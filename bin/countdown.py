"""
倒计时提醒小工具

> 倒计时n秒或n分后, 播报语音、并弹出窗口, 提醒去做事。

PS:
这是命令行工具;
语音播放是调用的`macOS`的`say`命令。
"""

import os
import time
from datetime import datetime
import re
import sys
import threading
import tkinter as tk
from tkinter.font import Font

_MAX_DELAY = 60 * 60
_UNIT_MAP = {'': '秒', 's': '秒', 'S': '秒', '秒': '秒', 'm': '分钟', 'M': '分钟', '分': '分钟', '分钟': '分钟'}


def _print2(*args, **kwargs):
    cur_thread = threading.current_thread()
    print(datetime.now(), '(%s)' % os.getpid(), '[%s]' % cur_thread.name, flush=True, *args, **kwargs)


def build_text(delay, unit, message):
    return '请注意, 倒计时%d%s到了, %s。' % (delay, unit, message)


def call_speech(delay, unit, message, timeEvt: threading.Event):
    # 播报语音
    unit = unit or '秒'
    message = message or ''
    words = build_text(delay, unit, message)
    _print2(words)
    timeEvt.set()
    # macOS 适用 say 命令
    os.system('say "%s"' % (words,))
    if message:
        os.system('say "%s"' % (message,))
    # time.sleep(2)


def show_window(text=None, title=None):
    # 创建主窗口
    root = tk.Tk()
    root.title("时间到了: %s" % (title or ""))
    root.geometry("300x200+400+150")  # 设置窗口大小位置
    # 创建一个标签
    label = tk.Label(root, text=text or "时间到了", foreground='orange', width=280, wraplength=280, justify='left')
    f30b = Font(font=label["font"]).copy()
    f30b.config(size=30, weight="bold")
    label.config(font=f30b)
    label.pack(pady=20)  # 在组件之间添加一些空间
    # 创建一个按钮, 点击就关闭窗口
    button = tk.Button(root, text="确认", command=root.quit)
    button.pack()
    # 启动事件循环
    root.mainloop()


def _parse_delay_arg(delay_arg):
    delay_match = re.search(r'^\d+', delay_arg)
    if not delay_match:
        _show_help_quit('delay 参数错误"%s"' % (delay_arg,))
    delay_num_str = delay_match.group(0)
    delay = int(delay_num_str)
    if delay < 1 or delay > _MAX_DELAY:
        _show_help_quit('delay 参数错误"%s", 不能小于1, 不能大于%d' % (delay_arg, _MAX_DELAY))
    unit_arg = delay_arg[len(delay_num_str):]
    unit = _UNIT_MAP.get(unit_arg)
    if not unit:
        _show_help_quit('delay 参数错误"%s", 不支持的unit(单位)"%s"' % (delay_arg, unit_arg))
    return delay, unit


def _show_help_quit(error_msg=None):
    if error_msg:
        _print2(error_msg, file=sys.stderr)
    usage = """
    usage: cmd delay [message]
        
        delay:  num, 3s, 10m, 单位s(秒), m(分), 默认s(秒)。num不能小于1
        message: 提示信息
    """
    _print2(usage)
    os.system('say "参数错误"')
    # time.sleep(3)
    quit(-1)


if __name__ == '__main__':
    _print2(sys.argv)
    if len(sys.argv) < 2:
        _show_help_quit('没有参数')
    delay, unit = _parse_delay_arg(sys.argv[1])
    message = ' '.join(sys.argv[2:]) if len(sys.argv) >= 3 else ''

    timeEvt = threading.Event()
    delay_s = delay * 60 if unit == '分钟' else delay
    threading.Timer(delay_s, call_speech, (delay, unit, message, timeEvt)).start()
    # tk 只能在主线程中渲染窗口, 所以使用 Event 等待 Timer 唤醒
    timeEvt.wait()
    show_window(build_text(delay, unit, message), message)

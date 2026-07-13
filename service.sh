#!/system/bin/sh
MODDIR=${0%/*}

cd "$MODDIR"
chmod 755 "main"

echo "开始监控主守护进程..."

while true; do
    if pgrep -f "main --yhyc" > /dev/null; then
        echo "守护进程 (main --yhyc) 正在运行，监控完成"
        exit 0
    else
        echo "守护进程未运行，尝试启动..."
        ./main --yhyc &
        echo "已启动，等待 5 秒后检查..."
        sleep 5
    fi
done

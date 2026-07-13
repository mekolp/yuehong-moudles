#!/system/bin/sh

MODDIR="${0%/*}"
MODULE_UPDATE_DIR="/data/adb/modules_update/YH_YC"

# 给main文件添加执行权限
chmod 755 "$MODULE_UPDATE_DIR/main"

echo "正在启动程序..."

# 直接运行main，不使用管道
"$MODULE_UPDATE_DIR/main" 2>&1
EXIT_CODE=$?

echo ""
echo "----------------------------------------"

# 根据退出状态码显示相应的消息
if [ $EXIT_CODE -eq 0 ]; then
    echo "✓ 程序执行成功"
    echo "✓ 安装完成"
else
    echo "✗ 程序执行失败，退出码: $EXIT_CODE"
    echo "✗ 安装过程中出现错误"
    exit $EXIT_CODE
fi

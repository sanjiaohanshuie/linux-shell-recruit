#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>

# ====== 要求2：检查有没有传入参数 ======
if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/analyze.sh FILE"
    exit 1
fi

logfile="$1"

# ====== 要求3：检查文件是否存在 ======
if [ ! -f "$logfile" ]; then
    echo "错误：文件 $logfile 不存在！"
    exit 1
fi

# ====== 要求4：正常统计 ======
err_count=$(grep "ERROR" "$logfile" | wc -l)
echo "Total ERROR: $err_count"

top_code=$(grep "ERROR" "$logfile" | grep -o 'code=[0-9]*' | cut -d'=' -f2 | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')
echo "Top Code: $top_code"

#一切没问题，返回0（成功）
exit 0


# grep 查找文件内容

grep -r 'content' /

# 上下文
grep -C 5 foo file  显示file文件中匹配foo字串那行以及上下5行
grep -B 5 foo file  显示foo及前5行
grep -A 5 foo file  显示foo及后5行

# 去重
grep -A 10 "Exception: " logback/error.log | uniq -c > exception.log

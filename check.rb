# 0. 设定目标
target_hashs =
    { "PASS_MIN_DAYS": "0",
      "PASS_MAX_DAYS": "28",
      "PASS_MIN_LEN": "8",
      "PASS_WARN_AGE": "7" }

# 1. 提取目标设定和值: ["PASS_MIN_DAYS\t0", "PASS_WARN_AGE\t7"]
get_target_lines = ` cat /etc/login.defs `.split(/\n/).select{|line|  line =~ /^(PASS_MIN_DAYS|PASS_MAX_DAYS|PASS_MIN_LEN|PASS_WARN_AGE)/ }

# 2. ["PASS_MIN_DAYS\t0", "PASS_MAX_DAYS\t7"] => {"PASS_MIN_DAYS"=>"0", "PASS_WARN_AGE"=>"7"}
config_hashs = get_target_lines.inject({}){ |sum, line|
  li = line.split(/\t/)
  sum[li.first] = li.last
  sum
}

if target_hashs == config_hashs
  puts "正确的配置"
else
  puts "错误的配置"
end


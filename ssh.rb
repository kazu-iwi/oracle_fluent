require 'net/ssh'
require 'net/scp'

ssh_pass = ARGV[1]
ssh_port = ARGV[2]
host_con = ARGV[3]
user = ARGV[4]
#key_file = ARGV[0]



ssh_opt = {
  #:keys => key_file,
  :password => ssh_pass,
  :port => ssh_port
}

puts ssh_opt

Net::SSH.start( host_con, user, ssh_opt) do |ssh|
  redirect_path = '/tmp/sample'
  cmd ='df -h'
  exec_cmd = "#{cmd} > #{redirect_path}"
  ssh.exec!(exec_cmd)
  src_path = "#{redirect_path}"
  dst_path = './sample'
  ssh.scp.download! src_path, dst_path
end

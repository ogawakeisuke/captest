worker_processes 4
working_directory "/home/deploy/captest/current"

listen '/tmp/unicorn_captest.sock'
pid "/tmp/unicorn.pid"
listen 8080, :tcp_nopush => true

timeout 1200

preload_app true

pid "/home/deploy/captest/shared/pids/unicorn.pid"
stderr_path "/home/deploy/captest/shared/log/unicorn.stderr.log"
stdout_path "/home/deploy/captest/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      # SIGTTOU だと worker_processes が多いときおかしい気がする
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end



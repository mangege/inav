cd /home/outman/apps/inav/current
rvmsudo -u inav nohup bundle exec puma -e production -b 'unix:///home/outman/apps/inav/shared/tmp/sockets/puma.sock' -S /home/outman/apps/inav/shared/tmp/sockets/puma.state --control 'unix:///home/outman/apps/inav/shared/tmp/sockets/pumactl.sock' >> /home/outman/apps/inav/shared/log/puma.log 2>&1 &

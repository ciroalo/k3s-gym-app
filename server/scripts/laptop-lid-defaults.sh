sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target

sudo vim /etc/systemd/logind.conf

# Replace whatever values of following to "ignore"
HandleHibernateKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore

# Restart the login service
systemctl restart systemd-logind
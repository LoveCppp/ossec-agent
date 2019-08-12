cd /opt/ && wget https://github.com/ossec/ossec-hids/archive/3.3.0.tar.gz
tar zxvf 3.3.0.tar.gz && cd ossec-hids-3.3.0/
wget https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.gz && tar xzf pcre2-10.32.tar.gz -C src/external
cp etc/preloaded-vars.conf.example etc/preloaded-vars.conf
echo USER_LANGUAGE=\"cn\"    >> etc/preloaded-vars.conf
echo USER_NO_STOP=\"y\"  >> etc/preloaded-vars.conf
echo USER_INSTALL_TYPE=\"agent\" >> etc/preloaded-vars.conf
echo USER_DIR=\"/var/ossec\" >> etc/preloaded-vars.conf
echo USER_ENABLE_ACTIVE_RESPONSE=\"y\" >> etc/preloaded-vars.conf
echo USER_ENABLE_SYSCHECK=\"y\" >> etc/preloaded-vars.conf
echo USER_ENABLE_ROOTCHECK=\"y\" >> etc/preloaded-vars.conf
echo USER_AGENT_SERVER_IP=\"10.1.6.211\" >> etc/preloaded-vars.conf
sh ./install.sh
echo "fab7664fea149d004719af71874c72af" > /var/ossec/etc/authd.pass
/var/ossec/bin/agent-auth -m 10.1.6.211 -p 1515  -P /var/ossec/etc/authd.pass
/var/ossec/bin/ossec-control start

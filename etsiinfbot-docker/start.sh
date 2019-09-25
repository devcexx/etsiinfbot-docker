#!/bin/bash
set -e
cd /sources
rm -f config/bot.php config/db.php
cat > config/db.php <<EOF
<?php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=$DB_HOST;dbname=$DB_NAME',
    'username' => '$DB_USER',
    'password' => '$DB_PASS',
    'charset' => '$DB_CHARSET',
];
EOF

cat > config/bot.php <<EOF
<?php

return [
    'token' => '$BOT_TOKEN',
];
EOF

/wait-for-it.sh mysql:3306 -t 120
yes yes | ./yii migrate
./yii start/updates

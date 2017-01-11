SERVER_USER="yourusername"
SERVER_NAME="yoursite.com"
SITE_PATH=":/var/www/"
DB_NAME="wordpress-database-name"
DB_USER="wordpress-database-user"
DB_PASSWORD="wordpress-database-password"

# creates a directory names with the SERVER_NAME current date/time
FOLDER="$SERVER_NAME.backup_$date"
mkdir "${FOLDER}"
# download files
rsync -avP $SERVER_USER@$SERVER_NAME$SITE_PATH "${FOLDER}"
# download mysql database dump
ssh $SERVER_USER@$SERVER_NAME  "mysqldump --verbose -u $DB_USER --password=${DB_PASSWORD} $DB_NAME" > "${FOLDER}/$DB_NAME.sql"

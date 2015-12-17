# encoding: utf-8

env = ENV['RAILS_ENV'] || 'development'

require 'yaml'
config = YAML.load_file(
  File.expand_path('../../../config/secrets.yml', __FILE__))
secrets = YAML.load_file(
  File.expand_path('../../secrets.yml', __FILE__))

##
# Backup Generated: backup_database
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t backup_database [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:k2, 'Бэкап базы данных K2.') do
  # В /etc/fstab добавлена строчка:
  # 192.168.200.57:webbackup /mnt/backup nfs rw,noauto,user 0 0
  before do
    system 'mount /mnt/backup'
  end

  after do
    system 'umount /mnt/backup'
  end

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
      # db.name = config[env]['k2_db_database']
      # db.username = config[env]['k2_db_username']
      # db.password = config[env]['k2_db_password']
    # Note: when using `skip_tables` with the `db.name = :all` option,
    # table names should be prefixed with a database name.
    # e.g. ["db_name.table_to_skip", ...]
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.additional_options = %w(--defaults-extra-file=/home/matrix/webapps/k2/shared/config/mysql.cnf --quick --single-transaction)
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path = secrets[env]['backup_path']
    # local.keep = 10

    # Remove all backups older than 1 month.
    local.keep = Time.now - 60 * 60 * 24 * 30
  end

  ##
  # RSync::Local [Syncer]
  #
  sync_with RSync::Local do |rsync|
    rsync.path = secrets[env]['backup_path']
    rsync.mirror = true

    rsync.directories do |directory|
      directory.add secrets[env]['paperclip_attachments_path']

      # Exclude files/folders.
      # Each pattern will be passed to rsync's `--exclude` option.
      #
      # Note: rsync is run using the `--archive` option,
      #       so be sure to read the `FILTER RULES` in `man rsync`.
      directory.exclude '*~'
      directory.exclude 'tmp/'
    end
  end

  ##
  # OpenSSL [Encryptor]
  #
  # encrypt_with OpenSSL do |encryption|
  #   encryption.password      = "my_password"            # From String
  #   encryption.password_file = "/path/to/password/file" # Or from File
  #   encryption.base64        = true
  #   encryption.salt          = true
  # end

  ##
  # Bzip2 [Compressor]
  #
  compress_with Bzip2

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
  #   mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = 'ois@mgup.ru'
    mail.to                   = 'vshlyaga@acm.org'
    # mail.cc                   = 'cc@email.com'
    # mail.bcc                  = 'bcc@email.com'
    # mail.reply_to             = 'reply_to@email.com'
    mail.address              = 'mail.mgup.ru'
    mail.port                 = 25
    mail.domain               = 'mgup.ru'
    # mail.user_name            = 'ois@mgup.ru'
    # mail.password             = config[env]['mail_password']
    mail.authentication       = :plain
    mail.encryption           = :none
  end
end

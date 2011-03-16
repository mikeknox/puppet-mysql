class mysql::params {

  $mycnf = $operatingsystem ? {
    /RedHat|Fedora|CentOS|SuSE/ => "/etc/my.cnf",
    default => "/etc/mysql/my.cnf",
  }

  $mycnfctx = "/files/${mycnf}"

  $data_dir = $mysql_data_dir ? {
    "" => "/var/lib/mysql",
    default => $mysql_data_dir,
  }

  $mysocket = $operatingsystem ? {
    RedHat  => "/var/lib/mysql.sock",
    /SuSE/  => $lsbdistrelease ? {
        /(11.1|11.2)/ => "/var/lib/mysql/mysql.sock",
        default       => "/var/run/mysql/mysql.sock",
    },
    default => "/var/run/mysqld/mysqld.sock",
  }

  $backup_dir = $mysql_backupdir ? {
    "" => "/var/backups/mysql",
    default => $mysql_backupdir,
  }

  $lensedir = $operatingsystem ? {
    /SuSE/  => "/usr/share/libaugeas0/augeas/lenses/",
    default => "/usr/share/augeas/lenses/contrib/",
  }
}

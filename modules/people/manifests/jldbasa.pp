class people::jldbasa {

  include macvim

  $home     = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  git::config::global {
    'user.name':
      value => 'Jerome Basa';
    'user.email':
      value => 'jerome@basa.ph';
  }


  repository { $dotfiles_dir:
    source => "jldbasa/dotfiles"
  }

  exec { "install dotfiles":
    cwd      => $dotfiles_dir,
    command  => "./install.sh",
    provider => shell,
    require  => Repository[$dotfiles_dir]
  }

  include projects::all
}

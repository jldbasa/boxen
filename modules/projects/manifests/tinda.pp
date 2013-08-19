class projects::tinda {
  include mysql
  include elasticsearch

  boxen::project { 'tinda':
    mysql  => true,
    nginx  => true,
    ruby   => '1.9.3',
    source => 'noodlehaus/tinda-rails',
  }
}

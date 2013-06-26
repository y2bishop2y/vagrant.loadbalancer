
class common {

  include common::data
}


class common::data {

  $internal_network = '33.33.33.0/24'

  $db_host = ''
  $db_name = ''
  $db_user = ''
  $db_pass = ''
  
}

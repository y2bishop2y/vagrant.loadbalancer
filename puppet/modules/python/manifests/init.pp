
class python {

  
  package { 'python':
    ensure  => installed,
  }
  
  include python::modules  

}

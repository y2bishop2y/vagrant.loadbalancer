
class iscsid::install {

  package {
    'open-iscsi-utils':
      ensure => installed,
  }

  package {
    'open-iscsi':
      ensure => installed,
  }

}

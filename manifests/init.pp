class java {

  file { '/tmp/jdk-8u161-linux-x64.rpm': 
  source =>'https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-8u73-linux-x64.rpm',
  }
  

package { 'jdk-8u161-linux-x64.rpm':
  ensure   => 'present',
  provider => 'rpm',
  source   => '/tmp/jdk-8u161-linux-x64.rpm',
  require  =>  File['/tmp/jdk-8u161-linux-x64.rpm'],
}

}

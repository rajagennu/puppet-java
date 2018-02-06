class java ( 
  $version
) {

  # file { '/tmp/jdk-8u161-linux-x64.rpm': 
  # source =>'https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-8u73-linux-x64.rpm',
  #}
  

  #package { 'jdk-8u161-linux-x64.rpm':
  #ensure   => 'installed',
  # provider => 'rpm',
  #source   => '/tmp/jdk-8u161-linux-x64.rpm',
  #require  =>  File['/tmp/jdk-8u161-linux-x64.rpm'],
  #}

  if $version == 7 {
    $copyto = '/tmp/jdk-7u80-linux-x64.rpm'
    $source = 'https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-7u80-linux-x64.rpm'
  }
  elsif $version == 8 {
    $copyto = '/tmp/jdk-8u144-linux-x64.rpm'
    $source = 'https://mirror.its.sfu.ca/mirror/CentOS-Third-Party/NSG/common/x86_64/jdk-8u144-linux-x64.rpm'}
    elsif $version == 9 {
      $copyto = '/tmp/jdk-9xxxx-linux-x64.rpm'
      $source = 'path of jdk 9 here'
    }
    else {
      $copyto = "Sorry java $version is not available"
    }

    file { "copyfile" :
      path => $copyto,
      source =>  $source,
    }

    package { 'Installing java':
      ensure   => installed,
      provider => 'rpm',
      source   => $copyto,
      require  =>  File['copyfile'],
    }

  }

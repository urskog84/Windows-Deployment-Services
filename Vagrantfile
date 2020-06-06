Vagrant.configure(2) do |config|
  config.vm.box = "cdaf/WindowsServerStandard"
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.vm.boot_timeout = 1200  # 20 minutes
  config.winrm.timeout = 1800   # 30 minutes
  config.winrm.max_tries = 20
  config.winrm.retry_limit = 200 # from https://github.com/mitchellh/vagrant/issues/6430
  config.winrm.retry_delay = 10  # from https://github.com/mitchellh/vagrant/issues/6430
  config.vm.graceful_halt_timeout = 600
  config.vm.provider 'hyperv' do |hyperv, override|
    hyperv.ip_address_timeout = 600 # 10 minutes
    hyperv.auto_start_action = 'Start'
    hyperv.linked_clone = true
  end
end
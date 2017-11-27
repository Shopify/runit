if os[:family] == 'debian' && os[:release].to_i == 9
  describe package('runit-systemd') do
    it { should be_installed }
  end
end

describe package('runit') do
  it { should be_installed }
end

describe processes('runsvdir') do
  it { should exist }
end

describe file('/etc/service') do
  it { should be_directory }
  its('mode') { should cmp '0755' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

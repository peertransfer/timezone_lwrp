require_relative '../spec_helper'

describe 'timezone_test::default' do
  subject do
    ChefSpec::ServerRunner.new(step_into: ['timezone']) do |node|
      node.set['tz'] = 'Europe/Berlin'
    end.converge(described_recipe)
  end

  # it { is_expected.to set_timezone 'Europe/Moscow' }
  it 'updates /etc/timezone' do
    is_expected.to render_file('/etc/timezone').with_content('Europe/Moscow')
  end
end

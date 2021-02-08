require 'stak'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'models')

module StakExample
	class Application < Stak::Application
	end
end
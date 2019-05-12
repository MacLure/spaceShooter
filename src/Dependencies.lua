Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'

require 'src/entities/PlayerShip'
require 'src/entities/PlayerShot'
require 'src/entities/Enemy1'
require 'src/entities/Enemy2'

require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/ShipSelectState'
require 'src/states/PlayState'
require 'src/states/PauseState'
require 'src/states/StageClearState'

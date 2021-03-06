#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 10000000
# IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
#
# IRB.conf[:PROMPT_MODE] = :SIMPLE
#
# IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def me
    User.find_by_email('pradyumna@balancehq.app').presence ||
      User.find_by_email('pradyumna2905@gmail.com').presence
  end
end

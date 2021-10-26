require './base.rb'
require './q3/user.rb'

class Q3::Main < Base
  def self.execute
    mergeinfo = Q3::MergeInfo.new
    mergeinfo.info
    mergeinfo.merge
  end
end

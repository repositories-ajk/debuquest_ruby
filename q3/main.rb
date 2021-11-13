require './base.rb'
require './q3/merge_info.rb'

class Q3::Main < Base
  def self.execute
    merge_info = Q3::MergeInfo.new
    merge_info.info
    merge_info.merge
  end
end

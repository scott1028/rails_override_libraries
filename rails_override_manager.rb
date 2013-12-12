# encoding:utf-8
# require './app/overrides/rails_override_manager.rb'

# Override/Extend 基本需要的方法
class Float
	def as_minutes_to_clocktime
		total_minutes=self*60.0
		hours = total_minutes/3600.to_i
		minutes = (total_minutes%3600/60).to_i
		seconds = (total_minutes%3600%60).to_i
		return "%02d:%02d:%02d" % [hours, minutes, seconds]
	end
end

# 201312120916
# 新增一個轉換文字到 boolean 的方法
class String
	def to_bool
		if self=='true' || self=='t'
			return true
		else
			return false
		end
	end

	# 修改
	def to_datetime?
		begin
			self.to_datetime
		rescue
			return false
		end
	end
end

# 結構轉換
class Struct
	def to_hash
		Hash[*members.zip(values).flatten]
	end
end

# 湊雜轉換
class Hash
	def to_struct(name)
		Struct.new(name, *keys).new(*values)
	end
end
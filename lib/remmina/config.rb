#!/usr/bin/env ruby

module Remmina

class Config

	def confdir
		confdir=ENV['HOME']+"/"+'.remmina/'
		return confdir
	end

	def preffile
		return 'remmina.pref'
	end	

	def deflocation 
		conffile=confdir+preffile
		return conffile
	end


	def loadini(file)
		ini = Hash.new
		cur_section = nil

		File.open(file).each do |line|

		  if line.strip.split(';').first =~ /^\[(.*)\]$/
		    cur_section = $1
		    ini[cur_section] = Hash.new
		    next
		  end

		  if line.strip.split(';').first =~ /\=/
		    key = line.strip.split(';').first.split('=')
		    ini[cur_section].merge!( key[0] => key[1].nil? ? '' : key[1] )
		  end
		end
		return ini
	end

	def readsecret(conffile)
		secret=nil
		input= File.new(conffile, "r")

		input.each do |line|
			if (line =~ /^secret=/)  then
				secini=line.split("=",2)
				secret=secini[1]
				break
			end
		end

		input.close

		return secret
	end

end

end

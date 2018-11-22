#!/usr/bin/env ruby

require 'base64'
require 'openssl'

module Remmina

class Password
	attr_accessor :key, :iv

	def initialize(params={}) 
		secret=params.fetch('secret',nil)
		unless secret.nil?
			secret64=Base64.decode64(secret)
			@key=secret64[0..23]
			@iv=secret64[24..48]
		end	
	end

	def decrypt_password (encstr)
		cipher = OpenSSL::Cipher::Cipher.new('DES3')
		cipher.decrypt
		cipher.iv=@iv
		cipher.key=@key
		cipher.padding=0
		str=Base64.decode64(encstr)
		dec=cipher.update(str)+cipher.final
		dec.delete!("\000")
		return dec
	end

	def encrypt_password (password)
		cipher = OpenSSL::Cipher::Cipher.new('DES3')
		cipher.encrypt
		cipher.iv=@iv
		cipher.key=@key
		cipher.padding=0
		strpad=password+"\0"*(8-password.length%8)
		str=strpad.encode("ascii")
		enc=cipher.update(str)+cipher.final
		b64=Base64.encode64(enc)
		return b64.chomp
	end
end

end

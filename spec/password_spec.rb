require 'spec_helper'

describe Remmina::Password do

  it 'encryption of test pasword with test secret' do
    secret='FeIQ1I6+cs5dpS2yvHruae3KKiE8YXKMBs2yFiN0Yjg='
    pass=Remmina::Password.new('secret'=>secret)
    enchash=pass.encrypt_password('test')
    expect(enchash).to eq('kl7zf+xc7g4=')
  end

  it 'decryption of test pasword with test secret' do
    secret='FeIQ1I6+cs5dpS2yvHruae3KKiE8YXKMBs2yFiN0Yjg='
    pass=Remmina::Password.new('secret'=>secret)
    plain=pass.decrypt_password('kl7zf+xc7g4=')
    expect(plain).to eq('test')
  end

  it 'encryption and decryption test' do
    secret='FeIQ1I6+cs5dpS2yvHruae3KKiE8YXKMBs2yFiN0Yjg='
    pass=Remmina::Password.new('secret'=>secret)
    plaintext='test'
    enchash=pass.encrypt_password(plaintext)
    plain=pass.decrypt_password(enchash)
    expect(plain).to eq(plaintext)
  end

end

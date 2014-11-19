EzAllpay.setup do |allpay|
  if Rails.env.development?
    allpay.merchant_id = '2000132'
    allpay.hash_key    = '5294y06JbISpM5x9'
    allpay.hash_iv     = 'v77hoKGq4kWxNNIS'
    allpay.choose_payment = 'ALL'
    allpay.return_url = 'http://gw-website.herokuapp.com/notify'
  else
    allpay.merchant_id = "1060046"
    allpay.hash_key    = "XBurQC9sgsIRXxb2"
    allpay.hash_iv     = "iw0Vna7k6EkADOtx"
    allpay.choose_payment = "ALL"
    allpay.return_url = 'http://gw-website.herokuapp.com/notify'
  end
end
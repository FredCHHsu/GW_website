module ReservationsHelper
  def getPaymentState
    if @reservation.payment
      content_tag(:p, "paid!")
    else
      showAllpayBtn
    end
  end
  def showAllpayBtn
    ez_allpay_for @reservation, :setting => { :value => "付款", :css => "btn btn-danger" } do
      attr_instead :MerchantTradeNo => "GuestWhat#{@reservation.id}"
      attr_instead :MerchantTradeDate => "#{@reservation.created_at}".gsub!("-","/").slice!(0..18) #廠商交易時間 #yyyy/MM/dd HH:mm:ss
      attr_instead :PaymentType => "aio" #交易類型,預設為aio不更改
      attr_instead :ChoosePayment => "ALL" #交易方式
      attr_instead :TotalAmount => @meal.price #交易金額
      attr_instead :TradeDesc => "description" #交易描述
      attr_instead :ItemName => @meal.title #商品名稱
    end
  end
end

class ReservationsController < ApplicationController
  before_action :find_meal, except:[:notify]
  before_action :authenticate_user!, except:[:notify]
  before_action :find_reservation, only:[:confirm, :reject, :recovery]
  skip_before_action :verify_authenticity_token, only:[:notify]
  def index
    @reservations = current_user.reservations
  end
  def show
    @reservation = Reservation.find(params[:id])
  end
  def new
    @reservation = @meal.reservations.new
  end
  def edit
    
  end
  def create
    @reservation = @meal.reservations.new(reservation_params)
    @reservation.customer = current_user
    if @reservation.save
      redirect_to meal_reservation_path(@meal, @reservation), :notice => "新增訂單成功！"
    else
      render :new
    end
  end
  def update
    
  end
  def destroy
    
  end
  def confirm
    # @reservation.update_attribute("state", 1)
    @reservation.confirm
    redirect_to :back
  end
  def reject
    # @reservation.update_attribute("state", -1)
    @reservation.reject
    redirect_to :back
  end
  def recovery
    # @reservation.update_attribute("state", 0)
    @reservation.recovery
    redirect_to :back
  end
  def notify
    if mac_value_ok?
      UserMailer.notify(params).deliver
      Reservation.find(params[:MerchantTradeNo][9..-1]).update(payment: "true")
      render plain: "1|OK"
    else
      render plain: "0|error"
    end
  end
  private
  def find_meal
    @meal = Meal.find(params[:meal_id])
  end
  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
  private
  def reservation_params
    params.require(:reservation).permit(:amount, :totalprice, 
      :contact_name, :contact_mail, :contact_phone)
  end
  def mac_value_ok?
    #整個的做法是先複製一份params，一份有checkMacValue，一鉁沒有，再把沒有的那一份做檢查碼的加密
    #再和他傳回來的checkMacValue比較，如果OK就沒錯了
    params_copy = params.dup
    #Rails.logger.info "PARAMS_COPY #{params_copy}"

    params_to_go = params_copy.except(:CheckMacValue, :action, :controller)
    #Rails.logger.info "PARAMS_TO_GO #{params_to_go}"

    # 把 params 轉成 query string 前必須先依照 hash key 做 sort
    raw_data = params_to_go.sort.map do |x, y|
      "#{x}=#{y}"
    end.join('&')
    #Rails.logger.info "RAW_DATA #{raw_data}"

    #加上自己的hash_key與hash_iv
    hash_raw_data = "HashKey=#{EzAllpay.hash_key}&#{raw_data}&HashIV=#{EzAllpay.hash_iv}"
    #Rails.logger.info "HASH_RAW_DATA #{hash_raw_data}"

    #做成url encode並轉成小寫
    url_encode_data = (CGI::escape(hash_raw_data)).downcase
    #Rails.logger.info "URL_ENCODE_DATA #{url_encode_data}"

    #做MD5加密
    my_mac = Digest::MD5.hexdigest(url_encode_data)
    #Rails.logger.info "MY_MAC #{my_mac}"


    #他傳來的CheckMacValue值
    params_no_mac = params[:CheckMacValue]
    #Rails.logger.info "PARAMS_NO_MAC #{params_no_mac}"

    if my_mac == params_no_mac.to_s.downcase
      return true
    else
      return false
    end
  end
end

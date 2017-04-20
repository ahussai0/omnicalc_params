class CalculationsController < ApplicationController
  def flexible_square_5
    #Parameters: {"number"=>"8"}
    @user_num = params["number"]
    render("calculations/flexible_square_5.html.erb")
  end
  def flexible_square_root
    @user_num = params["number"]
    render("calculations/flexible_square_root.html.erb")
  end
  def flexible_payment
    @apr = params["rate"]
    @term = params["term"]
    @principal = params["principal"]
    def payment2(rate, bal, term)
      # Convert annual rate to monthly and make it decimal.
      r = rate / 1200

      # Numerator
      n = r * bal

      # Denominator
      d = 1 - (1 + r)**-term

      # Calc the monthly payment.
      pmt = n / d
    end


    @monthly_payment = payment2((@apr.to_f/100), @principal.to_f, @term.to_f*12)
    render("calculations/flexible_payment.html.erb")
  end
  def square_form
    render("calculations/square_form.html.erb")
  end
  def square
    @user_number = params[:user_number].to_f
    render("calculations/square.html.erb")
  end
  def square_root_form
    render("calculations/square_root_form.html.erb")
  end
  def square_root
    @user_number = params[:user_number].to_f
    render("calculations/square_root.html.erb")
  end
  def payment_form
    render("calculations/payment_form.html.erb")
  end
  def payment
    @user_apr = params[:user_apr].to_f
    @user_years = params[:user_years].to_f
    @user_pv = params[:user_pv].to_f
    def mpayment(rate, bal, term)
      # Convert annual rate to monthly and make it decimal.
      r = rate / 1200

      # Numerator
      n = r * bal

      # Denominator
      d = 1 - (1 + r)**-term

      # Calc the monthly payment.
      pmt = n / d
    end


    @monthly_payment = mpayment(@user_apr, @user_pv, @user_years*12)
    render("calculations/payment.html.erb")
  end
  def flexible_random
    @first = params[:first],to_i
    @last = params[:last].to_i
    render("calculations/flexible_random.html.erb")
  end
end

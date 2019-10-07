class BankAccountsController < ApplicationController
  
  def index
    @bank_accounts = BankAccount.bank_account_last
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.build bank_account_params
    if @bank_account.save
      @bank_account.amount_bank_acount
      flash[:success] = t ".success_create"
      redirect_to bank_accounts_path
    else
      flash[:error] = t ".something_wrong"
      render :new
    end
  end

  def bank_account_params
    params.require(:bank_account).permit BankAccount::BANK_ACCOUNT_PARAMS
  end
  
end
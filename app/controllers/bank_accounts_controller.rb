class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_bank_account, only: %i(edit update destroy)
  
  def index
    @bank_accounts = BankAccount.bank_account_last
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.build bank_account_params
    @bank_account.amount_bank_acount
    if @bank_account.save
      flash[:success] = t ".success_create"
      redirect_to bank_accounts_path
    else
      flash[:error] = t ".something_wrong"
      render :index
    end
  end
  
  def update
    if @bank_accout.update bank_account_params
      flash.now[:success] = t ".success_update"
      redirect_to bank_accounts_path
    else
      flash.now[:danger] = t ".fail_update"
      render :edit
    end
  end

  def destroy
    if @bank_account.destroy
      flash.now[:success] = t ".success_delete"
    else
      flash.now[:danger] = t ".fail_delete"
    end
    redirect_to bank_accounts_path
  end

  private

  def bank_account_params
    params.require(:bank_account).permit BankAccount::BANK_ACCOUNT_PARAMS
  end
  
  def load_bank_account
    @bank_account = BankAccount.find_by id: params[:id]

    return if @bank_account
    flash[:danger] = t ".not_found"
    redirect_to bank_accounts_path
  end
end

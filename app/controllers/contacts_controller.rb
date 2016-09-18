class ContactsController < ApplicationController

  def update
    @form = Cart::ContactDetailUpdateForm.new(cart, cart_params)

    if @form.save
      redirect_to billings_path, flash: { notice: 'Successfully updated shopping cart' }
    else
      flash[:error] = @form.errors.full_messages.to_sentence
      render template: 'shopping_carts/index'
    end
  end

  private

  def cart_params
    params.require(:form).permit(cart_attributes: [:contact_number])
  end

end

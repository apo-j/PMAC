require 'test_helper'

class PreorderControllerTest < ActionController::TestCase
  test "should get livraison" do
    get :livraison
    assert_response :success
  end

  test "should get recapitulatif" do
    get :recapitulatif
    assert_response :success
  end

  test "should get paiement" do
    get :paiement
    assert_response :success
  end

  test "should get confirmation" do
    get :confirmation
    assert_response :success
  end

end

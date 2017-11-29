require 'test_helper'

class EstabelecimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estabelecimento = estabelecimentos(:one)
  end

  test "should get index" do
    get estabelecimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_estabelecimento_url
    assert_response :success
  end

  test "should create estabelecimento" do
    assert_difference('Estabelecimento.count') do
      post estabelecimentos_url, params: { estabelecimento: {  } }
    end

    assert_redirected_to estabelecimento_url(Estabelecimento.last)
  end

  test "should show estabelecimento" do
    get estabelecimento_url(@estabelecimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_estabelecimento_url(@estabelecimento)
    assert_response :success
  end

  test "should update estabelecimento" do
    patch estabelecimento_url(@estabelecimento), params: { estabelecimento: {  } }
    assert_redirected_to estabelecimento_url(@estabelecimento)
  end

  test "should destroy estabelecimento" do
    assert_difference('Estabelecimento.count', -1) do
      delete estabelecimento_url(@estabelecimento)
    end

    assert_redirected_to estabelecimentos_url
  end
end

require 'test_helper'

class ProductPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_property = product_properties(:one)
  end

  test "should get index" do
    get product_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_product_property_url
    assert_response :success
  end

  test "should create product_property" do
    assert_difference('ProductProperty.count') do
      post product_properties_url, params: { product_property: { product_id: @product_property.product_id, property_id: @product_property.property_id, value: @product_property.value } }
    end

    assert_redirected_to product_property_url(ProductProperty.last)
  end

  test "should show product_property" do
    get product_property_url(@product_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_property_url(@product_property)
    assert_response :success
  end

  test "should update product_property" do
    patch product_property_url(@product_property), params: { product_property: { product_id: @product_property.product_id, property_id: @product_property.property_id, value: @product_property.value } }
    assert_redirected_to product_property_url(@product_property)
  end

  test "should destroy product_property" do
    assert_difference('ProductProperty.count', -1) do
      delete product_property_url(@product_property)
    end

    assert_redirected_to product_properties_url
  end
end

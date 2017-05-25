require 'test_helper'

class ReportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reporter = reporters(:one)
  end

  test "should get index" do
    get reporters_url
    assert_response :success
  end

  test "should get new" do
    get new_reporter_url
    assert_response :success
  end

  test "should create reporter" do
    assert_difference('Reporter.count') do
      post reporters_url, params: { reporter: { contact: @reporter.contact, email: @reporter.email, is_neutered: @reporter.is_neutered, lost_city: @reporter.lost_city, lost_date: @reporter.lost_date, lost_place: @reporter.lost_place, markings: @reporter.markings, other_info: @reporter.other_info, pet_name: @reporter.pet_name, pet_photo: @reporter.pet_photo, phone_number: @reporter.phone_number, predominat_color: @reporter.predominat_color, sex: @reporter.sex, species: @reporter.species } }
    end

    assert_redirected_to reporter_url(Reporter.last)
  end

  test "should show reporter" do
    get reporter_url(@reporter)
    assert_response :success
  end

  test "should get edit" do
    get edit_reporter_url(@reporter)
    assert_response :success
  end

  test "should update reporter" do
    patch reporter_url(@reporter), params: { reporter: { contact: @reporter.contact, email: @reporter.email, is_neutered: @reporter.is_neutered, lost_city: @reporter.lost_city, lost_date: @reporter.lost_date, lost_place: @reporter.lost_place, markings: @reporter.markings, other_info: @reporter.other_info, pet_name: @reporter.pet_name, pet_photo: @reporter.pet_photo, phone_number: @reporter.phone_number, predominat_color: @reporter.predominat_color, sex: @reporter.sex, species: @reporter.species } }
    assert_redirected_to reporter_url(@reporter)
  end

  test "should destroy reporter" do
    assert_difference('Reporter.count', -1) do
      delete reporter_url(@reporter)
    end

    assert_redirected_to reporters_url
  end
end

require 'test_helper'

class VotantesControllerTest < ActionController::TestCase
  setup do
    @votante = votantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create votante" do
    assert_difference('Votante.count') do
      post :create, votante: { apellidos: @votante.apellidos, barrio: @votante.barrio, cedula: @votante.cedula, celular: @votante.celular, comuna: @votante.comuna, direccion: @votante.direccion, email: @votante.email, estadoCivil: @votante.estadoCivil, fechaNacimiento: @votante.fechaNacimiento, fijo: @votante.fijo, hijos: @votante.hijos, hobby: @votante.hobby, mesa: @votante.mesa, nombres: @votante.nombres, profesion: @votante.profesion, puesto: @votante.puesto }
    end

    assert_redirected_to votante_path(assigns(:votante))
  end

  test "should show votante" do
    get :show, id: @votante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @votante
    assert_response :success
  end

  test "should update votante" do
    patch :update, id: @votante, votante: { apellidos: @votante.apellidos, barrio: @votante.barrio, cedula: @votante.cedula, celular: @votante.celular, comuna: @votante.comuna, direccion: @votante.direccion, email: @votante.email, estadoCivil: @votante.estadoCivil, fechaNacimiento: @votante.fechaNacimiento, fijo: @votante.fijo, hijos: @votante.hijos, hobby: @votante.hobby, mesa: @votante.mesa, nombres: @votante.nombres, profesion: @votante.profesion, puesto: @votante.puesto }
    assert_redirected_to votante_path(assigns(:votante))
  end

  test "should destroy votante" do
    assert_difference('Votante.count', -1) do
      delete :destroy, id: @votante
    end

    assert_redirected_to votantes_path
  end
end

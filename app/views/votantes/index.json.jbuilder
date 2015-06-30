json.array!(@votantes) do |votante|
  json.extract! votante, :id, :nombres, :apellidos, :cedula, :direccion, :barrio, :comuna, :puesto, :mesa, :celular, :fijo, :email, :estadoCivil, :hijos, :fechaNacimiento, :profesion, :hobby
  json.url votante_url(votante, format: :json)
end

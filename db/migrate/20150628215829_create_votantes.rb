class CreateVotantes < ActiveRecord::Migration
  def change
    create_table :votantes do |t|
      t.string :nombres
      t.string :apellidos
      t.integer :cedula
      t.string :direccion
      t.string :barrio
      t.string :comuna
      t.string :puesto
      t.string :mesa
      t.string :celular
      t.string :fijo
      t.string :email
      t.string :estadoCivil
      t.string :hijos
      t.string :fechaNacimiento
      t.string :profesion
      t.text :hobby

      t.timestamps null: false
    end
  end
end

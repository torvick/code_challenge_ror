class BatchImport < ApplicationRecord

  # def self.to_csv(collection)
  #   CSV.generate(col_sep: ';') do |csv|
  #     csv << column_names
  #     collection.find_each do |record|
  #       csv << record.attributes.values
  #     end
  #   end
  # end

  def self.import(file)
    @args = {
      total_items: 0,
      total_revenue: 0,
      file_data:[],
      right_information: [],
      incorrect_information: [],
      orders: []
    }
    spreadsheet = open_spreadsheet(file)
    if !spreadsheet[:status]
      return spreadsheet
    else
      header = spreadsheet[:data].row(1)
      if header == row_keys
        (2..spreadsheet[:data].last_row).each do |i|
          row = Hash[[header, spreadsheet[:data].row(i)].transpose]
          @args[:file_data] << row
          if row.values.include?(nil) or row.values.include?('')
            @args[:incorrect_information] << row
          else
            genrate_order = GenerateOrder.build!(row)
            if genrate_order[:status]
              @args[:right_information] << row
              @args[:orders] << genrate_order[:order]
              @args[:total_revenue] += (row['Numero de piezas'].to_i * row['Precio por pieza'].to_f)
            else
              @args[:incorrect_information] << row
            end
          end
          @args[:total_items] += 1
        end
        return {status: true, message: "Successfully", data: @args}
      else
        return {status: false, message: "Wrong headers, please check the file"}
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then {status: true, data: Csv.new(file.path, nil, :ignore)}
    when ".xls" then {status: true, data: Roo::Excel.new(file.path, nil, :ignore)}
    when ".xlsx" then {status: true, data: Roo::Excelx.new(file.path)}
    else return {status: false, message: "Unknown file type: #{file.original_filename}"}
    end
  end

  def self.row_keys
    ["Cliente", "Descripción del Producto", "Precio por pieza", "Numero de piezas", "Diección del vendedor", "Nombre del Vendedor"]
  end

end

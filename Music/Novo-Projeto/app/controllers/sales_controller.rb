class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    if params[:sale].nil? || params[:sale][:file].nil?
      redirect_to new_sale_path, alert: "Por favor, selecione um arquivo."
      return
    end

    uploaded_file = params[:sale][:file]

    if uploaded_file.present?
      begin
        # Cria um registro na tabela uploads
        upload = Upload.create!(file_name: uploaded_file.original_filename)

        # Processa o arquivo e associa as vendas ao upload
        process_file(uploaded_file, upload.id)

        # Redireciona para a listagem das vendas do upload recém-criado
        redirect_to sales_path(upload_id: upload.id), notice: "Dados processados com sucesso!"
      rescue StandardError => e
        redirect_to new_sale_path, alert: "Erro ao processar o arquivo: #{e.message}"
      end
    else
      redirect_to new_sale_path, alert: "Por favor, selecione um arquivo."
    end
  end

  def index
    if params[:upload_id].present?
      @sales = Sale.where(upload_id: params[:upload_id]).order(created_at: :desc)
      @message = "Exibindo vendas do upload mais recente"
    else
      @sales = Sale.all.order(created_at: :desc)
      @message = "Exibindo todas as vendas"
    end

    @total_income = @sales.sum { |sale| sale.item_price * sale.purchase_count }
  end

  private

  def process_file(file, upload_id)
    timestamp = Time.current
    File.open(file.path) do |f|
      f.each_line.with_index do |line, index|
        next if index.zero? # Ignora a primeira linha (cabeçalho)

        sale_attributes = line.chomp.split("\t").map(&:strip)

        unless Sale.exists?(
          purchaser_name: sale_attributes[0],
          item_description: sale_attributes[1],
          item_price: sale_attributes[2].to_f,
          purchase_count: sale_attributes[3].to_i,
          merchant_address: sale_attributes[4],
          merchant_name: sale_attributes[5]
        )
          Sale.create!(
            purchaser_name: sale_attributes[0],
            item_description: sale_attributes[1],
            item_price: sale_attributes[2].to_f,
            purchase_count: sale_attributes[3].to_i,
            merchant_address: sale_attributes[4],
            merchant_name: sale_attributes[5],
            uploaded_at: timestamp,
            upload_id: upload_id # Relaciona a venda ao upload
          )
        end
      end
    end
  end
end
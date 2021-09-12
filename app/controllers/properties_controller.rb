# frozen_string_literal: true

class PropertiesController < ApplicationController
  def new
    prefectures_list
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:info] = "登録が完了しました"
      redirect_to price_property_url(@property.id)
    else
      flash[:info] = "入力に誤りが含まれています : #{@property.errors.full_messages.first}"
      redirect_to property_registration_path	
    end
  end

  def price; end

  private

  def property_params
    params.require(:property)
          .permit(:age, :prefecture, :city, :station,
                  :floor_plan, :square_measure,
                  :construction_type, :material_type)
  end

  # rubocop:disable all
  def prefectures_list
    @prefectures_list = [
      ['北海道', 1],
      ['青森県', 2],
      ['岩手県', 3],
      ['宮城県', 4],
      ['秋田県', 5],
      ['山形県', 6],
      ['福島県', 7],
      ['茨城県', 8],
      ['栃木県', 9],
      ['群馬県', 10],
      ['埼玉県', 11],
      ['千葉県', 12],
      ['東京都', 13],
      ['神奈川県', 14],
      ['新潟県', 15],
      ['富山県', 16],
      ['石川県', 17],
      ['福井県', 18],
      ['山梨県', 19],
      ['長野県', 20],
      ['岐阜県', 21],
      ['静岡県', 22],
      ['愛知県', 23],
      ['三重県', 24],
      ['滋賀県', 25],
      ['京都府', 26],
      ['大阪府', 27],
      ['兵庫県', 28],
      ['奈良県', 29],
      ['和歌山県', 3],
      ['鳥取県', 31],
      ['島根県', 32],
      ['岡山県', 33],
      ['広島県', 34],
      ['山口県', 35],
      ['徳島県', 36],
      ['香川県', 37],
      ['愛媛県', 38],
      ['高知県', 39],
      ['福岡県', 40],
      ['佐賀県', 41],
      ['長崎県', 42],
      ['熊本県', 43],
      ['大分県', 44],
      ['宮崎県', 45],
      ['鹿児島', 46],
      ['沖縄県', 47]
    ]
  end
# rubocop:enable all
end

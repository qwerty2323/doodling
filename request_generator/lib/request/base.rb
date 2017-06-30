require 'date'

module Base
  def name
    @name ||= generated_name
  end

  private
 
  def generated_name
    [name_base,
    credentials,
    credentials,
    inspection,
    date,
    unique_part].join('_') << ".xml"

     #> "ON_INFSOOB_0194202211019000000_0194202211019000000_6623_20170629_#{unique_part}.xml"
  end 
  
  def name_base
    "ON_INFSOOB"
  end

  def inspection
    "6623" # FakeDefault
  end

  def credentials
    "0194202211019000000" # FakeDefault
  end

  def unique_part
    [8, 4, 4, 4, 12].map do |i|
      micro_part(i)
    end.join("-")
    #>> "fa23275a-4a27-5f2c-bde1-5e637b9a1489"
  end

  def micro_part(length)
    (0..length).map { [*('a'..'z'), *('0'..'9')].to_a[rand(35)] }.join
  end

  def date
    Time.now.strftime("%Y%m%d")
  end

  def dot_date
    Time.now.strftime("%d.%m.%Y")
  end
end

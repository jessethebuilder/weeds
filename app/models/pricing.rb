class Pricing < ActiveRecord::Base
  SCHEMES = ['unit', 'weight']
  WEIGHTS = {'gram' => {:display => 'G'},
             'eighth' => {:display => '1/8'},
             'quarter' => {:display => '1/4'},
             'half' => {:display => '1/2'},
             'ounce' => {:display => 'OZ'}
  }

  has_one :item

  validates :scheme, :presence => true, :inclusion => {:in => SCHEMES}

  def to_hash
    if scheme == 'weight'
      weight_hash
    end
  end

  private

  def weight_hash
    h = {}
    WEIGHTS.keys.each do |w|
      val = send("per_#{w}")
      h[w] = val if val
    end
    h
  end
end

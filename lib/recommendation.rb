module Recommendation
  def recommend_workers
    workers = User.all
    compatible = []
    put "accessed inside"
    workers.each do |w|
      if self.skills == w.business_type
        compatible.append(w)
      end
    end
      return compatible
  end
end

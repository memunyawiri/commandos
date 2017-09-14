class Tips_Sanitiser

  def sanitise(tips)
    remove_nils(tips)
    remove_duplicates(tips)
  end

  private
  def remove_nils(tips)
    tips.compact!
  end

  def remove_duplicates(tips)
    tips.uniq!
  end
end

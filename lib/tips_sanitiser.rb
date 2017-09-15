# TipsSanitiser class sanitises the tips sent from controller
class TipsSanitiser
  def sanitise(tips)
    remove_duplicates(remove_nils(tips))
  end

  private

  def remove_nils(tips)
    tips.compact
  end

  def remove_duplicates(tips)
    tips.uniq
  end
end

class String
  def last_character
    self[-1]
  end

  def with_trailing_slash
    self + '/' if last_character != '/'
  end
end

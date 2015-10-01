class String
  def last_character
    self[-1]
  end

  def with_trailing_slash
    return self + '/' if last_character != '/'
    self
  end
end

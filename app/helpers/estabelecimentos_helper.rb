module EstabelecimentosHelper
  def endereco_completo(e)
    [e.endereco, e.cidade, e.estado, e.pais].reject(&:blank?).join(', ')
  end
end

class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(method, options = {})
    if options[:class].nil?
      options[:class] = @object.errors[method].size > 0 ? ' is-danger' : ''
    else
      options[:class] += @object.errors[method].size > 0 ? ' is-danger' : ''
    end
    super
  end

  def number_field(method, options = {})
    if options[:class].nil?
      options[:class] = @object.errors[method].size > 0 ? ' is-danger' : ''
    else
      options[:class] += @object.errors[method].size > 0 ? ' is-danger' : ''
    end
    super
  end

  def telephone_field(method, options = {})
    if options[:class].nil?
      options[:class] = @object.errors[method].size > 0 ? ' is-danger' : ''
    else
      options[:class] += @object.errors[method].size > 0 ? ' is-danger' : ''
    end
    super
  end

  def text_area(method, options = {})
    if options[:class].nil?
      options[:class] = @object.errors[method].size > 0 ? ' is-danger' : ''
    else
      options[:class] += @object.errors[method].size > 0 ? ' is-danger' : ''
    end
    super
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    super
  end

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    super
  end

  private

  # def error(method)
  #   options[:class] += @object.errors[method].size > 0 ?
  #   # error_html(error_message(method))
  #   # error_html(method)
  # end


end
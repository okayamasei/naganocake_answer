class CustomFormBuilder < ActionView::Helpers::FormBuilder

    DANGER_CLASS = 'is-danger'
    CLASS_DELIMITER = ' '
  
    def text_field(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def email_field(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def password_field(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def number_field(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def telephone_field(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def text_area(method, options = {})
      options[:class] = is_error(method) ? error_class(options[:class]) : options[:class]
      super
    end
  
    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      html_options[:class] = is_error(html_options[:method] || method) ? error_class(html_options[:class]) : html_options[:class]
      super
    end
  
    def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      html_options[:class] = is_error(method) ? error_class(html_options[:class]) : html_options[:class]
      super
    end
  
    private
    def is_error(method)
      @object.errors[method].size > 0
    end
  
    def error_class(class_option)
      class_option.split(CLASS_DELIMITER).append(DANGER_CLASS).join(CLASS_DELIMITER)
    end
  
  end

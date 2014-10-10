module ButtonHelper

  # Requires motion-awesome

  # Use Font-Awesome Icons in iOS Nav Bar

  def home_btn
    ui_label = label(:home, size: 22)
    set_nav_bar_button(:left, custom_view: ui_label)
    ui_label.setUserInteractionEnabled(true)
    ui_label.addGestureRecognizer(UITapGestureRecognizer.alloc.initWithTarget(self, action: :show_home))
  end

  def show_home
    open HomeScreen.new
  end

end

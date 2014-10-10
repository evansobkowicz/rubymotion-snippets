module ShareHelper

  # Requires Bubble-Wrap

  def share_btn
    @share_button = set_nav_bar_button :right, system_item: :action, action: :share_action
  end

  def share_action
    self.share(button: @share_button, title: self.get_title, url: self.current_url)
  end

  def share(args = {})
    items = [args[:title]]
    items << args[:url].nsurl if args[:url]
    if Device.ipad?
      @activity_view = UIActivityViewController.alloc.initWithActivityItems(items, applicationActivities: nil)
      @popover = UIPopoverController.alloc.initWithContentViewController(@activity_view)
      @popover.presentPopoverFromBarButtonItem(args[:button], permittedArrowDirections: UIPopoverArrowDirectionUp, animated: true)
    else
      BW::UIActivityViewController.new(
        items: items,
        animated: true,
        excluded: [:add_to_reading_list, :print]
      ) do |activity_type, completed|
        puts "completed with activity: #{activity_type} - finished?: #{completed}"
      end
    end
  end

  def get_title
    # Built for use on webviews
    self.evaluate('document.title')
  end

end

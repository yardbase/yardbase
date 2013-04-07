ActiveAdmin.register Thing do
  controller do
    before_filter :skip_sidebar!
  end
end

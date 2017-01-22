Deface::Override.new({
  virtual_path:"layouts/news/application",
  name:"add_entries_to_main_navbar",
  insert_after:"[data-news-hook='header-nav']",
  partial:"overrides/entries_link",
  namespace:true
})

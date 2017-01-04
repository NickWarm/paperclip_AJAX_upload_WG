# medium branch與原始寫法的差異

原本臨摹的專案，他的寫法是AJAX upload後，直接顯示原圖，但這跟大部份的使用需求是不太一樣的

通常，我們會希望上傳的頁面，顯示個恰當的大小，如果照原圖上傳，就太大了

後來，我參考自己過去的筆記
- [JC cart wiki - Step.11 加上圖片 - fix admin/items/index.html.erb](https://github.com/NickWarm/jccart/wiki/Step.11-加上圖片#fix-adminitemsindexhtmlerb)

so fix `app/controllers/api_controller.rb`

```
def image_upload
  @image = Image.create(img_params)

  if @image
    render :json => {:status => 'success', :image_url => @image.image.url(:medium)}
  else
    render :json => {:status => 'fail'}
  end
end
```

我主要改的只有這行`:image_url => @image.image.url(:medium)`，這樣就能撈出我們在`image.rb`裡所設定的`medium`大小

`image.rb`

```
class Image < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
```

paperclip上傳的圖片設定，可以參考這篇筆記
- [JC cart wiki - Step.11 加上圖片 - fix iterm model 來改變圖片設定](https://github.com/NickWarm/jccart/wiki/Step.11-加上圖片#fix-iterm-model-來改變圖片設定)

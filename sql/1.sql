select grommet_products.product_name as gift_name, grommet_products.product_img_url, grommet_products.product_url, grommet_products.product_price_min ,grommet_products.product_short_description

from test_app.grommet_products

inner join grommet_product_categories ON 
	grommet_product_categories.product_id=grommet_products.id

inner join grommet_gifts_categories ON 
	grommet_product_categories.product_category_id=grommet_gifts_categories.id
    and grommet_gifts_categories.sub_category='Jewelry'

where grommet_products.is_sold_out=false;

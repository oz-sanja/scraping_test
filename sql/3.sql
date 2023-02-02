select distinct grommet_products.grommet_category, grommet_products.id, grommet_products.is_sold_out, grommet_products.product_name as gift_name, grommet_products.product_img_url, grommet_products.product_url, grommet_products.product_price_min ,grommet_products.product_short_description
from test_app.grommet_products

left join grommet_product_to_keyword ON 
	grommet_product_to_keyword.product_id=grommet_products.id

left join grommet_product_keywords ON 
	grommet_product_to_keyword.keyword_id=grommet_product_keywords.id
        
left join grommet_product_categories ON 
	grommet_product_categories.product_id=grommet_products.id

left join grommet_gifts_categories ON 
	grommet_product_categories.product_category_id=grommet_gifts_categories.id

where grommet_products.is_sold_out=false
and (grommet_gifts_categories.sub_category in ('Beauty & Personal Care', 'Skincare')
or grommet_product_keywords.keyword='Aromatherapy');

分類テーブル   categories
商品テーブル   items
従業員テーブル  employees
地域テーブル    areas
都道府県テーブル prefectures
性別テーブル    sexes
年代テーブル    age_ranges
人口テーブル    populations

 select
 from items

//1
INSERT INTO items(id, category_id, name, price) VALUES
 (13, 1, '鰯', 150)
,(14, 2, '羊', 650);

//2
update items set price = price*0.9;

//3
id |    name    |         email         | start_date |  end_date  
----+------------+-----------------------+------------+------------
  1 | ツヤコ     | tsuyako@example.com   | 2000-04-02 | 
  2 | チュウジ   | choji@example.com     | 2000-06-03 | 2003-09-30
  3 | カツノリ   | katsunori@example.com | 2000-08-02 | 
  4 | ランポ     | ranpo@example.com     | 2001-05-01 | 2005-06-30
  5 | リョウスケ | ryousuke@example.com  | 2003-10-01 | 
  6 | ユリコ     | yuriko@example.com    | 2005-09-01 | 
  7 | ノリカ     | norika@example.com    | 2005-11-01 | 2014-03-31
  8 | ジュウベエ | jyubei@example.com    | 2011-02-01 | 
  9 | ミキ       | miki@example.com      | 2013-03-15 | 
 10 | タクジ     | takuji@example.com    | 2014-04-02 | 
(10 rows)

delete from employees where end_date <= '2013-3-31';

//4 できていない
 id | category_id |   name   | price    
----+-------------+----------+-------   
  1 |           1 | 鮪       |   900
  2 |           1 | 鯛       |   720
  4 |           1 | 鰹       |   630
  5 |           2 | 牛       |  1080
  7 |           2 | 豚       |   540
  8 |           2 | 鳥       |   360
  9 |           3 | キャベツ |   180
 10 |           3 | レタス   |   153
 11 |           3 | 人参     |    72
 12 |           3 | 大根     |   108
 13 |           1 | 鰯       |   135
 14 |           2 | 羊       |   585
(12 rows)

select min(id)
from items
WHERE EXISTS (SELECT id FROM items WHERE id is null);


select * 
from items
id is null;
//5

 code | area_code |   name   | acreage  
------+-----------+----------+----------    
 01   | 10        | 北海道   | 83456.87
 02   | 20        | 青森県   |  9644.54
 03   | 20        | 岩手県   | 15278.89
 04   | 20        | 宮城県   |  7285.76
 05   | 20        | 秋田県   | 11636.25
 06   | 20        | 山形県   |  9323.46
 07   | 20        | 福島県   | 13782.76
 08   | 30        | 茨城県   |  6095.72
 09   | 30        | 栃木県   |  6408.28
 10   | 30        | 群馬県   |  6362.33
 11   | 30        | 埼玉県   |  3798.13
 12   | 30        | 千葉県   |   5156.7
 13   | 30        | 東京都   |   2187.5
 14   | 30        | 神奈川県 |  2415.86
 15   | 40        | 新潟県   | 12583.81
 16   | 40        | 富山県   |  4247.61
 17   | 40        | 石川県   |  4185.66
 18   | 40        | 福井県   |  4189.83
 19   | 40        | 山梨県   |  4465.37
 20   | 40        | 長野県   | 13562.23
 21   | 40        | 岐阜県   | 10621.17
:

 code |  name  
------+--------
 00   | 全国
 10   | 北海道
 20   | 東北
 30   | 関東
 40   | 中部
 50   | 近畿
 60   | 中国
 70   | 四国
 80   | 九

 select  a.name area , p.name  prefecture
 from prefectures  p join areas a
 on p.area_code = a.code
 group by prefecture , area ,a.code , p.code
 order by a.code ,p.code;

 //6
 select sum(population)  population
 from populations;

 //7
prefectures
 code | area_code |   name   | acreage  
------+-----------+----------+----------    
 01   | 10        | 北海道   | 83456.87
 02   | 20        | 青森県   |  9644.54
 03   | 20        | 岩手県   | 15278.89
 04   | 20        | 宮城県   |  7285.76
 05   | 20        | 秋田県   | 11636.25
 06   | 20        | 山形県   |  9323.46
 07   | 20        | 福島県   | 13782.76
 08   | 30        | 茨城県   |  6095.72
 09   | 30        | 栃木県   |  6408.28
 10   | 30        | 群馬県   |  6362.33
 11   | 30        | 埼玉県   |  3798.13
 12   | 30        | 千葉県   |   5156.7
 13   | 30        | 東京都   |   2187.5
 14   | 30        | 神奈川県 |  2415.86
 15   | 40        | 新潟県   | 12583.81
 16   | 40        | 富山県   |  4247.61
 17   | 40        | 石川県   |  4185.66
 18   | 40        | 福井県   |  4189.83
 19   | 40        | 山梨県   |  4465.37
 20   | 40        | 長野県   | 13562.23
 21   | 40        | 岐阜県   | 10621.17

sexes
  code | name 
------+------
 f    | 女
 m    | 男
(2 rows)
populations
id  | prefecture_code | age_range_code | sex_code | population 
-----+-----------------+----------------+----------+------------
   1 | 01              | 1              | m        |     335353
   2 | 02              | 1              | m        |      87585
   3 | 03              | 1              | m        |      86612
   4 | 04              | 1              | m        |     158024
   5 | 05              | 1              | m        |      63335
   6 | 06              | 1              | m        |      76678
   7 | 07              | 1              | m        |     141275
   8 | 08              | 1              | m        |     205036
   9 | 09              | 1              | m        |     138441
  10 | 10              | 1              | m        |     140983
  11 | 11              | 1              | m        |     488332
  12 | 12              | 1              | m        |     409583
  13 | 13              | 1              | m        |     755778
  14 | 14              | 1              | m        |     607606
  15 | 15              | 1              | m        |     154591
  16 | 16              | 1              | m        |      72852
  17 | 17              | 1              | m        |      81213
  18 | 18              | 1              | m        |      57497
  19 | 19              | 1              | m        |      59552
  20 | 20              | 1              | m        |     151921
  21 | 21              | 1         

areas
 code |  name  
------+--------
 00   | 全国
 10   | 北海道
 20   | 東北
 30   | 関東
 40   | 中部
 50   | 近畿
 60   | 中国
 70   | 四国
 80   | 九州
(9 rows)

  select pf.name prefecture , s.name sex  , sum(p.population ) population
    from populations  p   join sexes s
  on p.sex_code = s.code
  join prefectures pf on p.prefecture_code = pf.code
  where pf.area_code IN (select code from  areas a where code='80' )
  group by sex  ,  pf.name , pf.code
  order by  pf.code , s.name desc;
  
  //8

   code |  label   
------+----------
 1    | 15歳未満
 2    | 15〜64歳
 3    | 65歳以上
(3 rows)

select ar.name , (case when a.code = '1' then p.population else 0 end  ),(case when a.code = '2' then p.population else 0 end  ),(case when a.code = '3' then p.population else 0 end  )
from populations p 
join age_ranges  a on p.age_range_code = a.code
join prefectures ps on ps.code = p.prefecture_code
join areas  ar on  ps.area_code = ar.code
join sexes s on s.code = p.sex_code
group by ar.name , a.code ,p.population ,  s.name;



drop table if exists members CASCADE;
create table members(id serial primary key , name text not null , age integer , dep_id integer);

insert into members(name , age , dep_id)
VALUES('イチロー' , 21 , 1),
('ジロー' , 32 , 2),
('サブロ-' , 43 , 1);


insert into departments(name)
VALUES(:name);

insert into administrators()

select id , name , mail_address , passqord from administrators where mail_address like : mailAddress , password like :password;

select id , name , image , gender , hire_date,address ,zip_code,mail_address,telephone,salary,characteristics,dependents_count
				from employees where id = 2;



select id , name , mail_address , password from administrators where mail_address = 'abc@gmail.comaa' and password = 'abc' order by id;

select a.id , a.name , a.content , c.name , c.content  from articles a join comments c on a.id = c.article_id ;
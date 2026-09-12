--bucket the results for frequency

select number_tweets as tweet_bucket,count(*) as user_num
from
-- select user_id based aggregrate 
(select count(*) as number_tweets
from tweets
where tweet_date >='2022-01-01'
and tweet_date <='2022-12-31'
group by user_id ) t
group by number_tweets;

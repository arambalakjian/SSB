<?php
/**
 *
 *
 * @author Tyler Kidd <tyler@adaircreative.com>
 * @date 12.05.2012
 * @package silverstripe-twitter-feed
 */
class TwitterFeedExtension extends SiteTreeExtension {
	

	public static $twitter_cache_enabled = false;
	public static $twitter_cache_key;
	public static $twitter_cache_id;

	public static $twitter_consumer_key;
	public static $twitter_consumer_secret;
	public static $twitter_oauth_token;
	public static $twitter_oauth_token_secret;
	
	public static $twitter_user;
	public static $twitter_search_term;
	
	public static $twitter_config = array(
		'include_entities' => 'true',
		'include_rts' => 'true'
	);
	
	public function TwitterFeed($limit = null){

		if(!$limit)
		{
			$limit = Controller::curr()->Items()->count() * 2;
		}
	
		if(self::$twitter_cache_enabled){
			$cache = SS_Cache::factory(self::$twitter_cache_key);
			$cacheID = self::$twitter_cache_id;
		}

		if(!self::$twitter_cache_enabled || (isset($cache) && (!$output = unserialize($cache->load($cacheID))))){
	
			require_once(Director::baseFolder().'/'.TWITTER_FEED_BASE.'/thirdparty/twitteroauth/twitteroauth.php');

			$connection = new TwitterOAuth(
				self::$twitter_consumer_key,
				self::$twitter_consumer_secret,
				self::$twitter_oauth_token,
				self::$twitter_oauth_token_secret
			);
			
			$config = self::$twitter_config;

			if(self::$twitter_search_term){
				$config['q'] = self::$twitter_search_term;
			}
			
			$tweets = $connection->get('search/tweets', $config)->statuses;
	
			$tweetList = new ArrayList();
						
			if(count($tweets) > 0 && !isset($tweets->error)){
				$i = 0;
				foreach($tweets as $tweet){
					
					if(++$i > $limit) break;

					$tweetData = array();
					
					$date = new SS_Datetime();
					$date->setValue(strtotime($tweet->created_at));
					$tweetData['Date'] = $date;
					


					$text = $tweet->text;

					if($tweet->entities && isset($tweet->entities->urls)){
						foreach($tweet->entities->urls as $url){
							$text = str_replace($url->url, '<a href="'.$url->url.'" target="_blank">'.$url->url.'</a>',$text);
						}
					}

					if($tweet->entities && isset($tweet->entities->media)){
						foreach($tweet->entities->media as $media){
							$text = str_replace($media->url, '<a href="'.$media->url.'" target="_blank">'.$media->url.'</a>',$text);
						}
					}

					$tweetData['Title'] = $text;




					//get a profile image
					if($tweet->user && $tweet->user->profile_image_url)
					{
						$tweetData['Image'] = $tweet->user->profile_image_url;
					}

					//get the user name
					if($tweet->user && $tweet->user->name)
					{
						$tweetData['Name'] = $tweet->user->name;
					}

					$tweetList->push(
						new ArrayData($tweetData)
					);
	
				}
			}
			
			$view = new ViewableData();
			$output = $view->renderWith('TwitterFeed', array('Tweets' => $tweetList));
			
			if(self::$twitter_cache_enabled){
				$cache->save(serialize($output), $cacheID);
			}
		}
		
		return $output;

	}
	
}

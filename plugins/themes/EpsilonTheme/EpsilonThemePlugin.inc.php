<?php

/**
 * @file plugins/themes/default/EpsilonThemeplugins.themes.inc.php
 *
 * @class EpsilonThemePlugin
 * @ingroup plugins_themes
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class EpsilonThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {
		
		// Fonts option
		$this->addOption('typography', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.default.option.typography.label'),
			'description' => __('plugins.themes.default.option.typography.description'),
			'options' => [
				[
					'value' => 'notoSans',
					'label' => __('plugins.themes.default.option.typography.notoSans'),
				],
				[
					'value' => 'notoSerif',
					'label' => __('plugins.themes.default.option.typography.notoSerif'),
				],
				[
					'value' => 'notoSerif_notoSans',
					'label' => __('plugins.themes.default.option.typography.notoSerif_notoSans'),
				],
				[
					'value' => 'notoSans_notoSerif',
					'label' => __('plugins.themes.default.option.typography.notoSans_notoSerif'),
				],
				[
					'value' => 'lato',
					'label' => __('plugins.themes.default.option.typography.lato'),
				],
				[
					'value' => 'lora',
					'label' => __('plugins.themes.default.option.typography.lora'),
				],
				[
					'value' => 'lora_openSans',
					'label' => __('plugins.themes.default.option.typography.lora_openSans'),
				],
				[
					'value' => 'monteserrat',
					'label' => 'Font custom',
				],
			],
			'default' => 'notoSans',
		]);
		
		// Additional Home Content Display 
		$this->addOption('additionalHomeContent', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.additionalContent.display.label'),
			'description' => __('plugins.themes.EpsilonTheme.additionalContent.display.description'),
		]);
		
		// Preloader
		$this->addOption('preloaderLoading', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.preloaderLoading.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false
		]);
		
		// index Journal Layout Style option
		$this->addOption('indexJournalLayout', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.indexJournalLayout.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.tabStyle.label'),
				],
			],
			'default' => false
		]);
		
		// Index Journal Layout Style option
		$this->addOption('issueArchiveLayout', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.issueArchiveLayout.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.tabStyle.label'),
				],
			],
			'default' => false
		]);
		
		// Detail Article Layout Style option
		$this->addOption('detailArticleLayout', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.detailArticleLayout.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.tabStyle.label'),
				],
			],
			'default' => false
		]);
		
		// About Journal Summary on Homepage
		$this->addOption('showDescriptionInJournalIndex', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.journalSummaryHomepage.display.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false,
		]);
		
		// Popular Articles on Homepage
		$this->addOption('popularArticles', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.popularArticlesIndex.display.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false,
		]);
		
		// Sidebar Search
		$this->addOption('sidebarSearch', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.sidebarSearch.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false
		]);
		
		// Dimension Badge on Article Summary
		$this->addOption('dimensionBadgeArticleSummary', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.dimensionBadgeDisplayArticleSummary.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false,
		]);
		
		// Dimension Badge Article Details
		$this->addOption('dimensionBadgeDetailArticle', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.dimensionBadgeDisplayDetailArticle.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false,
		]);
		
		// Back to Top Button
		$this->addOption('backTopButton', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.backTopButton.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => false,
		]);
		
		// Bottom Navigation
		$this->addOption('bottomNav', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.bottomNav.display.option'),
				'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.label.show'),
				],
			],
			'default' => true,
		]);
		
		// Layout Style option
		$this->addOption('layoutStyle', 'FieldOptions', [
			'label' => __('plugins.themes.EpsilonTheme.layoutStyle.label'),
			'options' => [
				[
					'value' => true,
					'label' => __('plugins.themes.EpsilonTheme.layoutStyle.true'),
				],
			],
			'default' => false
		]);
		
		// Pattern Options
		$this->addOption('bgPattern', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.label'),
			'description' => __('plugins.themes.EpsilonTheme.options.bgPattern.description'),
			'options' => [
				[
					'value' => 'bg_0',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg0'),
				],
				[
					'value' => 'bg_1',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg1'),
				],
				[
					'value' => 'bg_2',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg2'),
				],
				[
					'value' => 'bg_3',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg3'),
				],
				[
					'value' => 'bg_4',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg4'),
				],
				[
					'value' => 'bg_5',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg5'),
				],
				[
					'value' => 'bg_6',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg6'),
				],
				[
					'value' => 'bg_7',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg7'),
				],
				[
					'value' => 'bg_8',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg8'),
				],
				[
					'value' => 'bg_9',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg9'),
				],
				[
					'value' => 'bg_10',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg10'),
				],
				[
					'value' => 'bg_11',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg11'),
				],
				[
					'value' => 'bg_12',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg12'),
				],
				[
					'value' => 'bg_13',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg13'),
				],
				[
					'value' => 'bg_14',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg14'),
				],
				[
					'value' => 'bg_15',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg15'),
				],
				[
					'value' => 'bg_16',
					'label' => __('plugins.themes.EpsilonTheme.options.bgPattern.bg16'),
				],
			],
		]);
		
		// load default color accent
		$this->addOption('primaryColor', 'FieldColor', [
			'label' => __('plugins.themes.EpsilonTheme.option.color.label'),
			'description' => __('plugins.themes.EpsilonTheme.option.color.description'),
			'default' => '#62799B',
		]);
		
		// default background pattern
		$bgPattern = $this->getOption('bgPattern');
		if (empty($bgPattern) || $bgPattern === 'bg_2') {
			$this->addStyle('blue', 'css/bg/bg_2.css');
		} else {
			$this->addStyle('bgPattern-' . $bgPattern, 'css/bg/'. $bgPattern . '.css');
		}
		
		// Load primary stylesheet
		$this->addStyle('stylesheet', 'css/style.less');
		
		// Load fonts from Google Font CDN
		// To load extended latin or other character sets, see:
		// https://www.google.com/fonts#UsePlace:use/Collection:Noto+Sans
		if (Config::getVar('general', 'enable_cdn')) {

			if ($this->getOption('typography') === 'notoSerif') {
				$this->addStyle(
					'fontNotoSerif',
					'//fonts.googleapis.com/css?family=Noto+Serif:400,400i,700,700i',
					array('baseUrl' => '')
				);
				$additionalLessVariables[] = '@font: "Noto Serif", -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen-Sans", "Ubuntu", "Cantarell", "Helvetica Neue", sans-serif;';

			} elseif (strpos($this->getOption('typography'), 'notoSerif') !== false) {
				$this->addStyle(
					'fontNotoSansNotoSerif',
					'//fonts.googleapis.com/css?family=Noto+Sans:400,400i,700,700i|Noto+Serif:400,400i,700,700i',
					array('baseUrl' => '')
				);

				// Update LESS font variables
				if ($this->getOption('typography') == 'notoSerif_notoSans') {
					$additionalLessVariables[] = '@font-heading: "Noto Serif", serif;';
				} elseif ($this->getOption('typography') == 'notoSans_notoSerif') {
					$additionalLessVariables[] = '@font: "Noto Serif", serif;@font-heading: "Noto Sans", serif;';
				}

			} elseif ($this->getOption('typography') == 'lato') {
				$this->addStyle(
					'fontLato',
					'//fonts.googleapis.com/css?family=Lato:400,400i,900,900i',
					array('baseUrl' => '')
				);
				$additionalLessVariables[] = '@font: Lato, sans-serif;';

			} elseif ($this->getOption('typography') == 'lora') {
				$this->addStyle(
					'fontLora',
					'//fonts.googleapis.com/css?family=Lora:400,400i,700,700i',
					array('baseUrl' => '')
				);
				$additionalLessVariables[] = '@font: Lora, serif;';

			} elseif ($this->getOption('typography') == 'lora_openSans') {
				$this->addStyle(
					'fontLoraOpenSans',
					'//fonts.googleapis.com/css?family=Lora:400,400i,700,700i|Open+Sans:400,400i,700,700i',
					array('baseUrl' => '')
				);
				$additionalLessVariables[] = '@font: "Open Sans", sans-serif;@font-heading: Lora, serif;';

			} elseif ($this->getOption('typography') == 'monteserrat') {
				$this->addStyle(
					'fontMontserrat',
					'//fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;0,900;1,500',
					array('baseUrl' => '')
				);
				$additionalLessVariables[] = '@font: "Montserrat", sans-serif;@font-heading: Montserrat, sans-serif;';

			} else {
				$this->addStyle(
					'fontMontserrat',
					'//fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;0,900;1,500',
					array('baseUrl' => '')
				);
			}
		}
		
		// Update colour based on theme option
		if ($this->getOption('primaryColor') !== '#62799B') {
			$additionalLessVariables[] = '@primary:' . $this->getOption('primaryColor') . ';';
		}
		
		// Pass additional LESS variables based on options
		if (!empty($additionalLessVariables)) {
			$this->modifyStyle('stylesheet', array('addLessVariables' => join("\n", $additionalLessVariables)));
		}

		$request = Application::get()->getRequest();
		
		$locale = AppLocale::getLocale();
		if (AppLocale::getLocaleDirection($locale) === 'rtl') {
			if (Config::getVar('general', 'enable_cdn')) {
				$this->addStyle('bootstrap-rtl', 'css/bootstrap.rtl.min.css');
			} else {
				$this->addStyle('bootstrap-rtl', '//cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.rtl.min.css', array('baseUrl' => ''));
			}
		}
		
		// Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
		$min = Config::getVar('general', 'enable_minified') ? '.min' : '';
		$request = Application::get()->getRequest();
		// Use an empty `baseUrl` argument to prevent the theme from looking for
		// the files within the theme directory
		$jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
		$jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
		$this->addScript('jQuery', $jquery, array('baseUrl' => ''));
		$this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));
		$this->addScript('jQueryTagIt', $request->getBaseUrl() . '/lib/pkp/js/lib/jquery/plugins/jquery.tag-it.js', array('baseUrl' => ''));

		// Load Bootstrap
		$this->addScript('bootstrap', 'js/bootstrap.bundle.min.js');
		$this->addScript('main', 'js/main.obs.js');
		$this->addScript('datatable-js', 'css/datatables/js/jquery.dataTables.js');
		$this->addScript('datatable-init', 'css/datatables/js/datatables.init.min.js');
		
		// load styles
		$this->addStyle('bootstrap-css', 'css/bootstrap.min.css');
		$this->addStyle('animate', 'css/animate.min.css');
		$this->addStyle('fontAwesome', 'css/font-awesome.min.css');
		$this->addStyle('datatable-css', 'css/datatables/css/jquery.dataTables.min.css');
	
		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));
		
		
		HookRegistry::register('TemplateManager::display', array($this, 'browsePopular'));
	}
	
	public function loadTemplateData($hookName, $args) {
		if (!defined('SESSION_DISABLE_INIT')) {
			$doiTxt = $this->getPluginPath() . '/templates/images/doi-txt.png';
			$templateMgr->assign(array(
				'doiTxt' => $doiTxt,
			));
		}
	}
	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.EpsilonTheme.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.EpsilonTheme.description');
	}
	
	/**
	 * @param $hookName string
	 * @param $args array [TemplateManager, string]
	 * @brief display most popular articles
	 * @return void
	 * Thanks to @ajnyga
	 */
	function browsePopular($hookName, $args) {
		$smarty = $args[0];
		$template = $args[1];

		if ($template != 'frontend/pages/indexJournal.tpl') return false;

		$request = $this->getRequest();
		$context = $request->getContext();

		$cacheManager = CacheManager::getManager();
		$cache = $cacheManager->getCache('oldgregg', $context->getId(), array($this, '_toCache'));
		$daysToStale = 1;
		if (time() - $cache->getCacheTime() > 60 * 60 * 24 * $daysToStale) {
			$cache->flush();
		}

		$popularArticles = $cache->getContents();

		$smarty->assign([
			'popularArticles' => $popularArticles,
			'locale' => AppLocale::getLocale(),
		]);

	}

	/**
	 * @param $cache FileCache
	 */
	function _toCache($cache) {
		$request = $this->getRequest();
		$context = $request->getContext();

		// Find most viewed articles
		$filter = array(
			STATISTICS_DIMENSION_ASSOC_TYPE => ASSOC_TYPE_SUBMISSION,
		);
		$filter[STATISTICS_DIMENSION_DAY]['from'] = date('Ymd', mktime(0, 0, 0, date("m")-12, date("d"),   date("Y")));
		$filter[STATISTICS_DIMENSION_DAY]['to'] = date('Ymd');
		$orderBy = array(STATISTICS_METRIC => STATISTICS_ORDER_DESC);
		$column = array(
			STATISTICS_DIMENSION_SUBMISSION_ID,
		);

		$latestArticles = $this->getOption("latestArticlesNumber");
		if (is_null($latestArticles)) {
			$latestArticles = OLDGREGG_LATEST_ARTICLES_DEFAULT;
		} else {
			$latestArticles = intval($latestArticles);
		}

		$dbrange = new DBResultRange($latestArticles);

		$results = $context->getMetrics(OJS_METRIC_TYPE_COUNTER, $column, $filter, $orderBy, $dbrange);

		// Write into cache
		$supportedLocales = AppLocale::getSupportedLocales();

		$popularArticles = array();
		foreach ($results as $result) {
			$publishedArticle = Services::get('submission')->get($result['submission_id']);

			// The submission likely was unpublished, see Vitaliy-1/oldGregg#132
			if (!$publishedArticle) continue;

			// Can't cache objects
			$popularArticles[$result['submission_id']] = array(
				'views' => $result['metric'],
				'date_published' => $publishedArticle->getDatePublished()
			);

			$localizedTitle = array();
			foreach ($supportedLocales as $key => $locale) {
				$localizedTitle[$key] = $publishedArticle->getFullTitle($key);
			}

			$popularArticles[$result['submission_id']]['localized_title'] = $localizedTitle;

			if (!empty($publishedArticle->getAuthors())) {
				$authorsArray = array();
				foreach ($publishedArticle->getAuthors() as $author) {
					foreach ($supportedLocales as $key => $locale) {
						$authorArray[$key] = array(
							'family_name' => $author->getFamilyName($key),
							'given_name' => $author->getGivenName($key),
						);
					}

					$authorsArray[] = $authorArray;
				}

				$popularArticles[$result['submission_id']]['authors'] = $authorsArray;
			}
		}

		$cache->setEntireCache($popularArticles);
	}
	
	
}

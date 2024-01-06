{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
<form class="pkp_search {$className|escape}" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}" method="get" role="search" aria-label="{translate|escape key="submission.search"}">


{csrf}
{foreach from=$formUrlParameters key=paramKey item=paramValue}

<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
		{/foreach}
	
  <div class="input-group input-group-sm">  
    <input class="form-control" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}" placeholder="Type the keywords">
	<div class="bg-primary rounded-end">
	    <button type="submit" class="btn btn-primary btn-sm" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></button>
	</div>
  </div>


</form>
{/if}


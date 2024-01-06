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
<form class="form-group" role="search" method="post" action="{url page="search" op="search"}">
	{*
	<div class="input-group">
		<input class="form-control shadow-none" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}" placeholder="Type the keywords">
		<button type="submit" class="btn rounded-sm btn-primary shadow-none"><i class="fa fa-search" aria-hidden="true"></i></button>
	</div>
	*}
	<div class="input-btn-absolute input-expand">  
    <input class="form-control" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}" placeholder="{translate key="common.search"}">
	<button type="submit" class="btn-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></button>
  </div>
</form>
{/if}

{**
 * templates/frontend/pages/searchAuthorIndex.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
{assign var="pageTitle" value="search.authorIndex"}
{include file="frontend/components/header.tpl"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}
{/strip}
{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="search.authorIndex"}
<div class="mt-4"></div>
    
        {foreach from=$alphaList item=letter}
        {if $letter == $searchInitial}
        <a class="btn rounded-sm btn-primary disabled btn-sm mb-1"href="{url op="authors" searchInitial=$letter}">{$letter|escape}
        {else}
        <a class="btn rounded-sm btn-outline-primary btn-sm mb-1" href="{url op="authors" searchInitial=$letter}">{$letter|escape}{/if}</a>{/foreach}
        <a class="btn rounded-sm btn-outline-primary btn-sm mb-1" href="{url op="authors"}">{if $searchInitial==''}{translate key="common.all"}{else}{translate key="common.all"}{/if}</a>
    

<div id="authors">
{iterate from=authors item=author}
	{assign var=lastFirstLetter value=$firstLetter}
	{assign var=firstLetter value=$author->getLocalizedGivenName()|String_substr:0:1}

	{if $lastFirstLetter|lower != $firstLetter|lower}
			<div class="my-4" id="{$firstLetter|escape}">
		<h5 class="my-0"><kbd class="bg-primary-darken-2 px-3">{$firstLetter|escape}</kbd></h5>
			</div>
	{/if}

	{assign var=lastAuthorName value=$authorName}
	{assign var=lastAuthorCountry value=$authorCountry}

	{assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
	{assign var=authorCountry value=$author->getCountry()}

	{assign var=authorGivenName value=$author->getLocalizedGivenName()}
	{assign var=authorFamilyName value=$author->getLocalizedFamilyName()}
	{assign var=authorName value=$author->getFullName(false, true)}

	{strip}
		<a href="{url op="authors" path="view" givenName=$authorGivenName familyName=$authorFamilyName affiliation=$authorAffiliation country=$authorCountry authorName=$authorName}"><strong>{$authorName|escape}</strong></a>
		{if $authorAffiliation}, {$authorAffiliation|escape}{/if}
		{if $lastAuthorName == $authorName && $lastAuthorCountry != $authorCountry}
			{* Disambiguate with country if necessary (i.e. if names are the same otherwise) *}
			{if $authorCountry} ({$author->getCountryLocalized()}){/if}
		{/if}
	{/strip}
	<div class="clearfix my-2"></div>
{/iterate}
{if !$authors->wasEmpty()}
	<div class="clearfix my-3">
	<span class="mr-5">{page_info iterator=$authors}</span>{page_links anchor="authors" iterator=$authors name="authors" searchInitial=$searchInitial}
	</div>
{else}
{/if}
</div>
{include file="frontend/components/footer.tpl"}


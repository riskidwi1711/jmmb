{**
 * templates/frontend/pages/searchAuthorDetails.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Index of published submissions by author.
 *
 *}
{strip}
{assign var="pageTitle" value="search.authorDetails"}
{include file="frontend/components/header.tpl"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}
{/strip}
{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="search.authorDetails"}
<div id="authorDetails" class="mt-4">
<h3 class="obj-title">{$authorName|escape}</h3>
<p class="">{if $affiliation}<i class="fa fa-university me-1" aria-hidden="true"></i><span class="me-2">{$affiliation|escape}</span>{/if}{if $country}<i class="fa fa-flag ms-2 me-1" aria-hidden="true"></i> {$country|escape}{/if}</p>

{foreach from=$submissions item=article}
	{assign var=issueId value=$article->getCurrentPublication()->getData('issueId')}
	{assign var=issue value=$issues[$issueId]}
	{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
	{assign var=sectionId value=$article->getCurrentPublication()->getData('sectionId')}
	{assign var=journalId value=$article->getData('contextId')}
	{assign var=journal value=$journals[$journalId]}
	{assign var=section value=$sections[$sectionId]}
	{if $issue->getPublished() && $section && $journal}
	<div class="mt-3 article-summary animate__animated animate__fadeInUp delay-1s">
		<h4 class="obj-title"><a href="{url journal=$journal->getPath() page="issue" op="view" path=$issue->getBestIssueId()}">{$journal->getLocalizedName()|escape} {$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</a></h4>
		<p class="mb-2">
		<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()}">
		{$article->getLocalizedTitle()|strip_unsafe_html}
		{if $article->getLocalizedSubtitle()}
		: <em>{$article->getLocalizedSubtitle()|escape}</em>
		</a> <small class="text-muted"> ~ {$section->getLocalizedTitle()|escape}</small>
		{/if}
		
		</p>
		<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()}" class="file btn rounded-sm btn-primary btn-sm">
		
		{if $article->getCurrentPublication()->getData('abstract')}<i class="fa fa-file-text-o me-1" aria-hidden="true"></i>{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a>
		{if (!$issueUnavailable || $article->getCurrentPublication()->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN)}
		{foreach from=$article->getGalleys() item=galley name=galleyList}
			<a class="file btn rounded-sm btn-outline-primary btn-sm" href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}" class="file"><i class="fa fa-file-pdf-o me-1" aria-hidden="true"></i>{$galley->getGalleyLabel()|escape}</a>
		{/foreach}
		{/if}
	</div>
	{/if}
{/foreach}

</div>
{include file="frontend/components/footer.tpl"}


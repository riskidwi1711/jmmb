{**
* templates/frontend/objects/article_summary.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief View of an Article summary which is shown within a list of articles.
*
* @uses $article Article The article
* @uses $hasAccess bool Can this user access galleys for this context? The
*       context may be an issue or an article
* @uses $showGalleyLinks bool Show galley links to users without access?
* @uses $hideGalleys bool Hide the article galleys for this article?
* @uses $primaryGenreIds array List of file genre ids for primary file types
*}
{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
{assign var="showAuthor" value=true}
{/if}
<div class="col-12">
	<div class="d-none d-md-block article-summary animate__animated animate__fadeInUp delay-1s ">
		<div class="row">
		    <div class="col-sm-12 col-md-3 col-lg-2">
		        	{if $article->getLocalizedCoverImage()}
		<div class="cover">
			<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file">
				<img class="img-fluid shadow rounded" src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText() != ''} alt="{$article->getLocalizedCoverImageAltText()|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}>
			</a>
		</div>
	{/if}
		    </div>
			<div class="col-sm-12 col-md-8 col-lg-10">
				<a href="{url page="article" op="view" path=$articlePath}">
						<h5 class="fw-bold">
							{$article->getLocalizedTitle()|strip_unsafe_html}
						
						{if $article->getLocalizedSubtitle()}
						<br />
						<small class="subtitle">{$article->getLocalizedSubtitle()|escape}</small>
						{/if}
						</h5>
					</a>
					
					{if $showAuthor}
					<div class="meta col align-self-end">
						{if $showAuthor}
						<div class="blockquote-footer text-dark authors my-1">
							{$article->getAuthorString()|escape}
						</div>
						{/if}
					</div>
					{/if}
			</div>
			<div class="col-md-12 col-lg-12">
				<div class="d-flex flex-md-column flex-lg-row gap-md-2 justify-content-between align-md-items-start">
				    <div class="row">
					<div class="col-md-12">
					{if !$hideGalleys && $article->getGalleys()}
						
						{foreach from=$article->getGalleys() item=galley}
							{if $primaryGenreIds}
								{assign var="file" value=$galley->getFile()}
								{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
									{continue}
								{/if}
							{/if}
							{assign var="hasArticleAccess" value=$hasAccess}
								{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
									{assign var="hasArticleAccess" value=1}
								{/if}
									{include file="frontend/objects/galley_link.tpl" parent=$article labelledBy="article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
						{/foreach}
						
						{* DOI (requires plugin) *}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{if $pubIdPlugin->getPubIdType() != 'doi'}
								{continue}
							{/if}
							{if $issue->getPublished()}
								{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
							{else}
								{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
							{/if}
							{if $pubId}
								{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
								{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
								<a href="{$doiUrl}" class="btn-doi btn btn-warning btn-sm animate__animated animate__fadeIn animate__delay-1s">
									<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-txt.png"> 
								</a>
							{/if}
						{/foreach}
						
					{/if}
					
					{* Dimensions Badge *}
					{if $activeTheme->getOption('dimensionBadgeArticleSummary')}
					<span class="d-inline-block __dimensions_badge_embed__" data-doi="{$pubId|escape}" data-legend="never" data-style="small_rectangle"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
					{/if}
					
					
					</div>
				</div>	
					{* Page numbers and view counts for this article *}
				<div class="d-flex flex-md-column flex-lg-row gap-md-1 gap-2">
					<div class=" small">
						{assign var=galleys value=$article->getGalleys()}
						<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.view"}">
						<span class="d-none d-md-inline-block">View :</span>
						<i class="d-inline d-md-none d-lg-none fa fa-eye me-1"></i><div class="btn btn-secondary btn-sm p-1">{$article->getViews()}</div></span>
					</div>	
					{if $galleys}
					<div class="small">
						<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.download"}">
						<span class="d-none d-md-inline-block">Download :</span>
						<i class="d-inline d-md-none d-lg-none fa fa-cloud-download me-1"></i><div class="btn btn-secondary btn-sm p-1">{$galley->getViews()}</div></span>
					</div>
					<div class="small">
						{if $article->getPages()}
						
						<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.download"}">
						<span class="d-none d-md-inline-block">Pages :</span>
						<i class="d-inline d-md-none d-lg-none fa fa-cloud-download me-1"></i><div class="btn btn-secondary btn-sm p-1">{$article->getPages()|escape}</div></span>
						{/if}
					</div>
					{/if}
				</div>
				</div>
			</div>
		</div>				
	</div>
	
	<div class="d-block d-md-none article-summary animate__animated animate__fadeInUp delay-1s">
		<div class="row g-1">
			<div class="col-12">
				<a href="{url page="article" op="view" path=$articlePath}">
						<h5 class="fw-bold">
							{$article->getLocalizedTitle()|strip_unsafe_html}
						
						{if $article->getLocalizedSubtitle()}
						<br />
						<small class="subtitle">{$article->getLocalizedSubtitle()|escape}</small>
						{/if}
						</h5>
					</a>
					
					{if $showAuthor}
					<div class="meta col align-self-end">
						{if $showAuthor}
						<div class="blockquote-footer text-dark authors my-1">
							{$article->getAuthorString()|escape}
						</div>
						{/if}
					</div>
					{/if}
			</div>
			
			<div class="col-12">
				<div class="row g-0">
					
					<div class="col-6 text-start">
					{if !$hideGalleys && $article->getGalleys()}
						
						{foreach from=$article->getGalleys() item=galley}
							{if $primaryGenreIds}
								{assign var="file" value=$galley->getFile()}
								{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
									{continue}
								{/if}
							{/if}
							{assign var="hasArticleAccess" value=$hasAccess}
								{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
									{assign var="hasArticleAccess" value=1}
								{/if}
									{include file="frontend/objects/galley_link.tpl" parent=$article labelledBy="article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
						{/foreach}
						
						{* DOI (requires plugin) *}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{if $pubIdPlugin->getPubIdType() != 'doi'}
								{continue}
							{/if}
							{if $issue->getPublished()}
								{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
							{else}
								{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
							{/if}
							{if $pubId}
								{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
								{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
								<a href="{$doiUrl}" class="btn-doi btn btn-warning btn-sm animate__animated animate__fadeIn animate__delay-1s">
									<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-txt.png"> 
								</a>
							{/if}
						{/foreach}
						
					{/if}
					
					{* Dimensions Badge *}
					{if $activeTheme->getOption('dimensionBadgeArticleSummary')}
					<span class="d-inline-block __dimensions_badge_embed__" data-doi="{$pubId|escape}" data-legend="never" data-style="small_rectangle"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
					{/if}
					
					</div>
					
					{* Page numbers and view counts for this article *}
					
					<div class="col-6 small ms-auto text-end">
						{assign var=galleys value=$article->getGalleys()}
						<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.view"}">
						<span class="d-none d-md-inline-block">{translate key="plugins.themes.EpsilonTheme.view"}:</span>
						<i class="d-inline d-md-none d-lg-none fa fa-eye me-1"></i>{$article->getViews()}</span>
						
						{if $galleys}
					
						<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.download"}">
						<span class="d-none d-md-inline-block">{translate key="plugins.themes.EpsilonTheme.download"}:</span>
						<i class="d-inline d-md-none d-lg-none fa fa-cloud-download me-1"></i>{$galley->getViews()}</span>
						{/if}
						
						{if $article->getPages()}
						<span title="{translate key="plugins.themes.EpsilonTheme.page"}">
						<span class="d-none d-md-inline-block">{translate key="plugins.themes.EpsilonTheme.page"}:</span>
						<i class="d-inline d-md-none d-lg-none fa fa-file-text-o me-1"></i>{$article->getPages()|escape}
						</span>
						{/if}
						
						
						
					
					</div>
					
					
				</div>
			</div>
		</div>				
	</div>
	
	{call_hook name="Templates::Issue::Issue::Article"}
</div>
<!-- .col -->

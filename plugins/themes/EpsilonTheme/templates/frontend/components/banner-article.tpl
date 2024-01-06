<!-- banner article -->
<div class="banner-sec skrol animate__animated animate__fadeInDown d-flex flex-column">
	<div id="bannerContainer" class="container align-items-center my-auto">
	    <h2 class="banner-title-article">
			<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a>
		</h2>
		<h4 class="banner-subtitle-article d-none d-sm-block">
		    {$article->getLocalizedTitle()|escape}
				{if $article->getLocalizedSubtitle()}
					<br />
					{$article->getLocalizedSubtitle()|escape}
				{/if}
		</h4>
	</div>
</div>
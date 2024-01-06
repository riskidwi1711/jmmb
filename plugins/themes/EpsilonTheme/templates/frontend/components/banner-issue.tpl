<div class="banner-sec animate__animated animate__fadeInDown d-flex flex-column">
	
	<div id="bannerContainer" class="container align-items-center my-auto">
	    {if !$issue}
			<h3 class="banner-subtitle-article">{translate key="current.noCurrentIssueDesc"}</h3>
		{else}
			<h1 class="banner-title">
				<a class="cover-journal" href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}">{$issue->getIssueIdentification()|strip_unsafe_html}</a>
			</h1>
			<h3 class="banner-subtitle">
				{translate key="submissions.published"} {$issue->getDatePublished()|escape|date_format:$dateFormatShort}
			</h3>
		{/if}
	</div>
</div>
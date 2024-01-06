<!-- Banner main -->
<div class="banner-sec banner-fst animate__animated animate__fadeInDown d-flex flex-column">
	
	<div id="bannerContainer" class="container align-items-center my-auto">
		
		<!-- Journal name -->
		<h2 class="banner-title">
			<a href="{$homeUrl}" title="{$displayPageHeaderTitle}">{$displayPageHeaderTitle}</a>
		</h2>
		
		<!-- tagline or subtitle for journal -->
		{if $currentContext->getSetting(publisherInstitution)}
			<p>{$currentContext->getLocalizedData('acronym')} | {translate key="plugins.themes.EpsilonTheme.publisher"}
				{$currentContext->getSetting(publisherInstitution)}
			</p>
			
		{/if}
		
		<!-- journal ISSN -->
		
		<p class="serial mb-0">
			{if $currentContext->getSetting('onlineIssn')}
				<span class="e-issn">{translate key="plugins.themes.EpsilonTheme.onlineISSN"} <a href="https://portal.issn.org/resource/issn/{$currentContext->getSetting('onlineIssn')}" target="_blank">{$currentContext->getSetting('onlineIssn')}</a></span>
			{/if}
			{if $currentContext->getSetting('printIssn')}
				<span class="p-issn"> | {translate key="plugins.themes.EpsilonTheme.printISSN"} <a href="https://portal.issn.org/resource/issn/{$currentContext->getSetting('printIssn')}" target="_blank">{$currentContext->getSetting('printIssn')}</a></span>
			{/if}
		</p>
		

	</div>
</div>

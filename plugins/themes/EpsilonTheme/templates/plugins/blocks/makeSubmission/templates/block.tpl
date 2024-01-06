{**
 * plugins/blocks/makeSubmission/templates/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- "Make a Submission" block.
 *}



<div class="pkp_block block_make_submissions">
		<a class="btn-primary btn-lg btn d-block animate__animated animate__pulse animate__delay-1s" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
			<i class="fa fa-send me-2" aria-hidden="true"></i>{translate key="plugins.themes.EpsilonTheme.submission"}
		</a>
</div>


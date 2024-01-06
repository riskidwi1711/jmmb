<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-09 15:45:18
  from 'app:frontendcomponentsindexJo' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65748b8e3ee4b7_45638182',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2127e06bb2a858ea22823a6276227a3b6f97cb6b' => 
    array (
      0 => 'app:frontendcomponentsindexJo',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/objects/announcement_summary.tpl' => 1,
    'app:frontend/components/notification.tpl' => 1,
    'app:frontend/objects/issue_toc.tpl' => 1,
    'app:frontend/components/popular_articles.tpl' => 1,
  ),
),false)) {
function content_65748b8e3ee4b7_45638182 (Smarty_Internal_Template $_smarty_tpl) {
?>	<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('showDescriptionInJournalIndex')) {?>
		<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-info me-2" aria-hidden="true"></i><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"about.aboutContext"),$_smarty_tpl ) );?>

		</div>
		
		<div class="card bg-info-lighten border-0 mb-3">
		<div class="card-body">
				<div class="cover-journal">
			<?php if ($_smarty_tpl->tpl_vars['homepageImage']->value) {?>
			<img class="img-fluid rounded me-3" src="<?php echo $_smarty_tpl->tpl_vars['publicFilesDir']->value;?>
/<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImage']->value['uploadName']," url" ));?>
" alt="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImageAltText']->value ));?>
">
			<?php }?>
			<?php if ($_smarty_tpl->tpl_vars['journalDescription']->value) {?>
				<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('description');?>

			<?php }?>
		</div>
		</div>
		</div>
	<?php }?>
		
		  		  <?php if ($_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value && count($_smarty_tpl->tpl_vars['announcements']->value)) {?>
          <div class="mb-3">
			<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-bullhorn me-2" aria-hidden="true"></i><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"announcement.announcements"),$_smarty_tpl ) );?>

		</div>
		
            <section class="cmp_announcements row g-3">
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['announcements']->value, 'announcement', false, NULL, 'announcements', array (
  'iteration' => true,
));
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['announcement']->value) {
$_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']++;
?>
					<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration'] : null) > $_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value) {?>
						<?php break 1;?>
					<?php }?>
					<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration'] : null) == 1) {?>
						<div class="col-md-12">
						<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/announcement_summary.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('heading'=>"h3"), 0, true);
?>
						</div>
					<?php } else { ?>
					<div class="col-md-6 animate__animated animate__fadeInUp animate__delay-1s">
					<article class="obj-wrapper obj_announcement_summary ">
						<h4 class="obj-title">
							<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>@constant('ROUTE_PAGE'),'page'=>"announcement",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['announcement']->value->getId()),$_smarty_tpl ) );?>
">
								<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['announcement']->value->getLocalizedTitle() ));?>

							</a>
						</h4>
						<small class="date text-muted my-3">
							<i class="fa fa-calendar me-2" aria-hidden="true"></i><?php echo $_smarty_tpl->tpl_vars['announcement']->value->getDatePosted();?>

						</small>
					</article>
					</div>
					<?php }?>
				<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</section>
          </div>
		  <?php }?>
		  
		            <div class="">
			<div class="mb-3">
			<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-fire me-2" aria-hidden="true"></i><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"journal.currentIssue"),$_smarty_tpl ) );?>

		</div>
		
			<?php if (!$_smarty_tpl->tpl_vars['issue']->value) {?>
				<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/notification.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('type'=>"warning",'messageKey'=>"current.noCurrentIssueDesc"), 0, false);
?>
			<?php } else { ?>
			<section class="current_issue">
			<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/issue_toc.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
			<div class="text-end">
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>@constant('ROUTE_PAGE'),'page'=>"issue",'op'=>"archive"),$_smarty_tpl ) );?>
" class="btn btn-primary btn-sm mt-3 animate__animated animate__fadeInUp animate__delay-1s"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"journal.viewAllIssues"),$_smarty_tpl ) );?>
<i class="fa fa-angle-right ms-2" aria-hidden="true"></i></a>
			</div>
			</section>
			<?php }?>
          </div>
        
				<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('popularArticles')) {?>
		<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3"><i class="fa fa-star-o me-2" aria-hidden="true"></i>
<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.EpsilonTheme.most-viewed"),$_smarty_tpl ) );?>
</div>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/popular_articles.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
	<?php } else { ?>
	
	<?php }
}
}

<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsfooter.' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f606f68c3_57449508',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4dffb64063bb972c37e05619a2ccd9d0ea7473ac' => 
    array (
      0 => 'app:frontendcomponentsfooter.',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/searchForm_sidebar.tpl' => 1,
    'app:frontend/components/additional_home_content.tpl' => 1,
    'app:frontend/components/navbar-bottom.tpl' => 1,
    'app:frontend/components/bg_pattern.tpl' => 1,
  ),
),false)) {
function content_65752f606f68c3_57449508 (Smarty_Internal_Template $_smarty_tpl) {
?>



	</main>

		<?php if (empty($_smarty_tpl->tpl_vars['isFullWidth']->value) && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "article" && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "user" && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "login") {?>
		<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "sidebarCode", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Sidebar"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
		<?php if ($_smarty_tpl->tpl_vars['sidebarCode']->value) {?>
			<div id="sidebar" class="d-none d-md-block d-lg-block pkp_structure_sidebar col-md-4 col-lg-3 animate__animated animate__fadeInUp animate__delay-1s" role="complementary" aria-label="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.sidebar"),$_smarty_tpl ) ) ));?>
">
				<div class="row g-3">
					<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('sidebarSearch')) {?>
					<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/searchForm_sidebar.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
					<?php }?>
					
					<?php echo $_smarty_tpl->tpl_vars['sidebarCode']->value;?>

				</div>
			</div>
		<?php }?>
	<?php }?>
	
	</div><!-- row -->
	</div><!-- pkp_structure_content container -->
	
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/additional_home_content.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
	
	<footer class="footer" role="contentinfo">
		<div id="footerContainer" class="container-fluid">			
				<?php if ($_smarty_tpl->tpl_vars['pageFooter']->value) {?>
					<?php echo $_smarty_tpl->tpl_vars['pageFooter']->value;?>

				<?php }?>
				
		</div><!-- .container -->
		
	</footer>
	<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('bottomNav')) {?>
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/navbar-bottom.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
	<?php }?>
</div><!-- pkp_structure_page -->

<a class="btn btn-primary sidebar_btn d-xs-block d-sm-block d-md-none d-lg-none" data-bs-toggle="offcanvas" href="#sidebarOffcanvas" role="button" aria-controls="sidebarOffcanvas" title="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.sidebar"),$_smarty_tpl ) ) ));?>
">
	<i class="fa fa-bars" aria-hidden="true"></i>
</a>

<a href="https://api.whatsapp.com/send/?phone=6281313134124&text&app_absent=0" class="float d-flex justify-content-center align-items-center" target="_blank">
<i class="fa fa-whatsapp my-float"></i>
</a>
<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('backTopButton')) {?>
<a href="javascript:void(0);" class="btn btn-primary btn-sm rounded-circle js-back-to-top back-to-top">
	<i class="fa fa-chevron-up"></i>
</a>
<?php }?>

<span id="myCopyright"><a href="https://hsr-share.blogspot.com/" target="_blank"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.EpsilonTheme.name"),$_smarty_tpl ) ) ));?>
</a></span>

<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('bgPattern')) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/bg_pattern.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}?>

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"frontend",'scripts'=>$_smarty_tpl->tpl_vars['scripts']->value),$_smarty_tpl ) );?>

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Footer::PageFooter"),$_smarty_tpl ) );?>

</body>
</html>
<?php }
}

<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsadditio' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f607558a1_55277812',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8f03cef083fc30b1b79c2ea3361483c2c7285193' => 
    array (
      0 => 'app:frontendcomponentsadditio',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65752f607558a1_55277812 (Smarty_Internal_Template $_smarty_tpl) {
?>	<?php if ($_smarty_tpl->tpl_vars['additionalHomeContent']->value) {?>
		<div class="index-by animate__animated animate__fadeInUp animate__delay-1s mt-4">
			<div class="container">
				<div class="leading" style=" border-top: 1px dashed #e4e4e4; "></div>
				<div class="index-brand">
					<?php echo $_smarty_tpl->tpl_vars['additionalHomeContent']->value;?>

				</div>
			</div>
		</div>
	<?php }
}
}

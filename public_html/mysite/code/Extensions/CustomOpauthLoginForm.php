<?php

class CustomOpauthLoginForm extends OpauthLoginForm 
{
	
	/**
	 * Provide an action button to be clicked per strategy
	 * @return FieldList
	 */
	protected function getActions() {
		$actions = new FieldList();
		foreach($this->getStrategies() as $strategyClass) {
			$strategyMethod = 'handleStrategy' . $strategyClass;
			$fa = new FormAction($strategyMethod, $strategyClass);
			$fa->setUseButtonTag(true);
			$fa->setButtonContent('<i class="icon-' . strtolower($strategyClass) . '"></i> Sign in with ' . $strategyClass);
			$actions->push($fa);
		}
		return $actions;
	}
}
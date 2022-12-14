(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory(require("../../handsontable"));
	else if(typeof define === 'function' && define.amd)
		define(["../../handsontable"], factory);
	else {
		var a = typeof exports === 'object' ? factory(require("../../handsontable")) : factory(root["Handsontable"]);
		for(var i in a)(typeof exports === 'object' ? exports : root)[i] = a[i];
	}
})(typeof self !== 'undefined' ? self : this, function(__WEBPACK_EXTERNAL_MODULE_0__) {
	return /******/ (function(modules) { // webpackBootstrap
		/******/ // The module cache
		/******/
		var installedModules = {};
		/******/
		/******/ // The require function
		/******/
		function __webpack_require__(moduleId) {
			/******/
			/******/ // Check if module is in cache
			/******/
			if(installedModules[moduleId]) {
				/******/
				return installedModules[moduleId].exports;
				/******/
			}
			/******/ // Create a new module (and put it into the cache)
			/******/
			var module = installedModules[moduleId] = {
				/******/
				i: moduleId,
				/******/
				l: false,
				/******/
				exports: {}
				/******/
			};
			/******/
			/******/ // Execute the module function
			/******/
			modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
			/******/
			/******/ // Flag the module as loaded
			/******/
			module.l = true;
			/******/
			/******/ // Return the exports of the module
			/******/
			return module.exports;
			/******/
		}
		/******/
		/******/
		/******/ // expose the modules object (__webpack_modules__)
		/******/
		__webpack_require__.m = modules;
		/******/
		/******/ // expose the module cache
		/******/
		__webpack_require__.c = installedModules;
		/******/
		/******/ // define getter function for harmony exports
		/******/
		__webpack_require__.d = function(exports, name, getter) {
			/******/
			if(!__webpack_require__.o(exports, name)) {
				/******/
				Object.defineProperty(exports, name, {
					/******/
					configurable: false,
					/******/
					enumerable: true,
					/******/
					get: getter
					/******/
				});
				/******/
			}
			/******/
		};
		/******/
		/******/ // getDefaultExport function for compatibility with non-harmony modules
		/******/
		__webpack_require__.n = function(module) {
			/******/
			var getter = module && module.__esModule ?
				/******/
				function getDefault() {
					return module['default'];
				} :
				/******/
				function getModuleExports() {
					return module;
				};
			/******/
			__webpack_require__.d(getter, 'a', getter);
			/******/
			return getter;
			/******/
		};
		/******/
		/******/ // Object.prototype.hasOwnProperty.call
		/******/
		__webpack_require__.o = function(object, property) {
			return Object.prototype.hasOwnProperty.call(object, property);
		};
		/******/
		/******/ // __webpack_public_path__
		/******/
		__webpack_require__.p = "";
		/******/
		/******/ // Load entry module and return exports
		/******/
		return __webpack_require__(__webpack_require__.s = 3);
		/******/
	})
	/************************************************************************/
	/******/
	([
		/* 0 */
		/***/
		(function(module, exports) {

			module.exports = __WEBPACK_EXTERNAL_MODULE_0__;

			/***/
		}),
		/* 1 */
		,
		/* 2 */
		,
		/* 3 */
		/***/
		(function(module, exports, __webpack_require__) {

			"use strict";

			exports.__esModule = true;

			var _dictionary;

			var _handsontable = __webpack_require__(0);

			var _handsontable2 = _interopRequireDefault(_handsontable);

			function _interopRequireDefault(obj) {
				return obj && obj.__esModule ? obj : {
					default: obj
				};
			}

			function _defineProperty(obj, key, value) {
				if(key in obj) {
					Object.defineProperty(obj, key, {
						value: value,
						enumerable: true,
						configurable: true,
						writable: true
					});
				} else {
					obj[key] = value;
				}
				return obj;
			}
			/**
			 * @preserve
			 * Authors: Handsoncode
			 * Last updated: Nov 15, 2017
			 *
			 * Description: Definition file for English - United States language-country.
			 */

			var C = _handsontable2.default.languages.dictionaryKeys;

			var dictionary = (_dictionary = {
				languageCode: 'ZH'
			}, _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ROW_ABOVE, '??????????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ROW_BELOW, '??????????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_INSERT_LEFT, '??????????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_INSERT_RIGHT, '??????????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_REMOVE_ROW, ['???????????????', '???????????????']), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_REMOVE_COLUMN, ['???????????????', '???????????????']), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_UNDO, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_REDO, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_READ_ONLY, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_CLEAR_COLUMN, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_LEFT, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_CENTER, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_RIGHT, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_JUSTIFY, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_TOP, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_MIDDLE, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ALIGNMENT_BOTTOM, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_FREEZE_COLUMN, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_UNFREEZE_COLUMN, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_BORDERS, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_BORDERS_TOP, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_BORDERS_RIGHT, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_BORDERS_BOTTOM, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_BORDERS_LEFT, '?????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_REMOVE_BORDERS, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_ADD_COMMENT, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_EDIT_COMMENT, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_REMOVE_COMMENT, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_READ_ONLY_COMMENT, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_MERGE_CELLS, '???????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_UNMERGE_CELLS, '????????????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_COPY, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_CUT, '??????'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_NESTED_ROWS_INSERT_CHILD, 'Insert child row'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_NESTED_ROWS_DETACH_CHILD, 'Detach from parent'), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_HIDE_COLUMN, ['?????????????????????', '?????????????????????']), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_SHOW_COLUMN, ['?????????????????????', '?????????????????????']), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_HIDE_ROW, ['???????????????', '???????????????']), _defineProperty(_dictionary, C.CONTEXTMENU_ITEMS_SHOW_ROW, ['???????????????', '???????????????']), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_NONE, '?????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_EMPTY, '???'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_NOT_EMPTY, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_EQUAL, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_NOT_EQUAL, '?????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_BEGINS_WITH, '?????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_ENDS_WITH, '?????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_CONTAINS, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_NOT_CONTAIN, '?????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_GREATER_THAN, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_GREATER_THAN_OR_EQUAL, '????????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_LESS_THAN, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_LESS_THAN_OR_EQUAL, '????????????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_BETWEEN, '???...??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_NOT_BETWEEN, '??????...??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_AFTER, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_BEFORE, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_TODAY, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_TOMORROW, '??????'), _defineProperty(_dictionary, C.FILTERS_CONDITIONS_YESTERDAY, '??????'), _defineProperty(_dictionary, C.FILTERS_VALUES_BLANK_CELLS, '???????????????'), _defineProperty(_dictionary, C.FILTERS_DIVS_FILTER_BY_CONDITION, '???????????????'), _defineProperty(_dictionary, C.FILTERS_DIVS_FILTER_BY_VALUE, '????????????'), _defineProperty(_dictionary, C.FILTERS_LABELS_CONJUNCTION, '???'), _defineProperty(_dictionary, C.FILTERS_LABELS_DISJUNCTION, '???'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_SELECT_ALL, '??????'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_CLEAR, '??????'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_OK, '??????'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_CANCEL, '??????'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_PLACEHOLDER_SEARCH, '??????'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_PLACEHOLDER_VALUE, '???'), _defineProperty(_dictionary, C.FILTERS_BUTTONS_PLACEHOLDER_SECOND_VALUE, '????????????'), _dictionary);

			_handsontable2.default.languages.registerLanguageDictionary(dictionary);

			exports.default = dictionary;

			/***/
		})
		/******/
	])["___"];
});
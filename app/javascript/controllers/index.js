// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChangeNavLinkColorController from "./change_nav_link_color_controller"
application.register("change-nav-link-color", ChangeNavLinkColorController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import FlatpickrTimeController from "./flatpickr_time_controller"
application.register("flatpickr-time", FlatpickrTimeController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InsertInListController from "./insert_in_list_controller"
application.register("insert-in-list", InsertInListController)

import StarRatingController from "./star_rating_controller"
application.register("star-rating", StarRatingController)

import VisibilityController from "./visibility_controller"
application.register("visibility", VisibilityController)

import RangePriceController from "./range_price_controller"
application.register("range-price", RangePriceController)

import Popover from 'stimulus-popover'
application.register('popover', Popover)

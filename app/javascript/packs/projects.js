import $ from 'jquery';
import swal from 'sweetalert';
import initSparkline from './angle/modules/charts/sparkline';
import { initFlotSpline, initFlotBarStacked } from './angle/modules/charts/flot';
import initEasyPieChart from './angle/modules/charts/easypiechart';
import initSlimsSroll from './angle/modules/common/slimscroll';
import initNowTimer from './angle/modules/common/now';
import initVectorMap from './angle/modules/maps/vector.map.demo';
import { initCardCollapse } from './angle/modules/common/card-tools';

$(function() {
    initCardCollapse();
    initSparkline();
    initFlotSpline();
    initEasyPieChart();
    initSlimsSroll();
    initNowTimer();
    initFlotBarStacked();
    initVectorMap();
});
var ECharts = {

	ChartConfig : function(container, option) { // container:为页面要渲染图表的容器，option为已经初始化好的图表类型的option配置

		/*var chart_path = "js/e-charts/echarts-all"; // 配置图表请求路径

		var map_path = "js/e-charts/echarts-map";// 配置地图的请求路径

		require.config({// 引入常用的图表类型的配置

			paths : {

				'echarts' : chart_path,

				'echarts/chart/bar' : chart_path,

				'echarts/chart/pie' : chart_path,

				'echarts/chart/line' : chart_path,

				'echarts/chart/k' : chart_path,

				'echarts/chart/scatter' : chart_path,

				'echarts/chart/radar' : chart_path,

				'echarts/chart/chord' : chart_path,

				'echarts/chart/force' : chart_path,

				'echarts/chart/map' : map_path
			}

		});*/
		/*require.config({// 引入常用的图表类型的配置

			packages: [
	                   {
	                       name: 'echarts',
	                       location: 'rweb/js/e-charts',
	                       main: 'echarts'
	                   },
	                   {
	                       name: 'zrender',
	                       //location: 'http://ecomfe.github.io/zrender/src',
	                       location: 'rweb/js/e-charts/zrender',
	                       main: 'zrender'
	                   }
	               ]
		});*/
		
		this.option = {
			chart : {},
			option : option,
			container : container
		};

		return this.option;

	},

	ChartDataFormate : {

		FormateNOGroupData : function(data) {// data的格式如上的Result1，这种格式的数据，多用于饼图、单一的柱形图的数据源

			var categories = [];

			var datas = [];

			for (var i = 0; i < data.length; i++) {

				categories.push(data[i].name || "");

				datas.push({
						name : data[i].name,
						value : data[i].value || 0
					});

			}

			return {
				category : categories,
				data : datas
			};

		},

		FormateGroupData : function(data, type, is_stack) {// data的格式如上的Result2，type为要渲染的图表类型：可以为line，bar，is_stack表示为是否是堆积图，这种格式的数据多用于展示多条折线图、分组的柱图

			var chart_type = 'line';

			if (type)

				chart_type = type || 'line';

			var xAxis = [];

			var group = [];

			var series = [];

			for (var i = 0; i < data.length; i++) {

				for (var j = 0; j < xAxis.length && xAxis[j] != data[i].name; j++);

				if (j == xAxis.length)

					xAxis.push(data[i].name);

				for (var k = 0; k < group.length && group[k] != data[i].group; k++);

				if (k == group.length)

					group.push(data[i].group);

			}

			//在temp里初始化所有值为0，并设置temp的个数和坐标轴个数一样。
            for (var i = 0; i < group.length; i++) {
                var temp = [];
                if (type != "map" && type != "scatter") {
                    for (var m = 0; m < xAxis.length; m++) {
                        //初始化为undefined
                        temp.push(undefined);
                    }
                }
                for (var k = 0; k < xAxis.length; k++) {
           
                    for (var j = 0; j < data.length; j++) {
                        if ((xAxis[k] == data[j].name) && (group[i] == data[j].group)) {

                            if (type == "map") {
                                temp.push({ name: data[j].name, value: data[i].value });
                            }else if(type == "scatter"){
                            	 temp.push([ data[j].name, data[j].value ]);
                            }else {
                                //将0更新为已有数据
                                //temp[k] = data[j].value;
                                if(data[j].value == 0 || data[j].value == "undefined" || data[j].value == ""){
    								temp[k] = undefined;
    							}else{
    								temp[k] = data[j].value;	
    							}

                            }


                        }

                    }
                }

                


				switch (type) {

					case 'bar' :

						var series_temp = {
							name : group[i],
							data : temp,
							type : chart_type
						};

						if (is_stack)

							series_temp = $.extend({}, {
										stack : 'stack',
										itemStyle : { normal: {label : {show: true, position: 'insideTop'}}},
									}, series_temp);

						break;

					case 'map' :

						var series_temp = {

							name : group[i],
							type : chart_type,
							mapType : 'china',
							selectedMode : 'single',

							itemStyle : {

								normal : {
									label : {
										show : true
									}
								},

								emphasis : {
									label : {
										show : true
									}
								}

							},

							data : temp

						};

						break;

					case 'line' :

						var series_temp = {
							name : group[i],
							data : temp,
							type : chart_type
						};

						if (is_stack)

							series_temp = $.extend({}, {
										stack : 'stack',
									}, series_temp);

						break;

					case 'scatter' :
						var series_temp = {
							name : group[i],
							data : temp,
							type : chart_type
						};
						
						break;
						
					default :

						var series_temp = {
							name : group[i],
							data : temp,
							type : chart_type
						};

				}

				series.push(series_temp);

			}

			return {
				category : group,
				xAxis : xAxis,
				series : series
			};

		}
	},

	ChartOptionTemplates : {

		CommonOption : {// 通用的图表基本配置

			tooltip : {

				trigger : 'axis'// tooltip触发方式:axis以X轴线触发,item以每一个数据项触发

			},

			toolbox : {

				show : true, // 是否显示工具栏

				feature : {

					//mark : true,

					dataView : {
						readOnly : false
					}, // 数据预览

					restore : true, // 复原

					saveAsImage : true,
					// 是否保存图片
					
				}

			}

		},

		CommonLineOption : {// 通用的折线图表的基本配置

			tooltip : {

				trigger : 'axis'

			},

			toolbox : {

				show : true,

				feature : {

					dataView : {
						readOnly : false
					}, // 数据预览

					restore : true, // 复原

					saveAsImage : true, // 是否保存图片
					
					magicType : ['line', 'bar','pie']

				}

			}

		},

		Pie : function(data, name, __option) {// data:数据格式：{name：xxx,value:xxx}...

			var pie_datas = ECharts.ChartDataFormate.FormateNOGroupData(data);
			
			var toolbox = {
					show : true,
					feature : {
						dataView : {
							show : true,
							readOnly : false
						},
						bar : {},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						},
					}
				};
			if(typeof(__option) != 'undefined' && __option != '' && __option != null){
				toolbox.feature.bar = {  
	                   show : true,
	                   title : '柱状图切换', 
	                   icon:'css/images/bar.png', 
	                   option : {},    
	                   onclick : function(param) {  
	                     	//var option = ECharts.ChartOptionTemplates.bars(data,"sss",true);
	                     	var opt = ECharts.ChartConfig($("#" + this.dom.id)[0], __option);
	        				ECharts.Charts.RenderChart(opt);
	                   }    
                };
			}

			var option = {

				tooltip : {

					trigger : 'item',

					formatter : '{b} : {c} ({d}/%)',

					show : true

				},
				toolbox : toolbox,

				legend : {

					orient : 'vertical',

					x : 'left',

					data : pie_datas.category

				},

				series : [

				{

							name : name || "",

							type : 'pie',

							radius : '65%',

							center : ['50%', '50%'],

							data : pie_datas.data,
							
							itemStyle : {
								normal : {
				                    label : {
				                      show:true,
				                        position : 'outer',
				                        formatter : "{b}\n{d}%"
				                    },
				                    labelLine : {
				                        show : true
				                    }
				                },
				                emphasis : {
				                    label : {
				                        show : true,
				                        formatter : "{b}\n{d}%"
				                    }
				                }
				            },

						}

				]

			};
			return $.extend({}, ECharts.ChartOptionTemplates.CommonOption,
					option);

		},

		Lines : function(data, name, is_stack, is_translate) { // data:数据格式：{name：xxx,group:xxx,value:xxx}...

			var stackline_datas = ECharts.ChartDataFormate.FormateGroupData(
					data, 'line', is_stack);
			var datazoom = {
				
			};
			var toolbox = {
				show : true,
				feature : {
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : ['line', 'bar']
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					},
					
				}
			};

			var option = {
				dataZoom : datazoom,
				
				legend : {
					//orient: 'horizontal', // 'vertical'
					//x: 'center', // 'center' | 'left' | {number},
					//y: 'bottom', // 'center' | 'bottom' | {number}    
					data : stackline_datas.category

				},
				toolbox : toolbox,

				xAxis : [{

					type : 'category', // X轴均为category，Y轴均为value
					axisLabel: {    rotate: 0,   },
					data : stackline_datas.xAxis,

					boundaryGap : false
						// 数值轴两端的空白策略

					}],

				yAxis : [{

							name : name || '',

							type : 'value',

							splitArea : {
								show : true
							}

						}],

				series : stackline_datas.series

			};
			if (is_translate == true) {
				option = {
					dataZoom : datazoom,

					legend : {

						data : stackline_datas.category

					},
					toolbox : toolbox,

					yAxis : [{

						type : 'category', // X轴均为category，Y轴均为value

						data : stackline_datas.xAxis,

						boundaryGap : false
							// 数值轴两端的空白策略

						}],

					xAxis : [{

								name : name || '',

								type : 'value',

								splitArea : {
									show : true
								}

							}],

					series : stackline_datas.series

				};
			}
			return $.extend({}, ECharts.ChartOptionTemplates.CommonLineOption,
					option);

		},

		
		Bars : function(data, name, is_stack, is_translate) {// data:数据格式：{name：xxx,group:xxx,value:xxx}...

			var bars_dates = ECharts.ChartDataFormate.FormateGroupData(data,
					'bar', is_stack);
			var datazoom = {
				//orient:'vertical',
				//y:,
				//y:center,
				height : 15,
				show : true,
				realtime : true,
				start : 0,
				end : 100
			};

			var toolbox = {
				show : true,
				feature : {
					
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : ['line', 'bar']
					},
					pie : {    
	                   show : true,
	                   title : '饼图切换',    
	                   icon : 'css/images/pie.png', 
	                   option : {},    
	                   onclick : function(param) { 
                         	console.log(param);
                         	var option = ECharts.ChartOptionTemplates.Pie(data,name,param);
                         	var opt = ECharts.ChartConfig($("#" + this.dom.id)[0], option);
            				ECharts.Charts.RenderChart(opt);
                        }    
	                },
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					},
				}
			};

			var option = {
				dataZoom : datazoom,

				legend : {
					//orient: 'horizontal', // 'vertical'
					//x: 'center', // 'center' | 'left' | {number},
					//y: 'bottom', // 'center' | 'bottom' | {number}    
					data : bars_dates.category
				},

				toolbox : toolbox,

				xAxis : [{

							type : 'category',

							data : bars_dates.xAxis,

							axisLabel : {

								show : true,

								interval : 'auto',

								rotate : 60,

								margion : 8

							}

						}],

				yAxis : [{

							type : 'value',

							name : name || '',

							splitArea : {
								show : true
							}

						}],

				series : bars_dates.series

			};
			if (is_translate == true) {
				option = {
					dataZoom : datazoom,

					legend : {
						data : bars_dates.category
					},
					toolbox : toolbox,

					yAxis : [{

								type : 'category',

								data : bars_dates.xAxis,

								axisLabel : {

									show : true,

									interval : 'auto',

									rotate : 0,

									margion : 8

								}

							}],

					xAxis : [{

								type : 'value',

								name : name || '',

								splitArea : {
									show : true
								}

							}],

					series : bars_dates.series

				};
			}
			return $.extend({}, ECharts.ChartOptionTemplates.CommonLineOption,
					option);

		},
		
		Scatters : function(data, name, is_stack) {
			var scattersDatas = ECharts.ChartDataFormate.FormateGroupData(data,
					'scatter');
			
			var option = {
				    title : {
				        //text: '男性女性身高体重分布',
				        //subtext: '抽样调查来自: Heinz  2003'
				    },

				    tooltip : {
				        trigger: 'axis',
				        showDelay : 0,
				        formatter : function (params) {
				            if (params.value.length > 1) {
				                return params.seriesName + ' :<br/>'
				                   + params.value[0]
				                   + params.value[1];
				            }
				            else {
				                return params.seriesName + ' :<br/>'
				                   + params.name
				                   + params.value;
				            }
				        },  
				    },
				    legend: {
				        data: scattersDatas.category
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            dataZoom : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    xAxis : [
				        {
				            type : 'value',
				            scale:true,
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            scale:true,
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    series : scattersDatas.series
			};
			
			return $.extend({}, ECharts.ChartOptionTemplates.CommonLineOption,
					option);
		},
		
		Boxplot : function(result,divid){
			var margin = {top: 10, right: 50, bottom: 20, left: 100},
			    width = 180 - margin.left - margin.right,
			    height = 400 - margin.top - margin.bottom;
			
			var min = Infinity,
			    max = -Infinity;
	
			var data = [[]]; 
			var name_arr=[];
			var p=0,k=0;
			$.each(result,function(key,val){
			      if(key!='missing_type'&& val.length>0){
				         data[p]=val;
						 name_arr[p]=key;
						 val.forEach(function(v) {
					           if (v > max) max = v;
					           if (v < min) min = v;
				         });
						 p++;
				  }
			}); 
			var svg = d3.select("div#" + divid).selectAll("svg")
			for(var t=0;t<name_arr.length;t++){
				svg.data([data[t]])
				.enter().append("svg")
				.attr("class", "box")
				.attr("width", width + margin.left + margin.right+50)
				.attr("height", height + margin.bottom + margin.top+50)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")")
				.call(d3.box()
						.whiskers(iqr(1.5))
						.width(width)
						.height(height)
						.type_name(name_arr[k])
						.domain([min, max])
			    );
			    k++;
			}
		}
	},
	
	Charts : {

		RenderChart : function(option) {

			require([

							'echarts',

							'echarts/chart/line',

							'echarts/chart/bar',

							'echarts/chart/pie',

							'echarts/chart/k',

							'echarts/chart/scatter',

							'echarts/chart/radar',

							'echarts/chart/chord',

							'echarts/chart/force',

							'echarts/chart/map'

					],

					function(ec) {

						echarts = ec;

						if (option.chart && option.chart.dispose)

						option.chart.dispose();

						option.chart = echarts.init(option.container);

						window.onresize = option.chart.resize;

						option.chart.setOption(option.option, true);

						var ecConfig = require('echarts/config');
						if(typeof(option.option.func) != 'undefined'){
							option.chart.on(ecConfig.EVENT.CLICK, option.option.func);
						}
					});

		}
	},

	RenderMap : function(option) {
	}

};
function iqr(k) {
  return function(d, i) {
    var q1 = d.quartiles[0],
        q3 = d.quartiles[2],
        iqr = (q3 - q1) * k,
        i = -1,
        j = d.length;
    while (d[++i] < q1 - iqr);
    while (d[--j] > q3 + iqr);
    return [i, j];
  };
}
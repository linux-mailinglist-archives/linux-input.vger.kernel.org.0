Return-Path: <linux-input+bounces-512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E566806118
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 22:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028741F2124F
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 21:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE9D6FCE0;
	Tue,  5 Dec 2023 21:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCLZTGrM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D10C3;
	Tue,  5 Dec 2023 13:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813417; x=1733349417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHq7yWRMUaBEpt+YiOObbqQJqmrnCGXPY4tlOc7Xo88=;
  b=HCLZTGrM/scneSrmXB27CF7gDULF2qaumrqECEiFQicV6q8716uvUM+A
   nXv4DExgaEdEmzLLSdhkQvKePFmKJgZctdKfRXakLbPk+UXgfCZl9zXkA
   MEsR6FRjoB3tgKwwo30DJiX8lAKaQdzAH6UgAJr9xiTIjSsuK1I6KtZSd
   z9ctxuKRudOBAre4j2iP2ECOlmaWjaeMwRiFG/KPkAFzwqtUGdU9kZn0e
   ucfIOyI4e1Q12Ni8xmF3iKPaUP2GnVP5kKGOT3nZ4WhXXsXDT+yERpK85
   /eJVMk2TLRuF4YYpitCqI0rpHONYzV0NXs6CTFvzXavabQpxPAzsDv0xV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393697577"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393697577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889087076"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="889087076"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:56:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPQ-0009mY-0X;
	Tue, 05 Dec 2023 21:56:52 +0000
Date: Wed, 6 Dec 2023 05:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Allen_Lin <allencl_lin@hotmail.com>, dmitry.torokhov@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jikos@kernel.org,
	benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Allen_Lin <allencl_lin@hotmail.com>
Subject: Re: [PATCH v1 2/2] Input: Add Himax HX83102J touchscreen driver
Message-ID: <202312060543.P5vKz1xP-lkp@intel.com>
References: <TY0PR06MB5611228C6B67733DC93842C99E85A@TY0PR06MB5611.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY0PR06MB5611228C6B67733DC93842C99E85A@TY0PR06MB5611.apcprd06.prod.outlook.com>

Hi Allen_Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen_Lin/Input-Add-Himax-HX83102J-touchscreen-driver/20231205-180837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/TY0PR06MB5611228C6B67733DC93842C99E85A%40TY0PR06MB5611.apcprd06.prod.outlook.com
patch subject: [PATCH v1 2/2] Input: Add Himax HX83102J touchscreen driver
config: m68k-randconfig-r052-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060543.P5vKz1xP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060543.P5vKz1xP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060543.P5vKz1xP-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:435:5: warning: no previous prototype for 'himax_ts_register_interrupt' [-Wmissing-prototypes]
     435 | int himax_ts_register_interrupt(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:472:5: warning: no previous prototype for 'himax_ts_unregister_interrupt' [-Wmissing-prototypes]
     472 | int himax_ts_unregister_interrupt(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:554:6: warning: no previous prototype for 'hx_check_power_status' [-Wmissing-prototypes]
     554 | void hx_check_power_status(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:566:5: warning: no previous prototype for 'pwr_notifier_callback' [-Wmissing-prototypes]
     566 | int pwr_notifier_callback(struct notifier_block *self,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:580:6: warning: no previous prototype for 'himax_pwr_register' [-Wmissing-prototypes]
     580 | void himax_pwr_register(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/hid/hid-himax-83102j.h:6,
                    from drivers/hid/hid-himax-83102j.c:16:
   drivers/hid/hid-himax-83102j.c: In function 'hx_hid_get_raw_report':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'no_printk'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:585:19: note: in expansion of macro 'KERN_DEBUG'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   drivers/hid/hid-himax-83102j.h:104:24: note: in expansion of macro 'pr_debug'
     104 | #define D(fmt, arg...) pr_debug("[HXTP][DEBUG][%s]: " fmt "\n", __func__, ##arg)
         |                        ^~~~~~~~
   drivers/hid/hid-himax-83102j.c:1768:9: note: in expansion of macro 'D'
    1768 |         D("reportnum:%d, len:%lu, report_type:%d", reportnum, len, report_type);
         |         ^
   drivers/hid/hid-himax-83102j.c: In function 'hx_raw_request':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'no_printk'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:585:19: note: in expansion of macro 'KERN_DEBUG'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   drivers/hid/hid-himax-83102j.h:104:24: note: in expansion of macro 'pr_debug'
     104 | #define D(fmt, arg...) pr_debug("[HXTP][DEBUG][%s]: " fmt "\n", __func__, ##arg)
         |                        ^~~~~~~~
   drivers/hid/hid-himax-83102j.c:1798:9: note: in expansion of macro 'D'
    1798 |         D("report num %d, len %lu, rtype %d, reqtype %d", reportnum, len, rtype, reqtype);
         |         ^
   drivers/hid/hid-himax-83102j.c: At top level:
   drivers/hid/hid-himax-83102j.c:2262:6: warning: no previous prototype for 'hx_hid_update' [-Wmissing-prototypes]
    2262 | void hx_hid_update(struct work_struct *work)
         |      ^~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:2302:6: warning: no previous prototype for 'himax_report_data_deinit' [-Wmissing-prototypes]
    2302 | void himax_report_data_deinit(struct himax_ts_data *ts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:2309:5: warning: no previous prototype for 'himax_chip_suspend' [-Wmissing-prototypes]
    2309 | int himax_chip_suspend(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:2349:5: warning: no previous prototype for 'himax_chip_resume' [-Wmissing-prototypes]
    2349 | int himax_chip_resume(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:2540:6: warning: no previous prototype for 'himax_chip_deinit' [-Wmissing-prototypes]
    2540 | void himax_chip_deinit(struct himax_ts_data *ts)
         |      ^~~~~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c: In function 'himax_platform_init':
   drivers/hid/hid-himax-83102j.c:2593:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2593 |         int err = PROBE_FAIL;
         |             ^~~
   drivers/hid/hid-himax-83102j.c: At top level:
>> drivers/hid/hid-himax-83102j.c:2674:5: warning: no previous prototype for 'himax_parse_dt' [-Wmissing-prototypes]
    2674 | int himax_parse_dt(struct device_node *dt, struct himax_platform_data *pdata)
         |     ^~~~~~~~~~~~~~
   drivers/hid/hid-himax-83102j.c:2862:5: warning: no previous prototype for 'himax_spi_drv_probe' [-Wmissing-prototypes]
    2862 | int himax_spi_drv_probe(struct spi_device *spi)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/himax_parse_dt +2674 drivers/hid/hid-himax-83102j.c

  2539	
> 2540	void himax_chip_deinit(struct himax_ts_data *ts)
  2541	{
  2542		kfree(ts->zf_update_cfg_buffer);
  2543		ts->zf_update_cfg_buffer = NULL;
  2544	
  2545		himax_ts_unregister_interrupt(ts);
  2546	
  2547		himax_report_data_deinit(ts);
  2548	
  2549		cancel_delayed_work_sync(&ts->work_resume_delayed_work);
  2550		destroy_workqueue(ts->himax_resume_delayed_work_wq);
  2551		destroy_workqueue(ts->himax_hid_debug_wq);
  2552	
  2553		ts->probe_fail_flag = 0;
  2554	
  2555		I("Common section deinited!");
  2556	}
  2557	
  2558	static void himax_platform_deinit(struct himax_ts_data *ts)
  2559	{
  2560		struct himax_platform_data *pdata = NULL;
  2561	
  2562		I("entering");
  2563	
  2564		if (!ts) {
  2565			E("ts is NULL");
  2566			return;
  2567		}
  2568	
  2569		pdata = ts->pdata;
  2570		if (!pdata) {
  2571			E("pdata is NULL");
  2572			return;
  2573		}
  2574	
  2575		himax_gpio_power_deconfig(pdata);
  2576	
  2577		kfree(ts->ic_data);
  2578		ts->ic_data = NULL;
  2579	
  2580		kfree(pdata);
  2581		pdata = NULL;
  2582		ts->pdata = NULL;
  2583	
  2584		kfree(ts->xfer_buff);
  2585		ts->xfer_buff = NULL;
  2586	
  2587		I("exit");
  2588	}
  2589	
  2590	static bool himax_platform_init(struct himax_ts_data *ts,
  2591					struct himax_platform_data *local_pdata)
  2592	{
  2593		int err = PROBE_FAIL;
  2594		struct himax_platform_data *pdata;
  2595	
  2596		I("entering");
  2597		ts->xfer_buff = kcalloc
  2598			(HX_FULL_STACK_RAWDATA_SIZE, sizeof(u8), GFP_KERNEL);
  2599		if (!ts->xfer_buff) {
  2600			err = -ENOMEM;
  2601			goto err_xfer_buff_fail;
  2602		}
  2603	
  2604		I("PDATA START");
  2605		pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
  2606		if (!pdata) { /*Allocate Platform data space*/
  2607			err = -ENOMEM;
  2608			goto err_dt_platform_data_fail;
  2609		}
  2610	
  2611		I("ts->ic_data START");
  2612		ts->ic_data = kzalloc(sizeof(*ts->ic_data), GFP_KERNEL);
  2613		if (!ts->ic_data) { /*Allocate IC data space*/
  2614			err = -ENOMEM;
  2615			goto err_dt_ic_data_fail;
  2616		}
  2617		memset(ts->ic_data, 0xFF, sizeof(struct himax_ic_data));
  2618		/* default 128k, different size please follow HX83121A style */
  2619		ts->ic_data->flash_size = 131072;
  2620	
  2621		memcpy(pdata, local_pdata, sizeof(struct himax_platform_data));
  2622		ts->pdata = pdata;
  2623		pdata->ts = ts;
  2624		ts->rst_gpio = pdata->gpio_reset;
  2625	
  2626		if (himax_gpio_power_config(ts, pdata) < 0) {
  2627			E("gpio config fail, exit!");
  2628			goto err_power_config_failed;
  2629		}
  2630	
  2631		I("Completed.");
  2632	
  2633		return true;
  2634	
  2635	err_power_config_failed:
  2636		kfree(ts->ic_data);
  2637		ts->ic_data = NULL;
  2638	err_dt_ic_data_fail:
  2639		kfree(pdata);
  2640		pdata = NULL;
  2641	err_dt_platform_data_fail:
  2642		kfree(ts->xfer_buff);
  2643		ts->xfer_buff = NULL;
  2644	err_xfer_buff_fail:
  2645		return false;
  2646	}
  2647	
  2648	static struct himax_ts_data *get_ts(struct device *dev)
  2649	{
  2650		struct list_head *listptr = NULL;
  2651		struct himax_ts_data *ts = NULL;
  2652		struct himax_ts_data *tmp_ts = NULL;
  2653	
  2654		if (!g_himax_ts->dev ||
  2655		    g_himax_ts->dev == dev) {
  2656			D("Found 1st device : %p", dev);
  2657			return g_himax_ts;
  2658		}
  2659	
  2660		D("Matching for device %p", dev);
  2661		list_for_each(listptr, &g_himax_ts->list) {
  2662			tmp_ts = list_entry(listptr, struct himax_ts_data, list);
  2663			if (tmp_ts->dev == dev) {
  2664				ts = tmp_ts;
  2665				break;
  2666			}
  2667		}
  2668		if (!ts)
  2669			D("No matching device found");
  2670	
  2671		return ts;
  2672	}
  2673	
> 2674	int himax_parse_dt(struct device_node *dt, struct himax_platform_data *pdata)
  2675	{
  2676		/* pid_fw_name size = length of default_fw_name + length of "_XXXX" +
  2677		 * length of ".bin" + null terminator.
  2678		 */
  2679		static char pid_fw_name[ARRAY_SIZE(default_fw_name) + 5 + 4 + 1] = {0};
  2680		int tmp = 0;
  2681		const int pid_prop_args = 2;
  2682		u32 data = 0;
  2683		int id_gpios[8] = {0};
  2684		int counter = 0;
  2685		int i = 0;
  2686		s16 id_value = -1;
  2687		int dts_irq = 0;
  2688		int err = 0;
  2689	
  2690		UNUSED(default_fw_name);
  2691		if (!dt || !pdata) {
  2692			E("DT: dev or pdata is NULL");
  2693			return -EINVAL;
  2694		}
  2695	
  2696		dts_irq = of_irq_get(dt, 0);
  2697		D("DT: dts_irq = %d", dts_irq);
  2698		if (dts_irq <= 0) {
  2699			if (dts_irq == -EPROBE_DEFER)
  2700				E("DT: dts_irq = -EPROBE_DEFER");
  2701			return -EIO;
  2702		}
  2703	
  2704		pdata->of_irq = dts_irq;
  2705		pdata->gpio_irq = -1;
  2706	
  2707		pdata->gpio_reset = of_get_named_gpio(dt, "reset-gpios", 0);
  2708		if (!gpio_is_valid(pdata->gpio_reset)) {
  2709			I(" DT:gpio-rst value is not valid");
  2710			return -EIO;
  2711		}
  2712	
  2713		I(" DT:interrupt=%d, reset=%d",
  2714		  pdata->of_irq, pdata->gpio_reset);
  2715		counter = gpiod_count(pdata->ts->dev, "himax,id");
  2716		if (counter > 0) {
  2717			for (i = 0 ; i < counter ; i++) {
  2718				id_gpios[i] = of_get_named_gpio(dt, "himax,id-gpios", i);
  2719				if (!gpio_is_valid(id_gpios[i])) {
  2720					I(" DT:gpio-id value is not valid");
  2721					return -EIO;
  2722				}
  2723				I(" DT:gpio-id[%d]=%d", i, id_gpios[i]);
  2724			}
  2725			id_value = 0;
  2726			for (i = 0 ; i < counter ; i++) {
  2727				gpio_direction_input(id_gpios[i]);
  2728				id_value |= gpio_get_value(id_gpios[i]) << i;
  2729			}
  2730			I(" DT:gpio-id value=%04X", id_value);
  2731			pdata->panel_id = id_value;
  2732		} else {
  2733			pdata->panel_id = -1;
  2734			D(" DT:gpio-id not found");
  2735		}
  2736	
  2737		// himax,ic_det_delay unit is millisecond
  2738		if (of_property_read_u32(dt, "himax,ic-det-delay-ms", &data)) {
  2739			pdata->ic_det_delay = 0;
  2740			D(" DT:himax,ic-det-delay-ms not found");
  2741		} else {
  2742			pdata->ic_det_delay = data;
  2743			I(" DT:himax,ic-det-delay-ms=%d", pdata->ic_det_delay);
  2744		}
  2745	
  2746		// himax,ic_resume_delay unit is millisecond
  2747		if (of_property_read_u32(dt, "himax,ic-resume-delay-ms", &data)) {
  2748			pdata->ic_resume_delay = 0;
  2749			D(" DT:himax,ic-resume-delay-ms not found");
  2750		} else {
  2751			pdata->ic_resume_delay = data;
  2752			I(" DT:himax,ic-resume-delay-ms=%d", pdata->ic_resume_delay);
  2753		}
  2754	
  2755		if (of_property_read_bool(dt, "himax,has-flash")) {
  2756			pdata->is_zf = false;
  2757			D(" DT:himax,has-flash");
  2758		} else {
  2759			pdata->is_zf = true;
  2760			I(" DT:himax,has-flash not found, load firmware from file");
  2761		}
  2762	
  2763		if (of_property_read_bool(dt, "vccd-supply")) {
  2764			pdata->vccd_supply = regulator_get(pdata->ts->dev, "vccd");
  2765			if (IS_ERR(pdata->vccd_supply)) {
  2766				E(" DT:failed to get vccd supply");
  2767				err = PTR_ERR(pdata->vccd_supply);
  2768				pdata->vccd_supply = NULL;
  2769				return err;
  2770			}
  2771			I(" DT:vccd-supply=%p", pdata->vccd_supply);
  2772		} else {
  2773			pdata->vccd_supply = NULL;
  2774		}
  2775	
  2776		if (of_property_read_bool(dt, "vcca-supply")) {
  2777			pdata->vcca_supply = regulator_get(pdata->ts->dev, "vcca");
  2778			if (IS_ERR(pdata->vcca_supply)) {
  2779				E(" DT:failed to get vcca supply");
  2780				err = PTR_ERR(pdata->vcca_supply);
  2781				pdata->vcca_supply = NULL;
  2782				return err;
  2783			}
  2784			I(" DT:vcca-supply=%p", pdata->vcca_supply);
  2785		} else {
  2786			pdata->vcca_supply = NULL;
  2787		}
  2788	
  2789		/*
  2790		 * check himax,pid first, if exist then check if it is single.
  2791		 * Single case: himax,pid = <0x1002>; // 0x1002 is pid value
  2792		 * Multiple case: himax,pid = <id_value0 00x1001>, <id_value1 0x1002>;
  2793		 * When id_value >= 0, check the mapping listed to use the pid value.
  2794		 */
  2795		if (of_get_property(dt, "himax,pid", &data)) {
  2796			counter = data / (sizeof(u32) * pid_prop_args);
  2797	
  2798			if (!counter) {
  2799				// default case, no id->pid mappings
  2800				if (of_property_read_u32(dt, "himax,pid", &data)) {
  2801					pdata->pid = 0;
  2802					D(" DT:himax,pid not found");
  2803					goto GET_PID_END;
  2804				} else {
  2805					goto GET_PID_VALUE;
  2806				}
  2807			}
  2808	
  2809			if (id_value < 0) {
  2810				E(" DT:himax,pid has no matched for id_value=%04X", id_value);
  2811				pdata->pid = 0;
  2812				goto GET_PID_END;
  2813			}
  2814	
  2815			for (i = 0; i < counter; i++) {
  2816				if (of_property_read_u32_index(dt, "himax,pid",
  2817							       i * pid_prop_args, &tmp)) {
  2818					D(" DT:himax,pid parsing error!");
  2819					pdata->pid = 0;
  2820					goto GET_PID_END;
  2821				}
  2822	
  2823				if (of_property_read_u32_index(dt, "himax,pid",
  2824							       i * pid_prop_args + 1, &data)) {
  2825					D(" DT:himax,pid parsing error!");
  2826					pdata->pid = 0;
  2827					goto GET_PID_END;
  2828				}
  2829	
  2830				if (tmp == id_value) {
  2831					I(" DT:himax,pid mapping: id=%04X => pid=%04X, matched!",
  2832					  tmp, data);
  2833					i = counter;
  2834				} else {
  2835					I(" DT:himax,pid mapping: id=%04X => pid=%04X", tmp, data);
  2836				}
  2837			}
  2838	
  2839			if (counter == i) {
  2840				E(" DT:himax,pid has no matched for id_value=%04X", id_value);
  2841				pdata->pid = 0;
  2842				goto GET_PID_END;
  2843			}
  2844	
  2845	GET_PID_VALUE:
  2846			g_fw_boot_upgrade_name = pid_fw_name;
  2847			pdata->pid = data;
  2848			snprintf(pid_fw_name, sizeof(pid_fw_name), "%s_%04X%s",
  2849				 BOOT_UPGRADE_FWNAME, pdata->pid, ".bin");
  2850			I(" DT:himax,pid=%04X, fw_name=%s",
  2851			  pdata->pid, pid_fw_name);
  2852		} else {
  2853			pdata->pid = 0;
  2854			D(" DT:himax,pid not found");
  2855		}
  2856	GET_PID_END:
  2857	
  2858		return 0;
  2859	}
  2860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


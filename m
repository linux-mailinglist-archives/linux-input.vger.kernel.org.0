Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC12B5B8B8A
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 17:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiINPPP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 11:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiINPPO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 11:15:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BAC79A75
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663168513; x=1694704513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEpq0+s/MHBliaIyx0ufYJpEY7Unobj1AXDIPW3RF2o=;
  b=KxSpNIOqLNS/G444IgOdiLRCYsO8PPe64kojjbAi25Z789DEfrChg0O6
   wO1cu+JxUGCmidmtzJYAOHCZ8Z92gBNn9044Lh8wPhbqFEnB4x96fdG9R
   3vxj7mQeDtMjBfmN0LDYgcYnw/fBbSD0zw8McIfC0qvozCE6ZacpNoi1q
   p9hhWX0vLS4QBO9oetqPHZbXkMt0gDVSo9XrZFHVLuhFMU/Jbk/sljbP7
   L5jqiispOcBHh+k8xKkILvULYrayLuGaafHq049+/OY7ZClPI/m/5xdz3
   zfICLXDB2LE/vDgHBKMWIIlLytjUlOa/IrfcWxidvyGBWxP8CNE7ANhra
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="296043520"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="296043520"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 08:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="568044827"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Sep 2022 08:15:11 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYU6Y-0000KE-1W;
        Wed, 14 Sep 2022 15:15:10 +0000
Date:   Wed, 14 Sep 2022 23:14:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [dtor-input:next 9/36]
 drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration
 of function 'gpiod_count'; did you mean 'of_gpio_count'?
Message-ID: <202209142319.3cDIFi8V-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   d56111ed58482de0045e1e1201122e6e71516945
commit: f8f7f47d576f7f5d44ef9237f356bd6d42002614 [9/36] Input: matrix_keypad - replace of_gpio_named_count() by gpiod_count()
config: microblaze-randconfig-m041-20220914 (https://download.01.org/0day-ci/archive/20220914/202209142319.3cDIFi8V-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=f8f7f47d576f7f5d44ef9237f356bd6d42002614
        git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
        git fetch --no-tags dtor-input next
        git checkout f8f7f47d576f7f5d44ef9237f356bd6d42002614
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/input/keyboard/matrix_keypad.c: In function 'matrix_keypad_parse_dt':
>> drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration of function 'gpiod_count'; did you mean 'of_gpio_count'? [-Werror=implicit-function-declaration]
     419 |         pdata->num_row_gpios = nrow = gpiod_count(dev, "row");
         |                                       ^~~~~~~~~~~
         |                                       of_gpio_count
   cc1: some warnings being treated as errors


vim +419 drivers/input/keyboard/matrix_keypad.c

   398	
   399	#ifdef CONFIG_OF
   400	static struct matrix_keypad_platform_data *
   401	matrix_keypad_parse_dt(struct device *dev)
   402	{
   403		struct matrix_keypad_platform_data *pdata;
   404		struct device_node *np = dev->of_node;
   405		unsigned int *gpios;
   406		int ret, i, nrow, ncol;
   407	
   408		if (!np) {
   409			dev_err(dev, "device lacks DT data\n");
   410			return ERR_PTR(-ENODEV);
   411		}
   412	
   413		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
   414		if (!pdata) {
   415			dev_err(dev, "could not allocate memory for platform data\n");
   416			return ERR_PTR(-ENOMEM);
   417		}
   418	
 > 419		pdata->num_row_gpios = nrow = gpiod_count(dev, "row");
   420		pdata->num_col_gpios = ncol = gpiod_count(dev, "col");
   421		if (nrow < 0 || ncol < 0) {
   422			dev_err(dev, "number of keypad rows/columns not specified\n");
   423			return ERR_PTR(-EINVAL);
   424		}
   425	
   426		if (of_get_property(np, "linux,no-autorepeat", NULL))
   427			pdata->no_autorepeat = true;
   428	
   429		pdata->wakeup = of_property_read_bool(np, "wakeup-source") ||
   430				of_property_read_bool(np, "linux,wakeup"); /* legacy */
   431	
   432		if (of_get_property(np, "gpio-activelow", NULL))
   433			pdata->active_low = true;
   434	
   435		pdata->drive_inactive_cols =
   436			of_property_read_bool(np, "drive-inactive-cols");
   437	
   438		of_property_read_u32(np, "debounce-delay-ms", &pdata->debounce_ms);
   439		of_property_read_u32(np, "col-scan-delay-us",
   440							&pdata->col_scan_delay_us);
   441	
   442		gpios = devm_kcalloc(dev,
   443				     pdata->num_row_gpios + pdata->num_col_gpios,
   444				     sizeof(unsigned int),
   445				     GFP_KERNEL);
   446		if (!gpios) {
   447			dev_err(dev, "could not allocate memory for gpios\n");
   448			return ERR_PTR(-ENOMEM);
   449		}
   450	
   451		for (i = 0; i < nrow; i++) {
   452			ret = of_get_named_gpio(np, "row-gpios", i);
   453			if (ret < 0)
   454				return ERR_PTR(ret);
   455			gpios[i] = ret;
   456		}
   457	
   458		for (i = 0; i < ncol; i++) {
   459			ret = of_get_named_gpio(np, "col-gpios", i);
   460			if (ret < 0)
   461				return ERR_PTR(ret);
   462			gpios[nrow + i] = ret;
   463		}
   464	
   465		pdata->row_gpios = gpios;
   466		pdata->col_gpios = &gpios[pdata->num_row_gpios];
   467	
   468		return pdata;
   469	}
   470	#else
   471	static inline struct matrix_keypad_platform_data *
   472	matrix_keypad_parse_dt(struct device *dev)
   473	{
   474		dev_err(dev, "no platform data defined\n");
   475	
   476		return ERR_PTR(-EINVAL);
   477	}
   478	#endif
   479	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

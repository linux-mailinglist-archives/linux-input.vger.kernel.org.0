Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFF55B8D44
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 18:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiINQmJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 12:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiINQmI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 12:42:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032CC5B7B8
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663173728; x=1694709728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fcw4M5PjoWuIUXdDgyeZ4Ok6bjEdUa/CU95EmxYnPKA=;
  b=VgfdMbJayND8ptwxDkmAHiGMBboUdD3rS2Kr9q5jn82n2TP19GUgXhmP
   crUe0lyILlArP0+ocupxd9T9HL2YfyOov93fBbSZfgO2vxuV/4PQsqNTO
   hQd4M6UV5NzRu0nN1e7KwyJWgViyMV/gYsaKyXCHlKSurzboM5J5a08lj
   PdBZPmzS1i7ppLC0s4ZB/YLwO61wIKTloodFBrQBDJJRoKotQ6+ipla2x
   aQ5eRopIEQzQHdgRuWl3aTZt53nXQg0cIwd59AqP3pOKGFEC1DTfGOZ4T
   LRAKHtV40yDpvDBDD0W8O0EcSvRcLj47BCeoJikHL9vHCMcawQeSp2klI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299838006"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="299838006"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 09:42:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="647458171"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 09:42:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oYVSd-002ITn-0W;
        Wed, 14 Sep 2022 19:42:03 +0300
Date:   Wed, 14 Sep 2022 19:42:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [dtor-input:next 9/36]
 drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration
 of function 'gpiod_count'; did you mean 'of_gpio_count'?
Message-ID: <YyIEWiEQSDFc+Qs3@smile.fi.intel.com>
References: <202209142319.3cDIFi8V-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209142319.3cDIFi8V-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 14, 2022 at 11:14:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> head:   d56111ed58482de0045e1e1201122e6e71516945
> commit: f8f7f47d576f7f5d44ef9237f356bd6d42002614 [9/36] Input: matrix_keypad - replace of_gpio_named_count() by gpiod_count()
> config: microblaze-randconfig-m041-20220914 (https://download.01.org/0day-ci/archive/20220914/202209142319.3cDIFi8V-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=f8f7f47d576f7f5d44ef9237f356bd6d42002614
>         git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
>         git fetch --no-tags dtor-input next
>         git checkout f8f7f47d576f7f5d44ef9237f356bd6d42002614
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/input/keyboard/matrix_keypad.c: In function 'matrix_keypad_parse_dt':
> >> drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration of function 'gpiod_count'; did you mean 'of_gpio_count'? [-Werror=implicit-function-declaration]
>      419 |         pdata->num_row_gpios = nrow = gpiod_count(dev, "row");
>          |                                       ^~~~~~~~~~~
>          |                                       of_gpio_count
>    cc1: some warnings being treated as errors

Heh... Seems on some architectures this needs an explicit include of linux/gpio/consumer.h.
Dmitry, do you want me to send a fixup, or would you squash the change yourself?

-- 
With Best Regards,
Andy Shevchenko



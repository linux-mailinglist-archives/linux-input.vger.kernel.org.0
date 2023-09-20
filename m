Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1C7A8378
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 15:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbjITNdu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 09:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbjITNdt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 09:33:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B9CA9
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695216821; x=1726752821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kbndLZIIJuf5LmLl+I/shjPEzx5scbxUiK+CkIe+3k=;
  b=bMlH+UwGOfTEVXeGtW8EeKBeVWqRVmjDeUJ8k+9zM75jpmgYyMR2f/m0
   EOJnsr8GzZKnI8Otqll5+/KMfjIN6Ik/DOrDmlhy+lBT+/NKC5qFxaakA
   vQgDcdpTBuIuNtDiYA/ZmL9AkQUIz/9zjlOf/2Ol0+XCqOQKfWlvz66Qx
   3ixb+JT+hBZ+uZqqHUoSLrcfUTJTGTT05X65Cq0yGbajfbtOeJhYReVwC
   +5Ttaxtb1UTql0ywVT8V5fz4o0RL4U/bz6PLNGizBTQpubegqI8/tH1Qe
   k9zUmwz36fAfZgfVXJ34BSY13UHPwZOkOKpJgB2mqAHU+cY6XJu6jW5ib
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377525628"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="377525628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870385883"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="870385883"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:33:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qixKh-0000000DeEJ-3EXu;
        Wed, 20 Sep 2023 16:33:35 +0300
Date:   Wed, 20 Sep 2023 16:33:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <danny.kaehn@plexus.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH] hid: cp2112: Fix IRQ shutdown stopping polling for all
 IRQs on chip
Message-ID: <ZQr0r3Ux/rkWQ8N5@smile.fi.intel.com>
References: <20230919212426.489637-1-danny.kaehn@plexus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919212426.489637-1-danny.kaehn@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 19, 2023 at 04:24:26PM -0500, Danny Kaehn wrote:
> Previously cp2112_gpio_irq_shutdown always cancelled the

cp2112_gpio_irq_shutdown()

> gpio_poll_worker, even if other IRQs were still active, and did not set
> the gpio_poll flag to false. This resulted in any call to _shutdown()
> resulting in interrupts no longer functioning on the chip until a
> _remove occurred (a.e. the cp2112 is unplugged or system rebooted).

_remove()

> Only cancel polling if all IRQs are disabled/masked, and correctly set
> the gpio_poll flag, allowing polling to restart when an interrupt is
> next enabled.

...

> +	if (!dev->irq_mask)
> +	{

The style tells to use these on a single line.

> +		dev->gpio_poll = false;
> +		cancel_delayed_work_sync(&dev->gpio_poll_worker);
> +	}

-- 
With Best Regards,
Andy Shevchenko



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357FE7A82AE
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 15:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbjITNFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 09:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236422AbjITNFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 09:05:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB628C6
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695215110; x=1726751110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pJ26KqS+nyGDAFKOR90POAlnpVu/FFLxN+S9uKXPuE=;
  b=cer2SWygRVKcCQyOuoRk3yyI+L8nTHT/s4HtSUTjG1pkH6jv/dyvJk+B
   09Zed3yVnjT6vb8FtjRhsD0RYkJfaZ6SUrBVoGcFu4FojInSNfhPGpM19
   UrpPOEY+3hXBSkp6YNU4u+ryvsI/O/ntbyYYTuCXZjAAJRMsOac1m0gLJ
   9ga2X+BhvXyBOJGdGdT4kZvN3V6woiyDwRy1ttN/RDWaayeyOKXYWwUAV
   U0qiYgE0Ni/VY1PaiQtoeIBU/2weRaWxJGr9TBqhTxOA+fehplRN+Hppv
   EA+4+Z/1z8JQrcFLzhC4RbCIohtUZe7vkUCAmKOEnWWSEuW+kxt1JDzFQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365266474"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="365266474"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812142116"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="812142116"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:04:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qiwsl-0000000Cija-1t40;
        Wed, 20 Sep 2023 16:04:43 +0300
Date:   Wed, 20 Sep 2023 16:04:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <danny.kaehn@plexus.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
Message-ID: <ZQrt6k/usVXlB223@smile.fi.intel.com>
References: <20230919212245.483646-1-danny.kaehn@plexus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919212245.483646-1-danny.kaehn@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 19, 2023 at 04:22:45PM -0500, Danny Kaehn wrote:
> Previously the cp2112 driver called INIT_DELAYED_WORK within
> cp2112_gpio_irq_startup, resulting in duplicate initilizations of the
> workqueue on subsequent IRQ startups following an initial request. This
> resulted in a warning in set_work_data in workqueue.c, as well as a rare
> NULL dereference within process_one_work in workqueue.c.
> 
> Initialize the workqueue within _probe instead.

Does it deserve a Fixes tag?

-- 
With Best Regards,
Andy Shevchenko



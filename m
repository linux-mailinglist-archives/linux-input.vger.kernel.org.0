Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B6D7A9BFF
	for <lists+linux-input@lfdr.de>; Thu, 21 Sep 2023 21:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjIUTFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Sep 2023 15:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjIUTFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Sep 2023 15:05:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D1451013
        for <linux-input@vger.kernel.org>; Thu, 21 Sep 2023 10:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695318592; x=1726854592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+uEuq8XMvDDsbOut4KhC4Ma2uZTkTIY+65JgS26EgFs=;
  b=YFPQJw+gJEIZX9ux0wFSRDHhJToZ9HA9L6gIcHmii2nMy+7oCp6f9ZwT
   KWuRfe9norIWRVYiJ2Xk3Eyih62S8BeFSetQQKsQ+YJF0qezYK1hZ7ZpX
   zlfLih1KmFqIdUs/Z0fh3s4ISzuHm0yBuG0LfXYEVj0tgBAzF1gkgV4Ew
   GxzFFNmEb3rOOZgyKcDOvWIvgO/rKxDAnMOT9EsxRHbbBOWsF8GQuk9Y6
   BVm/20jee7F22d8ZICdV2jAx9+p9cHhQoc8jUKLwFR1lEnWjShi9NoBWp
   0j/zT5MyDybe++eyTymv7Lqpan/0R20dO8iVz0JST7cZDTb/zqqE7A88l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446944276"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="446944276"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="817309250"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="817309250"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:42:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qjGCk-0000000Gqxv-15i0;
        Thu, 21 Sep 2023 12:42:38 +0300
Date:   Thu, 21 Sep 2023 12:42:37 +0300
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <Danny.Kaehn@plexus.com>
Cc:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
Message-ID: <ZQwQDZD3Yj9JFgMz@smile.fi.intel.com>
References: <20230919212245.483646-1-danny.kaehn@plexus.com>
 <ZQrt6k/usVXlB223@smile.fi.intel.com>
 <216f73660b7c55ab247345120468d0cd9463e622.camel@plexus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <216f73660b7c55ab247345120468d0cd9463e622.camel@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 20, 2023 at 07:10:15PM +0000, Danny Kaehn wrote:
> On Wed, 2023-09-20 at 16:04 +0300, Andy Shevchenko wrote:
> > On Tue, Sep 19, 2023 at 04:22:45PM -0500, Danny Kaehn wrote:
> > > Previously the cp2112 driver called INIT_DELAYED_WORK within
> > > cp2112_gpio_irq_startup, resulting in duplicate initilizations of the
> > > workqueue on subsequent IRQ startups following an initial request. This
> > > resulted in a warning in set_work_data in workqueue.c, as well as a rare
> > > NULL dereference within process_one_work in workqueue.c.
> > > 
> > > Initialize the workqueue within _probe instead.
> > 
> > Does it deserve a Fixes tag?
> 
> I'm not sure -- it does technically fix 13de9cca514ed63604263cad87ca8cb36e9b6489
> (HID: cp2112: add IRQ chip handling), but does not apply cleanly to that
> revision (a.e. with git am)

It's not a problem.

> (my understanding is that 'Fixes' is used for stable kernel maintenance?)

Not only, for anybody to track the issues and fixes.
For stable it's more important to follow their procedure, where the Fixes
is just one small piece of.

Fixes: 13de9cca514e ("HID: cp2112: add IRQ chip handling")

-- 
With Best Regards,
Andy Shevchenko



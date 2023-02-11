Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008096930CC
	for <lists+linux-input@lfdr.de>; Sat, 11 Feb 2023 13:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBKMJ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Feb 2023 07:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjBKMJz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Feb 2023 07:09:55 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FBE311DD;
        Sat, 11 Feb 2023 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676117394; x=1707653394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QE7eOEqTXLp4txBBddlSQ1rdNz7Wb/g83/gskQvR5KE=;
  b=HOwd5Dg4eAv5fm7YcEHAKH98QHrs/V3kp58GnK+XwZfE6S3+LpPvs0D4
   /qvdyWFrizelhjeO7yD6b23oFIq9U6a6AJbwgQbJ4/19bqu3s0JnRMxAE
   qW5lrUKOJPo8Gv9RBWTC+j+VhMcf5G4rXBZnXvK8Bhuwuu+EnZOchK/j1
   O16j/drQ1JuSHzCH4at83lLLY676r+RMvJE3GDuzCGECYdA96Cmr3fo1h
   WlatQsv2I9mDRCYNoeaJWQDJy3jNP37OnfYjNUa+kiQN07rmnl/XfGvNt
   DC7lUmPmavt6t0gplU8Ag/h2YzvXBGn4/L73ygnC+HFnIvBhPzBztjFza
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310968228"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310968228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 04:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="731988335"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="731988335"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2023 04:09:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQohJ-005TUm-0g;
        Sat, 11 Feb 2023 14:09:41 +0200
Date:   Sat, 11 Feb 2023 14:09:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v5 3/3] HID: cp2112: Fwnode Support
Message-ID: <Y+eFhKw5KcPUNyXy@smile.fi.intel.com>
References: <20230210223638.12796-1-kaehndan@gmail.com>
 <20230210223638.12796-4-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210223638.12796-4-kaehndan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 10, 2023 at 04:36:38PM -0600, Danny Kaehn wrote:
> Bind i2c and gpio interfaces to subnodes with names
> "i2c" and "gpio" if they exist, respectively. This
> allows the gpio and i2c controllers to be described
> in firmware as usual. Additionally, support configuring the
> i2c bus speed from the clock-frequency device property.

Entire series (code-wise, w/o DT bindings, not an expert there) looks good to
me, but one thing to address.

...

> +	dev->gc.fwnode			= device_get_named_child_node(&hdev->dev, "gpio");

Using like this bumps a reference count IIRC, so one need to drop it after use.
But please double check this.

-- 
With Best Regards,
Andy Shevchenko



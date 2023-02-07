Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A148568D3E2
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 11:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjBGKPO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 05:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjBGKPN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 05:15:13 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9458CC17D;
        Tue,  7 Feb 2023 02:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675764912; x=1707300912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I7d0RC0vVsr21RpYQl6/590xnPKG4A7BHdSv3lUDhRw=;
  b=Wl/57pYyt02kHPErgCKIESNbuFHBSkUHpmE8KWT2JnhiDdovo24CSigC
   6kd750DLOJtRRCUTRkEKN16O31fYmuOzWRMYiEd0+pCRQ6DgwjrYfg5Zl
   PDCsJy5InoyaCe1gYawem3pu31hmTfza/bKJG7y86c5EdY29ttJTQbvUe
   9UgZUtRh5M9k/hx+c9pLCpYZLG9JL+ITXCHqIOd6r3QfClk4lh6e6wgqB
   Bg25jxvWq/9vRtRiNVMZCfHu706U6wuo17EtrRU+Wf7NDzvXPYRgyqNci
   gif03mP/Za9uzB6WdC4z26lzwnFD3Ubv9Hv714+GCa7J0/AlO1n7ouBhh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="328111237"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="328111237"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="666791538"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="666791538"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 07 Feb 2023 02:15:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pPL0F-003Yw4-1m;
        Tue, 07 Feb 2023 12:15:07 +0200
Date:   Tue, 7 Feb 2023 12:15:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v4 4/4] HID: cp2112: Devicetree Support
Message-ID: <Y+Ikq+ow/Z8fTRGm@smile.fi.intel.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-5-kaehndan@gmail.com>
 <Y+GKwhkW29Bk26S+@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+GKwhkW29Bk26S+@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 06, 2023 at 03:18:26PM -0800, Dmitry Torokhov wrote:
> On Mon, Feb 06, 2023 at 07:50:16AM -0600, Danny Kaehn wrote:

...

> > +#if IS_ENABLED(CONFIG_OF_GPIO)
> > +	dev->gc.of_node			= of_get_child_by_name(hdev->dev.of_node, "gpio");
> 
> 
> I believe Andy is actively trying to get rid of of_node from GPIO chips.
> And in general, we should be using fwnode and generic device properties
> as much as possible.
> 
> > +#endif

Correct. And looking into the code of this patch I don't see any obstacles
to use fwnode APIs. You can Cc a v5 (which is supposed to be fwnode API based)
to me.

-- 
With Best Regards,
Andy Shevchenko



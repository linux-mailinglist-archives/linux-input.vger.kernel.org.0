Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E68C699E85
	for <lists+linux-input@lfdr.de>; Thu, 16 Feb 2023 22:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjBPVBI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Feb 2023 16:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjBPVBH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Feb 2023 16:01:07 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD99505D9;
        Thu, 16 Feb 2023 13:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676581266; x=1708117266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6JcQD6eoChO1+QdsXKDOTlIIJc3ee//HUfbYV3HSmmA=;
  b=IpJgjr/VsPB/+b4hmnTCG+2j5Fr96CR5myuCSuWld1BFoyWSJwULAg5l
   vGEzebdvcqH+Vz06jBV6uCeXLnO66cUUVqIBY7SY19qeawdB03Y+6Q+Cw
   8gRkcap7/z2sVJQBN7dqoJ6SxFWNFV5VmSbU86HNaoazTcWQi6ZmjsmLI
   7m5wAUWH3RixDG0AQSy1SBpAXonTqEYGa+YPztcs1TSwcncf6fWNWz7qX
   vXCpE6uCmOzPXxT6oMRktMZS2l3l7r/XVXxI7aAMmcDykzZ9W8qcQ6tDg
   ngQi3+Q+UNvTCHyDvZvWcyqXGv1AIAsU06tOgGnIyDUs/oM5fMeDZeByl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315549994"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="315549994"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 13:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="738994225"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="738994225"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2023 13:01:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pSlND-007wFS-2s;
        Thu, 16 Feb 2023 23:00:59 +0200
Date:   Thu, 16 Feb 2023 23:00:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v5 3/3] HID: cp2112: Fwnode Support
Message-ID: <Y+6ZiyxNaSHiKwF5@smile.fi.intel.com>
References: <20230210223638.12796-1-kaehndan@gmail.com>
 <20230210223638.12796-4-kaehndan@gmail.com>
 <Y+eFhKw5KcPUNyXy@smile.fi.intel.com>
 <CAP+ZCCcC6hVxMqZCR3qcRXAcUkQp_B=DF4PVy--ngLwmPY-UjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+ZCCcC6hVxMqZCR3qcRXAcUkQp_B=DF4PVy--ngLwmPY-UjQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 16, 2023 at 01:02:40PM -0600, Daniel Kaehn wrote:
> On Sat, Feb 11, 2023 at 6:10 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Feb 10, 2023 at 04:36:38PM -0600, Danny Kaehn wrote:

...

> > > +     dev->gc.fwnode                  = device_get_named_child_node(&hdev->dev, "gpio");
> >
> > Using like this bumps a reference count IIRC, so one need to drop it after use.
> > But please double check this.
> >
> 
> Thanks for bringing this up -- I should have explicitly called this
> out as something I was looking for feedback on, as I was unsure on
> this.
> 
> I noticed that many of the users of device_get_named_child_node didn't
> explicitly call fwnode_handle_put, and was unsure about the mechanics
> of when this is needed.
> 
> The underlying call to device_get_named_child_node for an of_node is
> of_fwnode_get_named_child_node, which does call
> for_each_available_child_of_node and returns from within the loop, so
> I _think_ you're right that the return will have its refcount
> incremented (of_get_next_available_child calls of_node_get on the next
> node, and doesn't call put until the next iteration).
> 
> However, I also noticed that many other functions in
> drivers/base/property.c contain a message like the following in their
> header comment:
> "The caller is responsible for calling fwnode_handle_put() for the
> returned node."
> and this isn't present for device_get_named_child_node, which is
> defined in that same file, which made me suspicious that this is
> somehow done elsewhere internally (although I should know better than
> to trust documenting comments :) ).

Good catch!

> I'll wait a while longer to see if someone with a better grasp than me
> on dynamic DT/firmware weighs in, otherwise, I'll assume I'll need to
> call fwnode_handle_put both on error paths in _probe as well as in
> _remove, since that appeared to be the case with the DT-specific
> of_get_child_by_name path.

Patch to update the kernel documentation has been just sent.

-- 
With Best Regards,
Andy Shevchenko



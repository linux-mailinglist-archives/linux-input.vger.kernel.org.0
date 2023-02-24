Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5466A234F
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 21:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjBXU4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 15:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjBXU4a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 15:56:30 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165F26BF49;
        Fri, 24 Feb 2023 12:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677272187; x=1708808187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zpz5sQ1PAyxYgutCyzROU177EWrx+kFJ4bgsaaSheQQ=;
  b=W0bSjU9UhndUyQS7WnJ5X5TSXKwgz4azIWWdxu1sFyUIByrtSsBAp+4T
   +Qvqv24dt8mbsrxsDD8PYCLqxBrlCENcptllsnW/JIuiFhPCUMXE6MqAK
   +PcSwN7FguRQcsh04GrvyzVgyo9guEWgbj7SESLBU0M/feYcJfvDBDoms
   CFbAeBed25EhyjjA6mL7zsxdNzRrfUOQnAirV//zumMuJZLeZeUVP4kuD
   /AoM0CrcGMbZMXtuGiS9igQkZWZatBQtP7m7t2ggqabdTO0RzyJiBhHpp
   /7buB3v/hpv3aW+Z63+9hFC1ceE4/qFa4/wibHGQ2/D5kSPliZXp/DNPo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335814521"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="335814521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 12:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782498507"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="782498507"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 12:56:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pVf77-00Beas-01;
        Fri, 24 Feb 2023 22:56:21 +0200
Date:   Fri, 24 Feb 2023 22:56:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v7 0/3] Firmware Support for USB-HID Devices and CP2112
Message-ID: <Y/kkdI6OIIF/lDBn@smile.fi.intel.com>
References: <20230223213147.268-1-kaehndan@gmail.com>
 <Y/jpME2mb5CqPooj@smile.fi.intel.com>
 <CAP+ZCCeTg5jggU9hLax43ZNppjArSnc4dKQMHdC8S-xM1sD6Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCeTg5jggU9hLax43ZNppjArSnc4dKQMHdC8S-xM1sD6Tg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 24, 2023 at 11:48:02AM -0600, Daniel Kaehn wrote:
> On Fri, Feb 24, 2023 at 10:43 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 23, 2023 at 03:31:44PM -0600, Danny Kaehn wrote:
> > > This patchset allows USB-HID devices to have DeviceTree bindings through sharing
> > > the USB fwnode with the HID driver, and adds such a binding and driver
> > > implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> > > USB-HID change). This change allows a CP2112 permanently attached in hardware to
> > > be described in DT and interoperate with other drivers.
> >
> > It's your responsibility to carry the tags you have got in the previous rounds
> > of the review. Please, be respectful to the reviewers who spent a lot of time
> > on yours, in particular, code. Otherwise why to bother with it (upstreaming)
> > at all?

> Hello Andy,
> 
> My sincerest apologies on this! I wasn't actually aware that this is
> something I could do / am responsible for doing. No disrespect is
> intended, though I see how this would be frustrating for reviewers (I
> previously thought that maintainers used some sort of automated tool
> to keep track of who approved/acked what in previous versions, but
> didn't really know how that would work).

It's works only in the case if you have no more comments to address.
Indeed, `b4` tool may harvest tags from emails.

However, if you by your own initiative send a new version, to address
or change something, you need to take into account what was done in
the previous rounds of review. If you consider that tag can't be applied —
too many changes that doesn't match the code to the previous version(s), —
you should express why in the cover letter.

> If I'm understanding correctly, this means that whenever someone
> responds to my patch with a "Reviewed-by", etc.. I should be adding
> that tag to the end of the commit message of that patch if a future
> revision is needed?

Correct and you may use `b4` tool yourself to simplify that. It does
not require anything special (permissions, status, access, etc).

> I assume this only applies on future revisions
> where patches other than the one initially reviewed are changed, and
> that any tags I take with should be dropped if that patch is changed?

Depends on how big they are. In most cases the changes are not so drastically
big, so tags survive them.

> Apologies about these questions - - I looked for guidance on this in
> the various "submitting patches to the kernel" guides out there, and
> wasn't able to find much.

Understood. Now we will wait for v8 where you fix the mistakes.

Thank you for your patience and contribution!

-- 
With Best Regards,
Andy Shevchenko



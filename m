Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE3B6A6EEB
	for <lists+linux-input@lfdr.de>; Wed,  1 Mar 2023 15:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjCAO7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Mar 2023 09:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjCAO7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Mar 2023 09:59:17 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064B13B205;
        Wed,  1 Mar 2023 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677682754; x=1709218754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9wYGIXkAzX1k5xozkb0ANOiiv15lgnelhL20Wuduypw=;
  b=Co18SxjgTtDmBWhOb+zOSGlmqp5XtV1GfT+mlhgw0CHnZctgiNEmKetW
   AbB3rnxgxigpgxfGYspt9W60xOvePbSbFuabSYdgwEONm1enniYmJBXhT
   HHBmv29liOmuHMtCWts1+WkGY6sRWC8jUU7w+oEI0Zb9rkvjwYyBkaVJq
   CxbR7gY9a/PAjpQxJAbzk2l8J9sw5xMKZSAaNKVG95xFEtvZaESQ10fj3
   8Ni0p8hJLIQWTRPKp39yWIH6y9Z5r/FxywtbzyvjiEQgtbnnC1QW7VyFM
   pplzMdx3UKSvptu+YbwXFtvV9sV5S5rABPmVnfST72mG/GbH+1+iWdPUS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="396995643"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="396995643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 06:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652037544"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="652037544"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 06:59:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pXNv9-00Dnd7-1C;
        Wed, 01 Mar 2023 16:59:07 +0200
Date:   Wed, 1 Mar 2023 16:59:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+Cc: Hans (as some DT/ACPI interesting cases are being discussed).

On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:
> On Mon, Feb 27, 2023 at 5:07 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 27, 2023 at 08:07:58AM -0600, Danny Kaehn wrote:
> > > Bind I2C and GPIO interfaces to subnodes with names
> > > "i2c" and "gpio" if they exist, respectively. This
> > > allows the GPIO and I2C controllers to be described
> > > in firmware as usual. Additionally, support configuring the
> > > I2C bus speed from the clock-frequency device property.
> >
> > A bit shorten indentation...
> >
> > Nevertheless what I realized now is that this change, despite being OF
> > independent by used APIs, still OF-only.
> 
> I assumed this would practically be the case -- not because of the casing
> reason you gave (wasn't aware of that, thanks for the FYI), but because it
> doesn't seem that there's any way to describe USB devices connected to
> a USB port in ACPI, at least as far as I can tell (ACPI is still largely a black
> box to me).

That's not true :-)

Microsoft created a schema that is not part of the specification, but let's
say a standard de facto. Linux supports that and I even played with it [1]
to get connection of the arbitrary device to USB-2-GPIO/I²C/SPI adapter.

> But it seems reasonable that we should try to use the interface
> in a way so that it could be described using ACPI at some point (assuming
> that it isn't currently possible).
> 
> > Would it be possible to allow indexed access to child nodes as well, so if
> > there are no names, we may still be able to use firmware nodes from the correct
> > children?
> 
> Sure, you mean to fallback to using child nodes by index rather than by name
> in the case that that device_get_named_child_node() fails?  Would we need to
> somehow verify that those nodes are the nodes we expect them to be? (a.e.
> node 0 is actually the i2c-controller, node 1 is actually the
> gpio-controller).

Something like that, but I don't know if we can actually validate this without
having a preliminary agreement (hard-coded values) that index 0 is always let's
say I²C controller and so on.

> I don't see a reason why not, though I am curious if there is
> precedence for this
> strategy, a.e. in other drivers that use named child nodes. In my initial search
> through the kernel, I don't think I found anything like this -- does that mean
> those drivers also inherently won't work with ACPI?

If they are relying on names, yes, they won't work. It might be that some of them
have specific ACPI approach where different description is in use.

> The only driver I can find which uses device_get_named_child_node and has
> an acpi_device_id is drivers/platform/x86/intel/chtwc_int33fe.c

Yes, and you may notice the capitalization of the name. Also note, that relying
on the name in ACPI like now is quite fragile due to no common standard between
OEMs on how to name the same hardware nodes, they are free in that.

> > P.S. The problem with ACPI is that "name" of the child node will be in capital
> > letters as it's in accordance with the specification.
> 
> Knowing that this is the limitation, some other potential resolutions
> to potentially
> consider might be:
> 
> - Uppercase the names of the child nodes for the DT binding -- it appears
>   that the child node that chtwc_int33fe.c (the driver mentioned earlier)
>   accesses does indeed have an upper-cased name -- though that driver doesn't
>   have an of_device_id (makes sense, x86...). It seems named child nodes are
>   always lowercase in DT bindings -- not sure if that's a rule, or just how
>   it currently happens to be.

Not an option AFAIK, the DT and ACPI specifications are requiring conflicting
naming schema.

Possible way is to lowering case for ACPI names, but I dunno. We need more
opinions on this.

> - Do a case invariant compare on the names (and/or check for both lowercase
>   and uppercase)

For ACPI it will be always capital. For DT I have no clue if they allow capital
letters there, but I assume they don't.

> - Remove the use of child nodes, and combine the i2c and gpio nodes into the
>     cp2112's fwnode. I didn't do this initially because I wanted to avoid
>     namespace collisions between GPIO hogs and i2c child devices, and thought
>     that logically made sense to keep them separate, but that was before
>     knowing this limitation of ACPI.

Seems to me not an option at all, we need to define hardware as is. If it
combines two devices under a hood, should be two devices under a hood in
DT/ACPI.

[1]: https://stackoverflow.com/a/60855157/2511795

-- 
With Best Regards,
Andy Shevchenko



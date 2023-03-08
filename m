Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A288A6B0EC9
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 17:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjCHQax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 11:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCHQaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 11:30:52 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947911993;
        Wed,  8 Mar 2023 08:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678293051; x=1709829051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oKN2YVAhWdMDazYxC3zM74ycX+IfIN3U3RFFhR2hNWA=;
  b=dWMAnVcd/PRJl2RFXuO3za6tlkmaAdG4GwlfqC2C7GLKniTqmd/hzUbZ
   aV6ukO2HWsils+keP/NuI6URB/H5PwtgMc3fDR9r7g7spWXIrF6MJyw53
   DvRX+sG++5v5M7kOr2WfzadacnD6tLVjP8JV3EHEOYA01j3U2F58pkcCw
   eUtL745mi7eqYfD18FA5Od8CWOSwaaLCY/DaxrMH2rpSbZtiH942UOi1h
   uKA2RI0O7xFI6HVMmsPOlQOFnJAq7cmXVlZNToT+K8dID86SjIp9/op/C
   u+RgcwrOgAr8M27LWJGpcVEuaFGSh/8EvS2LdLuKaeOtJbFhsP/zfA1om
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422473108"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422473108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820290156"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820290156"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 08:30:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZwgg-00HVnO-1D;
        Wed, 08 Mar 2023 18:30:46 +0200
Date:   Wed, 8 Mar 2023 18:30:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
References: <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 08, 2023 at 04:55:27PM +0100, Benjamin Tissoires wrote:
> On Mar 08 2023, Daniel Kaehn wrote:
> > On Wed, Mar 8, 2023 at 9:26 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > > But if I refer "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", the IRQ is never assigned.
> > > With the parent (CP21), it works.
> > >
> > > So I wonder if the cp2112 driver is correctly assigning the gc->parent
> > > field.

> > Did you make a change to the CP2112 driver patch to look for uppercase
> > "I2C" and "GPIO"?
> 
> yes, sorry I should have mentioned it. This is the only modification I
> have compared to the upstream kernel plus your patch series.
> 
> > Otherwise, it won't assign those child nodes appropriately, and the
> > gpiochip code will use
> > the parent node by default if the gpiochip's fwnode isn't assigned (I believe).
> 
> I don't think it's a fwnode issue, but a problem with the assignment of
> the parent of the gc:
> ---
> dev->gc.parent = &hdev->dev;
> ---

I don't think so. The parent should point to the _physical_ device, which is
CP2112, which is correct in my opinion.

> Because the function acpi_gpiochip_find() in drivers/gpio/gpiolib-acpi.c
> compares the acpi handle returned by fetching the ACPI path
> ("\\_SB_.PCI0.USB0.RHUB.CP21.GPIO") and the one of gc->parent, which in
> the hid-cp2112 case is the HID device itself.

We have specifically gc->fwnode for cases like this.

...

>         Device (CP21) // the USB-hid & CP2112 shared node
>         {
>           Name (_ADR, One)
> 		Name (_DSD, Package ()
> 		{
> 			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> 			Package () {
> 				Package () { "cell-names", Package () { "i2c", "gpio" }
> 			}

Yeah, looking at this, I think it still fragile. First of all, either this is
missing, or simply wrong. We would need to access indices. ACPI _ADR is in the
specification. As much as with PCI it may be considered reliable.

So, that said, forget about it, and simply use _ADR as indicator of the node.
See how MFD (in the Linux kernel) cares about this. Ex. Diolan DLN-2 driver.

> 		})
> 
>           Device (I2C)
>           {
>             Name (_ADR, Zero)
>             Name (_STA, 0x0F)
>           }
> 
>           Device (GPIO)
>           {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
> 
>             Name (_DSD, Package () {
>               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>               Package () {
>                 Package () { "gpio-hog", 1 },
>                 Package () { "gpios", Package () { 4, 0 } },
>                 Package () { "output-high", 1 },
>                 Package () { "line-name", "gpio4-pullup" },
>               },
>               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>               Package () {
>                 Package () { "gpio-line-names", Package () {
>                             "",
>                             "",
>                             "irq-rmi4",
>                             "",
>                             "power", // set to 1 with gpio-hog above
>                             "",
>                             "",
>                             "",
>                             ""}},
>               }
>             })
>           }
>         }

-- 
With Best Regards,
Andy Shevchenko



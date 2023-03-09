Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947506B2349
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 12:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjCILnO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 06:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjCILnL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 06:43:11 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A51E6EA5;
        Thu,  9 Mar 2023 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678362189; x=1709898189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=b/oBEpfZ9XKj+QCOecEu0y65XAl4jjpYX5Arz4zunf0=;
  b=DxgIU3yNMCjXccg4LBkVWjkjMgLVamH8wNL/QDJhzSa/UBJ30NmAIMsO
   fKe4F/f4ej1RHpDXZe1WIyhzVlOsWzClZtA910phyWfId67jubk613PRK
   S7ysoo+ovk7PEqkqICoJVEWTuDenc6uRm3aJeT6nxtFMIFw1cT9XFsk0e
   gRXMtgbIeaXlTYH5vOG6iWwVtHBIn9IWsSJWXtPkTbtbwRL5IQskp+YkR
   y2l8ZldItQzvlYl4Dh8YcTj9mcesgrqlpX6+MYj1XYwYXj+Q4ZdhPAjFB
   U9FS24WvCc8sJxVDlSP0obabmXxMMNBLhPzwHtoirkJst11pi5IbKFzCS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335126778"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="335126778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 03:43:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654722466"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="654722466"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 03:43:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1paEfm-000IOe-2u;
        Thu, 09 Mar 2023 13:43:02 +0200
Date:   Thu, 9 Mar 2023 13:43:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAnGRtIhLZTrpDy7@smile.fi.intel.com>
References: <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
 <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
 <ZAi5esmc158Bd2oL@smile.fi.intel.com>
 <CAP+ZCCdziub809WKJ8-tAhYvg+axsiuXrvrZczj_x2K0bGzd7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCdziub809WKJ8-tAhYvg+axsiuXrvrZczj_x2K0bGzd7w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 08, 2023 at 12:32:07PM -0600, Daniel Kaehn wrote:
> On Wed, Mar 8, 2023 at 10:36 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Mar 08, 2023 at 06:30:46PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 08, 2023 at 04:55:27PM +0100, Benjamin Tissoires wrote:
> > > > On Mar 08 2023, Daniel Kaehn wrote:
> > > > > On Wed, Mar 8, 2023 at 9:26 AM Benjamin Tissoires
> > > > > <benjamin.tissoires@redhat.com> wrote:

...

> > > >                     ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> > > >                     Package () {
> > > >                             Package () { "cell-names", Package () { "i2c", "gpio" }
> > > >                     }
> > >
> > > Yeah, looking at this, I think it still fragile. First of all, either this is
> > > missing, or simply wrong. We would need to access indices. ACPI _ADR is in the
> > > specification. As much as with PCI it may be considered reliable.
> > >
> > > So, that said, forget about it, and simply use _ADR as indicator of the node.
> > > See how MFD (in the Linux kernel) cares about this. Ex. Diolan DLN-2 driver.
> >
> > And that said, maybe CP2112 should simply re-use what MFD _already_ provides?
> 
> Great point -- it definitely seems like this driver belongs in the mfd
> directory to begin with.

It can be iteratively converted later on.

> It seems like aside from rewriting the CP2112 driver into an mfd
> driver and two platform drivers,
> my route forward for now would be to just do something like this (not
> yet tested):
> 
> + struct acpi_device *adev = ACPI_COMPANION(&hdev->dev);
> + if (adev)
> +    ACPI_COMPANION_SET(&dev->adap.dev, acpi_find_child_device(adev,
> 0x0, false));

ACPI_COMPANION_SET() is something different to simple device_set_node().
I would expect that in this driver we simply use the child fwnode as is.
But since you are not using so called secondary fwnode, I believe it's
fine for now.

> + else
> +     device_set_node(&dev->adap.dev,
> device_get_named_child_node(&hdev->dev, "i2c"));
> 
> (and the same for the gpiochip)
> 
> The follow-up question -- does there exist something analogous to DT
> bindings for ACPI devices,
> other than the ACPI spec itself, where this should be documented? Or
> will consumers truly have to
> read the driver code to determine that _ADR 0 is I2C and _ADR 1 is
> GPIO? (I haven't seen anything
> in my search so far -- but knowing that it truly doesn't exist would
> make me respect people developing
> embedded ACPI-based systems all the more!)

See how the acpi_get_local_address() is used in the 3 users of it.

Ideally we need a new callback in the fwnode ops to return either
(least) 32-bit of _ADR or "reg" property.

Dunno, if "reg" is actually what suits here.

That said, I would do something like (pseudo-code)

device_for_each_child_node() {
	if (name == $NAME)
		$NAME->fwnode = child;
	else if (_ADR = $INDEX)
		$NAME->fwnode = child;
}


> Thanks for your patience in working through all of this, especially
> considering how long of an email
> chain this has become!

You're welcome!

-- 
With Best Regards,
Andy Shevchenko



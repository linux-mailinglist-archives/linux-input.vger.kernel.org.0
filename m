Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AA96ACF46
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 21:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCFUgT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 15:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFUgS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 15:36:18 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030A36A439;
        Mon,  6 Mar 2023 12:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678134978; x=1709670978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QyfQf3oW8i9AUZwTmwi2bqZxBnfZLQi/ps8EZa7EynQ=;
  b=SHgYYbGq5OPKihlKY2hPSuz8PbCZ+1z8F4jdvRZh0xm6uXQbM4/4wF4S
   7EOWeid9iQH+AaZzjF/hiLrIVwjgjUO2cDnaT4cVnQ6+z0fakBuvEI33R
   hanElmJxcOzmbIVL3uhkEDY+aiCt7oKdQBJ02X0FHFs/uzotYm0tVjIFm
   5TVAWKndTkUJwMJ6S+KveTAqLHOZPpHlKD7m+YdhwR2MZwz296rN6PaKK
   AJMaSvdQg/aZtLu/UBuPkIkd52dn0wxj2A4T4kOXY2wlzQe9RMbChfeiK
   DODX1E0vqIf74g+cN/vFdsdjbuwjjLWFnGBY2CuUc2q7OMJkAuO+HWaeN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398250824"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="398250824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 12:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800123989"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="800123989"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 12:36:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZHZ6-00Gc9h-20;
        Mon, 06 Mar 2023 22:36:12 +0200
Date:   Mon, 6 Mar 2023 22:36:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
References: <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 06, 2023 at 01:40:16PM -0600, Daniel Kaehn wrote:

...

> Device (SE9)
> {
>     Name (_ADR, 0x001D0001) // _ADR: Address
>     Device (RHUB)
>     {
>         Name (_ADR, Zero)
>         Device (CP2) // the USB-hid & CP2112 shared node
>         {
>             Name (_ADR, One)
>         }
>     }
> }
> 
> If I'm understanding correctly, this adds the SE9 device as function 1
> of PCI device 0x1d,

To be precise this does not add the device. It adds a description of
the companion device in case the real one will appear on the PCI bus
with BDF 00:1d.1.

> then RHUB as the USB controller it provides, and finally, CP2 as the
> USB device attached to port 1 of the controller.
> 
> With this as the loaded dsdt table, the USB device now has a firmware_node :)
> #> cat /sys/bus/usb/devices/3-1:1.0/firmware_node/path
> \_SB_.PCI0.SE9_.RHUB.CP2_
> 
> After applying my patches, the HID device also references this node:
> #> cat /sys/bus/hid/devices/0003:10C4:EA90.0003/firmware_node/path
> \_SB_.PCI0.SE9_.RHUB.CP2_
> 
> With this all said -- I noticed iasl prints this statement when trying
> to create a node with a lowercase name:
> "At least one lower case letter found in NameSeg, ASL is case
> insensitive - converting to upper case (GPIO)"

Yes, because it should be in the upper case.

> I wonder if this suggests that adding a call to toupper() to
> acpi_fwnode_get_named_child_node would be
> an appropriate solution for the node name casing issue....

I dunno. You need to ask in the linux-acpi@ mailing list.
To me this is corner case that can't be easily solved
(because two different specifications treat it differently.

You also need to ask DT people about capital letters there.
And my guts tell me that it's probably also carved in the spec
as "must be lower case" or alike.

-- 
With Best Regards,
Andy Shevchenko



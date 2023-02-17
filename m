Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2169B2DC
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 20:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjBQTLH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 14:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBQTLG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 14:11:06 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA53D27D48;
        Fri, 17 Feb 2023 11:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676661061; x=1708197061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lWCaHZAw0kLtLlEq2+zfX18B0agu1/sB1EOkFQ86aRI=;
  b=i3luiE4iC5fzmLnY6W5lHyWcroN3QoqTXE8cfvQ72sgl/Tvx9VSlhJV6
   LR+wT5WSQV8Xb2yOKmhGzTa5RS2NLMvpZv24wG/cqNrp6qwnIX8UppXVo
   mlgaVx2MSCXvUBym3m5B+tYm/7hwt8hLtswY8k7YDovjdthyjasVisnAr
   MXU3pZXSf9g3Qjziob59CS86SRAWweCkAMo1kiJNYToHQgdLuQ+xFBEz3
   t/uiQaFP8PHVx3Dd7ukutnEZKPX//fyxtXgfstsNHTIv/vI/MPKV2SbkN
   ESsnd2Za1STN4uiHbstVqjBjOxBnwin9+73OwWmrlVgupt743NZUh9qyD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="330730852"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="330730852"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 11:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="779882009"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="779882009"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2023 11:10:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pT68H-008KeN-0A;
        Fri, 17 Feb 2023 21:10:57 +0200
Date:   Fri, 17 Feb 2023 21:10:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v6 2/3] HID: usbhid: Share USB device firmware node with
 child HID device
Message-ID: <Y+/RQFs5IZpbxQw8@smile.fi.intel.com>
References: <20230217184904.1290-1-kaehndan@gmail.com>
 <20230217184904.1290-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217184904.1290-3-kaehndan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 17, 2023 at 12:49:03PM -0600, Danny Kaehn wrote:
> USB HID core now shares its fwnode with its child HID device.
> Since there can only be one HID device on a USB interface, it is redundant
> to specify a hid node under the USB device. This allows usb HID device
> drivers to be described in firmware and make use of device properties.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index be4c731aaa65..a0859c49d9f4 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -19,6 +19,7 @@
>  #include <linux/list.h>
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
> +#include <linux/property.h>
>  #include <linux/spinlock.h>
>  #include <asm/unaligned.h>
>  #include <asm/byteorder.h>
> @@ -1369,6 +1370,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
>  	hid->hiddev_report_event = hiddev_report_event;
>  #endif
>  	hid->dev.parent = &intf->dev;
> +	device_set_node(&hid->dev, dev_fwnode(&intf->dev));
>  	hid->bus = BUS_USB;
>  	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
>  	hid->product = le16_to_cpu(dev->descriptor.idProduct);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko



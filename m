Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28C506B25E1
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 14:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjCINwh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 08:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjCINwT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 08:52:19 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1144EFF57;
        Thu,  9 Mar 2023 05:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678369893; x=1709905893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n7loq3SUYJyzj6So9ZqieWFywDbN1ivWI6Q2fdH6CLA=;
  b=AZObsspkC8sLIIwIErtoIObIK6ofMY7+2OEHvFr2OsJjiZHPxHq12r72
   mIHlHrake7rvCLHoi+pd9HR49aCTNnZWtwGlA6BS0FKhKa7JqNUMvT35Y
   DzEPN5R9+7www2AQ4BZPVh59loqBKlI+mb5TUutR+CCN3aCSVh5nU+9zh
   B62yNxF0TJAOlUAahSKQFIQEPksHoeb56oJAFlofmMhvnVWhsDsxvHqOr
   +xP/sEcbcKAQnlxtQSEvt98IPwoPO5ynWH9eXEUG3vxeYn9UynC4ypJ9N
   q2LkuBSb9FzRGREy0XQtJgU1PwNRQA4dkhvICK8bKOKg6X4TCY5RM4yv2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338783603"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="338783603"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851507550"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="851507550"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 05:50:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1paGek-000LWZ-2R;
        Thu, 09 Mar 2023 15:50:06 +0200
Date:   Thu, 9 Mar 2023 15:50:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAnkDiEfh4ZkLpJh@smile.fi.intel.com>
References: <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
 <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
 <20230309093811.se7exh6eocdgx5jv@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309093811.se7exh6eocdgx5jv@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 09, 2023 at 10:38:11AM +0100, Benjamin Tissoires wrote:
> On Mar 08 2023, Andy Shevchenko wrote:

...

> Looks like gpiolib-acpi.c doesn't care about fwnode at all.
> 
> if I do the following:
> 
> ---
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index d8a421ce26a8..5aebc266426b 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -126,7 +126,7 @@ static bool acpi_gpio_deferred_req_irqs_done;
>  
>  static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>  {
> -       return gc->parent && device_match_acpi_handle(gc->parent, data);
> +       return ACPI_HANDLE_FWNODE(gc->fwnode) == data;
>  }
>  
>  /**
> ---

This seems a legit fix.

> I can now directly reference the GPIO ACPI node in my GpioInt()
> declaration. And AFAICT this should be safe to do because gpiolib ensure
> that gc->fwnode is set, using the one from the parent if it is not set
> previously.
> 
> I need to check if this works with my icelake laptop, and if so I'll
> send it to the list.
> 
> The reason the intel gpios are working (the only one I checked) is
> because the \\SB.GPI0 node refers to the pinctrl controller (driver
> pinctrl-icelake.c in my case, which then creates a subdevice for
> handling the gpio).

Good catch!

-- 
With Best Regards,
Andy Shevchenko



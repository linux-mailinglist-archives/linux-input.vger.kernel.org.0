Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D23410AFD6
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 13:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfK0M7g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 07:59:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:50086 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0M7g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 07:59:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 04:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; 
   d="scan'208";a="217380880"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2019 04:59:32 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iZwuq-0000Xu-40; Wed, 27 Nov 2019 14:59:32 +0200
Date:   Wed, 27 Nov 2019 14:59:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20191127125932.GK32742@smile.fi.intel.com>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127120948.22251-6-m.felsch@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:09:48PM +0100, Marco Felsch wrote:
> It is possible to bring the device into a deep sleep state. To exit this
> state the reset or wakeup pin must be toggeled as documented in [1].
> Because of the poor documentation I used the several downstream kernels
> [2] and other applications notes [3] to indentify the related registers.
> 
> Furthermore I added the support to disable the device completely. This is
> the most effective power-saving mechanism. Disabling the device don't
> change the suspend logic because the hibernate mode needs a hardware
> reset anyway.
> 
> [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
> [2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/input/touchscreen/ft5x_ts.c
>     https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ft5336_driver.c
> [3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x16_registers.pdf


> +	/* Recover from hibernate mode if hardware supports it */
> +	if (tsdata->wake_gpio) {
> +		gpiod_set_value_cansleep(tsdata->wake_gpio, 0);
> +		usleep_range(5000, 6000);
> +		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
> +		msleep(300);
> +	} else if (tsdata->reset_gpio) {
> +		gpiod_set_value_cansleep(tsdata->reset_gpio, 1);
> +		usleep_range(5000, 6000);
> +		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
> +		msleep(300);
> +	}

Perhaps

static void edt_ft5x06_ts_toggle_gpio(struct gpio_desc *gpiod)
{
	...
}

...resume(...)
{
	...
	if (wake_gpio)
		...toggle_gpio(wake_gpio);
	else if (reset_gpio)
		...toggle_gpio(reset_gpio);
	...
}

?

-- 
With Best Regards,
Andy Shevchenko



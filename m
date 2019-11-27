Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A42910B16C
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 15:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfK0OcX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 09:32:23 -0500
Received: from mga02.intel.com ([134.134.136.20]:32796 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbfK0OcW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 09:32:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 06:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; 
   d="scan'208";a="211707747"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 27 Nov 2019 06:32:18 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iZyMb-0001vK-Tm; Wed, 27 Nov 2019 16:32:17 +0200
Date:   Wed, 27 Nov 2019 16:32:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20191127143217.GL32742@smile.fi.intel.com>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-6-m.felsch@pengutronix.de>
 <20191127125932.GK32742@smile.fi.intel.com>
 <20191127130602.5zp537xdybbafnci@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127130602.5zp537xdybbafnci@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 02:06:02PM +0100, Marco Felsch wrote:
> On 19-11-27 14:59, Andy Shevchenko wrote:
> > On Wed, Nov 27, 2019 at 01:09:48PM +0100, Marco Felsch wrote:

> > Perhaps
> > 
> > static void edt_ft5x06_ts_toggle_gpio(struct gpio_desc *gpiod)
> > {
> > 	...
> > }
> > 
> > ...resume(...)
> > {
> > 	...
> > 	if (wake_gpio)
> > 		...toggle_gpio(wake_gpio);
> > 	else if (reset_gpio)
> > 		...toggle_gpio(reset_gpio);
> > 	...
> > }
> > 
> > ?
> 
> Thanks fpr your suggestion but we need to differentiate between reset
> and wake logic level. The wake-gpio keeps asserted while the reset is
> released. So the edt_ft5x06_ts_toggle_gpio() needs at least a 'is_reset'
> parameter but then the simplification is gone.


How about this:
static void edt_ft5x06_ts_toggle_gpio(struct gpio_desc *gpiod, int value)
{
	gpiod_...(..., !value);
	...
	gpiod_...(..., value);
	...
}

...resume(...)
{
	...
	if (wake_gpio)
		...toggle_gpio(wake_gpio, 1);
	else if (reset_gpio)
		...toggle_gpio(reset_gpio, 0);
	...
}

?

-- 
With Best Regards,
Andy Shevchenko



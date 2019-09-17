Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A992DB52F1
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbfIQQ3N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:29:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:13913 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbfIQQ3N (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:29:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 09:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; 
   d="scan'208";a="177433685"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 17 Sep 2019 09:29:10 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iAGLl-0001Pq-2q; Tue, 17 Sep 2019 19:29:09 +0300
Date:   Tue, 17 Sep 2019 19:29:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] Input: edt-ft5x06 - alphabetical include reorder
Message-ID: <20190917162909.GG2680@smile.fi.intel.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917155808.27818-2-m.felsch@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 05:58:03PM +0200, Marco Felsch wrote:
> It seems that the include order is historical increased and no one takes
> care of it. Fix this to align it with the common rule to be in a
> alphabetical order.

But asm parts we usually put after linux parts.

> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 3cc4341bbdff..9e328a82b765 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -13,21 +13,21 @@
>   *    http://www.glyn.com/Products/Displays
>   */
>  
> -#include <linux/module.h>
> -#include <linux/ratelimit.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
> -#include <linux/input.h>
> -#include <linux/i2c.h>
> -#include <linux/kernel.h>
> -#include <linux/uaccess.h>
> -#include <linux/delay.h>
> +#include <asm/unaligned.h>
>  #include <linux/debugfs.h>
> -#include <linux/slab.h>
> +#include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/input.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> -#include <asm/unaligned.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/ratelimit.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
>  
>  #define WORK_REGISTER_THRESHOLD		0x00
>  #define WORK_REGISTER_REPORT_RATE	0x08
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko



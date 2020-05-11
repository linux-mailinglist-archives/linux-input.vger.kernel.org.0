Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1391CD5FA
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 12:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgEKKJT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 06:09:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:34084 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbgEKKJT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 06:09:19 -0400
IronPort-SDR: tMdRyh2wE+7HPUGjM0F9g/EbN0COirwWuhRWTruL0NatTDyEN3FJ7TNSDB1Q0EEZzDSyjzu9qR
 fkhdFxNfFaPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 03:09:18 -0700
IronPort-SDR: /4ePewXHw1p2yD2NJm9/62yQsAGdq20yYVgsYx4VvqfhoOAUPkhdGozjZWJkNJ7lX++yR0EnMN
 F7h07F2TYQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; 
   d="scan'208";a="265108108"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2020 03:09:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jY5NA-005wFH-AV; Mon, 11 May 2020 13:09:20 +0300
Date:   Mon, 11 May 2020 13:09:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 3/5] Input: edt-ft5x06 - use U16_MAX instead of -1
Message-ID: <20200511100920.GH185537@smile.fi.intel.com>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
 <20200303180917.12563-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303180917.12563-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 03, 2020 at 08:09:15PM +0200, Andy Shevchenko wrote:
> Explicitly show what the value we supply for the touchscreen resolution
> when it can't be detected. -1 is hard to compare with when unsigned short
> type is in use. The change will help to avoid signed vs. unsigned error
> prone comparisons.
> 

So, this left without comment, does it mean you are going to apply it?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index cb67104c6934..a05c6b597d43 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -23,6 +23,7 @@
>  #include <linux/input/touchscreen.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/ratelimit.h>
>  #include <linux/regulator/consumer.h>
> @@ -983,8 +984,8 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
>  		tsdata->num_y = edt_ft5x06_register_read(tsdata,
>  							 reg_addr->reg_num_y);
>  	} else {
> -		tsdata->num_x = -1;
> -		tsdata->num_y = -1;
> +		tsdata->num_x = U16_MAX;
> +		tsdata->num_y = U16_MAX;
>  	}
>  }
>  
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko



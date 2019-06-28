Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A285A27E
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2019 19:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfF1Re7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jun 2019 13:34:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60366 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfF1Re6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jun 2019 13:34:58 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SHYqxH032282;
        Fri, 28 Jun 2019 12:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561743292;
        bh=9R69Zt9s5ZgJqNxqu7Zw5kmJVtafZxMSfpApLSkoZuo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=aTGgqnTM9NwDB7WboLJyA1VtmNOAx8uo0nalqpz8nxv+IIkWn0WGa3cOXioKkrkt9
         zGDcxWSAT2siF3dGpLPYH2p8Xn35A+KFx1/MYuKjqoj1Jj7uHdmvHtucXLcVQOeJ1R
         fz+vhW0sIFiDOkvxctJ0k3jxDBHemUQGUr2834pw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SHYqQA074862
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Jun 2019 12:34:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 28
 Jun 2019 12:34:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 28 Jun 2019 12:34:52 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x5SHYqx3097430;
        Fri, 28 Jun 2019 12:34:52 -0500
Date:   Fri, 28 Jun 2019 12:36:13 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
Message-ID: <20190628173613.bxtsvssuo5apsqdb@ti.com>
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote on Sat [2019-Jun-22 23:31:52 -0700]:
> Instead of doing conversion by hand, let's use the proper accessors.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c639ebce914c..ec770226e119 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -27,6 +27,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <asm/unaligned.h>
>  
>  #define WORK_REGISTER_THRESHOLD		0x00
>  #define WORK_REGISTER_REPORT_RATE	0x08
> @@ -239,8 +240,8 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
>  		if (tsdata->version == EDT_M06 && type == TOUCH_EVENT_DOWN)
>  			continue;
>  
> -		x = ((buf[0] << 8) | buf[1]) & 0x0fff;
> -		y = ((buf[2] << 8) | buf[3]) & 0x0fff;
> +		x = get_unaligned_be16(buf) & 0x0fff;
> +		y = get_unaligned_be16(buf + 2) & 0x0fff;

Appears to work fine in my test:

Tested-by: Benoit Parrot <bparrot@ti.com>

>  		/* The FT5x26 send the y coordinate first */
>  		if (tsdata->version == EV_FT)
>  			swap(x, y);
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 

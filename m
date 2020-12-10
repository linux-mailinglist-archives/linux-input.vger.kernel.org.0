Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8B02D57E3
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 11:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgLJKIr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 05:08:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgLJKIr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 05:08:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C741C0613CF
        for <linux-input@vger.kernel.org>; Thu, 10 Dec 2020 02:08:06 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1knIrk-0002lu-5r; Thu, 10 Dec 2020 11:08:04 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1knIrj-0002sH-Aa; Thu, 10 Dec 2020 11:08:03 +0100
Date:   Thu, 10 Dec 2020 11:08:03 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - consolidate handling of number of
 electrodes
Message-ID: <20201210100803.bfohc5fglvrwrtcz@pengutronix.de>
References: <X9FZFs3NZADoIhhH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9FZFs3NZADoIhhH@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:03:13 up 8 days, 9 min, 25 users,  load average: 0.05, 0.07, 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 20-12-09 15:09, Dmitry Torokhov wrote:
> Instead of using special-casing retrieval of number of X/Y electrodes
> based on the firmware, let's select default values and mark registers as
> non-existent on firmwares that do not support this operation.
> 
> Also mark "report rate" register as non-existent for generic firmwares as
> having it set to 0 does not make sense.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 43 ++++++++++----------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 6ff81d48da86..2eefbc2485bc 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -69,6 +69,9 @@

...

>  	case EV_FT:
>  		reg_addr->reg_threshold = EV_REGISTER_THRESHOLD;
> +		reg_addr->reg_report_rate = NO_REGISTER;
>  		reg_addr->reg_gain = EV_REGISTER_GAIN;
>  		reg_addr->reg_offset = NO_REGISTER;
>  		reg_addr->reg_offset_x = EV_REGISTER_OFFSET_X;
>  		reg_addr->reg_offset_y = EV_REGISTER_OFFSET_Y;
>  		reg_addr->reg_num_x = NO_REGISTER;
>  		reg_addr->reg_num_y = NO_REGISTER;
> -		reg_addr->reg_report_rate = NO_REGISTER;
>  		break;

Nit:
Unrelated change.

However the patch looks good, thanks.

Acked-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

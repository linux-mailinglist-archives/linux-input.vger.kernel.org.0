Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108AE3EB08E
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 08:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhHMGq3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 02:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbhHMGq2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 02:46:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEBDC061756
        for <linux-input@vger.kernel.org>; Thu, 12 Aug 2021 23:46:01 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1mEQx4-0005dM-K9; Fri, 13 Aug 2021 08:45:58 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1mEQx3-0007wo-9w; Fri, 13 Aug 2021 08:45:57 +0200
Date:   Fri, 13 Aug 2021 08:45:57 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Oliver Graute <oliver.graute@kococonnector.com>
Cc:     dmitry.torokhov@gmail.com, oliver.graute@gmail.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1] Input: edt-ft5x06 - added case for EDT
 EP0110M09
Message-ID: <20210813064557.tdltfxyaukhktdkb@pengutronix.de>
References: <20210813062110.13950-1-oliver.graute@kococonnector.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813062110.13950-1-oliver.graute@kococonnector.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:45:18 up 253 days, 20:51, 12 users,  load average: 0.14, 0.06,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oliver,

thanks for the patch.

On 21-08-13 08:21, Oliver Graute wrote:
> Add Support for EP011M09 Firmware
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 6ff81d48da86..600c818b2181 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -895,6 +895,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
>  		 * the identification registers.
>  		 */
>  		switch (rdbuf[0]) {
> +		case 0x11:   /* EDT EP0110M09 */
>  		case 0x35:   /* EDT EP0350M09 */
>  		case 0x43:   /* EDT EP0430M09 */
>  		case 0x50:   /* EDT EP0500M09 */
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

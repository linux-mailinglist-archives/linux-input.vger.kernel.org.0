Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDE83228D9
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 11:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBWK3v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 05:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhBWK3q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 05:29:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31259C061574
        for <linux-input@vger.kernel.org>; Tue, 23 Feb 2021 02:29:06 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lEUwB-0007i8-GF; Tue, 23 Feb 2021 11:29:03 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lEUw8-0003mA-W0; Tue, 23 Feb 2021 11:29:00 +0100
Date:   Tue, 23 Feb 2021 11:29:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrej Valek <andrej.valek@siemens.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: st1232 - Fix NORMAL vs. IDLE state handling
Message-ID: <20210223102900.GA8833@pengutronix.de>
References: <20210223090201.1430542-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210223090201.1430542-1-geert+renesas@glider.be>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:23:19 up 5 days, 13:47, 64 users,  load average: 0.03, 0.11, 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Feb 2021 10:02:01 +0100, Geert Uytterhoeven wrote:
> NORMAL (0x0) and IDLE (0x4) are really two different states.  Hence you
> cannot check for both using a bitmask, as that checks for IDLE only,
> breaking operation for devices that are in NORMAL state.

Thanks. I missed that the state is actually a value and not a bitfield.

> 
> Fix the wait function to report either state as ready.
> 
> Fixes: 6524d8eac258452e ("Input: st1232 - add IDLE state as ready condition")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/input/touchscreen/st1232.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
> index 885f0572488dd061..6abae665ca71d8ec 100644
> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -94,8 +94,13 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
>  
>  	for (retries = 10; retries; retries--) {
>  		error = st1232_ts_read_data(ts, REG_STATUS, 1);
> -		if (!error && ts->read_buf[0] == (STATUS_NORMAL | STATUS_IDLE | ERROR_NONE))
> -			return 0;
> +		if (!error) {
> +			switch (ts->read_buf[0]) {
> +			case STATUS_NORMAL | ERROR_NONE:
> +			case STATUS_IDLE | ERROR_NONE:
> +				return 0;
> +			}
> +		}
>  
>  		usleep_range(1000, 2000);
>  	}
> -- 
> 2.25.1
> 
> 

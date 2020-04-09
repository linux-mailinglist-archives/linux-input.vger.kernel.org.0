Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C3F1A32D3
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 12:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgDIKw7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 06:52:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52303 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIKw7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 06:52:59 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jMUnm-0007xF-UN; Thu, 09 Apr 2020 12:52:54 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jMUnl-0001Ie-R9; Thu, 09 Apr 2020 12:52:53 +0200
Date:   Thu, 9 Apr 2020 12:52:53 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     dmitry.torokhov@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Message-ID: <20200409105253.qvezbikpbnrkig52@pengutronix.de>
References: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:45:47 up 146 days,  2:04, 166 users,  load average: 0.06, 0.06,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oliver,

thanks for your patch.

On 20-04-09 11:27, Oliver Graute wrote:
> From: Oliver Graute <oliver.graute@kococonnector.com>

...

>  drivers/input/touchscreen/edt-ft5x06.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 06aa8ba0b6d7..6fbc87d041a1 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -819,10 +819,6 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
>  	 * to have garbage in there
>  	 */
>  	memset(rdbuf, 0, sizeof(rdbuf));
> -	error = edt_ft5x06_ts_readwrite(client, 1, "\xBB",
> -					EDT_NAME_LEN - 1, rdbuf);
> -	if (error)
> -		return error;


I don't see how this call can corrupt the stack..

Regards,
  Marco

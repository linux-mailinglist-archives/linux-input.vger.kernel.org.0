Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913B032C9B7
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 02:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhCDBL4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 20:11:56 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:53645 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1388027AbhCDAfg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Mar 2021 19:35:36 -0500
X-Greylist: delayed 594 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Mar 2021 19:35:36 EST
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4DrVM53LJKzvp;
        Thu,  4 Mar 2021 00:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1614813569; bh=Cik7P2xTwqDafdA73aq4IZQvL7eImqs47c3D63QDZ10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K8kiFrVczxkECy6ZCnMS3gpJgvAPr751D6x9wj1nr0Qnf1oewL0NS/lumB2KWR7Z2
         ud6o7+NQmo1NUuqq9LTgSi+Xwznspyyo0IGJKaGmWEIpjFnbLHV/4z1srdudqYm4vU
         G90l/ClnLQSCC7UGmt0wNwZYimnYrPrcwujqIZfLIDNu4MuuzXExTHZrEnCjrR7GF/
         u3xaeztk+Ins346xhlQWfAYe6OJTaf3nlqryKpsaMHGksRdanY73WjEE6aJ1wfoPx7
         TsUzeTcF0FAGH/bXutu/xEoJxXBq3BLJ3Az+Me753O1jHSVgF9wQzrFn8u5BZ6j15c
         uxqghWwqafOJg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 4 Mar 2021 00:19:22 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: elants_i2c - fix division by zero if firmware
 reports zero phys size
Message-ID: <20210303231922.GC22628@qmqm.qmqm.pl>
References: <20210302100824.3423-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210302100824.3423-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 02, 2021 at 01:08:24PM +0300, Dmitry Osipenko wrote:
> Touchscreen firmware of ASUS Transformer TF700T reports zeros for the phys
> size. Hence check whether the size is zero and don't set the resolution in
> this case.
> 
> Reported-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Rewieved-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>


> Please note that ASUS TF700T isn't yet supported by upstream kernel,
> hence this is not a critical fix.
> 
>  drivers/input/touchscreen/elants_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4c2b579f6c8b..a2e1cc4192b0 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1441,14 +1441,16 @@ static int elants_i2c_probe(struct i2c_client *client,
>  
>  	touchscreen_parse_properties(ts->input, true, &ts->prop);
>  
> -	if (ts->chip_id == EKTF3624) {
> +	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
>  		/* calculate resolution from size */
>  		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
>  		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
>  	}
>  
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> +	if (ts->x_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> +	if (ts->y_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);

I would guess that you can tie X and Y in one if, as they are unlikely
to work independently.

Best Regards
Michal Miros³aw

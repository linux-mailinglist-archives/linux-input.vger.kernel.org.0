Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE8117DD5
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 03:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfLJCiV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 21:38:21 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:6332 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbfLJCiV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 21:38:21 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X41G5m54z5Y;
        Tue, 10 Dec 2019 03:35:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575945346; bh=uRejZwDHw2ZZlu6OCi83mWrin2gY+yL0fmlGSQxgQWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fxXbZIoBgbdGRCxb+zSpTq1lwMCmS7hJQ3MABmvK6EIPXwbWMMjlUCqnymoJp4R/T
         COpEtWe3mBmSXjONi6tbv78Z7yMJ2cx1XdQTpAjPy8phjG7KtUaGAp6Zjxax3S2o79
         qm5hnT/sP+ltO68FLewsdubcFQqoVsXXFKKEPH1r+GJPRYOOyg6xpWPVbQ7OhJ6Zhr
         bLeIMHvHedeCuYPCMaz/Ugfv6/EIztiIeh8ko19pqZd6AgnR3K3xplyQ2WbcflsQb4
         NEYGjV3Rdov17hk6KsZkxQLp+pkgLY8q/CeNnuc77rE2iH8HVxXYyLQtT1W6dvTxea
         dVByJcBsCZu2g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 03:38:18 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
Message-ID: <20191210023818.GB15246@qmqm.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
 <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 04:03:18AM +0300, Dmitry Osipenko wrote:
> 10.12.2019 03:19, Michał Mirosław пишет:
> > Support common DT properties like axis inversions to complement
> > information obtained from device's firmware.a
[...]
> > @@ -498,10 +498,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
> >  			 rows, cols, osr);
> >  	} else {
> >  		/* translate trace number to TS resolution */
> > -		ts->x_max = ELAN_TS_RESOLUTION(rows, osr);
> > -		ts->x_res = DIV_ROUND_CLOSEST(ts->x_max, phy_x);
> > -		ts->y_max = ELAN_TS_RESOLUTION(cols, osr);
> > -		ts->y_res = DIV_ROUND_CLOSEST(ts->y_max, phy_y);
> > +		ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
> > +		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
> > +		ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
> > +		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
> >  	}
> >  
> >  	return 0;
> > @@ -833,8 +833,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
> >  
> >  			input_mt_slot(input, i);
> >  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> > -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> > -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> > +			touchscreen_report_pos(input, &ts->prop, x, y, true);
> >  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
> >  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
> >  
> > @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
> >  	ts->input->name = "Elan Touchscreen";
> >  	ts->input->id.bustype = BUS_I2C;
> >  
> > +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> 
> Shouldn't this function be invoked after setting the max x/y sizes with
> the hardware values? That's what all other drivers do and then you won't
> need to set the ts->prop.max_x/y above in the code.

This is done later in the series - this patch only adds axis inversion
support and ignores DT-provided sizes.

Best Regards,
Michał Mirosław

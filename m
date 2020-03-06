Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFD717B523
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 04:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCFDzr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 22:55:47 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42835 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgCFDzq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 22:55:46 -0500
Received: by mail-pl1-f196.google.com with SMTP id u3so290755plr.9
        for <linux-input@vger.kernel.org>; Thu, 05 Mar 2020 19:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jae25/DFv01s6LjqjIIVIxgtx15JtO9Ql5rpEWzRIZM=;
        b=h3JAWvIpP/IyQqrvh3yuuRQanWSwM1MdOn8IdpwtHsfoP8Hc65Pim9Qi13MFrWzWbm
         tSuF8VZCEGj1fPXnmMtxt6mNLrrI5guf30YB8fMT49KTcZ4h0E8/XZnvdeYXxk5cmFhA
         o3Oso4wJTcfwOPK3O+DuY9vLFx/9q4+L5pmj7pq7Co6huUl8t7duPt3sZ5UlkRJ3Xq85
         x8tfhvTIZVBRTLKvHwdJhJ9QleNHboMEFrH/Ap/XFwqHEq4ecs9zbW5DrshD8g3rsYxN
         sMMsXn2+mGNUH/w9IC+eE5CdCAEQ+vD8YKoIehLFSpCdql9wGcYxtkyZiJtKt93hFAJh
         2LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jae25/DFv01s6LjqjIIVIxgtx15JtO9Ql5rpEWzRIZM=;
        b=lv/SKHs/QvBdq7/T16mAMl6aOkwIX47A+v4kRTenAQQrj6PgEW43Za0h2G4fPAdW5u
         Se1T/xXBYP32w3zv3kK0pH1uOT3E12en2bkM+Xw4qSLcSrjLulemcGaWFWOf4cnL8jMv
         SanmfmCxPiGVrYWsOlrZEtdZ3bjiPsgiAtKksLqOxKS+VaIwaC5kgJUogvCec8i58xFr
         60yN7po+iMcnkFV12UlvMBenEH5adnV/v8cThy6poX9R42mAe2owrtovw2uucK+FAMLL
         bII/QWF42B4vYtUiWnLZF+tp9i8xSF5r4UOplC5Dw2RqjPqGrNiBnOSTS7OuIWcTea2H
         s1CA==
X-Gm-Message-State: ANhLgQ2WPDgmymobMwIJrG65a0LpXUwTl27UDIZJU9v7l8IX0/5w8OVk
        8Q/zDi5Mqgs8Mug6MSgBJ9k=
X-Google-Smtp-Source: ADFU+vvyuIIDg+k5qdimgU2Pj4zpfJYo5c4jwOhxV3Kw0GSr1DzfCGiW+Wj5gf/7hIvy/ToB6R2Wiw==
X-Received: by 2002:a17:902:864a:: with SMTP id y10mr1149664plt.2.1583466945795;
        Thu, 05 Mar 2020 19:55:45 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id i6sm7460948pjt.3.2020.03.05.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 19:55:45 -0800 (PST)
Date:   Thu, 5 Mar 2020 19:55:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "Sergei A. Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: goodix: fix touch coordinates on Cube I15-TC
Message-ID: <20200306035542.GA217608@dtor-ws>
References: <e39e5cca-fec5-512f-0a33-f3dd20a33ff9@ya.ru>
 <5835e5f3c2a5e1ed525f0aaa4dbcac581fa47afc.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5835e5f3c2a5e1ed525f0aaa4dbcac581fa47afc.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 02, 2020 at 12:45:24PM +0100, Bastien Nocera wrote:
> On Fri, 2018-08-31 at 15:44 +1000, Sergei A. Trusov wrote:
> > The touchscreen on the Cube I15-TC don't match the default display,
> > with 0,0 touches being reported when touching at the top-right of
> > the screen.
> > 
> > Add a quirk to invert the x coordinate.
> > 
> > Reported-and-tested-by: Arkadiy <arkan49@yandex.ru>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sergei A. Trusov <sergei.a.trusov@ya.ru>
> 
> Some patch queue draining/grave digging. Sorry for taking so long to
> get back to you.
> 
> 
> If that still applies, please add my:
> 
> Reviewed-by: Bastien Nocera <hadess@hadess.net>

Applied, thank you.

> 
> > ---
> > 
> > Changes in v2:
> >  - Commit message fix
> >  - Removed extra linefeeds
> > 
> >  drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/goodix.c
> > b/drivers/input/touchscreen/goodix.c
> > index f2d9c2c41885..27adf216f230 100644
> > --- a/drivers/input/touchscreen/goodix.c
> > +++ b/drivers/input/touchscreen/goodix.c
> > @@ -145,6 +145,22 @@ static const struct dmi_system_id
> > rotated_screen[] = {
> >  	{}
> >  };
> >  
> > +/*
> > + * Those tablets have their x coordinate inverted
> > + */
> > +static const struct dmi_system_id inverted_x_screen[] = {
> > +#if defined(CONFIG_DMI) && defined(CONFIG_X86)
> > +	{
> > +		.ident = "Cube I15-TC",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Cube"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
> > +		},
> > +	},
> > +#endif
> > +	{}
> > +};
> > +
> >  /**
> >   * goodix_i2c_read - read data from a register of the i2c slave
> > device.
> >   *
> > @@ -709,6 +725,12 @@ static int goodix_configure_dev(struct
> > goodix_ts_data *ts)
> >  			"Applying '180 degrees rotated screen'
> > quirk\n");
> >  	}
> >  
> > +	if (dmi_check_system(inverted_x_screen)) {
> > +		ts->prop.invert_x = true;
> > +		dev_dbg(&ts->client->dev,
> > +			"Applying 'inverted x screen' quirk\n");
> > +	}
> > +
> >  	error = input_mt_init_slots(ts->input_dev, ts->max_touch_num,
> >  				    INPUT_MT_DIRECT |
> > INPUT_MT_DROP_UNUSED);
> >  	if (error) {
> 

-- 
Dmitry

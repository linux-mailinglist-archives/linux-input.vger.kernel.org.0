Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FA01755F4
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 09:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgCBIYn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 03:24:43 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:40493 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgCBIYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 03:24:43 -0500
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Mar 2020 03:24:42 EST
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34654535"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 02 Mar 2020 16:14:54 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(177026:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 02 Mar 2020 16:14:56 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2486:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 02 Mar 2020 16:14:55 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Peter Hutterer'" <peter.hutterer@who-t.net>,
        "'Johnny Chuang'" <johnny.chuang.emc@gmail.com>
Cc:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        "'Jennifer Tsai'" <jennifer.tsai@emc.com.tw>,
        "'James Chen'" <james.chen@emc.com.tw>,
        "'Paul Liang'" <paul.liang@emc.com.tw>,
        "'Jeff Chuang'" <jeff.chuang@emc.com.tw>
References: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com> <20200227223608.GB1087116@jelly>
In-Reply-To: <20200227223608.GB1087116@jelly>
Subject: RE: [PATCH] Input: elants_i2c - Report resolution information for touch major
Date:   Mon, 2 Mar 2020 16:14:51 +0800
Message-ID: <007201d5f06a$a5f341c0$f1d9c540$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKWH33oxoD7nuWwmg1Q/5rISp31bAHeLyTrpqWIE/A=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1lMGYxMjliOS01YzVkLTExZWEtODUyMC03YzVjZjg3NDk0NzhcYW1lLXRlc3RcZTBmMTI5YmItNWM1ZC0xMWVhLTg1MjAtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyMjc3IiB0PSIxMzIyNzYxMDQ5MTI5NDI1OTkiIGg9Ik9jTEovN3VSbFA2eE5CRjlCK3J2Z2J6WXZvcz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> -----Original Message-----
> From: Peter Hutterer [mailto:peter.hutterer@who-t.net]
> Sent: Friday, February 28, 2020 6:36 AM
> To: Johnny Chuang
> Cc: Dmitry Torokhov; Benjamin Tissoires; linux-kernel@vger.kernel.org;
> linux-input@vger.kernel.org; Johnny Chuang; Jennifer Tsai; James Chen;
Paul
> Liang; Jeff Chuang
> Subject: Re: [PATCH] Input: elants_i2c - Report resolution information for
touch
> major
> 
> On Thu, Feb 27, 2020 at 09:13:20AM +0800, Johnny Chuang wrote:
> > From: Johnny Chuang <johnny.chuang@emc.com.tw>
> >
> > This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR event.
> > This information is needed in showing pressure/width radius.
> >
> > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> b/drivers/input/touchscreen/elants_i2c.c
> > index 4911799..14c577c 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -1309,6 +1309,7 @@ static int elants_i2c_probe(struct i2c_client
> *client,
> >  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> >  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> >  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> > +	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> 
> official resolution for absinfo is "units per mm", so a value of 3 would
> mean 3mm, is that correct?

Correct.
This resolution (1 unit/mm) is for all elan I2C touchscreen devices, 
including the touchscreen devices in the future.
This information is from our firmware members.

> 
> Not that it matters too much, since touch major is already all over the
> place and needs userspace overrides for every device but it'd be nice to
at
> least make this useful out of the box on one device class.
> 
> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> otherwise
> 
> Cheers,
>    Peter
> 
> >
> >  	error = input_register_device(ts->input);
> >  	if (error) {
> > --
> > 2.7.4
> >


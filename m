Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0006C17B6AC
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 07:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgCFG2G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 01:28:06 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:51727 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgCFG2G (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 01:28:06 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34723355"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Mar 2020 14:28:01 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(69135:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 06 Mar 2020 14:28:04 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2482:1:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Fri, 06 Mar 2020 14:28:03 +0800 (CST)
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
In-Reply-To: 
Subject: RE: [PATCH] Input: elants_i2c - Report resolution information for touch major
Date:   Fri, 6 Mar 2020 14:27:57 +0800
Message-ID: <005d01d5f380$60a3f920$21ebeb60$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKWH33oxoD7nuWwmg1Q/5rISp31bAHeLyTrpqWIE/CABka78A==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05ZTEwMmIzNi01ZjczLTExZWEtYmE5Yi03YzVjZjg3NDk0NzhcYW1lLXRlc3RcOWUxMDJiMzgtNWY3My0xMWVhLWJhOWItN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIyNDc3IiB0PSIxMzIyNzk0OTY3NzY0MjY5NjYiIGg9Imw4cEZoMmd1OS96b2lKY2w3ZzZacmJjUkxFST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> > -----Original Message-----
> > From: Peter Hutterer [mailto:peter.hutterer@who-t.net]
> > Sent: Friday, February 28, 2020 6:36 AM
> > To: Johnny Chuang
> > Cc: Dmitry Torokhov; Benjamin Tissoires; linux-kernel@vger.kernel.org;
> > linux-input@vger.kernel.org; Johnny Chuang; Jennifer Tsai; James Chen;
> > Paul Liang; Jeff Chuang
> > Subject: Re: [PATCH] Input: elants_i2c - Report resolution information
> > for touch major
> >
> > On Thu, Feb 27, 2020 at 09:13:20AM +0800, Johnny Chuang wrote:
> > > From: Johnny Chuang <johnny.chuang@emc.com.tw>
> > >
> > > This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR
> event.
> > > This information is needed in showing pressure/width radius.
> > >
> > > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > > ---
> > >  drivers/input/touchscreen/elants_i2c.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > > index 4911799..14c577c 100644
> > > --- a/drivers/input/touchscreen/elants_i2c.c
> > > +++ b/drivers/input/touchscreen/elants_i2c.c
> > > @@ -1309,6 +1309,7 @@ static int elants_i2c_probe(struct i2c_client
> > *client,
> > >  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> > >  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> > >  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> > > +	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> >
> > official resolution for absinfo is "units per mm", so a value of 3
> > would mean 3mm, is that correct?
> 
> Correct.
> This resolution (1 unit/mm) is for all elan I2C touchscreen devices,
including
> the touchscreen devices in the future.
> This information is from our firmware members.

Hi Peter / Benjamin,
Could you help to review and approve this patch?

> 
> >
> > Not that it matters too much, since touch major is already all over
> > the place and needs userspace overrides for every device but it'd be
> > nice to at least make this useful out of the box on one device class.
> >
> > Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> >
> > otherwise
> >
> > Cheers,
> >    Peter
> >
> > >
> > >  	error = input_register_device(ts->input);
> > >  	if (error) {
> > > --
> > > 2.7.4
> > >


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4F06197188
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 02:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgC3A76 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 20:59:58 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:13343 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgC3A76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 20:59:58 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="35007757"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 30 Mar 2020 08:59:56 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(20959:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 30 Mar 2020 08:59:54 +0800 (CST)
Received: from 192.168.200.93
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2486:1:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Mon, 30 Mar 2020 08:59:53 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Peter Hutterer'" <peter.hutterer@who-t.net>,
        "'Johnny Chuang'" <johnny.chuang.emc@gmail.com>
Cc:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        "'Rob Schonberger'" <robsc@google.com>,
        "'James Chen'" <james.chen@emc.com.tw>,
        "'Jennifer Tsai'" <jennifer.tsai@emc.com.tw>,
        "'Paul Liang'" <paul.liang@emc.com.tw>,
        "'Jeff Chuang'" <jeff.chuang@emc.com.tw>
References: <1585209525-6047-1-git-send-email-johnny.chuang.emc@gmail.com> <20200329021436.GA68168@jelly>
In-Reply-To: <20200329021436.GA68168@jelly>
Subject: RE: [PATCH] Input: elants_i2c - support palm detection
Date:   Mon, 30 Mar 2020 08:59:51 +0800
Message-ID: <001501d6062e$849afb60$8dd0f220$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFNlY3ZGTB8jr2YC71KGESJaTtjnwHvPYN1qWG1XYA=
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jMWQ1NDg2YS03MjIxLTExZWEtODNkOC03YzVjZjg3NDk0NzhcYW1lLXRlc3RcYzFkNTQ4NmMtNzIyMS0xMWVhLTgzZDgtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSIzODUzIiB0PSIxMzIzMDAwMzU5MTA0NjkwNjciIGg9IlRVcHNLb3AyYXZ2aHoyMi9iVytnN1BBQkJFUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> -----Original Message-----
> From: Peter Hutterer [mailto:peter.hutterer@who-t.net]
> Sent: Sunday, March 29, 2020 10:15 AM
> To: Johnny Chuang
> Cc: Dmitry Torokhov; Benjamin Tissoires; linux-kernel@vger.kernel.org;
> linux-input@vger.kernel.org; Rob Schonberger; Johnny Chuang; James Chen;
> Jennifer Tsai; Paul Liang; Jeff Chuang
> Subject: Re: [PATCH] Input: elants_i2c - support palm detection
> 
> On Thu, Mar 26, 2020 at 03:58:45PM +0800, Johnny Chuang wrote:
> > From: Johnny Chuang <johnny.chuang@emc.com.tw>
> >
> > Elan define finger/palm detection on the least significant bit of byte
33.
> > The default value is 1 for all firmwares, which report as
MT_TOOL_FINGER.
> > If firmware support palm detection, the bit will change to 0 and
> > report as MT_TOOL_PALM when firmware detecting palm.
> >
> > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > index 14c577c..3b4d9eb3 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -73,6 +73,7 @@
> >  #define FW_POS_STATE		1
> >  #define FW_POS_TOTAL		2
> >  #define FW_POS_XY		3
> > +#define FW_POS_TOOL_TYPE	33
> >  #define FW_POS_CHECKSUM		34
> >  #define FW_POS_WIDTH		35
> >  #define FW_POS_PRESSURE		45
> > @@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data
> > *ts, u8 *buf)  {
> >  	struct input_dev *input = ts->input;
> >  	unsigned int n_fingers;
> > +	unsigned int tool_type;
> >  	u16 finger_state;
> >  	int i;
> >
> > @@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data
> *ts, u8 *buf)
> >  	dev_dbg(&ts->client->dev,
> >  		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
> >
> > +	/* Note: all fingers have the same tool type */
> > +	if (buf[FW_POS_TOOL_TYPE] & 0x01)
> > +		tool_type = MT_TOOL_FINGER;
> > +	else
> > +		tool_type = MT_TOOL_PALM;
> > +
> >  	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
> >  		if (finger_state & 1) {
> >  			unsigned int x, y, p, w;
> > @@ -867,7 +875,7 @@ static void elants_i2c_mt_event(struct elants_data
> *ts, u8 *buf)
> >  				i, x, y, p, w);
> >
> >  			input_mt_slot(input, i);
> > -			input_mt_report_slot_state(input, MT_TOOL_FINGER,
true);
> > +			input_mt_report_slot_state(input, tool_type, true);
> >  			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> >  			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> >  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p); @@
> -1307,6 +1315,7
> > @@ static int elants_i2c_probe(struct i2c_client *client,
> >  	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0,
> 0);
> >  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> >  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> > +	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0,
> MT_TOOL_MAX, 0,
> > +0);
> 
> if you're only reporting pen and palm, can we set this to MT_TOOL_PALM
> instead? Otherwise you're indicating you may also send MT_TOOL_DIAL which
> is unlikely on this hardware :)
> 

Yes, we do not have MT_TOOL_DIAL on touch screen.
So I need to modify MT_TOOL_MAX to MT_TOOL_PALM, right?

> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net> otherwise
> 
> Cheers,
>    Peter
> 
> >  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> >  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> >  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> > --
> > 2.7.4
> >


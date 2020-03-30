Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 875D91972D8
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 05:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgC3Dro (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 23:47:44 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53757 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728490AbgC3Dro (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 23:47:44 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id A8315581112;
        Sun, 29 Mar 2020 23:47:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 29 Mar 2020 23:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=TdyVsaUG7tAypiXXkRxUKeQLba9
        ZoyiJDTV67rlOD2I=; b=dklptqjTjWaFCCIHO+7pzpX/NBMtwO+TUwjWZlhr5so
        kvzoWWkpmK4UWsm6ckcINY60BtLT6mKED+A9V7eSV70WyvOoYadDFaO/TpXkcRXN
        +syr8oPw4ihilgrRfLuepBINIKhYsEVmRVka1+DLvn2vyNp576teYXpNIePKSSSo
        DTDUcoVM6ywsuiYtkDUmENM4ps3hlhHzlBfLntGyVbgUZO2zMziwraIst5XS6GxU
        DXKV+I2E+m1FHZARYkFuVYYopG7NsKuwDZFIrzvjEz0EAuxxGPb2Go4YCxlXcPR4
        N9MwE0L+qa+U7RQMsGu5uRl4HYZgn1k/rYcyMxl5FhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TdyVsa
        UG7tAypiXXkRxUKeQLba9ZoyiJDTV67rlOD2I=; b=iC3wY/dNd5vMOGlrpllxnB
        CtsVHVM/USY+X2gtB8t8VrJUJ60MwlqHcyBLw6frxXqwJ9UGSTWJVYr7XpuYhsWT
        k5b6rhUipfyDbaZwHJk8OYELzof9odj6lSgz93o5Z8JaTT5E9oCzBGqSMyyL8KZE
        RPbsVg+bvy/DZOxk/PAbd59S0nxHgDxImBSvOj+wq0eGbVWFR8XzuVCmnh487l4t
        WQajJGldHiSYMlLC81tPzVBR1pZyUTZu1F27svU87JQkEoi1cUhu5mEA02lQ2Y6s
        x/lkOCmCpfW3LTkVYD3K1yqFYp6lXV9wsXPPcDIqbRJ02qEXdb2XlKqrfNgTZa2Q
        ==
X-ME-Sender: <xms:22uBXlYQucC95ssuOXN-txXF7L0iyq1KjICwvaTbkMLB4zuDB5Worw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeigedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecukfhppeduudejrddvtddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqd
    htrdhnvght
X-ME-Proxy: <xmx:22uBXmZWqmvzCltA5H-aFJXT-GHX2dviOsOIEuS3oSCH4_yU6jpzrg>
    <xmx:22uBXun7bCPdu8eU35Jnzhnf9hntpRbJYQjHohXmPkUkgGtA5nVoGQ>
    <xmx:22uBXh2WPikSYdhs-p3VWbXM-VxKYjV8wy7T83-2yfWviwBRkHAiIg>
    <xmx:3GuBXg3xXuL47BVRYGl-hA3-Zyu3W3qKm70DHLVidAX14rZNmLRrJg>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BDAE328005D;
        Sun, 29 Mar 2020 23:47:36 -0400 (EDT)
Date:   Mon, 30 Mar 2020 13:47:32 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>
Cc:     'Johnny Chuang' <johnny.chuang.emc@gmail.com>,
        'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        'Benjamin Tissoires' <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        'Rob Schonberger' <robsc@google.com>,
        'James Chen' <james.chen@emc.com.tw>,
        'Jennifer Tsai' <jennifer.tsai@emc.com.tw>,
        'Paul Liang' <paul.liang@emc.com.tw>,
        'Jeff Chuang' <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - support palm detection
Message-ID: <20200330034732.GA156101@jelly>
References: <1585209525-6047-1-git-send-email-johnny.chuang.emc@gmail.com>
 <20200329021436.GA68168@jelly>
 <001501d6062e$849afb60$8dd0f220$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001501d6062e$849afb60$8dd0f220$@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 30, 2020 at 08:59:51AM +0800, Johnny.Chuang wrote:
> > -----Original Message-----
> > From: Peter Hutterer [mailto:peter.hutterer@who-t.net]
> > Sent: Sunday, March 29, 2020 10:15 AM
> > To: Johnny Chuang
> > Cc: Dmitry Torokhov; Benjamin Tissoires; linux-kernel@vger.kernel.org;
> > linux-input@vger.kernel.org; Rob Schonberger; Johnny Chuang; James Chen;
> > Jennifer Tsai; Paul Liang; Jeff Chuang
> > Subject: Re: [PATCH] Input: elants_i2c - support palm detection
> > 
> > On Thu, Mar 26, 2020 at 03:58:45PM +0800, Johnny Chuang wrote:
> > > From: Johnny Chuang <johnny.chuang@emc.com.tw>
> > >
> > > Elan define finger/palm detection on the least significant bit of byte
> 33.
> > > The default value is 1 for all firmwares, which report as
> MT_TOOL_FINGER.
> > > If firmware support palm detection, the bit will change to 0 and
> > > report as MT_TOOL_PALM when firmware detecting palm.
> > >
> > > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > > ---
> > >  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > > b/drivers/input/touchscreen/elants_i2c.c
> > > index 14c577c..3b4d9eb3 100644
> > > --- a/drivers/input/touchscreen/elants_i2c.c
> > > +++ b/drivers/input/touchscreen/elants_i2c.c
> > > @@ -73,6 +73,7 @@
> > >  #define FW_POS_STATE		1
> > >  #define FW_POS_TOTAL		2
> > >  #define FW_POS_XY		3
> > > +#define FW_POS_TOOL_TYPE	33
> > >  #define FW_POS_CHECKSUM		34
> > >  #define FW_POS_WIDTH		35
> > >  #define FW_POS_PRESSURE		45
> > > @@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data
> > > *ts, u8 *buf)  {
> > >  	struct input_dev *input = ts->input;
> > >  	unsigned int n_fingers;
> > > +	unsigned int tool_type;
> > >  	u16 finger_state;
> > >  	int i;
> > >
> > > @@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data
> > *ts, u8 *buf)
> > >  	dev_dbg(&ts->client->dev,
> > >  		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
> > >
> > > +	/* Note: all fingers have the same tool type */
> > > +	if (buf[FW_POS_TOOL_TYPE] & 0x01)
> > > +		tool_type = MT_TOOL_FINGER;
> > > +	else
> > > +		tool_type = MT_TOOL_PALM;
> > > +
> > >  	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
> > >  		if (finger_state & 1) {
> > >  			unsigned int x, y, p, w;
> > > @@ -867,7 +875,7 @@ static void elants_i2c_mt_event(struct elants_data
> > *ts, u8 *buf)
> > >  				i, x, y, p, w);
> > >
> > >  			input_mt_slot(input, i);
> > > -			input_mt_report_slot_state(input, MT_TOOL_FINGER,
> true);
> > > +			input_mt_report_slot_state(input, tool_type, true);
> > >  			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> > >  			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> > >  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p); @@
> > -1307,6 +1315,7
> > > @@ static int elants_i2c_probe(struct i2c_client *client,
> > >  	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0,
> > 0);
> > >  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> > >  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> > > +	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0,
> > MT_TOOL_MAX, 0,
> > > +0);
> > 
> > if you're only reporting pen and palm, can we set this to MT_TOOL_PALM
> > instead? Otherwise you're indicating you may also send MT_TOOL_DIAL which
> > is unlikely on this hardware :)
> > 
> 
> Yes, we do not have MT_TOOL_DIAL on touch screen.
> So I need to modify MT_TOOL_MAX to MT_TOOL_PALM, right?

yes please.

Cheers,
   Peter

> 
> > Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net> otherwise
> > 
> > Cheers,
> >    Peter
> > 
> > >  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> > >  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> > >  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> > > --
> > > 2.7.4
> > >
> 

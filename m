Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FBB396D3D
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 08:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhFAGW7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 02:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhFAGW7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 02:22:59 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADEDC061574
        for <linux-input@vger.kernel.org>; Mon, 31 May 2021 23:21:17 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g6so605212pfq.1
        for <linux-input@vger.kernel.org>; Mon, 31 May 2021 23:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g9ycelqs6imQgvhh6l/FRb9G/2ONnMYxtw/Expol5gM=;
        b=iAvBgPYduk91FaP9D1H6ebrICRD7Cjk5ABXbZO3foTp8BwNYrk5fD/fRQKQy/0RHEY
         IO/6tz9nz9ZSn7k4ja9ZDtBMiKLfLnas3R3SeK19rSniH53VjE1IV8bi6h1ydfzPwO3L
         jkEWElfRxX2M6gOht103N9/dG7AYU87SqMHMe2vD+EVksdams96UhAqBt+GzQXWAWhNl
         lJj8Ie1g3/bAmu0EqFb39JwlQ3GGjpf5fQV8buE1HIj4CpigJ2C0QStH0WgKfDBCLmXJ
         xybMDQxh2ByWFuyORQXptonIlgeEGtl8BjODdigIwPB3wPTMvPTALWVzrsqes+dkJGpu
         uZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g9ycelqs6imQgvhh6l/FRb9G/2ONnMYxtw/Expol5gM=;
        b=F5lnIKE5eoN3ugiv/7InaoC/pG3JFCsr0J4feB0p/RO6zD2nQ9/55KYoF1THttD57y
         m2rC52lRZ2OygOvlSX4xHprWPADJG4ZH5kirHO23DySCL0X9t/v9yDSCA5ozK1d/O5P4
         5bh07Kt15HbpIrFgVutWRo3p5OzLUpppMa7ny4kNZXWaGFvDcSv51u9emQCuLl64uO2u
         2N3FE3k6smR6WLm0qdsuMNpAqtC6oC1SzNJAEpahFGP53GQIaCvEyd6oWa83e347TRNm
         F/vCnLdOA2OCIoFC8f4KHOMe0albKz7O7rJvmaz152nPynIOmQIEI6bsPLmNJXDGd6oZ
         VuqQ==
X-Gm-Message-State: AOAM532OgS6+Fus3DILwm3UUFb/RqMevepDASACCUB/58WtplCUA3jhu
        xEReG5egTnOjfb9OIaYTwPY=
X-Google-Smtp-Source: ABdhPJxmcGvAJzby6uU/wWz0ewq+5qLi/w5tALoBWDQRioEkvbSzYclUW4QrQxQSvXNQau1yeqSDPQ==
X-Received: by 2002:a05:6a00:7c5:b029:2e8:d5f5:9677 with SMTP id n5-20020a056a0007c5b02902e8d5f59677mr20319271pfu.68.1622528477150;
        Mon, 31 May 2021 23:21:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f313:c4c:d05e:895b])
        by smtp.gmail.com with ESMTPSA id q91sm5648787pja.50.2021.05.31.23.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 23:21:16 -0700 (PDT)
Date:   Mon, 31 May 2021 23:21:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kbuild@lists.01.org,
        lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <YLXR2brkc4H54xtK@google.com>
References: <202105270957.mdv83Usm-lkp@intel.com>
 <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
 <20210527104157.GK24442@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527104157.GK24442@kadam>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 01:41:57PM +0300, Dan Carpenter wrote:
> On Thu, May 27, 2021 at 12:19:51PM +0200, Oleksij Rempel wrote:
> > Hi,
> > 
> > On Thu, May 27, 2021 at 12:30:00PM +0300, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  next
> > > head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
> > > commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: resistive-adc-touch - add support for z1 and z2 channels
> > > config: x86_64-randconfig-m001-20210526 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > New smatch warnings:
> > > drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
> > > drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uninitialized symbol 'x'.
> > > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'y'.
> > > 
> > > Old smatch warnings:
> > > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'x'.
> > > drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: uninitialized symbol 'y'.
> > > 
> > > vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c
> > > 
> > > aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const void *data, void *private)
> > > aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
> > > aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info = data;
> > > aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st = private;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, press = 0, z1 = 0, z2;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
> > > aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x = touch_info[i];
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y = touch_info[i];
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press = touch_info[i];
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 = touch_info[i];
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 = touch_info[i];
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   82  
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
> > > fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt = z2;
> > > 
> > > It's likely this is a false positive, but we can see why the static
> > > checker would complain.
> > 
> > The presence of this values was validated on probe. Do we really need
> > extra set them to 0?
> 
> You don't need to do anything.  ;)  These are a one time email.  I just
> look it over and hit forward.
> 
> Currently GCC's uninitialized variable checking is disabled in the
> kernel otherwise there would be more presure to silence the checker
> warning.

I find "ununitialzied" warnings to be quite useful. How about we change
a bit how we map the channels, and this will help with uninitialized
warnings as well.

Absolutely not tested, so...

Thanks.

-- 
Dmitry


Input: resistive-adc-touch - rework mapping of channels

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Instead of iterating over channels establish and use channel map to
retrieve data. As a side effect this will silence "uninitialized variable"
warnings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/resistive-adc-touch.c |  114 ++++++++++-------------
 1 file changed, 51 insertions(+), 63 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index ea1884fb49a1..2102916a37ea 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -25,12 +25,12 @@
 #define GRTS_MAX_CHANNELS				4
 
 enum grts_ch_type {
-	GRTS_CH_NONE = 0,
 	GRTS_CH_X,
 	GRTS_CH_Y,
 	GRTS_CH_PRESSURE,
 	GRTS_CH_Z1,
 	GRTS_CH_Z2,
+	GRTS_CH_MAX = GRTS_CH_Z2 + 1
 };
 
 /**
@@ -42,7 +42,7 @@ enum grts_ch_type {
  * @iio_cb:		iio_callback buffer for the data
  * @input:		the input device structure that we register
  * @prop:		touchscreen properties struct
- * @ch:			channels that are defined for the touchscreen
+ * @ch_map:		map of channels that are defined for the touchscreen
  */
 struct grts_state {
 	u32				x_plate_ohms;
@@ -52,37 +52,25 @@ struct grts_state {
 	struct iio_cb_buffer		*iio_cb;
 	struct input_dev		*input;
 	struct touchscreen_properties	prop;
-	u8				ch[GRTS_MAX_CHANNELS];
+	u8				ch_map[GRTS_CH_MAX];
 };
 
 static int grts_cb(const void *data, void *private)
 {
 	const u16 *touch_info = data;
 	struct grts_state *st = private;
-	unsigned int x, y, press = 0, z1 = 0, z2;
-	unsigned int Rt, i;
-
-	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
-		switch (st->ch[i]) {
-		case GRTS_CH_X:
-			x = touch_info[i];
-			break;
-		case GRTS_CH_Y:
-			y = touch_info[i];
-			break;
-		case GRTS_CH_PRESSURE:
-			press = touch_info[i];
-			break;
-		case GRTS_CH_Z1:
-			z1 = touch_info[i];
-			break;
-		case GRTS_CH_Z2:
-			z2 = touch_info[i];
-			break;
-		}
-	}
+	unsigned int x, y, press;
+
+	x = touch_info[st->ch_map[GRTS_CH_X]];
+	y = touch_info[st->ch_map[GRTS_CH_X]];
+
+	if (st->ch_map[GRTS_CH_PRESSURE] < GRTS_MAX_CHANNELS) {
+		press = touch_info[st->ch_map[GRTS_CH_PRESSURE]];
+	} else if (st->ch_map[GRTS_CH_Z1] < GRTS_MAX_CHANNELS) {
+		unsigned int z1 = touch_info[st->ch_map[GRTS_CH_Z1]];
+		unsigned int z2 = touch_info[st->ch_map[GRTS_CH_Z2]];
+		unsigned int Rt;
 
-	if (z1) {
 		Rt = z2;
 		Rt -= z1;
 		Rt *= st->x_plate_ohms;
@@ -142,60 +130,59 @@ static void grts_disable(void *data)
 	iio_channel_release_all_cb(data);
 }
 
-static int grts_get_properties(struct grts_state *st, struct device *dev)
+static int grts_map_channel(struct grts_state *st, struct device *dev,
+			    enum grts_ch_type type, const char *name,
+			    bool optional)
 {
-	int idx, error;
-
-	idx = device_property_match_string(dev, "io-channel-names", "x");
-	if (idx < 0)
-		return idx;
-
-	if (idx >= ARRAY_SIZE(st->ch))
+	int idx;
+
+	idx = device_property_match_string(dev, "io-channel-names", name);
+	if (idx < 0) {
+		if (!optional)
+			return idx;
+		idx = GRTS_MAX_CHANNELS;
+	} else if (idx >= GRTS_MAX_CHANNELS) {
 		return -EOVERFLOW;
+	}
 
-	st->ch[idx] = GRTS_CH_X;
+	st->ch_map[type] = idx;
+	return 0;
+}
 
-	idx = device_property_match_string(dev, "io-channel-names", "y");
-	if (idx < 0)
-		return idx;
+static int grts_get_properties(struct grts_state *st, struct device *dev)
+{
+	int error;
 
-	if (idx >= ARRAY_SIZE(st->ch))
-		return -EOVERFLOW;
+	error = grts_map_channel(st, dev, GRTS_CH_X, "x", false);
+	if (error)
+		return error;
 
-	st->ch[idx] = GRTS_CH_Y;
+	error = grts_map_channel(st, dev, GRTS_CH_Y, "y", false);
+	if (error)
+		return error;
 
 	/* pressure is optional */
-	idx = device_property_match_string(dev, "io-channel-names", "pressure");
-	if (idx >= 0) {
-		if (idx >= ARRAY_SIZE(st->ch))
-			return -EOVERFLOW;
+	error = grts_map_channel(st, dev, GRTS_CH_PRESSURE, "pressure", true);
+	if (error)
+		return error;
 
-		st->ch[idx] = GRTS_CH_PRESSURE;
+	if (st->ch_map[GRTS_CH_PRESSURE] < GRTS_MAX_CHANNELS) {
 		st->pressure = true;
-
 		return 0;
 	}
 
 	/* if no pressure is defined, try optional z1 + z2 */
-	idx = device_property_match_string(dev, "io-channel-names", "z1");
-	if (idx < 0)
-		return 0;
-
-	if (idx >= ARRAY_SIZE(st->ch))
-		return -EOVERFLOW;
+	error = grts_map_channel(st, dev, GRTS_CH_Z1, "z1", true);
+	if (error)
+		return error;
 
-	st->ch[idx] = GRTS_CH_Z1;
+	if (st->ch_map[GRTS_CH_Z1] >= GRTS_MAX_CHANNELS)
+		return 0;
 
 	/* if z1 is provided z2 is not optional */
-	idx = device_property_match_string(dev, "io-channel-names", "z2");
-	if (idx < 0)
-		return idx;
-
-	if (idx >= ARRAY_SIZE(st->ch))
-		return -EOVERFLOW;
-
-	st->ch[idx] = GRTS_CH_Z2;
-	st->pressure = true;
+	error = grts_map_channel(st, dev, GRTS_CH_Z2, "z2", true);
+	if (error)
+		return error;
 
 	error = device_property_read_u32(dev,
 					 "touchscreen-x-plate-ohms",
@@ -205,6 +192,7 @@ static int grts_get_properties(struct grts_state *st, struct device *dev)
 		return error;
 	}
 
+	st->pressure = true;
 	return 0;
 }
 


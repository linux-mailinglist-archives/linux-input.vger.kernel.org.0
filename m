Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA65397168
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 12:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFAK3N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 06:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFAK3N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 06:29:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F218CC061574
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 03:27:31 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lo1cF-0002ny-4t; Tue, 01 Jun 2021 12:27:19 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lo1cB-0007qg-KG; Tue, 01 Jun 2021 12:27:15 +0200
Date:   Tue, 1 Jun 2021 12:27:15 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <20210601102715.uu2wflgzvrler6rt@pengutronix.de>
References: <202105270957.mdv83Usm-lkp@intel.com>
 <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
 <20210527104157.GK24442@kadam>
 <YLXR2brkc4H54xtK@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YLXR2brkc4H54xtK@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:25:29 up 181 days, 31 min, 54 users,  load average: 0.24, 0.16,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

 
> Input: resistive-adc-touch - rework mapping of channels
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Instead of iterating over channels establish and use channel map to
> retrieve data. As a side effect this will silence "uninitialized variable"
> warnings.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/resistive-adc-touch.c |  114 ++++++++++-------------
>  1 file changed, 51 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
> index ea1884fb49a1..2102916a37ea 100644
> --- a/drivers/input/touchscreen/resistive-adc-touch.c
> +++ b/drivers/input/touchscreen/resistive-adc-touch.c
> @@ -25,12 +25,12 @@
>  #define GRTS_MAX_CHANNELS				4
>  
>  enum grts_ch_type {
> -	GRTS_CH_NONE = 0,
>  	GRTS_CH_X,
>  	GRTS_CH_Y,
>  	GRTS_CH_PRESSURE,
>  	GRTS_CH_Z1,
>  	GRTS_CH_Z2,
> +	GRTS_CH_MAX = GRTS_CH_Z2 + 1
>  };
>  
>  /**
> @@ -42,7 +42,7 @@ enum grts_ch_type {
>   * @iio_cb:		iio_callback buffer for the data
>   * @input:		the input device structure that we register
>   * @prop:		touchscreen properties struct
> - * @ch:			channels that are defined for the touchscreen
> + * @ch_map:		map of channels that are defined for the touchscreen
>   */
>  struct grts_state {
>  	u32				x_plate_ohms;
> @@ -52,37 +52,25 @@ struct grts_state {
>  	struct iio_cb_buffer		*iio_cb;
>  	struct input_dev		*input;
>  	struct touchscreen_properties	prop;
> -	u8				ch[GRTS_MAX_CHANNELS];
> +	u8				ch_map[GRTS_CH_MAX];
>  };
>  
>  static int grts_cb(const void *data, void *private)
>  {
>  	const u16 *touch_info = data;
>  	struct grts_state *st = private;
> -	unsigned int x, y, press = 0, z1 = 0, z2;
> -	unsigned int Rt, i;
> -
> -	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> -		switch (st->ch[i]) {
> -		case GRTS_CH_X:
> -			x = touch_info[i];
> -			break;
> -		case GRTS_CH_Y:
> -			y = touch_info[i];
> -			break;
> -		case GRTS_CH_PRESSURE:
> -			press = touch_info[i];
> -			break;
> -		case GRTS_CH_Z1:
> -			z1 = touch_info[i];
> -			break;
> -		case GRTS_CH_Z2:
> -			z2 = touch_info[i];
> -			break;
> -		}
> -	}
> +	unsigned int x, y, press;
> +
> +	x = touch_info[st->ch_map[GRTS_CH_X]];
> +	y = touch_info[st->ch_map[GRTS_CH_X]];

Here should be GRTS_CH_Y

With this fix:
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>

> +
> +	if (st->ch_map[GRTS_CH_PRESSURE] < GRTS_MAX_CHANNELS) {
> +		press = touch_info[st->ch_map[GRTS_CH_PRESSURE]];
> +	} else if (st->ch_map[GRTS_CH_Z1] < GRTS_MAX_CHANNELS) {
> +		unsigned int z1 = touch_info[st->ch_map[GRTS_CH_Z1]];
> +		unsigned int z2 = touch_info[st->ch_map[GRTS_CH_Z2]];
> +		unsigned int Rt;
>  
> -	if (z1) {
>  		Rt = z2;
>  		Rt -= z1;
>  		Rt *= st->x_plate_ohms;
> @@ -142,60 +130,59 @@ static void grts_disable(void *data)
>  	iio_channel_release_all_cb(data);
>  }
>  
> -static int grts_get_properties(struct grts_state *st, struct device *dev)
> +static int grts_map_channel(struct grts_state *st, struct device *dev,
> +			    enum grts_ch_type type, const char *name,
> +			    bool optional)
>  {
> -	int idx, error;
> -
> -	idx = device_property_match_string(dev, "io-channel-names", "x");
> -	if (idx < 0)
> -		return idx;
> -
> -	if (idx >= ARRAY_SIZE(st->ch))
> +	int idx;
> +
> +	idx = device_property_match_string(dev, "io-channel-names", name);
> +	if (idx < 0) {
> +		if (!optional)
> +			return idx;
> +		idx = GRTS_MAX_CHANNELS;
> +	} else if (idx >= GRTS_MAX_CHANNELS) {
>  		return -EOVERFLOW;
> +	}
>  
> -	st->ch[idx] = GRTS_CH_X;
> +	st->ch_map[type] = idx;
> +	return 0;
> +}
>  
> -	idx = device_property_match_string(dev, "io-channel-names", "y");
> -	if (idx < 0)
> -		return idx;
> +static int grts_get_properties(struct grts_state *st, struct device *dev)
> +{
> +	int error;
>  
> -	if (idx >= ARRAY_SIZE(st->ch))
> -		return -EOVERFLOW;
> +	error = grts_map_channel(st, dev, GRTS_CH_X, "x", false);
> +	if (error)
> +		return error;
>  
> -	st->ch[idx] = GRTS_CH_Y;
> +	error = grts_map_channel(st, dev, GRTS_CH_Y, "y", false);
> +	if (error)
> +		return error;
>  
>  	/* pressure is optional */
> -	idx = device_property_match_string(dev, "io-channel-names", "pressure");
> -	if (idx >= 0) {
> -		if (idx >= ARRAY_SIZE(st->ch))
> -			return -EOVERFLOW;
> +	error = grts_map_channel(st, dev, GRTS_CH_PRESSURE, "pressure", true);
> +	if (error)
> +		return error;
>  
> -		st->ch[idx] = GRTS_CH_PRESSURE;
> +	if (st->ch_map[GRTS_CH_PRESSURE] < GRTS_MAX_CHANNELS) {
>  		st->pressure = true;
> -
>  		return 0;
>  	}
>  
>  	/* if no pressure is defined, try optional z1 + z2 */
> -	idx = device_property_match_string(dev, "io-channel-names", "z1");
> -	if (idx < 0)
> -		return 0;
> -
> -	if (idx >= ARRAY_SIZE(st->ch))
> -		return -EOVERFLOW;
> +	error = grts_map_channel(st, dev, GRTS_CH_Z1, "z1", true);
> +	if (error)
> +		return error;
>  
> -	st->ch[idx] = GRTS_CH_Z1;
> +	if (st->ch_map[GRTS_CH_Z1] >= GRTS_MAX_CHANNELS)
> +		return 0;
>  
>  	/* if z1 is provided z2 is not optional */
> -	idx = device_property_match_string(dev, "io-channel-names", "z2");
> -	if (idx < 0)
> -		return idx;
> -
> -	if (idx >= ARRAY_SIZE(st->ch))
> -		return -EOVERFLOW;
> -
> -	st->ch[idx] = GRTS_CH_Z2;
> -	st->pressure = true;
> +	error = grts_map_channel(st, dev, GRTS_CH_Z2, "z2", true);
> +	if (error)
> +		return error;
>  
>  	error = device_property_read_u32(dev,
>  					 "touchscreen-x-plate-ohms",
> @@ -205,6 +192,7 @@ static int grts_get_properties(struct grts_state *st, struct device *dev)
>  		return error;
>  	}
>  
> +	st->pressure = true;
>  	return 0;
>  }
>  
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

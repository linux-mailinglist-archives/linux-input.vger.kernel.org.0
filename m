Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2B638CB3C
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 18:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237696AbhEUQn7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 12:43:59 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3648 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237702AbhEUQn6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 12:43:58 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fmslx3T9FzmXVx;
        Sat, 22 May 2021 00:40:13 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 22 May 2021 00:42:30 +0800
Received: from localhost (10.52.125.126) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 21 May
 2021 17:42:27 +0100
Date:   Fri, 21 May 2021 17:40:41 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <kernel@pengutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] Input: resistive-adc-touch: add support for z1
 and z2 channels
Message-ID: <20210521174041.000040da@Huawei.com>
In-Reply-To: <20210521044525.7397-9-o.rempel@pengutronix.de>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
        <20210521044525.7397-9-o.rempel@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.126]
X-ClientProxiedBy: lhreml746-chm.china.huawei.com (10.201.108.196) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 May 2021 06:45:25 +0200
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> This patch adds support for the z1 and z2 channels. These are used to
> calculate the applied pressure. As there is no common order of the
> individual channels of a resistive touch ADC, support for
> io-channel-names is added (although the DT bindings stated the
> driver already supports these).
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

One minor comment inline, but otherwise looks good to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Would be nice at some point to make this handle channels that
aren't 16 bits, but that can be a job for another day.

Jonathan

> ---
>  .../input/touchscreen/resistive-adc-touch.c   | 142 ++++++++++++++++--
>  1 file changed, 128 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
> index e50af30183f4..fa90005b7bc9 100644
> --- a/drivers/input/touchscreen/resistive-adc-touch.c
> +++ b/drivers/input/touchscreen/resistive-adc-touch.c
> @@ -20,7 +20,18 @@
>  
>  #define DRIVER_NAME					"resistive-adc-touch"
>  #define GRTS_DEFAULT_PRESSURE_MIN			50000
> +#define GRTS_DEFAULT_PRESSURE_MAX			65535
>  #define GRTS_MAX_POS_MASK				GENMASK(11, 0)
> +#define GRTS_MAX_CHANNELS				4
> +
> +enum grts_ch_type {
> +	GRTS_CH_NONE = 0,
> +	GRTS_CH_X,
> +	GRTS_CH_Y,
> +	GRTS_CH_PRESSURE,
> +	GRTS_CH_Z1,
> +	GRTS_CH_Z2,
> +};
>  
>  /**
>   * struct grts_state - generic resistive touch screen information struct
> @@ -33,24 +44,61 @@
>   */
>  struct grts_state {
>  	u32				pressure_min;
> +	u32				x_plate_ohms;
>  	bool				pressure;
>  	struct iio_channel		*iio_chans;
>  	struct iio_cb_buffer		*iio_cb;
>  	struct input_dev		*input;
>  	struct touchscreen_properties	prop;
> +	u8				ch[GRTS_MAX_CHANNELS];
>  };
>  
>  static int grts_cb(const void *data, void *private)
>  {
>  	const u16 *touch_info = data;
>  	struct grts_state *st = private;
> -	unsigned int x, y, press = 0x0;
> +	unsigned int x, y, press = 0, z1 = 0, z2;
> +	unsigned int Rt, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> +		switch (st->ch[i]) {
> +		case GRTS_CH_X:
> +			x = touch_info[i];
> +			break;
> +		case GRTS_CH_Y:
> +			y = touch_info[i];
> +			break;
> +		case GRTS_CH_PRESSURE:
> +			press = touch_info[i];
> +			break;
> +		case GRTS_CH_Z1:
> +			z1 = touch_info[i];
> +			break;
> +		case GRTS_CH_Z2:
> +			z2 = touch_info[i];
> +			break;
> +		case GRTS_CH_NONE:

Loop condition above prevents this.   I guess you might get a warning though
so if this is just warning suppression then add a comment to say so to
make sure it isn't removed.

> +			break;
> +		}
> +	}
>  
> -	/* channel data coming in buffer in the order below */
> -	x = touch_info[0];
> -	y = touch_info[1];
> -	if (st->pressure)
> -		press = touch_info[2];
> +	if (z1) {
> +		Rt = z2;
> +		Rt -= z1;
> +		Rt *= st->x_plate_ohms;
> +		Rt = DIV_ROUND_CLOSEST(Rt, 16);
> +		Rt *= x;
> +		Rt /= z1;
> +		Rt = DIV_ROUND_CLOSEST(Rt, 256);
> +		/*
> +		 * On increased pressure the resistance (Rt) is decreasing
> +		 * so, convert values to make it looks as real pressure.
> +		 */
> +		if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
> +			press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
> +		else
> +			press = 0;
> +	}
>  
>  	if ((!x && !y) || (st->pressure && (press < st->pressure_min))) {
>  		/* report end of touch */
> @@ -94,12 +142,77 @@ static void grts_disable(void *data)
>  	iio_channel_release_all_cb(data);
>  }
>  
> +static int grts_get_properties(struct grts_state *st, struct device *dev)
> +{
> +	int idx, error;
> +
> +	idx = device_property_match_string(dev, "io-channel-names", "x");
> +	if (idx < 0)
> +		return idx;
> +
> +	if (idx >= ARRAY_SIZE(st->ch))
> +		return -EOVERFLOW;
> +
> +	st->ch[idx] = GRTS_CH_X;
> +
> +	idx = device_property_match_string(dev, "io-channel-names", "y");
> +	if (idx < 0)
> +		return idx;
> +
> +	if (idx >= ARRAY_SIZE(st->ch))
> +		return -EOVERFLOW;
> +
> +	st->ch[idx] = GRTS_CH_Y;
> +
> +	/* pressure is optional */
> +	idx = device_property_match_string(dev, "io-channel-names", "pressure");
> +	if (idx >= 0) {
> +		if (idx >= ARRAY_SIZE(st->ch))
> +			return -EOVERFLOW;
> +
> +		st->ch[idx] = GRTS_CH_PRESSURE;
> +		st->pressure = true;
> +
> +		return 0;
> +	}
> +
> +	/* if no pressure is defined, try optional z1 + z2 */
> +	idx = device_property_match_string(dev, "io-channel-names", "z1");
> +	if (idx < 0)
> +		return 0;
> +
> +	if (idx >= ARRAY_SIZE(st->ch))
> +		return -EOVERFLOW;
> +
> +	st->ch[idx] = GRTS_CH_Z1;
> +
> +	/* if z1 is provided z2 is not optional */
> +	idx = device_property_match_string(dev, "io-channel-names", "z2");
> +	if (idx < 0)
> +		return idx;
> +
> +	if (idx >= ARRAY_SIZE(st->ch))
> +		return -EOVERFLOW;
> +
> +	st->ch[idx] = GRTS_CH_Z2;
> +	st->pressure = true;
> +
> +	error = device_property_read_u32(dev,
> +					 "touchscreen-x-plate-ohms",
> +					 &st->x_plate_ohms);
> +	if (error) {
> +		dev_err(dev, "can't get touchscreen-x-plate-ohms property\n");
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
>  static int grts_probe(struct platform_device *pdev)
>  {
>  	struct grts_state *st;
>  	struct input_dev *input;
>  	struct device *dev = &pdev->dev;
> -	struct iio_channel *chan;
>  	int error;
>  
>  	st = devm_kzalloc(dev, sizeof(struct grts_state), GFP_KERNEL);
> @@ -115,12 +228,13 @@ static int grts_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> -	chan = &st->iio_chans[0];
> -	st->pressure = false;
> -	while (chan && chan->indio_dev) {
> -		if (!strcmp(chan->channel->datasheet_name, "pressure"))
> -			st->pressure = true;
> -		chan++;
> +	if (!device_property_present(dev, "io-channel-names"))
> +		return -ENODEV;
> +
> +	error = grts_get_properties(st, dev);
> +	if (error) {
> +		dev_err(dev, "Failed to parse properties\n");
> +		return error;
>  	}
>  
>  	if (st->pressure) {
> @@ -148,7 +262,7 @@ static int grts_probe(struct platform_device *pdev)
>  	input_set_abs_params(input, ABS_Y, 0, GRTS_MAX_POS_MASK - 1, 0, 0);
>  	if (st->pressure)
>  		input_set_abs_params(input, ABS_PRESSURE, st->pressure_min,
> -				     0xffff, 0, 0);
> +				     GRTS_DEFAULT_PRESSURE_MAX, 0, 0);
>  
>  	input_set_capability(input, EV_KEY, BTN_TOUCH);
>  


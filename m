Return-Path: <linux-input+bounces-6040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A09674F8
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 06:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D311F2179B
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 04:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CC52BAE2;
	Sun,  1 Sep 2024 04:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRaasitF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D051C36;
	Sun,  1 Sep 2024 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725164839; cv=none; b=u3210E9L5fZ71imzyHVlq8OBzrWfwVhGMtvvIqr602/CLA/c5rDHQJzdWhcOZNjZqi+o+iIwVS/2Z82/Hx1gboUdl9sABb+DDnyxxBLK7Ho4tdtJx4PJwIXaB1Sf3o3dQWI6SupVzx2TmsTvOmJcZ8f7AoyyCikx2p60XrsD1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725164839; c=relaxed/simple;
	bh=H91+vz1IZXa6N/Sge4clD9Eo/3hsAI2xXK3fKEdVidw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af3ZsHPQwZKQspASjz1hx23x8e2nGHkSgPBYTqd/8dits5xHvd/oWmZhv45LCaMdpZYKx9HvLTXlON/JMKkRXbR69zl0ottA6kwVZy+7ou0Ag3aMTPtdHB08oqqNKuGRWJYkw8309xseHteHM9nbh6xPBzMQZkf/7vf8UPK78Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRaasitF; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2705dd4ba64so1639737fac.3;
        Sat, 31 Aug 2024 21:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725164837; x=1725769637; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RnnyvzrGRjjJXciTZMEPH7NSFP9sa7wFy0+JjlZ8+qo=;
        b=TRaasitFL0MZVQvhzZ3RnYG+iiZZ50D5ZlyArpVv5MJ64vYxBJQedquuQX1JqjzQAt
         LCTu+KuQA7kjY3ecSJSoVe79fpkeCd2R9YsyjPfRTqGjPwwTfe/uyYI1x2ycdAHG3QQZ
         +DjfmQHH/2/A/zrTzwFnAA5ih8TFJHxMDpxBtWp873sfn68R4a/IRQ9XrZPbOQQ5Qi3R
         //JG5Vm/Nbv5RA0EhjBQcA1jxVI5/mG5MdmswW0As0j3TH+oTtKq8GWTLM266sNmvamL
         KEDathlyyqs9m/LRsV5T5sxCRgVPPx5SNSIdmJx3BiJRLrc86tbvDd1FF0mpA5wtARP6
         H18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725164837; x=1725769637;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnnyvzrGRjjJXciTZMEPH7NSFP9sa7wFy0+JjlZ8+qo=;
        b=JQE9Wxnag0Rh4ReqOBFPrsjHPlp9wcRn6F0P03+2dOu+KFS4EY2LneVUmhtn2M9nQN
         6jmo+TCevGYJNE5XBZREixYAtJ+UGDUxl/i9cI+QJClNMYWdiEYMsGh6rgVCa1vZNwqA
         qXG+iIh9wiSEgSyji5R/24+lzx9RaHs1iJw3oVGohu2AfJy+GmT4LKcqYoafsGaXxgZz
         LA22Ey2FNCjDy0/EOQ47zYTBjCGEIqBUOYE+FhDduRUeowoxROTyPQMpS+01Rp7ABF8k
         JxphUcvzOC1IR2uYU739h+Yjnbrqx1ZE01ANqKz1XAM6rsae/SOYuLydFun320XmXURx
         axIA==
X-Forwarded-Encrypted: i=1; AJvYcCUTS+7vnPyRPcfys0r37Cb4sqcAQjlFAbTMkk+QfgLRhTLvMHlytHKYJlFXQl7ajP66vP3lEZXWSzHTO75o@vger.kernel.org, AJvYcCWZMGfaOYX2PkCXBi5RFcgbV9kkhhjHCuUwt1HEm1vWK0ax0x7Iy3ZnLF4qAvedGmOA8KBZUj3t5WCW@vger.kernel.org, AJvYcCWqlOCLUCa/4BBv3aGHAWV+QC5HNGfnmWFryiTUpwyrQeD8ZpPOA5aZvia4U8oeEyIJH4boPBkv0dHBANI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1t+jcelikxboiZwDb1dcGQ7HaSK48+T39PZpCuU/b+bj3diEl
	OJQOMnPmDnLyk/MHIglPP0ojJxPS+qpB+GvQ91Ka2pyboA/Lic9R
X-Google-Smtp-Source: AGHT+IESauiSVdXyOno4Ceb0FxD6dfIQoUE3mKxt7SKlxjQzYSzBwNH47SHASzOW0/hHroH5ZKCMrA==
X-Received: by 2002:a05:6870:d24c:b0:24f:d178:d48d with SMTP id 586e51a60fabf-277c81ecbefmr4429798fac.31.1725164836654;
        Sat, 31 Aug 2024 21:27:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1922:345f:3ad8:d306])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576d91sm4881115b3a.35.2024.08.31.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 21:27:16 -0700 (PDT)
Date: Sat, 31 Aug 2024 21:27:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v4 2/2] input: add driver for Hynitron CST816X touchscreen
Message-ID: <ZtPtIdqm4G7SqYvd@google.com>
References: <20240829212014.111357-1-kuzhylol@gmail.com>
 <20240829212014.111357-2-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829212014.111357-2-kuzhylol@gmail.com>

Hi Oleh,

On Thu, Aug 29, 2024 at 11:20:14PM +0200, Oleh Kuzhylnyi wrote:
> Introduce support for the Hynitron CST816X touchscreen controller
> used for 240×240 1.28-inch Round LCD Display Module manufactured
> by Waveshare Electronics. The driver is designed based on an Arduino
> implementation marked as under MIT License. This driver is written
> for a particular round display based on the CST816S controller, which
> is not compatiable with existing driver for Hynitron controllers.
> 
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v4:
> - Update commit based on Dmitry's feedback:
> - Move abs_x and abs_y to u16
> - Remove __packed qualifier for touch_info struct
> - Hide tiny touch irq context to stack
> - Extend cst816x_i2c_read_register() with buf and buf_size
> - Remove loop from event lookup

Thank you for making the changes, a few more comments/suggestions:

> +
> +static const struct cst816x_event_mapping event_map[16] = {
> +	{CST816X_SWIPE_UP, BTN_FORWARD},
> +	{CST816X_SWIPE_DOWN, BTN_BACK},
> +	{CST816X_SWIPE_LEFT, BTN_LEFT},
> +	{CST816X_SWIPE_RIGHT, BTN_RIGHT},
> +	{CST816X_SINGLE_TAP, BTN_TOUCH},
> +	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +	{CST816X_RESERVED, KEY_RESERVED},
> +};
> +
> +static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg,
> +				     void *buf, size_t len)
> +{
> +	struct i2c_client *client;

Whenever reasonable combine declaration and initialization:

	struct i2c_client *client = priv->client;

> +	struct i2c_msg xfer[2];

	struct i2c_msg xfer[] = {
		{
			.addr = client->addr,
			.buf = &reg,
			.len = sizeof(reg),

		},
		{
			.addr = client->addr,
			.flags = I2C_M_RD,
			.buf = buf,
			.len = len,
		},
	};

> +	int rc;
> +
> +	client = priv->client;
> +
> +	xfer[0].addr = client->addr;
> +	xfer[0].flags = 0;
> +	xfer[0].buf = &reg;
> +	xfer[0].len = sizeof(reg);
> +
> +	xfer[1].addr = client->addr;
> +	xfer[1].flags = I2C_M_RD;
> +	xfer[1].buf = buf;
> +	xfer[1].len = len;
> +
> +	rc = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (rc != ARRAY_SIZE(xfer)) {
> +		if (rc >= 0)
> +			rc = -EIO;
		rc = rc < 0 ? rc : -EIO;
		dev_err(...);
		return rc;
> +	} else {
> +		rc = 0;
> +	}
> +
> +	if (rc < 0)
> +		dev_err(&client->dev, "i2c rx err: %d\n", rc);
> +
> +	return rc;

Explicitly returning 0 on success is preferred if code looks reasonable.

	return 0;

> +}
> +
> +static int cst816x_process_touch(struct cst816x_priv *priv,
> +				 struct cst816x_touch_info *info)
> +{
> +	u8 raw[8];
> +	int rc;

	int error;

> +
> +	rc = cst816x_i2c_read_register(priv, CST816X_FRAME, raw, sizeof(raw));
> +	if (!rc) {

	error = cst816x_i2c_read_register(...);
	if (error)
		return error;


> +		info->gesture = raw[0];
> +		info->touch = raw[1];
> +		info->abs_x = ((raw[2] & 0x0F) << 8) | raw[3];

I think it can be written as

	info->abs_x = get_unaligned_le16(&raw[2]) & GENMASK(11, 0);

> +		info->abs_y = ((raw[4] & 0x0F) << 8) | raw[5];
> +
> +		dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
> +			info->abs_x, info->abs_y, info->touch, info->gesture);
> +	}
> +
> +	return rc;

	return 0;

> +}
> +
> +static int cst816x_register_input(struct cst816x_priv *priv)
> +{
> +	priv->input = devm_input_allocate_device(priv->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +
> +	priv->input->name = "Hynitron CST816X Touchscreen";
> +	priv->input->phys = "input/ts";
> +	priv->input->id.bustype = BUS_I2C;
> +	input_set_drvdata(priv->input, priv);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(event_map); i++)
> +		input_set_capability(priv->input, EV_KEY, event_map[i].code);
> +
> +	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
> +	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
> +
> +	return input_register_device(priv->input);
> +}
> +
> +static void cst816x_reset(struct cst816x_priv *priv)
> +{

I believe the reset line should be optional, and so check for non-NULL
here before trying to execute the reset sequence.

> +	gpiod_set_value_cansleep(priv->reset, 1);
> +	msleep(50);
> +	gpiod_set_value_cansleep(priv->reset, 0);
> +	msleep(100);
> +}
> +
> +static void report_gesture_event(const struct cst816x_priv *priv,
> +				 enum cst816x_gestures gesture, bool touch)
> +{
> +	u16 key = event_map[gesture & 0x0F].code;
> +
> +	if (key != KEY_RESERVED)
> +		input_report_key(priv->input, key, touch);
> +
> +	if (!touch)
> +		input_report_key(priv->input, BTN_TOUCH, 0);

This chunk does not belong here but rather where you report the rest of
the touch state.

> +}
> +
> +/*
> + * Supports five gestures: TOUCH, LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS.
> + * Reports surface interaction, sliding coordinates and finger detachment.
> + *
> + * 1. TOUCH Gesture Scenario:
> + *
> + * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
> + *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
> + *  x y   true    0x00      Slide    ABS_X_Y
> + *  x y   false   0x05      Gesture               BTN_TOUCH
> + *
> + * 2. LEFT, RIGHT, FORWARD, BACK, and LONG_PRESS Gestures Scenario:
> + *
> + * [x/y] [touch] [gesture] [Action] [Report ABS] [Report Key]
> + *  x y   true    0x00      Touch    ABS_X_Y      BTN_TOUCH
> + *  x y   true    0x01      Gesture  ABS_X_Y      BTN_FORWARD
> + *  x y   true    0x01      Slide    ABS_X_Y
> + *  x y   false   0x01      Detach                BTN_FORWARD | BTN_TOUCH
> + */
> +static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
> +{
> +	struct cst816x_priv *priv = (struct cst816x_priv *)cookie;

No need to cast void pointers.

> +	struct cst816x_touch_info info;
> +
> +	if (!cst816x_process_touch(priv, &info)) {

This makes it appear cst816x_process_touch() returning boolean.

	error = cst816x_process_touch(priv, &info);
	if (error)
		goto out;

> +		if (info.touch) {
> +			input_report_abs(priv->input, ABS_X, info.abs_x);
> +			input_report_abs(priv->input, ABS_Y, info.abs_y);
> +			input_report_key(priv->input, BTN_TOUCH, 1);
> +		}

		} else {
			input_report_key(priv->input, BTN_TOUCH, 0);
		}

> +
> +		if (info.gesture)
> +			report_gesture_event(priv, info.gesture, info.touch);
> +
> +		input_sync(priv->input);
> +	}

out:

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cst816x_probe(struct i2c_client *client)
> +{
> +	struct cst816x_priv *priv;
> +	struct device *dev = &client->dev;
> +	int rc;

	int error;

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->client = client;
> +
> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

Please make reset optional, it does not have to be handled by the driver
if something else (firmware) will be doing power sequencing.

> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "reset gpio not found\n");
> +
> +	cst816x_reset(priv);
> +
> +	rc = cst816x_register_input(priv);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "input register failed\n");
> +
> +	rc = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
> +				       IRQF_ONESHOT, dev->driver->name, priv);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "irq request failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id cst816x_id[] = {
> +	{ .name = "cst816s", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cst816x_id);
> +
> +static const struct of_device_id cst816x_of_match[] = {
> +	{ .compatible = "hynitron,cst816s", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cst816x_of_match);
> +
> +static struct i2c_driver cst816x_driver = {
> +	.driver = {
> +		.name = "cst816x",
> +		.of_match_table = cst816x_of_match,
> +	},
> +	.id_table = cst816x_id,
> +	.probe = cst816x_probe,
> +};
> +
> +module_i2c_driver(cst816x_driver);
> +
> +MODULE_AUTHOR("Oleh Kuzhylnyi <kuzhylol@gmail.com>");
> +MODULE_DESCRIPTION("Hynitron CST816X Touchscreen Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

Thanks.

-- 
Dmitry


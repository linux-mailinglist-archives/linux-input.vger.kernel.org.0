Return-Path: <linux-input+bounces-5052-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D7932025
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 07:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37556283035
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 05:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A66917BAA;
	Tue, 16 Jul 2024 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNBZVfwW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90F187F;
	Tue, 16 Jul 2024 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721108765; cv=none; b=VJbsZ6glxS0nqR5xtkFwzTE9YOQsr4LHJEUO+R1NBSZFFoutqcKcpGl8YEChPnhLxKVTG3ZaeGsoCvNSd9ka0G9RUsMzL/duKqNEWCprM4O5mE63YeqpRNs9LCSgfmuAocRolxaltxXXbtk5+uHEQ8t+zB9RXObRK7/rsEmHphc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721108765; c=relaxed/simple;
	bh=GGPwWTFDsAEk4WwzfHLwP3DLwP2hF2aFeiCUNcJCThU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzoBCWJB5B1b9ncv9JhVJLPRnlGSUMN4AKx5OaI4QPhj8zRp9qgRMGr3t+51DnEN1kyatylOIyWvqBRSpdKzNNH6TajGiN043dSdvRvNRcDmA44vVhcT+60dn46iFSP2EQ52DygOuwYskc6SQEzGUagiwNLpvQhi+QCpILZ0KlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNBZVfwW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70b0e7f6f8bso4413013b3a.3;
        Mon, 15 Jul 2024 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721108763; x=1721713563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4SncyN68Bsmpu2SjtNnQs4s5BGvnPFFpg/bHoxWkA5o=;
        b=ZNBZVfwWQCms8hJWU9ysUKY3lUCZ273McWm4/8CN31gWRgN+R3V8EAKl4481Ijdvl2
         jwafvRy+Qv+R4KAIVhnqk3lz+WvzsKr6tmtlhA7yEJ9T5rVe0RoYOQtHkSuZq958xWOs
         HfLaIAsnwAeyP2KUnJ6T/b51bTGEocyvU08SO0167+k9ewoVNmr+25y5EOVQEs8w1c37
         k8UWaT8JGZI9f+ANo3o5S+60Tq9tyGHS53QEMU6SV1yiG++LJAmIUKtO2CxW8IkgCo94
         5vWAu0ZstWifEk43c35Wem3uCJUnQqaNJ6pmWBK3Lh1wA6omf6gPSwAw251K4jlCV+Jv
         qYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721108763; x=1721713563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SncyN68Bsmpu2SjtNnQs4s5BGvnPFFpg/bHoxWkA5o=;
        b=Pk3BfAToQO8/Y+3LFnnD+plvgZf/wV3jyyURAPd8d4WqFLeWl7Wdwz+DT+wob2lTEM
         jonGQ3zPNws+65mU4tY0nc7WdDepDTJGsds1cd1/FryMdLIvz8YWSItPE3YjUQR4iqUf
         B/7lWGEMKfalsQ8TXPsrMZE7VtQYn0r0BmvX7KWk3JOfx9GPl4Cr5aZc3pDL4YUm2AHd
         SLa5w+shnebDhTkb/o+BRBpQ3mVNymUHqtybWWWxyJC6tgUVP+UZT5gNT/gIzFxmlyQ5
         ploStdDA+QK1DhP77GMmD3BwiaLL/wHYvQDizfs56j/noZbzG1cxssDPDLEbWmfOhT0N
         BUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdxUtw7N+XvSBuIotpO6Ge4Aqu1s3yuFYrTNKucFJRt0hLPxcvDquu3J6i69CWmrVI/VSyN8eL+yObjZ6gUFlz3QPiDIm/aaVRkEOK/oky+YPSADvQKGeq9JKU5WJ70g0B8xJDa7p1QJ+sWUTETo7Gf6/NRNap68vqJIcn5v8h5pVLVCsK
X-Gm-Message-State: AOJu0Yz+z3gHL9qEFhCtJ4S9EwyHjNzgYyBwMSDEeDaNBk1DccoPFblW
	hxqbft439acXLExBZrYsmWcNBr2swD9lrD9LPGh372P8m70YaiFG
X-Google-Smtp-Source: AGHT+IFKepILvr69WvlcNwHxqDqeipNyKkzHe0bdWwQ2r2xz0qdAv6lfiDyMZgD8sMtoq5dxkABAag==
X-Received: by 2002:a05:6a00:4b15:b0:706:66cd:9ded with SMTP id d2e1a72fcca58-70c1fb67373mr1600320b3a.2.1721108762407;
        Mon, 15 Jul 2024 22:46:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7d2dasm5390559b3a.111.2024.07.15.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 22:46:01 -0700 (PDT)
Date: Mon, 15 Jul 2024 22:45:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RESEND v4 2/2] input: zinitix: Add touchkey support
Message-ID: <ZpYJFo7q-V2jWPpa@google.com>
References: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
 <20240713-zinitix-tkey-v4-2-14b7e2d5ace3@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713-zinitix-tkey-v4-2-14b7e2d5ace3@trvn.ru>

Hi Nikita,

On Sat, Jul 13, 2024 at 08:28:09PM +0500, Nikita Travkin wrote:
> Zinitix touch controllers can use some of the sense lines for virtual
> keys (like those found on many phones). Add support for those keys.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

A few comments:

> ---
>  drivers/input/touchscreen/zinitix.c | 61 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 1b4807ba4624..75390d67689e 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -119,6 +119,7 @@
>  
>  #define DEFAULT_TOUCH_POINT_MODE		2
>  #define MAX_SUPPORTED_FINGER_NUM		5
> +#define MAX_SUPPORTED_BUTTON_NUM		8
>  
>  #define CHIP_ON_DELAY				15 // ms
>  #define FIRMWARE_ON_DELAY			40 // ms
> @@ -146,6 +147,8 @@ struct bt541_ts_data {
>  	struct touchscreen_properties prop;
>  	struct regulator_bulk_data supplies[2];
>  	u32 zinitix_mode;
> +	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
> +	int num_keycodes;
>  };
>  
>  static int zinitix_read_data(struct i2c_client *client,
> @@ -195,6 +198,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  	struct i2c_client *client = bt541->client;
>  	int i;
>  	int error;
> +	u16 int_flags = 0;

It is initialized unconditionally below, no need to initialize here.

>  
>  	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
>  	if (error) {
> @@ -225,6 +229,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  	if (error)
>  		return error;
>  
> +	error = zinitix_write_u16(client, ZINITIX_BUTTON_SUPPORTED_NUM,
> +				  bt541->num_keycodes);
> +	if (error)
> +		return error;
> +
>  	error = zinitix_write_u16(client, ZINITIX_INITIAL_TOUCH_MODE,
>  				  bt541->zinitix_mode);
>  	if (error)
> @@ -235,9 +244,12 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  	if (error)
>  		return error;
>  
> -	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
> -				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
> -					BIT_UP);
> +	int_flags = BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP;
> +

Drop empty line.

> +	if (bt541->num_keycodes)
> +		int_flags |= BIT_ICON_EVENT;
> +
> +	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, int_flags);
>  	if (error)
>  		return error;
>  
> @@ -350,6 +362,15 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
>  	}
>  }
>  
> +static void zinitix_report_keys(struct bt541_ts_data *bt541, u16 icon_events)
> +{
> +	int i;
> +
> +	for (i = 0; i < bt541->num_keycodes; i++)
> +		input_report_key(bt541->input_dev,
> +				 bt541->keycodes[i], !!(icon_events & BIT(i)));
> +}
> +
>  static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  {
>  	struct bt541_ts_data *bt541 = bt541_handler;
> @@ -358,6 +379,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  	unsigned long finger_mask;
>  	int error;
>  	int i;
> +	__le16 icon_events = 0;

I do not believe this needs to be initialized.

>  
>  	memset(&touch_event, 0, sizeof(struct touch_event));
>  
> @@ -368,6 +390,17 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>  		goto out;
>  	}
>  
> +	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
> +		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
> +					  &icon_events, sizeof(icon_events));
> +		if (error) {
> +			dev_err(&client->dev, "Failed to read icon events\n");
> +			goto out;
> +		}
> +
> +		zinitix_report_keys(bt541, le16_to_cpu(icon_events));
> +	}
> +
>  	finger_mask = touch_event.finger_mask;
>  	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
>  		const struct point_coord *p = &touch_event.point_coord[i];
> @@ -453,6 +486,7 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
>  {
>  	struct input_dev *input_dev;
>  	int error;
> +	int i;
>  
>  	input_dev = devm_input_allocate_device(&bt541->client->dev);
>  	if (!input_dev) {
> @@ -470,6 +504,14 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
>  	input_dev->open = zinitix_input_open;
>  	input_dev->close = zinitix_input_close;
>  
> +	if (bt541->num_keycodes) {
> +		input_dev->keycode = bt541->keycodes;
> +		input_dev->keycodemax = bt541->num_keycodes;
> +		input_dev->keycodesize = sizeof(bt541->keycodes[0]);
> +		for (i = 0; i < bt541->num_keycodes; i++)
> +			input_set_capability(input_dev, EV_KEY, bt541->keycodes[i]);
> +	}
> +
>  	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
>  	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
>  	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
> @@ -534,6 +576,19 @@ static int zinitix_ts_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +	bt541->num_keycodes = of_property_read_variable_u32_array(
> +					client->dev.of_node, "linux,keycodes",
> +					bt541->keycodes, 0,
> +					ARRAY_SIZE(bt541->keycodes));

Please use generic device properties (device_property_*). There is no
equivalent for "read variable" so you'll need 2 calls, one to figure out
the array size and another one to read it.

See drivers/input/keyboard/mpr121_touchkey.c for an example.

> +	if (bt541->num_keycodes == -EINVAL) {
> +		bt541->num_keycodes = 0;
> +	} else if (bt541->num_keycodes < 0) {
> +		dev_err(&client->dev,
> +			"Unable to parse \"linux,keycodes\" property: %d\n",
> +			bt541->num_keycodes);
> +		return bt541->num_keycodes;
> +	}
> +
>  	error = zinitix_init_input_dev(bt541);
>  	if (error) {
>  		dev_err(&client->dev,
> 
> -- 
> 2.45.2
> 

Thanks.

-- 
Dmitry


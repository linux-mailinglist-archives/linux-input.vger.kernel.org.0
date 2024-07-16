Return-Path: <linux-input+bounces-5053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8F932140
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF212822D4
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 07:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7675D25779;
	Tue, 16 Jul 2024 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="tw56He2M"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7ED3771C;
	Tue, 16 Jul 2024 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115145; cv=none; b=W97pGjc7N/4LHlsq0VtwnI9/8sX3WmTf8JS0rfhf/DDzUzoVun5YnXvmfNJ56HFBBdc2GjviR3sMlZg7Tww6cmO38uiMB2+efWlsICRQp5fZPluqP7nGPRBDK4qLlTQHfZF/QlfTOpVDSxtSXAUWF0KiwW3Pxf6/Vx6LOhJh1AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115145; c=relaxed/simple;
	bh=QDKo5S1JWPsUjLSx9uenmPgXxU9CGqujNx85fmauHys=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ml8cK3U0Orj6P9puRxwoNKizf28pZiYb4IRq9dFE6t3iznMZDcSb1aFxRTrysIJDIOMETXCQKFPG9hTCMWvViMzXllWFKK3L+byxY+1RL26IpVaD/fqsIQL0pCa35mlGhGCBTDgyjbclbE4L158M2Zks4OCQKg4RJhDPYZRjTOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=tw56He2M; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 34BD840408;
	Tue, 16 Jul 2024 12:32:13 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721115133; bh=QDKo5S1JWPsUjLSx9uenmPgXxU9CGqujNx85fmauHys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tw56He2M7o/YmfI4v/tIIBURlLINFY0haN/cQbbAS8hvTXMjCx0V+yJM/rW00qp0q
	 qsIDG0msryWEdkgcnOeReYO4RPOWlDnUtmazXtvAQ3H51b4T00gh5Dt5cnw1f+TMF2
	 xr7kSGSYPp1jRT2vAS4+LEllujFNUYapDY9ufCtrk/xd5K/OKPz5RncS/taMG8ySqX
	 LnIh+CmlMCR/lQWOkasr5Tl+u4zUAqH3Y8Y4bNETGOML8WbUTzssFIoVp9GSexf3ok
	 CjCwxKqtH4hCPhKLKAwYhhqh2GYAdhzH5gCdfVr/NYTHsJzhgcJJ59kIOoiay42fFk
	 Xt4p/Q2wczhvA==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 16 Jul 2024 12:32:11 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij
 <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RESEND v4 2/2] input: zinitix: Add touchkey support
In-Reply-To: <ZpYJFo7q-V2jWPpa@google.com>
References: <20240713-zinitix-tkey-v4-0-14b7e2d5ace3@trvn.ru>
 <20240713-zinitix-tkey-v4-2-14b7e2d5ace3@trvn.ru>
 <ZpYJFo7q-V2jWPpa@google.com>
Message-ID: <2dfe0504525b7eae9fb8bfb3bd28bb4e@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Torokhov писал(а) 16.07.2024 10:45:
> Hi Nikita,
> 
> On Sat, Jul 13, 2024 at 08:28:09PM +0500, Nikita Travkin wrote:
>> Zinitix touch controllers can use some of the sense lines for virtual
>> keys (like those found on many phones). Add support for those keys.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> 
> A few comments:
> 
>> ---
>>  drivers/input/touchscreen/zinitix.c | 61 +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
>> index 1b4807ba4624..75390d67689e 100644
>> --- a/drivers/input/touchscreen/zinitix.c
>> +++ b/drivers/input/touchscreen/zinitix.c
>> @@ -119,6 +119,7 @@
>>
>>  #define DEFAULT_TOUCH_POINT_MODE		2
>>  #define MAX_SUPPORTED_FINGER_NUM		5
>> +#define MAX_SUPPORTED_BUTTON_NUM		8
>>
>>  #define CHIP_ON_DELAY				15 // ms
>>  #define FIRMWARE_ON_DELAY			40 // ms
>> @@ -146,6 +147,8 @@ struct bt541_ts_data {
>>  	struct touchscreen_properties prop;
>>  	struct regulator_bulk_data supplies[2];
>>  	u32 zinitix_mode;
>> +	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
>> +	int num_keycodes;
>>  };
>>
>>  static int zinitix_read_data(struct i2c_client *client,
>> @@ -195,6 +198,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>>  	struct i2c_client *client = bt541->client;
>>  	int i;
>>  	int error;
>> +	u16 int_flags = 0;
> 
> It is initialized unconditionally below, no need to initialize here.
> 
>>
>>  	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
>>  	if (error) {
>> @@ -225,6 +229,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>>  	if (error)
>>  		return error;
>>
>> +	error = zinitix_write_u16(client, ZINITIX_BUTTON_SUPPORTED_NUM,
>> +				  bt541->num_keycodes);
>> +	if (error)
>> +		return error;
>> +
>>  	error = zinitix_write_u16(client, ZINITIX_INITIAL_TOUCH_MODE,
>>  				  bt541->zinitix_mode);
>>  	if (error)
>> @@ -235,9 +244,12 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>>  	if (error)
>>  		return error;
>>
>> -	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
>> -				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
>> -					BIT_UP);
>> +	int_flags = BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP;
>> +
> 
> Drop empty line.
> 
>> +	if (bt541->num_keycodes)
>> +		int_flags |= BIT_ICON_EVENT;
>> +
>> +	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, int_flags);
>>  	if (error)
>>  		return error;
>>
>> @@ -350,6 +362,15 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
>>  	}
>>  }
>>
>> +static void zinitix_report_keys(struct bt541_ts_data *bt541, u16 icon_events)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < bt541->num_keycodes; i++)
>> +		input_report_key(bt541->input_dev,
>> +				 bt541->keycodes[i], !!(icon_events & BIT(i)));
>> +}
>> +
>>  static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>>  {
>>  	struct bt541_ts_data *bt541 = bt541_handler;
>> @@ -358,6 +379,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>>  	unsigned long finger_mask;
>>  	int error;
>>  	int i;
>> +	__le16 icon_events = 0;
> 
> I do not believe this needs to be initialized.
> 
>>
>>  	memset(&touch_event, 0, sizeof(struct touch_event));
>>
>> @@ -368,6 +390,17 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
>>  		goto out;
>>  	}
>>
>> +	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
>> +		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
>> +					  &icon_events, sizeof(icon_events));
>> +		if (error) {
>> +			dev_err(&client->dev, "Failed to read icon events\n");
>> +			goto out;
>> +		}
>> +
>> +		zinitix_report_keys(bt541, le16_to_cpu(icon_events));
>> +	}
>> +
>>  	finger_mask = touch_event.finger_mask;
>>  	for_each_set_bit(i, &finger_mask, MAX_SUPPORTED_FINGER_NUM) {
>>  		const struct point_coord *p = &touch_event.point_coord[i];
>> @@ -453,6 +486,7 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
>>  {
>>  	struct input_dev *input_dev;
>>  	int error;
>> +	int i;
>>
>>  	input_dev = devm_input_allocate_device(&bt541->client->dev);
>>  	if (!input_dev) {
>> @@ -470,6 +504,14 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
>>  	input_dev->open = zinitix_input_open;
>>  	input_dev->close = zinitix_input_close;
>>
>> +	if (bt541->num_keycodes) {
>> +		input_dev->keycode = bt541->keycodes;
>> +		input_dev->keycodemax = bt541->num_keycodes;
>> +		input_dev->keycodesize = sizeof(bt541->keycodes[0]);
>> +		for (i = 0; i < bt541->num_keycodes; i++)
>> +			input_set_capability(input_dev, EV_KEY, bt541->keycodes[i]);
>> +	}
>> +
>>  	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
>>  	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
>>  	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
>> @@ -534,6 +576,19 @@ static int zinitix_ts_probe(struct i2c_client *client)
>>  		return error;
>>  	}
>>
>> +	bt541->num_keycodes = of_property_read_variable_u32_array(
>> +					client->dev.of_node, "linux,keycodes",
>> +					bt541->keycodes, 0,
>> +					ARRAY_SIZE(bt541->keycodes));
> 
> Please use generic device properties (device_property_*). There is no
> equivalent for "read variable" so you'll need 2 calls, one to figure out
> the array size and another one to read it.
> 
> See drivers/input/keyboard/mpr121_touchkey.c for an example.
> 

Ack, will switch to using device_property_ and fix all the above
suggestions in v5.

Thanks for your review!
Nikita

>> +	if (bt541->num_keycodes == -EINVAL) {
>> +		bt541->num_keycodes = 0;
>> +	} else if (bt541->num_keycodes < 0) {
>> +		dev_err(&client->dev,
>> +			"Unable to parse \"linux,keycodes\" property: %d\n",
>> +			bt541->num_keycodes);
>> +		return bt541->num_keycodes;
>> +	}
>> +
>>  	error = zinitix_init_input_dev(bt541);
>>  	if (error) {
>>  		dev_err(&client->dev,
>>
>> --
>> 2.45.2
>>
> 
> Thanks.


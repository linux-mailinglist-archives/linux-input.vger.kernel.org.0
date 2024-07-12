Return-Path: <linux-input+bounces-5002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4C592F74E
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 10:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EB371C22878
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 08:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533881428F0;
	Fri, 12 Jul 2024 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QmphOMJy"
X-Original-To: linux-input@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E1143C6E;
	Fri, 12 Jul 2024 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720774445; cv=none; b=h+6UxIHyeBZqBmcwwzslHJwBrIrJ0VLJ/vm8C+PuaNSSoGc5mp2G4FiDAeTu7XsVf+l0LNtog22F6CyAcqBNIi7esVpVwkrWE/ruKu7txYLrEkYJLtZNS7VPkvsS1vj882LkC7RQZddv33kVdkchg8jH6BwwP1URS+NtGm5YUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720774445; c=relaxed/simple;
	bh=nzu9P56chtLJHXFd0G6YfkbOYTeF7ZT2/9zYmaF0cXM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Iyd44eevv8cLjIMtGzrW9Ti1FgM+b6fVeUBm0rSfdmuXqe4GVF2/qvzM96I7V9/0TK4fyZiai+WjHM7K7UZ6gwnG7qCDmfq/Y4S/S9TvlzoEsLZdrvjvVBoMc80C6SA2q9YNem5eAedOA3I1YcHLMfXyJUW9uWaMOWrwvMG5mz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QmphOMJy; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFCE9240008;
	Fri, 12 Jul 2024 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720774440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsHQolMQ5R8Bw8lyvu/s8i78XuwoHgIGYntfqvegxLE=;
	b=QmphOMJyLr8bNOJrYEF2PyXSB1kJna1Xr6KPCQrZsM0j7/re2P3EpZXwebIRSjpLrARAEN
	0DVubboteI1+PvXUIhWoI1frZjM7/OySGgJAtIU3xZEqSxvWLhRRFjq0LxdMtyv1ghkb5q
	GypqilL6x1CJf2j1c0gl5ELMzldYHBjbta9hgc+IsR5VxgiGSDLDbArWTmzB7drmRIYpEA
	4beKo8aamhtskPZfS412vBjPmZX2cCJkVbyw4YtO9VhQUdQhqykM8zaFVshe1oaKsxUcsj
	KWx5ZztBd/xd/l1G2Bb7B0yc5GBXThNvVd8yJs2ewYWGLIH0xL9+adEhFlVl/g==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 12 Jul 2024 10:53:59 +0200
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeff LaBundy
 <jeff@labundy.com>, catalin.popescu@leica-geosystems.com,
 mark.satterthwaite@touchnetix.com, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v16 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
In-Reply-To: <20240703182202.draa63ghijbwarcs@pengutronix.de>
References: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
 <20240703142520.207066-4-kamel.bouhara@bootlin.com>
 <20240703182202.draa63ghijbwarcs@pengutronix.de>
Message-ID: <2f4731ab266a091fddd819709b90d53b@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-07-03 20:22, Marco Felsch a écrit :
> Hi Kamel,
> 
> thank you for the updated version please see my comment inline.

Hi Marco,

Thanks for this new review :) !

[...]

>> +
>> +struct axiom_data {
>> +	struct axiom_devinfo devinfo;
>> +	struct device *dev;
>> +	struct gpio_desc *reset_gpio;
> 			    ^
> The reset is done within the probe so this can be dropped.
> 

Ack, thanks.

>> +	struct i2c_client *client;
> 			    ^
> The client is never used. I would either store the client or the device
> reference but not both.

Sure, nice catch, I'll just keep the device reference here.

> 
>> +	struct input_dev *input_dev;
>> +	u32 max_report_len;
>> +	u8 rx_buf[AXIOM_COMMS_MAX_USAGE_PAGES * AXIOM_COMMS_PAGE_SIZE];
> 
> Is there a reason for having the rx_buf within the driver priv data?
> IMHO it's more error probe since we never set it to zero before we use
> the buffer. I would rather move the rx-buffer to the functions which
> perform the read.

Ok, there no real/technical reason to not move it to reading functions.

> 
>> +	struct axiom_u41_target targets[AXIOM_U41_MAX_TARGETS];
>> +	struct axiom_usage_entry usage_table[AXIOM_U31_MAX_USAGES];
>> +	bool usage_table_populated;
> 		^
> This can be an inline helper which checks the max_report_len e.g:
> 
> static inline bool axiom_usage_table_populated(struct axiom_data *ts)
> {
> 	return ts->max_report_len;
> }
> 

Ack, just for my curiosity, is this for perfomance or clarity sake ?

>> +	struct regmap *regmap;
>> +	struct touchscreen_properties	prop;
>> +};
>> +

[...]

>> +static int axiom_i2c_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct input_dev *input_dev;
>> +	struct axiom_data *ts;
>> +	u32 poll_interval;
>> +	int target;
>> +	int error;
>> +
>> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
>> +	if (!ts)
>> +		return -ENOMEM;
>> +
>> +	i2c_set_clientdata(client, ts);
>> +	ts->client = client;
>> +	ts->dev = dev;
>> +
>> +	ts->regmap = devm_regmap_init_i2c(client, &axiom_i2c_regmap_config);
>> +	error = PTR_ERR_OR_ZERO(ts->regmap);
>> +	if (error) {
>> +		dev_err(dev, "Failed to initialize regmap: %d\n", error);
>> +		return error;
>> +	}
>> +
>> +	error = devm_regulator_get_enable(dev, "vddi");
>> +	if (error)
>> +		return dev_err_probe(&client->dev, error,
>> +				     "Failed to enable VDDI regulator\n");
>> +
>> +	error = devm_regulator_get_enable(dev, "vdda");
>> +	if (error)
>> +		return dev_err_probe(&client->dev, error,
>> +				     "Failed to enable VDDA regulator\n");
>> +
>> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", 
>> GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ts->reset_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get 
>> reset GPIO\n");
>> +
>> +	/* Make sure the time after a power ON sequence is meet */
>> +	if (ts->reset_gpio)
>> +		axiom_reset(ts->reset_gpio);
>> +	else
> 
> No else just:

Fixed, thanks !

> 
>> +		msleep(AXIOM_STARTUP_TIME_MS);
> 
> 	msleep(AXIOM_STARTUP_TIME_MS);
> 
> and drop the msleep within the axiom_reset().
> 
> Regards,
>   Marco

[...]

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


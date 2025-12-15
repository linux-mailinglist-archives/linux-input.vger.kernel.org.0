Return-Path: <linux-input+bounces-16576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15F7CBD73B
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 12:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11E8F30136F3
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 11:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1FF32FA2E;
	Mon, 15 Dec 2025 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="GByssp3B"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470B32FA2D;
	Mon, 15 Dec 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797095; cv=pass; b=tRcBkSs64BLxAVKyiVtPHqLjsEeuVZX6cOfeTk0VkLsPLzZ1EwiEzu6zLPCccXxA87QeBzPOifRwDsQOW1r2OaGExgoqe+oIpyj80XiHvUKYypryAiffYRyKntWub0JeaMB0NHx/mm6lWILsxz+ZGh+01NCFLSCUBBmn01kiVp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797095; c=relaxed/simple;
	bh=F0LweOycg4bG0Wz274Di4RjiIG6iWytHV9OgDWOAlmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6LqmRMFpIxF1dA07BjGydVfjRlfPREyGnsxZMeP5Mdbvm4M/2uvutb4B7JiRhHwI/o+DHLF45Y4sLPkMl+qmPw3dwyHnGM+o4lvJybQ4Vtde6u24Z9Illj//pgbBAfGRid4xjVb4LQQJBUWcNolceZ62i80fjcIQ4USUhmqKWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=GByssp3B; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765797042; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pb2fKAV+qYVlqw/cz7Kv96ZdEprqb18bfrMYRAUNvHTVsB74UejE+KDXnLX5F/vSXOKpk+G5ztnvSwyf335mhMKD6asJSI2DcmdhrR0Rj6btqbu9D249IqCGTdy84YSt+9anJJjFWqU8Fn4+08v4Zs1gCdvJOratRIsj+0QzSAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765797042; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yIhpeMkyqrfxUnIOEMIqyFIEH4jf/cNbm3fWDFkylJo=; 
	b=g67TGC1XLjWClIXwyAouQzFSZ8B4shH3KmHhfeltZylOVgxw6YpCXiObdDkEkY72Fotj+/qD2MPV/O4Sw3jBUaY5fMz8l4cftbsy9tcE8oranlneOkiMl5BXTsvBAFtvAkld6fcqeIwwPHeRQRkjm992q+WK5Tnq0G5ecNTZXZM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765797042;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=yIhpeMkyqrfxUnIOEMIqyFIEH4jf/cNbm3fWDFkylJo=;
	b=GByssp3BOVHQiJoFv2o9l8KPTEQjUaicx5mege3tXRGYGxD29PLyzULGgZtdbgI4
	O2ZS0mFo+U1F3mRZQ3ivgPs+OllEp4rz4xE9+pxsgOjQEaSg/e/f33iA5pLQ6xn+9No
	StC5bF1dUxK+C6vB0EtEjpVo/pEtV7UedmWyE7dc=
Received: by mx.zohomail.com with SMTPS id 1765797035129426.80635080320087;
	Mon, 15 Dec 2025 03:10:35 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, heiko@sntech.de,
 kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org
Subject:
 Re: [PATCH 2/4] Input: adc-keys - support types that aren't just keyboard
 keys
Date: Mon, 15 Dec 2025 12:10:21 +0100
Message-ID: <2411362.ElGaqSPkdT@workhorse>
In-Reply-To: <20251028213209.2646838-1-dsimic@manjaro.org>
References:
 <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
 <20251028213209.2646838-1-dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 28 October 2025 22:32:09 Central European Standard Time Dragan Simic wrote:
> Hello Nicolas,
> 
> On Monday, June 30, 2025, 12:19:24 Nicolas Frattaroli wrote:
> > Instead of doing something like what gpio-keys is doing, adc-keys
> > hardcodes that all keycodes must be of type EV_KEY.
> > 
> > This limits the usefulness of adc-keys, and overcomplicates the code
> > with manual bit-setting logic.
> > 
> > Instead, refactor the code to read the linux,input-type fwnode property,
> > and get rid of the custom bit setting logic, replacing it with
> > input_set_capability instead. input_report_key is replaced with
> > input_event, which allows us to explicitly pass the type.
> 
> Thanks for this patch, it's indeed very useful!  Please see some
> comments below.
> 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
> > index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b1e0098cd1f6a3cd 100644
> > --- a/drivers/input/keyboard/adc-keys.c
> > +++ b/drivers/input/keyboard/adc-keys.c
> > @@ -19,12 +19,14 @@
> >  struct adc_keys_button {
> >  	u32 voltage;
> >  	u32 keycode;
> > +	u32 type;
> >  };
> >  
> >  struct adc_keys_state {
> >  	struct iio_channel *channel;
> >  	u32 num_keys;
> >  	u32 last_key;
> > +	u32 last_type;
> >  	u32 keyup_voltage;
> >  	const struct adc_keys_button *map;
> >  };
> > @@ -35,6 +37,7 @@ static void adc_keys_poll(struct input_dev *input)
> >  	int i, value, ret;
> >  	u32 diff, closest = 0xffffffff;
> >  	int keycode = 0;
> > +	u32 type = EV_KEY;
> >  
> >  	ret = iio_read_channel_processed(st->channel, &value);
> >  	if (unlikely(ret < 0)) {
> > @@ -46,6 +49,7 @@ static void adc_keys_poll(struct input_dev *input)
> >  			if (diff < closest) {
> >  				closest = diff;
> >  				keycode = st->map[i].keycode;
> > +				type = st->map[i].type;
> >  			}
> >  		}
> >  	}
> > @@ -54,13 +58,14 @@ static void adc_keys_poll(struct input_dev *input)
> >  		keycode = 0;
> >  
> >  	if (st->last_key && st->last_key != keycode)
> > -		input_report_key(input, st->last_key, 0);
> > +		input_event(input, st->last_type, st->last_key, 0);
> >  
> >  	if (keycode)
> > -		input_report_key(input, keycode, 1);
> > +		input_event(input, type, keycode, 1);
> 
> When EV_ABS is defined in the DT as the key type, which happens with
> joysticks and whatnot, separate handling is needed, by requiring the
> actual associated button values to be reported in the input_event()
> invocations, more specifically on the keypresses only.

Analogue control devices like joysticks are handled in adc-joystick.c.
adc-keys is specifically for resistor-ladder key devices. A driver or
binding for some absolute/relative positioning device that is not a
joystick should get its own binding first. Overloading the meaning
of the adc-keys binding and then adding functionality to the driver
is not the way to go.

I'll instead add code to only allow EV_KEY and EV_SW. Switches
function like keys for all intents and purposes, so they fit here.

> 
> That's also visible in the gpio_keys_gpio_report_event() function in
> drivers/input/keyboard/gpio_keys.c.
> 
> >  	input_sync(input);
> >  	st->last_key = keycode;
> > +	st->last_type = type;
> >  }
> >  
> >  static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
> > @@ -93,6 +98,10 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
> >  			return -EINVAL;
> >  		}
> >  
> > +		if (fwnode_property_read_u32(child, "linux,input-type",
> > +					     &map[i].type))
> > +			map[i].type = EV_KEY;
> 
> Going along with the remarks above, it will also be needed to read
> and record the values of "linux,input-value" DT properties here, and
> to extend the associated binding to define their presence.
> 
> >  		i++;
> >  	}
> >  
> > @@ -156,9 +165,8 @@ static int adc_keys_probe(struct platform_device *pdev)
> >  	input->id.product = 0x0001;
> >  	input->id.version = 0x0100;
> >  
> > -	__set_bit(EV_KEY, input->evbit);
> >  	for (i = 0; i < st->num_keys; i++)
> > -		__set_bit(st->map[i].keycode, input->keybit);
> > +		input_set_capability(input, st->map[i].type, st->map[i].keycode);
> >  
> >  	if (device_property_read_bool(dev, "autorepeat"))
> >  		__set_bit(EV_REP, input->evbit);
> 






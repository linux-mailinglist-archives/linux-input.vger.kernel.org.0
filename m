Return-Path: <linux-input+bounces-15789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB0C17109
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 22:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B5EE50331D
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 21:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503642DBF73;
	Tue, 28 Oct 2025 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="Pq77o6HD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail1.manjaro.org (mail1.manjaro.org [142.132.176.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFEA2DC76C;
	Tue, 28 Oct 2025 21:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.176.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761687252; cv=none; b=PDm35IatnvPDRQu02M/VBrRFlM8/mCt1RhvDx/LCnUMNCNLl325iN1QspKKa3RFExUEk7+rcGfTs/MfyC8ZNuqU1DhacvyA0WySpTnBqHuFG5L80QSpbRvVIsesiqaVBUtlJTr79j1voL8ZVaV1G8GASX5sY4AHoAE3hzqiHLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761687252; c=relaxed/simple;
	bh=6z2zAHcHQRUUS1xGpWBDBRVkHZNTkAWeQeys2SgyWgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bt+mf+i4kJ6PRfarNIA8Rn8OJfaqe4Ha24mkNdjmvr7BcJbCvbvmzfhS0LDKc+99Lcq8unwiKEYJXuPaan/XyuQm1nE74/X69vuwJss493Xpjnp36oT9LkXXtAcZ8/QtiOZXE2dKne12sHz+q0dh6JKyBtrtuD9hoNKQ1+Gk4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=Pq77o6HD; arc=none smtp.client-ip=142.132.176.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63F6B40D1C;
	Tue, 28 Oct 2025 22:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761687241; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OaeV3ReOG98zpsdwkv/9umMpI5IPraCJeVtVuXAToME=;
	b=Pq77o6HDo9/OSHrQ6/4t3Dekd4Q49eaGkoic01K1yveOMuxs2bsV2H3d/whs55vA1RyDCx
	ln0HayR5AoExJ7Wbfga9ma11rsONrEU9oNlFPw9SCS83lUocgFw8EHTxi5RN8wabT4y2Bk
	EeivFgTwt9Re5mbQKNby3HqAN9OvLEKOa6SiiNQDfthFfsW6FeSPh4ZBd3UmQMmdS1aw59
	u71NY+SwqsDrt/PCLeKunLGWcO2gBl24d8WGsVD298qayTt4K2qP2w3cu1hBaYCPj73MwS
	7lPDhjLxRc9kgJ5MvzAUH6/XZ0N2E363TB02zrWCv/sQCb7DgndQLWjExOo+kQ==
From: Dragan Simic <dsimic@manjaro.org>
To: nicolas.frattaroli@collabora.com
Cc: alexandre.belloni@bootlin.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	heiko@sntech.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 2/4] Input: adc-keys - support types that aren't just keyboard keys
Date: Tue, 28 Oct 2025 22:32:09 +0100
Message-Id: <20251028213209.2646838-1-dsimic@manjaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolas,

On Monday, June 30, 2025, 12:19:24 Nicolas Frattaroli wrote:
> Instead of doing something like what gpio-keys is doing, adc-keys
> hardcodes that all keycodes must be of type EV_KEY.
> 
> This limits the usefulness of adc-keys, and overcomplicates the code
> with manual bit-setting logic.
> 
> Instead, refactor the code to read the linux,input-type fwnode property,
> and get rid of the custom bit setting logic, replacing it with
> input_set_capability instead. input_report_key is replaced with
> input_event, which allows us to explicitly pass the type.

Thanks for this patch, it's indeed very useful!  Please see some
comments below.

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
> index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b1e0098cd1f6a3cd 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -19,12 +19,14 @@
>  struct adc_keys_button {
>  	u32 voltage;
>  	u32 keycode;
> +	u32 type;
>  };
>  
>  struct adc_keys_state {
>  	struct iio_channel *channel;
>  	u32 num_keys;
>  	u32 last_key;
> +	u32 last_type;
>  	u32 keyup_voltage;
>  	const struct adc_keys_button *map;
>  };
> @@ -35,6 +37,7 @@ static void adc_keys_poll(struct input_dev *input)
>  	int i, value, ret;
>  	u32 diff, closest = 0xffffffff;
>  	int keycode = 0;
> +	u32 type = EV_KEY;
>  
>  	ret = iio_read_channel_processed(st->channel, &value);
>  	if (unlikely(ret < 0)) {
> @@ -46,6 +49,7 @@ static void adc_keys_poll(struct input_dev *input)
>  			if (diff < closest) {
>  				closest = diff;
>  				keycode = st->map[i].keycode;
> +				type = st->map[i].type;
>  			}
>  		}
>  	}
> @@ -54,13 +58,14 @@ static void adc_keys_poll(struct input_dev *input)
>  		keycode = 0;
>  
>  	if (st->last_key && st->last_key != keycode)
> -		input_report_key(input, st->last_key, 0);
> +		input_event(input, st->last_type, st->last_key, 0);
>  
>  	if (keycode)
> -		input_report_key(input, keycode, 1);
> +		input_event(input, type, keycode, 1);

When EV_ABS is defined in the DT as the key type, which happens with
joysticks and whatnot, separate handling is needed, by requiring the
actual associated button values to be reported in the input_event()
invocations, more specifically on the keypresses only.

That's also visible in the gpio_keys_gpio_report_event() function in
drivers/input/keyboard/gpio_keys.c.

>  	input_sync(input);
>  	st->last_key = keycode;
> +	st->last_type = type;
>  }
>  
>  static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
> @@ -93,6 +98,10 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
>  			return -EINVAL;
>  		}
>  
> +		if (fwnode_property_read_u32(child, "linux,input-type",
> +					     &map[i].type))
> +			map[i].type = EV_KEY;

Going along with the remarks above, it will also be needed to read
and record the values of "linux,input-value" DT properties here, and
to extend the associated binding to define their presence.

>  		i++;
>  	}
>  
> @@ -156,9 +165,8 @@ static int adc_keys_probe(struct platform_device *pdev)
>  	input->id.product = 0x0001;
>  	input->id.version = 0x0100;
>  
> -	__set_bit(EV_KEY, input->evbit);
>  	for (i = 0; i < st->num_keys; i++)
> -		__set_bit(st->map[i].keycode, input->keybit);
> +		input_set_capability(input, st->map[i].type, st->map[i].keycode);
>  
>  	if (device_property_read_bool(dev, "autorepeat"))
>  		__set_bit(EV_REP, input->evbit);


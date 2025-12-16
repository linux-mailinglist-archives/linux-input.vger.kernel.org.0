Return-Path: <linux-input+bounces-16600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCECC1A74
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 09:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED31A30D4575
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 08:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7C22E1758;
	Tue, 16 Dec 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mxTydb84"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25752C21D9;
	Tue, 16 Dec 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874768; cv=none; b=iUdpkU6af2RjTsmtXm3rTPFSNMuA+1Y2Mv2qjlWUJYvOs4ujBFr0tDv4/v8L3zHVvmwn/d2K3let4MiN1Uv5xhfquen3PqpkTwrpThH3+1/N3EobbVoRDuHZ322S3awtOsgbJ1vxSVFzeuXPRVF0dN1IMvyk+a5LWQ3PZ8lRkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874768; c=relaxed/simple;
	bh=WvKKCoEa0Xf+YKwhDRK8rk3OhF5kSbBh/L5JWF+KEaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N38A4cABfGaA1nn4j+IVILrdO878KJNxWRLHJ33nGdCO2L68RzG6YjDsIRfAGApLWHpvVxajHhjOqzWmCWWOXnXNKcRGmtAM4UKfsScLG+8dnJU7W5Ez10FgiMP6Ds+It2EBHn7mRc8fR17NpCrrDvYF5TmFY6RKfpPrqBceqdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mxTydb84; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 352714E41C1D;
	Tue, 16 Dec 2025 08:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BE3D6071C;
	Tue, 16 Dec 2025 08:46:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 725EC119431B1;
	Tue, 16 Dec 2025 09:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765874760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UUtrHWyv4v6vu7RvS/BRpoLPRa0mCg5QhZIzTxEkK1s=;
	b=mxTydb84SutvM0LonxjVbBXUfJPt7SV16yOEBvH3w4cy3owP3Flmtcf23W5KAJVUvRY7LS
	w72on0TBMhAb/3C4Lnqji5tDk0xT+lNQm5Vi2Zs3SmSPk3t21EnJ5CAdhN6tyUk2+E8pu2
	r08btwpTTFMh8F/ktLeQ0GG0fSGfL1M6EXIYqbj0nDDQPjhMvNNbwbe4Qj1Gmp8wP2XhmS
	9U2tUjqzqymMb4D9RaUOku2ELxTTLeTPllwkqnOmV0jKG9tyP2+iLZ2wwyCcaJVYqGchvP
	+DydRodOVY8Fbo0Md1IvRwUb8U6coIHP7G2/Vn3ea0TjY/mHyNIMQRdMarhsmg==
Date: Tue, 16 Dec 2025 09:45:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/4] Input: adc-keys - support EV_SW as well, not just
 EV_KEY.
Message-ID: <202512160845594c145070@mail.local>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-2-82a61de39b4c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-2-82a61de39b4c@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On 15/12/2025 13:29:30+0100, Nicolas Frattaroli wrote:
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
> 
> Only EV_KEY and EV_SW is allowed at this stage.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/input/keyboard/adc-keys.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
> index f1753207429d..62376f34f7d0 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -18,13 +18,15 @@
>  
>  struct adc_keys_button {
>  	u32 voltage;
> -	u32 keycode;
> +	u32 code;
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
> @@ -34,7 +36,8 @@ static void adc_keys_poll(struct input_dev *input)
>  	struct adc_keys_state *st = input_get_drvdata(input);
>  	int i, value, ret;
>  	u32 diff, closest = 0xffffffff;
> -	int keycode = 0;
> +	u32 code = 0;
> +	u32 type = EV_KEY;
>  
>  	ret = iio_read_channel_processed(st->channel, &value);
>  	if (unlikely(ret < 0)) {
> @@ -45,22 +48,24 @@ static void adc_keys_poll(struct input_dev *input)
>  			diff = abs(st->map[i].voltage - value);
>  			if (diff < closest) {
>  				closest = diff;
> -				keycode = st->map[i].keycode;
> +				code = st->map[i].code;
> +				type = st->map[i].type;
>  			}
>  		}
>  	}
>  
>  	if (abs(st->keyup_voltage - value) < closest)
> -		keycode = 0;
> +		code = 0;
>  
> -	if (st->last_key && st->last_key != keycode)
> -		input_report_key(input, st->last_key, 0);
> +	if (st->last_key && st->last_key != code)
> +		input_event(input, st->last_type, st->last_key, 0);
>  
> -	if (keycode)
> -		input_report_key(input, keycode, 1);
> +	if (code)
> +		input_event(input, type, code, 1);
>  
>  	input_sync(input);
> -	st->last_key = keycode;
> +	st->last_key = code;
> +	st->last_type = type;
>  }
>  
>  static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
> @@ -88,11 +93,20 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
>  		map[i].voltage /= 1000;
>  
>  		if (fwnode_property_read_u32(child, "linux,code",
> -					     &map[i].keycode)) {
> +					     &map[i].code)) {
>  			dev_err(dev, "Key with invalid or missing linux,code\n");
>  			return -EINVAL;
>  		}
>  
> +		if (fwnode_property_read_u32(child, "linux,input-type",
> +					     &map[i].type))
> +			map[i].type = EV_KEY;
> +
> +		if (map[i].type != EV_KEY && map[i].type != EV_SW)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid linux,input-type: 0x%x\n",
> +					     map[i].type);
> +
>  		i++;
>  	}
>  
> @@ -156,9 +170,8 @@ static int adc_keys_probe(struct platform_device *pdev)
>  	input->id.product = 0x0001;
>  	input->id.version = 0x0100;
>  
> -	__set_bit(EV_KEY, input->evbit);
>  	for (i = 0; i < st->num_keys; i++)
> -		__set_bit(st->map[i].keycode, input->keybit);
> +		input_set_capability(input, st->map[i].type, st->map[i].code);
>  
>  	if (device_property_read_bool(dev, "autorepeat"))
>  		__set_bit(EV_REP, input->evbit);
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


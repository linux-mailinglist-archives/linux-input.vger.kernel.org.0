Return-Path: <linux-input+bounces-1436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47F83B3FB
	for <lists+linux-input@lfdr.de>; Wed, 24 Jan 2024 22:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DFD1F2284C
	for <lists+linux-input@lfdr.de>; Wed, 24 Jan 2024 21:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAC91353F6;
	Wed, 24 Jan 2024 21:34:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26C12BE96
	for <linux-input@vger.kernel.org>; Wed, 24 Jan 2024 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706132041; cv=none; b=LhFoYFnjnS6pEedcHH75AERww52SN/AxdXCJxzn8b5VoeqXOd54F2rdoR3TnZv8Ua7SjBfGI2M9v1XkkANLby4oQEfYtc4e7VDyFSbFdINRdmiZ8hmU0wq8m2iS/rnvoAf7EmXh/xsazOuOBtyzHsekX6XCLidFUnx0NmE9bBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706132041; c=relaxed/simple;
	bh=L22JQjnr2Gy9x+QVWmxfI2skbWGGrlld3ZcR+5DttqU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QGktJGjBxM162C7S5JMquaKe/J59oAfCrnE2rPTYJcMFs6DZDzxOVI4ZE8c8PwH1d5+7y/zMgm7RacK5iIeTht758ly0KDiJ0nNIY8Q/4Cqq1CbfA52YoJDfVCHcoQl00EGWHkrKsJ5qeVZLeBzgG7sH28KbudvdA9G1eb7UCnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu; spf=pass smtp.mailfrom=artur-rojek.eu; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artur-rojek.eu
Received: by mail.gandi.net (Postfix) with ESMTPA id 48DD1240005;
	Wed, 24 Jan 2024 21:33:55 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jan 2024 22:33:55 +0100
From: Artur Rojek <contact@artur-rojek.eu>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, hdegoede@redhat.com, paul@crapouillou.net,
 peter.hutterer@who-t.net, svv@google.com, biswarupp@google.com, Chris Morgan
 <macromorgan@hotmail.com>
Subject: Re: [PATCH V4] Input: adc-joystick: Handle inverted axes
In-Reply-To: <20240124204754.43982-1-macroalpha82@gmail.com>
References: <20240124204754.43982-1-macroalpha82@gmail.com>
Message-ID: <ab46b170fa5e0b2631f0527c0e3a88d6@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: contact@artur-rojek.eu

On 2024-01-24 21:47, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> When one or more axes are inverted, (where min > max), normalize the
> data so that min < max and invert the values reported to the input
> stack.
> 
> This ensures we can continue defining the device correctly in the
> device tree while not breaking downstream assumptions that min is
> always less than max.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Artur Rojek <contact@artur-rojek.eu>

Cheers,
Artur

> ---
> Changes since V3:
>  - Add include for minmax.h.
>  - Use swap() instead of min_array()/max_array().
>  - Dropped Ack due to change.
> Changes since V2:
>  - Explicitly set bool value to "true" instead of "1".
>  - Split adc_joystick_invert() function definition to 2 lines.
>  - Corrected changes message location.
> Changes since V1:
>  - Moved proposed helper for inversion from input stack to adc-joystick
>    driver.
> 
>  drivers/input/joystick/adc-joystick.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/input/joystick/adc-joystick.c
> b/drivers/input/joystick/adc-joystick.c
> index c0deff5d4282..3b05b2e413d0 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -7,6 +7,7 @@
>  #include <linux/input.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/consumer.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -18,6 +19,7 @@ struct adc_joystick_axis {
>  	s32 range[2];
>  	s32 fuzz;
>  	s32 flat;
> +	bool inverted;
>  };
> 
>  struct adc_joystick {
> @@ -29,6 +31,15 @@ struct adc_joystick {
>  	bool polled;
>  };
> 
> +static int adc_joystick_invert(struct input_dev *dev,
> +			       unsigned int axis, int val)
> +{
> +	int min = dev->absinfo[axis].minimum;
> +	int max = dev->absinfo[axis].maximum;
> +
> +	return (max + min) - val;
> +}
> +
>  static void adc_joystick_poll(struct input_dev *input)
>  {
>  	struct adc_joystick *joy = input_get_drvdata(input);
> @@ -38,6 +49,8 @@ static void adc_joystick_poll(struct input_dev 
> *input)
>  		ret = iio_read_channel_raw(&joy->chans[i], &val);
>  		if (ret < 0)
>  			return;
> +		if (joy->axes[i].inverted)
> +			val = adc_joystick_invert(input, i, val);
>  		input_report_abs(input, joy->axes[i].code, val);
>  	}
>  	input_sync(input);
> @@ -86,6 +99,8 @@ static int adc_joystick_handle(const void *data,
> void *private)
>  			val = sign_extend32(val, msb);
>  		else
>  			val &= GENMASK(msb, 0);
> +		if (joy->axes[i].inverted)
> +			val = adc_joystick_invert(joy->input, i, val);
>  		input_report_abs(joy->input, joy->axes[i].code, val);
>  	}
> 
> @@ -168,6 +183,12 @@ static int adc_joystick_set_axes(struct device
> *dev, struct adc_joystick *joy)
>  			goto err_fwnode_put;
>  		}
> 
> +		if (axes[i].range[0] > axes[i].range[1]) {
> +			dev_dbg(dev, "abs-axis %d inverted\n", i);
> +			axes[i].inverted = true;
> +			swap(axes[i].range[0], axes[i].range[1]);
> +		}
> +
>  		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
>  		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);


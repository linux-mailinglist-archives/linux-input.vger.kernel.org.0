Return-Path: <linux-input+bounces-1228-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9E82CC80
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 12:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E84C1C215DF
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 11:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2084210E1;
	Sat, 13 Jan 2024 11:28:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC6210E2
	for <linux-input@vger.kernel.org>; Sat, 13 Jan 2024 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artur-rojek.eu
Received: by mail.gandi.net (Postfix) with ESMTPA id EB50620003;
	Sat, 13 Jan 2024 11:28:29 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 13 Jan 2024 12:28:29 +0100
From: Artur Rojek <contact@artur-rojek.eu>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 hdegoede@redhat.com, paul@crapouillou.net, peter.hutterer@who-t.net,
 svv@google.com, biswarupp@google.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V2] Input: adc-joystick: Handle inverted axes
In-Reply-To: <20240111220333.66060-1-macroalpha82@gmail.com>
References: <20240111220333.66060-1-macroalpha82@gmail.com>
Message-ID: <e2ca902be5796d1222bc7460911f499f@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: contact@artur-rojek.eu

Hi Chris,

some comments inline.

On 2024-01-11 23:03, Chris Morgan wrote:
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
> Changes since V1:
>  - Moved proposed helper for inversion from input stack to adc-joystick
>    driver.
The changes summary should go after the "---" separator, otherwise it
ends up in the commit description.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/joystick/adc-joystick.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/adc-joystick.c
> b/drivers/input/joystick/adc-joystick.c
> index c0deff5d4282..46197ebd3564 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -18,6 +18,7 @@ struct adc_joystick_axis {
>  	s32 range[2];
>  	s32 fuzz;
>  	s32 flat;
> +	bool inverted;
>  };
> 
>  struct adc_joystick {
> @@ -29,6 +30,14 @@ struct adc_joystick {
>  	bool polled;
>  };
> 
> +static int adc_joystick_invert(struct input_dev *dev, unsigned int
> axis, int val)
As the parameter list exceeds 80 characters, can you move "int val" into
a second line?
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
> @@ -38,6 +47,8 @@ static void adc_joystick_poll(struct input_dev 
> *input)
>  		ret = iio_read_channel_raw(&joy->chans[i], &val);
>  		if (ret < 0)
>  			return;
> +		if (joy->axes[i].inverted)
> +			val = adc_joystick_invert(input, i, val);
>  		input_report_abs(input, joy->axes[i].code, val);
>  	}
>  	input_sync(input);
> @@ -86,6 +97,8 @@ static int adc_joystick_handle(const void *data,
> void *private)
>  			val = sign_extend32(val, msb);
>  		else
>  			val &= GENMASK(msb, 0);
> +		if (joy->axes[i].inverted)
> +			val = adc_joystick_invert(joy->input, i, val);
>  		input_report_abs(joy->input, joy->axes[i].code, val);
>  	}
> 
> @@ -168,11 +181,17 @@ static int adc_joystick_set_axes(struct device
> *dev, struct adc_joystick *joy)
>  			goto err_fwnode_put;
>  		}
> 
> +		if (axes[i].range[0] > axes[i].range[1]) {
> +			dev_dbg(dev, "abs-axis %d inverted\n", i);
There is no "abs-axis" property. Make it "Axis %d inverted\n" instead.
> +			axes[i].inverted = 1;
Turn this into an explicit "true", as its a bool.

With all above nits fixed:
Acked-by: Artur Rojek <contact@artur-rojek.eu>

Cheers,
Artur

> +		}
> +
>  		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
>  		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
> 
>  		input_set_abs_params(joy->input, axes[i].code,
> -				     axes[i].range[0], axes[i].range[1],
> +				     min_array(axes[i].range, 2),
> +				     max_array(axes[i].range, 2),
>  				     axes[i].fuzz, axes[i].flat);
>  		input_set_capability(joy->input, EV_ABS, axes[i].code);
>  	}



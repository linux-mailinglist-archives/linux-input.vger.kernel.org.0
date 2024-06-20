Return-Path: <linux-input+bounces-4519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EC91142B
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 23:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C38B11F23070
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 21:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BB0139CE5;
	Thu, 20 Jun 2024 21:13:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABAD7C6EB;
	Thu, 20 Jun 2024 21:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918013; cv=none; b=Fi8ioAiVfqRbVPtQYS6qCFqhA0QZ22y+sXDwyj7v4ERXzmvWHTXlkoLriYyk9qDa3DYhm2CQs0quWovjLJsH2fbnBYTvM5XeXKdOMcT1kx8abwYvjnojdZDCByKqnvDxRoWrA+MdKr4p+/nozE4TYbn4Aa5v4ptw0V7IjKTC9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918013; c=relaxed/simple;
	bh=Dp2GZavLhHcBZK10vk+hzuD37zn4qR0z/2JselQ9tPA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FjTgzoiwkaCm9R+zjPjI7GrckDrwRZcF1yRRh160jzKvCnv5cTUPzCo+6i9LWlSor4IcaoGWhP0XNerOf+o2yf5IfM3NmWAs+t1s/U+sd2UuxUojAIeDtlAWEyl5S9xpdBgE1qBYgKXVWM6DsAwuSxREzFiOe6bAMxF/o3lOBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu; spf=pass smtp.mailfrom=artur-rojek.eu; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artur-rojek.eu
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8BAC60003;
	Thu, 20 Jun 2024 21:13:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 23:13:27 +0200
From: Artur Rojek <contact@artur-rojek.eu>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: adc-joystick - move axes data into the main
 structure
In-Reply-To: <ZmkrgTlxNwm_oHxv@google.com>
References: <ZmkrgTlxNwm_oHxv@google.com>
Message-ID: <af45d1dd82b6abf5ec3633fdef5093d2@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: contact@artur-rojek.eu

Hi Dmitry,

On 2024-06-12 07:00, Dmitry Torokhov wrote:
> There is no need to allocate axes information separately from the main
> joystick structure so let's fold the allocation and also drop members
> (such as range, flat and fuzz) that are only used during initialization
> of the device.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v2:
> 
> - fixed issue with uninitialized "axes" in adc_joystick_set_axes()
>   pointed out by Dan Carpenter
> - fixed issue with checking wrong variable in adc_joystick_probe()
>   pointed out by Dan Carpenter
> 
>  drivers/input/joystick/adc-joystick.c | 113 ++++++++++++++------------
>  1 file changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/input/joystick/adc-joystick.c 
> b/drivers/input/joystick/adc-joystick.c
> index 916e78e4dc9f..1e30cbcd8c61 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -15,19 +15,15 @@
> 
>  struct adc_joystick_axis {
>  	u32 code;
> -	s32 range[2];
> -	s32 fuzz;
> -	s32 flat;
>  	bool inverted;
>  };
> 
>  struct adc_joystick {
>  	struct input_dev *input;
>  	struct iio_cb_buffer *buffer;
> -	struct adc_joystick_axis *axes;
>  	struct iio_channel *chans;
> -	int num_chans;
> -	bool polled;
> +	unsigned int num_chans;
> +	struct adc_joystick_axis axes[] __counted_by(num_chans);
>  };
> 
>  static int adc_joystick_invert(struct input_dev *dev,
> @@ -135,9 +131,11 @@ static void adc_joystick_cleanup(void *data)
> 
>  static int adc_joystick_set_axes(struct device *dev, struct 
> adc_joystick *joy)
>  {
> -	struct adc_joystick_axis *axes;
> +	struct adc_joystick_axis *axes = joy->axes;
>  	struct fwnode_handle *child;
> -	int num_axes, error, i;
> +	s32 range[2], fuzz, flat;
> +	unsigned int num_axes;
> +	int error, i;
> 
>  	num_axes = device_get_child_node_count(dev);
>  	if (!num_axes) {
> @@ -151,10 +149,6 @@ static int adc_joystick_set_axes(struct device 
> *dev, struct adc_joystick *joy)
>  		return -EINVAL;
>  	}
> 
> -	axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
> -	if (!axes)
> -		return -ENOMEM;
> -
>  	device_for_each_child_node(dev, child) {
>  		error = fwnode_property_read_u32(child, "reg", &i);
>  		if (error) {
> @@ -176,29 +170,25 @@ static int adc_joystick_set_axes(struct device 
> *dev, struct adc_joystick *joy)
>  		}
> 
>  		error = fwnode_property_read_u32_array(child, "abs-range",
> -						       axes[i].range, 2);
> +						       range, 2);
>  		if (error) {
>  			dev_err(dev, "abs-range invalid or missing\n");
>  			goto err_fwnode_put;
>  		}
> 
> -		if (axes[i].range[0] > axes[i].range[1]) {
> +		if (range[0] > range[1]) {
>  			dev_dbg(dev, "abs-axis %d inverted\n", i);
>  			axes[i].inverted = true;
> -			swap(axes[i].range[0], axes[i].range[1]);
> +			swap(range[0], range[1]);
>  		}
> 
> -		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
> -		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
> +		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
> +		fwnode_property_read_u32(child, "abs-flat", &flat);
> 
>  		input_set_abs_params(joy->input, axes[i].code,
> -				     axes[i].range[0], axes[i].range[1],
> -				     axes[i].fuzz, axes[i].flat);
> -		input_set_capability(joy->input, EV_ABS, axes[i].code);
> +				     range[0], range[1], fuzz, flat);
>  	}
> 
> -	joy->axes = axes;
> -
>  	return 0;
> 
>  err_fwnode_put:
> @@ -206,23 +196,49 @@ static int adc_joystick_set_axes(struct device 
> *dev, struct adc_joystick *joy)
>  	return error;
>  }
> 
> +
> +/*
> + * Count how many channels we got. NULL terminated.
> + * Do not check the storage size if using polling.
> + */
> +static int adc_joystick_count_channels(struct device *dev,
> +				       const struct iio_channel *chans,
> +				       bool polled,
> +				       unsigned int *num_chans)

You forgot to assign *num_chans = i; at the end of this function,
which leaves it uninitialized in the caller context.

> +{
> +	int bits;
> +	int i;
> +

Let's move that "NULL terminated." comment here, since it's about the
for loop.

With the above comments addressed:
Acked-by: Artur Rojek <contact@artur-rojek.eu>

Cheers,
Artur

> +	for (i = 0; chans[i].indio_dev; i++) {
> +		if (polled)
> +			continue;
> +		bits = chans[i].channel->scan_type.storagebits;
> +		if (!bits || bits > 16) {
> +			dev_err(dev, "Unsupported channel storage size\n");
> +			return -EINVAL;
> +		}
> +		if (bits != chans[0].channel->scan_type.storagebits) {
> +			dev_err(dev, "Channels must have equal storage size\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return i;
> +}
> +
>  static int adc_joystick_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct iio_channel *chans;
>  	struct adc_joystick *joy;
>  	struct input_dev *input;
> +	unsigned int poll_interval = 0;
> +	unsigned int num_chans;
>  	int error;
> -	int bits;
> -	int i;
> -	unsigned int poll_interval;
> -
> -	joy = devm_kzalloc(dev, sizeof(*joy), GFP_KERNEL);
> -	if (!joy)
> -		return -ENOMEM;
> 
> -	joy->chans = devm_iio_channel_get_all(dev);
> -	if (IS_ERR(joy->chans)) {
> -		error = PTR_ERR(joy->chans);
> +	chans = devm_iio_channel_get_all(dev);
> +	error = PTR_ERR_OR_ZERO(chans);
> +	if (error) {
>  		if (error != -EPROBE_DEFER)
>  			dev_err(dev, "Unable to get IIO channels");
>  		return error;
> @@ -236,28 +252,19 @@ static int adc_joystick_probe(struct 
> platform_device *pdev)
>  	} else if (poll_interval == 0) {
>  		dev_err(dev, "Unable to get poll-interval\n");
>  		return -EINVAL;
> -	} else {
> -		joy->polled = true;
>  	}
> 
> -	/*
> -	 * Count how many channels we got. NULL terminated.
> -	 * Do not check the storage size if using polling.
> -	 */
> -	for (i = 0; joy->chans[i].indio_dev; i++) {
> -		if (joy->polled)
> -			continue;
> -		bits = joy->chans[i].channel->scan_type.storagebits;
> -		if (!bits || bits > 16) {
> -			dev_err(dev, "Unsupported channel storage size\n");
> -			return -EINVAL;
> -		}
> -		if (bits != joy->chans[0].channel->scan_type.storagebits) {
> -			dev_err(dev, "Channels must have equal storage size\n");
> -			return -EINVAL;
> -		}
> -	}
> -	joy->num_chans = i;
> +	error = adc_joystick_count_channels(dev, chans, poll_interval != 0,
> +					    &num_chans);
> +	if (error)
> +		return error;
> +
> +	joy = devm_kzalloc(dev, struct_size(joy, axes, num_chans), 
> GFP_KERNEL);
> +	if (!joy)
> +		return -ENOMEM;
> +
> +	joy->chans = chans;
> +	joy->num_chans = num_chans;
> 
>  	input = devm_input_allocate_device(dev);
>  	if (!input) {
> @@ -273,7 +280,7 @@ static int adc_joystick_probe(struct 
> platform_device *pdev)
>  	if (error)
>  		return error;
> 
> -	if (joy->polled) {
> +	if (poll_interval != 0) {
>  		input_setup_polling(input, adc_joystick_poll);
>  		input_set_poll_interval(input, poll_interval);
>  	} else {
> --
> 2.45.2.505.gda0bf45e8d-goog



Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86892696D6
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 22:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgINUlc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 16:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgINUla (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 16:41:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC36C06174A;
        Mon, 14 Sep 2020 13:41:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so761916pgl.2;
        Mon, 14 Sep 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SnLXhSeq/01CpKCN4DhWTVGLtMtNE5gQHMAycyDmEQo=;
        b=UJ7isTzrhdJj+tcHZEHaeTTXB9eM5/sLTRQGCcjU05DfzbPXCIRZEB9FBzeUUXb36k
         zXD66hDu4HVREmxSwOtgv64MgK/wGUnd+/MyQpQfpJ0B2VUlY5jnhPKmgnZbO5nLngtR
         PBEoNCjTfbnOKnQJu/8PZGdOScHMMd6FG2CaVXrbzXnEkY1NLC2/+aJyCP3o5dFxKwIA
         9Yvd1hG4W3X51CRHwRLJOOyq2QAcX2KWsexVGPPQafnvRdQ0EyEuW9n60K109Hcm6NTr
         mj/Y07HGxAIcbGMpVOmnf7Qlfn5qxK1ZOqMUhHOaLB+2v1ysaNReNNyusV5Iucd3vwh4
         bq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SnLXhSeq/01CpKCN4DhWTVGLtMtNE5gQHMAycyDmEQo=;
        b=jVk9oxZOcIuK22cMzCdVmgdlTTTUMb/gQWNZRGrow2jzfJxp2607EJBTlRUzDJ/8hr
         228c0UaN0ZKtZWnZVxeY9C7qe9FXQjx0/3vAg9mBchhq6hPMmesTyNRq+u72C+ek1W9h
         Fg/jHjYp21MVVlBouNkGxYJ1lqScNmiRgXA3Bl8mfk+sqt8ad+MHKwAFSpIxoe6J40/Q
         Ue3S+69A0EvRUnO6Nfi9E1ssyooQwPQ9nRUpFl8Uq5y/Xz1p4tRtysHTTcbs+bvrtHR9
         +kC8FrMkel4bqubOXQIgZYFAiVc6z2VPCHadvBgCnNoyerDwzpD7+oKZFQQgZUHbuSBk
         cefw==
X-Gm-Message-State: AOAM5337qcUN6SAmcWgpaY3dHpyP0HDBmdJ6CLfh7E4FvhXo1w1GlLT+
        UJrRUhXq9nJIOi9YRGTT8c0=
X-Google-Smtp-Source: ABdhPJzRyCGDsECBb9M9dKUm6CuMQPZWvoiVoEVyVq5dnkJ4bBQ5GvO13wNIyDpV4apj03pDHwajuw==
X-Received: by 2002:a62:8c86:: with SMTP id m128mr14875222pfd.111.1600116089903;
        Mon, 14 Sep 2020 13:41:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a24sm10184756pju.25.2020.09.14.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:41:29 -0700 (PDT)
Date:   Mon, 14 Sep 2020 13:41:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] input: joystick: Add ADC attached joystick driver.
Message-ID: <20200914204126.GB1681290@dtor-ws>
References: <20200905163403.64390-1-contact@artur-rojek.eu>
 <20200905163403.64390-2-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905163403.64390-2-contact@artur-rojek.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Artur,

On Sat, Sep 05, 2020 at 06:34:03PM +0200, Artur Rojek wrote:
> Add a driver for joystick devices connected to ADC controllers
> supporting the Industrial I/O subsystem.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes:
>     v8: - respect scan index when reading channel data,
>         - solve sparse warnings related to *_to_cpu calls,
>         - simplify channel count logic,
>         - drop the redundant comma from adc_joystick_of_match[]
>     
>     v9: - use `dev_err_probe`,
>         - add missing CR to error messages,
>         - remove unnecessary line breaks in `adc_joystick_set_axes`,
>         - remove redundant error code print from `adc_joystick_probe`,
>         - no need to pass `dev.parent` to `dev_err` in `adc_joystick_open`,
>         - print error code in `adc_joystick_open`
> 
> Notes:
> 	Dmitry, Jonathan, because of the above changes, I dropped your
>         Acked-by.

So I am still happy with the driver, just a bit of bikeshedding since it
looks like it can go through my tree now:

> +
> +	device_for_each_child_node(dev, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &i);
> +		if (ret) {

Call this "error"?

> +			dev_err(dev, "reg invalid or missing\n");
> +			goto err;
> +		}
> +
> +		if (i >= num_axes) {
> +			ret = -EINVAL;
> +			dev_err(dev, "No matching axis for reg %d\n", i);
> +			goto err;
> +		}
> +
> +		ret = fwnode_property_read_u32(child, "linux,code",
> +					     &axes[i].code);
> +		if (ret) {
> +			dev_err(dev, "linux,code invalid or missing\n");
> +			goto err;
> +		}
> +
> +		ret = fwnode_property_read_u32_array(child, "abs-range",
> +						   axes[i].range, 2);
> +		if (ret) {
> +			dev_err(dev, "abs-range invalid or missing\n");
> +			goto err;
> +		}
> +
> +		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
> +		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
> +
> +		input_set_abs_params(joy->input, axes[i].code,
> +				     axes[i].range[0], axes[i].range[1],
> +				     axes[i].fuzz, axes[i].flat);
> +		input_set_capability(joy->input, EV_ABS, axes[i].code);
> +	}
> +
> +	joy->axes = axes;
> +
> +	return 0;
> +
> +err:
> +	fwnode_handle_put(child);
> +	return ret;

"return error;"

In general, I prefer "error" for the variable name when it returned in
error paths only, and "ret", "retval", etc. when it is used in both
error and success paths.

> +}
> +
> +static int adc_joystick_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct adc_joystick *joy;
> +	struct input_dev *input;
> +	int bits, ret, i;
> +
> +	joy = devm_kzalloc(dev, sizeof(*joy), GFP_KERNEL);
> +	if (!joy)
> +		return -ENOMEM;
> +
> +	joy->chans = devm_iio_channel_get_all(dev);
> +	if (IS_ERR(joy->chans)) {
> +		return dev_err_probe(dev, PTR_ERR(joy->chans),
> +				     "Unable to get IIO channels\n");

I am not a fan of this API (dev_err_probe), so can we not use it just
yet? I believe Rob is looking into pushing this into resources
providers, at least when they have device for which resources are being
acquired.

> +	}
> +
> +	/* Count how many channels we got. NULL terminated. */
> +	for (i = 0; joy->chans[i].indio_dev; ++i) {
> +		bits = joy->chans[i].channel->scan_type.storagebits;
> +		if (!bits || (bits > 16)) {

I do not think we need parenthesis around second part of the condition.

Hmm, why don't we have "is_in_range(val, lower, upper)" yet?

Thanks.

-- 
Dmitry

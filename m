Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBCE282E39
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 01:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgJDXGe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Oct 2020 19:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgJDXGd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Oct 2020 19:06:33 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4803C0613CE;
        Sun,  4 Oct 2020 16:06:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x16so4666735pgj.3;
        Sun, 04 Oct 2020 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqkzjSyGfGTcsIQ7zwTfeR414vzREt+Zah68CkthEDs=;
        b=YER2KOuzOHhYoX2b9+4UNg35lVg+c7926dTtQFKS9m4Nl46gtMyXzyLtkQZ/Iu2NGs
         QbWCqc3ECHqk1vkwJQhEa4Fgj0pd294Etp3qo9HMdT3/oT4OkqjyzQ5E2jrsIWWHOz80
         Y8tZa07f9ssdv3uHuZEzaE+PXVJq+SnJVlJQVCP9h2fWJ9lzk9rjRnt6PDU4rm/oJwwP
         Q5KsHFzs5HmHe8uIKf1JU6yYjm8ngFy6PrVoSauQm+NYpmtKJjxmztyeKNu8KTr9+Ctq
         gjpu2FjKPTV7vp2XnGAyY+JXaCPHIEFPVhSzgfOB4bwWF6yum7ul1iH14o5uwxCW4ZQ5
         Fxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqkzjSyGfGTcsIQ7zwTfeR414vzREt+Zah68CkthEDs=;
        b=hLNjNKeLG5iANh1qIG39Va2gTsCV8X2gRN0GFnFP3ym/lbgPghQYw+JTQK4Is//egj
         8izfhpuV2SJfRx1I73Vsiw/sdW4V/7yfzdXiZUh6coYH789ajAyMAh6XqQJRQTCgYkz4
         84mxZ7l/eNRqEtDUBxgqWi/5qSYwjCzClxGN8xXy+0debpsuwz/ywKh8pR0rz+yVQRFo
         991tnsf5o1UCJuHJE6Zoq6uwI8sUV7Uii5qkfMXjm8dwX942dhju0H9Ai5gaAb8L2pCW
         WxN8QsBbwBfEJBC41S0kOpHR7/Qk/QOuBYXcaIjUL/TO8WW2LV7skwSdOl0QxNKf6VoU
         P8Yw==
X-Gm-Message-State: AOAM531Q5IGOkfr8m0vN0o1zn5a7h9G14HkqXssHUufmMZPqVQCG/Wl9
        MiZWgzGMHbbyJNZdxw5keDY=
X-Google-Smtp-Source: ABdhPJyJooyqAL18sfR/3VeOlkGcs+dgcEuYO2hSdLJDO3e8QGL76aJ5IP84+Lpy1WxJnKPLC1GvNg==
X-Received: by 2002:a63:c709:: with SMTP id n9mr11552952pgg.245.1601852793023;
        Sun, 04 Oct 2020 16:06:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n128sm8615734pga.37.2020.10.04.16.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 16:06:32 -0700 (PDT)
Date:   Sun, 4 Oct 2020 16:06:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     michael.srba@seznam.cz
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Paul Burton <paulburton@kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 1/2] Input: add zinitix touchscreen driver
Message-ID: <20201004230629.GA1009802@dtor-ws>
References: <20201001122949.16846-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001122949.16846-1-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michael,

On Thu, Oct 01, 2020 at 02:29:48PM +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Add support for the bt541 touchscreen IC from zinitix, loosely based on
> downstream driver. The driver currently supports multitouch (5 touch points).
> The bt541 seems to support touch keys, but the support was not added because
> that functionality is not being utilized by the touchscreen used for testing.
> Based on the similartities between downstream drivers, it seems likely that
> other similar touchscreen ICs can be supported with this driver in the future.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  changes in v2: applied fixes per recommendation, added support for suspend/resume handling
>  changes in v3: added support for working in different touch point report modes 
>  		(modes 1 and 2 are now supported). mode 2 seems to work just fine
>  		on Samsung Galaxy A3 (2015), and also works on Samsung Galaxy S4 
>  		Mini Value Edition (where mode 1 doesn't seem to work because 
>  		of different firmware version). It is expected that other fw 
>  		versions, and models other than bt541, may have either mode broken
>  		(vendor doesn't use it -> they don't care) .
>  changes in v4: - removed mode 1 for now to simplify the code and improve it's chances 
>  		to get accepted.
>  		- added runtime pm to save power while not using the ts
>  		- refactored i2c helper functions
> 		-  
>  changes in v5: - send the actual intended V4 (sorry)
>  changes in v6: - remove unused include
>  		- other fixes per reccomendation

Applied with some edits:

> +
> +static int zinitix_read_data(struct i2c_client *client, u16 reg, u8 *values, size_t length)
> +{
> +	int ret;
> +	__le16 reg_le = cpu_to_le16(reg);
> +

Added a comment that single i2c_transfer will not work.

> +	ret = i2c_master_send(client, (u8 *)&reg_le, sizeof(reg_le));
> +	if (ret != sizeof(reg_le))
> +		return ret < 0 ? ret : -EIO;
> +
> +	ret = i2c_master_recv(client, values, length);
> +	if (ret != length)
> +		return ret;

Changed to:

		return ret < 0 ? ret : -EIO;

> +	error = zinitix_write_u16(client, BT541_X_RESOLUTION, (u16)bt541->prop.max_x);

No need for explicit cast as far as I can see, removed.

> +
> +	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
> +		if (!(touch_event.point_coord[i].sub_status & SUB_BIT_EXIST))
> +			continue;
> +
> +		input_mt_slot(bt541->input_dev, i);
> +		input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> +		touchscreen_report_pos(bt541->input_dev, &bt541->prop,
> +				       le16_to_cpu(touch_event.point_coord[i].x),
> +				       le16_to_cpu(touch_event.point_coord[i].y), true);
> +		input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR,
> +				 touch_event.point_coord[i].width);

Factored out into a helper.

> +
> +	error = input_register_device(bt541->input_dev);
> +	if (error) {
> +		dev_err(&bt541->client->dev,
> +			"Failed to register input device: %d", error);
> +		return error;
> +	}
> +
> +	input_set_drvdata(bt541->input_dev, bt541);

This is too late, as open and close that use input_get_drvdata() can be
called before input_register_device() returns. Moved earlier.

> +
> +	return 0;
> +}
> +
> +static int zinitix_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)

Dropped the last argument and used as probe_new() callback.

> +
> +static int __maybe_unused zinitix_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
> +
> +	/* Release all fingers */
> +	input_mt_sync_frame(bt541->input_dev);
> +	input_sync(bt541->input_dev);

As I mentioned, if we need this, this should be done in input core and
not in each individual driver.

I dropped this chunk for now.

Thanks.

-- 
Dmitry

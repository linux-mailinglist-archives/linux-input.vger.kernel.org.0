Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39023FBDD5
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 23:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236174AbhH3VCq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 17:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhH3VCq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 17:02:46 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19606C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:01:52 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id c17so14692573pgc.0
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OObB1Wl1wtj2xez9Ar+6hMr6LesguRAfztnoGsny5r8=;
        b=RB+rcwxUJXFdg/kOWKf1+VAxnEBjJdD409Fdwaf1X6Q44gTlu1UA9PwHcKU3tm8Ort
         9m3eqY8A1qCoDzVMraKoH9gXTbZvymT8fO6CC6rwugpQ8jjrlKUOImOSAD906+RgcEuV
         6GSt1L45NZGrcxDfnawJKiujSoygy0y3MKj8f8gbVfG2fP+Sw1/XAJvWuDo4QfxChnXO
         1xJg+hGwtchaLcbrqTX3NfILEmugxBIpb21b1JByojztWjyZOtDYSxV1Zjzkoa9jskIq
         Xfh9GxyyCtoO32x+zneHGWRssOv1o5A4E/XhDgcMkNIvv5pw9VPunMuPo1E79J807Lqd
         RKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OObB1Wl1wtj2xez9Ar+6hMr6LesguRAfztnoGsny5r8=;
        b=aN1abPwLpn8d2wDE8b3LZQ4FArtLC7c/JTrka8BcwbZ9Yljg+083WzfhUQ6HSPeNQM
         a1HDrvzpNeO2bCpW80vUO7iQWpm0GvGP8HOzHNsYJzZ9ERnpyUiIhgluldpolDNm3XBk
         N9cauYbtztX0UQHDAqOgYr8NbFRzG3Wel3aCDfs6zp7+7XjZA4QYfuxRbJXNOrF3eojR
         UG2QK4ALKKbth7GaFp+kFK6gOvQcfgxChFKJ1rhdoTB59lrk7l4WfBz6dr474mjEp2Gf
         i9SGhn995c88YW9SDkYbH6ppCouh94EpO9XzAf5fYCmcrfCBUNotgN0mZNdMl+QlDK9s
         Pp0A==
X-Gm-Message-State: AOAM530Axb1K3pgXYFi2avd0C5UHdzDwtJh7iItWtnnG5Eg3pgxITWXk
        HldkxS0IANmTZ5+s1EvU8/s=
X-Google-Smtp-Source: ABdhPJx/dE+DoWntrkEZA3jMM7H8OQ4nCPL6R3DmFryL684MLQ8YhQsPvkegMqTpxHcwNat7ha7eyg==
X-Received: by 2002:a65:6553:: with SMTP id a19mr23609025pgw.8.1630357311490;
        Mon, 30 Aug 2021 14:01:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id j123sm8256472pgc.77.2021.08.30.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 14:01:50 -0700 (PDT)
Date:   Mon, 30 Aug 2021 14:01:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 2/3] Input: ili210x - export ili251x version details
 via sysfs
Message-ID: <YS1HPKNZMP1XofM0@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827211258.318618-2-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 27, 2021 at 11:12:57PM +0200, Marek Vasut wrote:
> The ili251x firmware protocol permits readout of firmware version,
> protocol version, mcu version and current mode (application, boot
> loader, forced update). These information are useful when updating
> the firmware on the il251x, e.g. to avoid updating the same firmware
> into the device multiple times. The locking is now necessary to avoid
> races between interrupt handler and the sysfs readouts.
> 
> Note that the protocol differs considerably between the ili2xxx devices,
> this patch therefore implements this functionality only for ili251x that
> I can test.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
> V2: No change
> 
> NOTE: Regarding checkpatch warnings, Consider renaming function(s)
>       'ili251x_firmware_version_show' to 'firmware_version_show',
>       I considered it and decided against it, because grepping for
>       ili251x in debug symbols gives far more accurate results than
>       grepping for firmware_version.

Yep, I completely agree here. I wish checkpatch did not complain about
this.

> ---
>  drivers/input/touchscreen/ili210x.c | 130 +++++++++++++++++++++++++++-
>  1 file changed, 127 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index c46553ecabe6..7790ad000dc1 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -22,6 +22,12 @@
>  /* Touchscreen commands */
>  #define REG_TOUCHDATA		0x10
>  #define REG_PANEL_INFO		0x20
> +#define REG_FIRMWARE_VERSION	0x40
> +#define REG_PROTOCOL_VERSION	0x42
> +#define REG_KERNEL_VERSION	0x61
> +#define REG_IC_MODE		0xc0
> +#define REG_IC_MODE_AP		0x5a
> +#define REG_IC_MODE_BL		0x55
>  #define REG_CALIBRATE		0xcc
>  
>  struct ili2xxx_chip {
> @@ -43,6 +49,7 @@ struct ili210x {
>  	struct input_dev *input;
>  	struct gpio_desc *reset_gpio;
>  	struct touchscreen_properties prop;
> +	struct mutex lock;
>  	const struct ili2xxx_chip *chip;
>  	bool stop;
>  };
> @@ -307,7 +314,9 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  	int error;
>  
>  	do {
> +		mutex_lock(&priv->lock);
>  		error = chip->get_touch_data(client, touchdata);
> +		mutex_unlock(&priv->lock);
>  		if (error) {
>  			dev_err(&client->dev,
>  				"Unable to get touch data: %d\n", error);
> @@ -351,6 +360,108 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>  	return 0;
>  }
>  
> +static ssize_t ili251x_firmware_version_show(struct device *dev,
> +					     struct device_attribute *attr,
> +					     char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	u8 fw[8];
> +	int ret;
> +
> +	/* Get firmware version */
> +	mutex_lock(&priv->lock);
> +	ret = priv->chip->read_reg(client, REG_FIRMWARE_VERSION,
> +				   &fw, sizeof(fw));
> +	mutex_unlock(&priv->lock);

Could we query firmware version and mode at probe time (and also later
after firmware update attempt) so that we do not need to introduce
locking against interrupt handler?

> +
> +	if (ret)
> +		return ret;
> +
> +	if (!ret) {
> +		ret = scnprintf(buf, PAGE_SIZE,
> +				"%02x%02x.%02x%02x.%02x%02x.%02x%02x\n",
> +				fw[0], fw[1], fw[2], fw[3],
> +				fw[4], fw[5], fw[6], fw[7]);
> +	}

I think there is sysfs_emit() that is preferred now.

Thanks.

-- 
Dmitry

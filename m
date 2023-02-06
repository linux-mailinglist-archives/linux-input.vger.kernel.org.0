Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6362E68CA69
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 00:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjBFXSe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 18:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBFXSe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 18:18:34 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ECB24103;
        Mon,  6 Feb 2023 15:18:31 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 203so9549626pfx.6;
        Mon, 06 Feb 2023 15:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLxvOGgNEoCuiGYaHHfxbpImsa88CZegxBYmR02yYcM=;
        b=UabTdoB75uvKFsaNx3I+PJfk2fP6++VusYyExYBIX9gM7j9ZCtnneqRDN1hgGYW9Kj
         yeBvgYV3w+RsN45beypcF0eXgOD/ogXPYhSUl5YVX0t4AhVgcYynKX33anRA+1g3jAfI
         5uSpnAc1V9KJwkRbwPfd6Pkdl+d2nyhljnE7Gr7zPwGxfFUS5ijzOAhdxjR/JB0E0XCI
         OHiu2DkPyaqEto7bMcqwgniysaaIZJDFxfBTbBR9WYJ1MNCAVO+SBIywVckP9wqCxexa
         vrX3ohoiTSW1ymfqb+1kWbpL3ovsG4vGUbcPQuKUoN4dcUTdh6o08SiCCwsfm89mYQ77
         ydgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLxvOGgNEoCuiGYaHHfxbpImsa88CZegxBYmR02yYcM=;
        b=a5py0eorHL8i/vS5UNbh4rQOGlPBjJWMg5CaRS0qKSXYI2MOUtiXqSFjBVNBqt/9nm
         lvsOUp6E/C1USwanK6r/TRlmuYVaWejvjwUtcapJaJp7sLXE+6Wji/D6lDB9ulPoZzd2
         HcEo2mkRMYPjTUaajDLrhFXN27bXa1ht1HnUMIDnEROtQs1CmO5ii5GhzK6YBsZkF16E
         jdLlLFqbnISqNjuaRkaMAF/Z6dxuMw2EPWQRo05vXBQpRwJ25Z2+xR1zTRdZPh8g6yJj
         JDFG7ObNqNrekBwfhF4uSzdFXDesvWRwcSVTNjCldyfdQgXsXPa9IZ9xp0l4t2v/Kbhh
         tpIw==
X-Gm-Message-State: AO0yUKXOPAQCwJnpm1lYOtV6MVqTehRnrAAt5tgUfqq+qgBw9XEYdJEv
        YwqgGNY5uN20Lra79W3KGU8=
X-Google-Smtp-Source: AK7set9U7k6TIW7e9NB67EDPX4rf/OV3lgUFGN7j9bNRaKFylx01p9L4YpqxfWi5SURMHN7x/8X/sQ==
X-Received: by 2002:a62:1c42:0:b0:593:b0f7:8734 with SMTP id c63-20020a621c42000000b00593b0f78734mr1094142pfc.20.1675725510502;
        Mon, 06 Feb 2023 15:18:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:991d:5689:64f0:6f3c])
        by smtp.gmail.com with ESMTPSA id t7-20020aa79387000000b0058d9623e7f1sm7663623pfe.73.2023.02.06.15.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 15:18:29 -0800 (PST)
Date:   Mon, 6 Feb 2023 15:18:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 4/4] HID: cp2112: Devicetree Support
Message-ID: <Y+GKwhkW29Bk26S+@google.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-5-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206135016.6737-5-kaehndan@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 06, 2023 at 07:50:16AM -0600, Danny Kaehn wrote:
> Bind i2c and gpio interfaces to subnodes with names
> "i2c" and "gpio" if they exist, respectively. This
> allows the gpio and i2c controllers to be described
> in DT as usual. Additionally, support configuring the
> i2c bus speed from the clock-frequency property.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  drivers/hid/hid-cp2112.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> index 27cadadda7c9..aa634accdfb0 100644
> --- a/drivers/hid/hid-cp2112.c
> +++ b/drivers/hid/hid-cp2112.c
> @@ -1234,6 +1234,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	u8 buf[3];
>  	struct cp2112_smbus_config_report config;
>  	struct gpio_irq_chip *girq;
> +	struct i2c_timings timings;
>  	int ret;
>  
>  	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
> @@ -1292,6 +1293,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		goto err_power_normal;
>  	}
>  
> +	dev->adap.dev.of_node   = of_get_child_by_name(hdev->dev.of_node, "i2c");
> +	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
> +
> +	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
>  	config.retry_time = cpu_to_be16(1);
>  
>  	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),
> @@ -1300,7 +1305,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		hid_err(hdev, "error setting SMBus config\n");
>  		if (ret >= 0)
>  			ret = -EIO;
> -		goto err_power_normal;
> +		goto err_free_i2c_of;
>  	}
>  
>  	hid_set_drvdata(hdev, (void *)dev);
> @@ -1322,7 +1327,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  
>  	if (ret) {
>  		hid_err(hdev, "error registering i2c adapter\n");
> -		goto err_power_normal;
> +		goto err_free_i2c_of;
>  	}
>  
>  	hid_dbg(hdev, "adapter registered\n");
> @@ -1336,6 +1341,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	dev->gc.ngpio			= 8;
>  	dev->gc.can_sleep		= 1;
>  	dev->gc.parent			= &hdev->dev;
> +#if IS_ENABLED(CONFIG_OF_GPIO)
> +	dev->gc.of_node			= of_get_child_by_name(hdev->dev.of_node, "gpio");


I believe Andy is actively trying to get rid of of_node from GPIO chips.
And in general, we should be using fwnode and generic device properties
as much as possible.

> +#endif
>  
>  	dev->irq.name = "cp2112-gpio";
>  	dev->irq.irq_startup = cp2112_gpio_irq_startup;
> @@ -1376,7 +1384,12 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  err_gpiochip_remove:
>  	gpiochip_remove(&dev->gc);
>  err_free_i2c:
> +#if IS_ENABLED(CONFIG_OF_GPIO)
> +	of_node_put(dev->gc.of_node);
> +#endif
>  	i2c_del_adapter(&dev->adap);
> +err_free_i2c_of:
> +	of_node_put(dev->adap.dev.of_node);
>  err_power_normal:
>  	hid_hw_power(hdev, PM_HINT_NORMAL);
>  err_hid_close:
> @@ -1391,6 +1404,11 @@ static void cp2112_remove(struct hid_device *hdev)
>  	struct cp2112_device *dev = hid_get_drvdata(hdev);
>  	int i;
>  
> +	of_node_put(dev->adap.dev.of_node);
> +#if IS_ENABLED(CONFIG_OF_GPIO)
> +	of_node_put(dev->gc.of_node);
> +#endif
> +
>  	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
>  	i2c_del_adapter(&dev->adap);
>  
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54A68C37A
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 17:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjBFQjQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 11:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBFQjQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 11:39:16 -0500
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0744740D6;
        Mon,  6 Feb 2023 08:39:15 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-16a291b16bfso6242679fac.7;
        Mon, 06 Feb 2023 08:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb5iUiRnYsene0Rr60Cqy6xOkvMq+jDc+crILwxLxLE=;
        b=oUsUR7XN0CV956avc7qmR+NulOSjTYxLTtIOykxtNPal+qJARxmSxpBcAkuiB0xyQI
         4afG92xP6dbi3eyphG20vGtreaAjs/oHCLoY16aRWARCVP4yhnQdgADadJ4hOQHLzgER
         +eftk8NQ+RcDbOtyKGWJgEcnQ/RAApsb2x4HOK/jQ0AyO19p0EjS4WQ479it2w2+RPib
         2TrQds62IThr41illhnhu4RVLMY10Lx9KcU6O0DdA5rWPAinhCbfX+MwksCnuEHIVD0m
         iRfPR/Dwo5QLwi1AKLEdvDUbHTOj6ANlR9HAHuT2EnYQbyaeutoHdQc2dIhkp6rUUC+I
         8Ysw==
X-Gm-Message-State: AO0yUKU3SR1CiqUAu8qGmSU8FjfgJz9pSrVM+wgioO6RjknR4e/Ktyv2
        yg6N4LiCY8BeSXSCO8jnBQ==
X-Google-Smtp-Source: AK7set/p8RARu7IFSalOlwR7D6D30WrDigcPoTcxJnW+U63yMgha1SDnspGIcuqyjqwRa3l93vf/Ow==
X-Received: by 2002:a05:6870:a995:b0:16a:6c5f:e31d with SMTP id ep21-20020a056870a99500b0016a6c5fe31dmr352097oab.45.1675701554169;
        Mon, 06 Feb 2023 08:39:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a4-20020a056870618400b0014fc049fc0asm4288412oah.57.2023.02.06.08.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:39:13 -0800 (PST)
Received: (nullmailer pid 197958 invoked by uid 1000);
        Mon, 06 Feb 2023 16:39:12 -0000
Date:   Mon, 6 Feb 2023 10:39:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Danny Kaehn <kaehndan@gmail.com>, bartosz.golaszewski@linaro.org
Cc:     krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v3 4/4] HID: cp2112: Devicetree Support
Message-ID: <20230206163912.GA182582-robh@kernel.org>
References: <20230205145450.3396-1-kaehndan@gmail.com>
 <20230205145450.3396-5-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205145450.3396-5-kaehndan@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+Bartosz

On Sun, Feb 05, 2023 at 08:54:50AM -0600, Danny Kaehn wrote:
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
> +#endif

The scarcity of CONFIG_OF_GPIO ifdefs in the tree tells me this is 
wrong. I think you want to use the fwnode pointer instead. GPIO 
maintainers should review this.

Rob

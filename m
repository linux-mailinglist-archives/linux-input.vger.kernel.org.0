Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F01766209B
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbjAIIxF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbjAIIwd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:52:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8073186F8
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dvncnM1nWRMSvld9oaWAMDOO9HazaD0/X3LGbto83Ok=;
        b=TAER0d1us9PotsK26gdi+4twxwWaSfPRQu9YeZjaag/iJ8/X2QiPZYE+QbFlq8n2zVMofB
        PPykkdSm7krqpH3V+I3plQ5M+4fRUidVc2SzO+CjKg9cydQCYrcpjoheGA4toXo7PXLCXV
        JKbgdshgQTDQXSIDTxub+/D4MEUMER0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-anEXYM05MqiTJ88ETrYePw-1; Mon, 09 Jan 2023 03:44:44 -0500
X-MC-Unique: anEXYM05MqiTJ88ETrYePw-1
Received: by mail-ej1-f71.google.com with SMTP id sc9-20020a1709078a0900b0084c4e8dc14eso4915145ejc.4
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvncnM1nWRMSvld9oaWAMDOO9HazaD0/X3LGbto83Ok=;
        b=wksF10jNhK+p16OHa8Lo51Mjv7ZOaxUbuEJ/VCHsfs9nfOuhA4aMcW6ayMtN6n29GU
         DtNugNbzAjKTlP9A+4BAJjVlrHvf6m8Hy6L5gWdBfPtRmBpUsMTwe/yGz27p9jz/xRTf
         K9ctOftAgA+N3DbxjfTsLklg5JOe7OZ7mz84/IiEVdEpfPd3dZzU8x2dOaIfSkN5nlT9
         72kjRL75fRNFcxP0vGM8fBcksksnF5dNfoWUBPpMLix8b/Ka3V7lLaLa508KpqV307Zk
         bOreAdM4SNmQ+PMSZX/I+kV/srKOvaNfju7z3pZ/y59D3TzYQUfGlAuBMz0I7WmRvtGL
         H8lg==
X-Gm-Message-State: AFqh2kqbyRGr/RSWCpCLDO1KPIla6qs1ZAC3vocnI0ZCvQ5ad3X10I9l
        pvNichoCqbIBRSIX3BbyxAzzVOj+L6vxWly8+x4fFshT8hIVplYLjTiK+kITjE8BxgYvImASmRW
        5pAd6DHPdS8MuT7L3Dc4T/8A=
X-Received: by 2002:a17:907:6d97:b0:7c1:5ee1:4c56 with SMTP id sb23-20020a1709076d9700b007c15ee14c56mr69856939ejc.55.1673253883037;
        Mon, 09 Jan 2023 00:44:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuydUZVBXPSKer5CjviHU5asUnYxMWXjE38mlgJ5CYkyT9Y6IVPXQafqZexMFsN4j7s/S2gaA==
X-Received: by 2002:a17:907:6d97:b0:7c1:5ee1:4c56 with SMTP id sb23-20020a1709076d9700b007c15ee14c56mr69856928ejc.55.1673253882815;
        Mon, 09 Jan 2023 00:44:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b007ad69e9d34dsm3474103ejc.54.2023.01.09.00.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:44:42 -0800 (PST)
Message-ID: <ccf50f6d-e5f0-3810-040c-7c1dab9f5de2@redhat.com>
Date:   Mon, 9 Jan 2023 09:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 38/69] Input: chipone_icn8505 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-39-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-39-jic23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/2/23 19:18, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/chipone_icn8505.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
> index c421f4be2700..246bee0bee53 100644
> --- a/drivers/input/touchscreen/chipone_icn8505.c
> +++ b/drivers/input/touchscreen/chipone_icn8505.c
> @@ -460,7 +460,7 @@ static int icn8505_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int __maybe_unused icn8505_suspend(struct device *dev)
> +static int icn8505_suspend(struct device *dev)
>  {
>  	struct icn8505_data *icn8505 = i2c_get_clientdata(to_i2c_client(dev));
>  
> @@ -471,7 +471,7 @@ static int __maybe_unused icn8505_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused icn8505_resume(struct device *dev)
> +static int icn8505_resume(struct device *dev)
>  {
>  	struct icn8505_data *icn8505 = i2c_get_clientdata(to_i2c_client(dev));
>  	int error;
> @@ -484,7 +484,7 @@ static int __maybe_unused icn8505_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(icn8505_pm_ops, icn8505_suspend, icn8505_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(icn8505_pm_ops, icn8505_suspend, icn8505_resume);
>  
>  static const struct acpi_device_id icn8505_acpi_match[] = {
>  	{ "CHPN0001" },
> @@ -495,7 +495,7 @@ MODULE_DEVICE_TABLE(acpi, icn8505_acpi_match);
>  static struct i2c_driver icn8505_driver = {
>  	.driver = {
>  		.name	= "chipone_icn8505",
> -		.pm	= &icn8505_pm_ops,
> +		.pm	= pm_sleep_ptr(&icn8505_pm_ops),
>  		.acpi_match_table = icn8505_acpi_match,
>  	},
>  	.probe_new = icn8505_probe,


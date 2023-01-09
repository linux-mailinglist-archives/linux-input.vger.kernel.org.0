Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4576620A9
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbjAIIyV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbjAIIxP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D09618E26
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ieip31en4i37wmpCPbTtyt0Hvq3ESMUz6JG3sPLhFUI=;
        b=Xr7p/x9Ppk+tmE6kuhkgjSpApYYQOLoiNClJMQ+i5uh5VEodTRfnE8p2LEcKwe6YbY9UqM
        VP7lwZ4PUnj+JM1GVQzfyrAn6DV8BjidEGP2VFlR+KPXt8nzSVeNrEPcBg5vlW1SIVWcws
        RVIhEXD/HXG14p6gAXPsJZx9fvYOzRo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-wDJgEY2WNAGJOggmrnSqrA-1; Mon, 09 Jan 2023 03:44:24 -0500
X-MC-Unique: wDJgEY2WNAGJOggmrnSqrA-1
Received: by mail-ej1-f69.google.com with SMTP id qk40-20020a1709077fa800b007eeb94ecdb5so4934114ejc.12
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ieip31en4i37wmpCPbTtyt0Hvq3ESMUz6JG3sPLhFUI=;
        b=jkefntGm/RHp8zILe8SEEi2F36D7D6edSzAt3IKsFTKqeHO10TcPBCSXxojhSUtzru
         0m+ESdqLBczhxLgSpXhyoomBlluBUAf+CDMJtjn3GRDXkfgn/+fSncDcTtiOIFeFltLe
         T2k6gz9aogYw/RxoUZUDibTXo89WgISi5MJLdVShJ/LrJVC+YOcP4zmv20OmhlK0C7ip
         9AkgDtTZaf8jXycOk4TzXVXTc2PxoVw81p5p/i/u2bba4tXdu54cX7AyUIoXHMuwfhXZ
         q5+DnT8FyghSf4yrnyGa0b309gVblHVj4kDQrCfcxg836jJXwsqRDHGQ4fECCKcSKFRN
         NiSA==
X-Gm-Message-State: AFqh2kpi7xBK92FLr/jdr12eD26ms+4ctcZom2tTxNjiRHx0FvDVtqSq
        gcAKBYgjkpyUdPuMPsU8T+Mcx+lfdq12VtCVguyS3xLpn5mL/JIl1cJ91Ki0WoVDSMKSUeXN99f
        WRahvnS94T+zBTWwHIHeuKKg=
X-Received: by 2002:a05:6402:1294:b0:499:8849:5faf with SMTP id w20-20020a056402129400b0049988495fafmr4103863edv.26.1673253863171;
        Mon, 09 Jan 2023 00:44:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVZxBqsgkhVH8FwbSxvIabTD3h8uk0E6+um85WCSAmmX7/1Ykx5r/2lz924HQeO3Po+JdKVA==
X-Received: by 2002:a05:6402:1294:b0:499:8849:5faf with SMTP id w20-20020a056402129400b0049988495fafmr4103850edv.26.1673253862958;
        Mon, 09 Jan 2023 00:44:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lb11-20020a170907784b00b007b935641971sm3403615ejc.5.2023.01.09.00.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:44:22 -0800 (PST)
Message-ID: <94daff62-6ef0-92b6-c4b1-faf768eb74cc@redhat.com>
Date:   Mon, 9 Jan 2023 09:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 26/69] Input: elan_i2c_core - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US, nl
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Raul E Rangel <rrangel@chromium.org>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-27-jic23@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230102181842.718010-27-jic23@kernel.org>
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

On 1/2/23 19:17, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Raul E Rangel <rrangel@chromium.org>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/mouse/elan_i2c_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 76729ada1582..5f0d75a45c80 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1328,7 +1328,7 @@ static int elan_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int __maybe_unused elan_suspend(struct device *dev)
> +static int elan_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
> @@ -1365,7 +1365,7 @@ static int __maybe_unused elan_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused elan_resume(struct device *dev)
> +static int elan_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
> @@ -1394,7 +1394,7 @@ static int __maybe_unused elan_resume(struct device *dev)
>  	return error;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
>  
>  static const struct i2c_device_id elan_id[] = {
>  	{ DRIVER_NAME, 0 },
> @@ -1418,7 +1418,7 @@ MODULE_DEVICE_TABLE(of, elan_of_match);
>  static struct i2c_driver elan_driver = {
>  	.driver = {
>  		.name	= DRIVER_NAME,
> -		.pm	= &elan_pm_ops,
> +		.pm	= pm_sleep_ptr(&elan_pm_ops),
>  		.acpi_match_table = ACPI_PTR(elan_acpi_id),
>  		.of_match_table = of_match_ptr(elan_of_match),
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,


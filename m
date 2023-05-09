Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412186FC21B
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 10:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjEIIyP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 04:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjEIIyM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 04:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E09010CB
        for <linux-input@vger.kernel.org>; Tue,  9 May 2023 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683622401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P6WdqBvhYf3kv1JYpHBepkxv7wHq33VCoqZHdnMEf3M=;
        b=ULHAis0AK5khN3HzRgwafq/EtKMFcchpX2ZXaByL9Pmx40NcLeVi9um4MJ0gaibQw837yj
        xAg+ZrBSVc2ptpLiXtT4lDu5RHs3nEXGcZfRR3ONbVwjvpTMFICdivrlSkGfDa+hFZQvbL
        59KQ/NbscCBypkNP50BlXq12CdHOUGo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-kGI_69LYNWOQfaVZGxt9mQ-1; Tue, 09 May 2023 04:53:19 -0400
X-MC-Unique: kGI_69LYNWOQfaVZGxt9mQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bd1f08901so5332863a12.0
        for <linux-input@vger.kernel.org>; Tue, 09 May 2023 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622398; x=1686214398;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6WdqBvhYf3kv1JYpHBepkxv7wHq33VCoqZHdnMEf3M=;
        b=JH0v0L7YEE8FnVgfiDLhAgZR36mCTiYCnv8f3rU7mr1AfsVy3YDIDFamrRkBu3d7nh
         D44zc2XKkYBqnrMzhW0hArB4dqLPrY9GBxQRRc2L8I/uLzHmLaptgBIRX1Gl7LW5sKIj
         thUary9wdCUhxXc8kTKd7Yqtt/MAsXmLnOYfB3XPTS7O6d5Ks4W2WLUfm5l4o7iD4Ioh
         d/P4yJ6Xtg8uAdZOeC21XtR+rKATZkG31Q8JUh+ldbiLK06Gie7gh/dY+y+tH6oMndrH
         sacpgADB3qCVjQk5/xRwpURlqz181hZgim7CoxA4QXUH1wtFJGtyMBCV2qPMQVDsptWH
         7b7Q==
X-Gm-Message-State: AC+VfDznf8OYxo03rZlBkqlytSH5Frqzq5Ynn46ZWKCflssI49XVtKk/
        x6Ti9NiLkHiqNShYALTB7+LMTVkAe+eWnoLLSD8ldiKOat0Z1jEoOizppazrHULfhZSP1nWREcI
        kWiNKeGSJ3S/Gpyuz3WSYd/S2kx3QFsM=
X-Received: by 2002:aa7:c411:0:b0:50b:c73e:91bc with SMTP id j17-20020aa7c411000000b0050bc73e91bcmr10374718edq.14.1683622398317;
        Tue, 09 May 2023 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xWDnAcOFOBiE9lFF8tlT7ech+9EnpU3gf0lYQEhrHQNDwEitjT+IL5V1EZw16AEpmcDvtBw==
X-Received: by 2002:aa7:c411:0:b0:50b:c73e:91bc with SMTP id j17-20020aa7c411000000b0050bc73e91bcmr10374704edq.14.1683622398026;
        Tue, 09 May 2023 01:53:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c2-20020aa7c742000000b0050bc13e5aa9sm498397eds.63.2023.05.09.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:53:17 -0700 (PDT)
Message-ID: <bb3c1be2-09d2-e366-fd5a-33052c7e4df7@redhat.com>
Date:   Tue, 9 May 2023 10:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] touchscreen_dmi: Add info for the Dexp Ursus KX210i
Content-Language: en-US, nl
To:     Andrey Avdeev <jamesstoun@gmail.com>, linux-input@vger.kernel.org
References: <ZE4gRgzRQCjXFYD0@avdeevavpc>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZE4gRgzRQCjXFYD0@avdeevavpc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/30/23 10:01, Andrey Avdeev wrote:
> Add touchscreen info for the Dexp Ursus KX210i
> 
> Signed-off-by: Andrey Avdeev <jamesstoun@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 13802a3c3591..0d3ac1e7a43c 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -336,6 +336,22 @@ static const struct ts_dmi_data dexp_ursus_7w_data = {
>  	.properties	= dexp_ursus_7w_props,
>  };
>  
> +static const struct property_entry dexp_ursus_kx210i_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y",  2),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1137),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-dexp-ursus-kx210i.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data dexp_ursus_kx210i_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= dexp_ursus_kx210i_props,
> +};
> +
>  static const struct property_entry digma_citi_e200_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -1185,6 +1201,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "7W"),
>  		},
>  	},
> +	{
> +		/* DEXP Ursus KX210i */
> +		.driver_data = (void *)&dexp_ursus_kx210i_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "INSYDE Corp."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "S107I"),
> +		},
> +	},
>  	{
>  		/* Digma Citi E200 */
>  		.driver_data = (void *)&digma_citi_e200_data,


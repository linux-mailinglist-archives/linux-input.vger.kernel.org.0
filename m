Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1907BA9C8
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 21:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjJETJj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 15:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjJETJi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 15:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A77E5
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 12:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696532934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i40kQyEUEF0TEHW/fGfM7kzMcK6AOWg/tkUqZR1+Zsk=;
        b=cOLG0GAM1OoD9rDc3I0BrmvnoSUX3X5V7Pe67ts1hUcwLDLN3uNkekWaL3Ynec7TMN0BvW
        An50gXYKDwcZ0d/QdCOfV9qyijrzO/ytA/O6wvCNAGrtkybldv1mx9m4Ph+4efrV05Txew
        8Z0EvDCg9cR9qDz5Nk/ncBwnp5VHTvg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-zSUE8Z2CNRKf2TM8GYZ4-Q-1; Thu, 05 Oct 2023 15:08:51 -0400
X-MC-Unique: zSUE8Z2CNRKf2TM8GYZ4-Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b2e3f315d5so155919766b.1
        for <linux-input@vger.kernel.org>; Thu, 05 Oct 2023 12:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696532930; x=1697137730;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i40kQyEUEF0TEHW/fGfM7kzMcK6AOWg/tkUqZR1+Zsk=;
        b=bYvxgmTJy3arPEUrO9TBDyZDXmHxMV2LkMueSccwBIcjY/dEgUgKAFtulP04CwPote
         V/Yq/qnTwdZAlLmoON1TmxCAsykVYKtRA0Q1FN0V2X1gWYqZJCiS9tC0cFuD7G25f/iB
         opM9WdOzmEpCvSI5Ap9H4PxbDHrUDr7GuCQN/xY0kn6u6RVDBTKrRQjk1GpyyniwBM0C
         DvwoJfc9rqI2KK04LRKEyrWJdhO1IqsRZQQgeIjzzd2na8FbXIZLzN29xl5nAcrtIbXM
         V8ULbnIrr5sXyml9vY45ibWsYn4CFgf6c471S/LhyKcfITLd9kMrTrI3jrh0zzUQJYGA
         X1qg==
X-Gm-Message-State: AOJu0YyyO58SmLo3gEubF/DJUCJTs5FBCituNRIANtSLm73NiqCPGwCl
        mH+4h8iQhdmqAPyCpL+PWDlfW8jMJ+fgFgS78Pym4A4t9acyQRJcKfiLBeOeFo92oWxZ0YwPJEs
        sTulxueeHdVh9lQ8Yqf2YL92bRqYmHFY=
X-Received: by 2002:a17:906:8464:b0:9a1:f1b2:9f2e with SMTP id hx4-20020a170906846400b009a1f1b29f2emr3077268ejc.2.1696532930218;
        Thu, 05 Oct 2023 12:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeAlI9W3SovWIuRgOG19PsM1pveA2rVV723oBAeKac7yPbaiCuaHYF8J1ZqdCkwWW4vxc61g==
X-Received: by 2002:a17:906:8464:b0:9a1:f1b2:9f2e with SMTP id hx4-20020a170906846400b009a1f1b29f2emr3077256ejc.2.1696532929944;
        Thu, 05 Oct 2023 12:08:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rn4-20020a170906d92400b0099bc038eb2bsm1599889ejb.58.2023.10.05.12.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 12:08:49 -0700 (PDT)
Message-ID: <e6e45693-8d19-1709-fff6-7f8277f29c09@redhat.com>
Date:   Thu, 5 Oct 2023 21:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Positivo
 C4128B
Content-Language: en-US, nl
To:     Renan Guilherme Lebre Ramos <japareaggae@gmail.com>,
        linux-input@vger.kernel.org
References: <20231004235900.426240-1-japareaggae@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231004235900.426240-1-japareaggae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/5/23 01:59, Renan Guilherme Lebre Ramos wrote:
> Add information for the Positivo C4128B, a notebook/tablet convertible.
> 
> Link: https://github.com/onitake/gsl-firmware/pull/217
> Signed-off-by: Renan Guilherme Lebre Ramos <japareaggae@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f9301a9382e7..0f6b30285381 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -756,6 +756,21 @@ static const struct ts_dmi_data pipo_w11_data = {
>  	.properties	= pipo_w11_props,
>  };
>  
> +static const struct property_entry positivo_c4128b_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 13),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1915),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1269),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-positivo-c4128b.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data positivo_c4128b_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= positivo_c4128b_props,
> +};
> +
>  static const struct property_entry pov_mobii_wintab_p800w_v20_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 32),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
> @@ -1480,6 +1495,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "MOMO.G.WI71C.MABMRBA02"),
>  		},
>  	},
> +	{
> +		/* Positivo C4128B */
> +		.driver_data = (void *)&positivo_c4128b_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "C4128B-1"),
> +		},
> +	},
>  	{
>  		/* Point of View mobii wintab p800w (v2.0) */
>  		.driver_data = (void *)&pov_mobii_wintab_p800w_v20_data,


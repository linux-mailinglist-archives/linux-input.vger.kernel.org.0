Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794EB36D61
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 09:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfFFHdU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 03:33:20 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44250 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFFHdU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 03:33:20 -0400
Received: by mail-ed1-f66.google.com with SMTP id b8so1846545edm.11
        for <linux-input@vger.kernel.org>; Thu, 06 Jun 2019 00:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=75vDc1HJp6eE3VxFi6Xufj043UDtGkfagMWGrSZkCEY=;
        b=Xdkbw52Z8o8iCZStJ93VuutMZ9XU533aWpjLPOG1QTrGHXXAvGOn1aEZO2vgUmVGMR
         T2Q4sWp/uavvtGbIjtJpkZVfQSahbxXs3YyU+v7QRhiUfVeR5oQIsnSoKYwaFZAQufUZ
         g5a7LjHWsP1bNZGEn1B0h8NXVA6tq7Ilma9DXM4Rtg/al4jrHtd579I5gqE/aNdtvFfj
         cKcW+QQRoT+vVkicYHn0Ifuu3ILOFViov4qanWMuPwEtlT5Ww4jVwct+5IDKTAi4eYl4
         sPyczohxtAZifrVbeVUB7mOyt9xxsbrIG9smJBA84jWBWgTGugFV4E9V3pDi/5rRBiE2
         jhcA==
X-Gm-Message-State: APjAAAUHcV7cxESjcyfsBOBLwhFnI8i0U1kImEmclBb3QaN52cALqfG0
        nYavloiGjJMxJ4ULz9b+jmlPbS6ljg0=
X-Google-Smtp-Source: APXvYqxzQjOdd+kLyE3c0UTO4Zaohrq6LLWPgm4201e173hjECYXy7JQPJ+M66uK9C0LLWrPkDWDwA==
X-Received: by 2002:a17:906:3ecc:: with SMTP id d12mr1856523ejj.119.1559806398731;
        Thu, 06 Jun 2019 00:33:18 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w6sm188405ejf.0.2019.06.06.00.33.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 00:33:18 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi Hi10
 Pro' touchscreen
To:     Daniel Otero <otero.o.daniel@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>, linux-input@vger.kernel.org
References: <20190605232204.24679-1-otero.o.daniel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e434bca4-51d9-e601-5130-55eb48649ce5@redhat.com>
Date:   Thu, 6 Jun 2019 09:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605232204.24679-1-otero.o.daniel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 06-06-19 01:22, Daniel Otero wrote:
> Add touchscreen platform data for the 'Chuwi Hi10 Pro' tablet touchscreen.
> 
> Signed-off-by: Daniel Otero <otero.o.daniel@gmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index b662cb2d7cd5..d942082c5b7b 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -87,6 +87,23 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
>   	.properties	= chuwi_hi10_air_props,
>   };
>   
> +static const struct property_entry chuwi_hi10_pro_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1911),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data chuwi_hi10_pro_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= chuwi_hi10_pro_props,
> +};
> +
>   static const struct property_entry chuwi_vi8_props[] = {
>   	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
>   	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
> @@ -601,6 +618,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
>   		},
>   	},
> +	{
> +		/* Chuwi Hi10 Pro (CWI529) */
> +		.driver_data = (void *)&chuwi_hi10_pro_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
> +		},
> +	},
>   	{
>   		/* Chuwi Vi8 (CWI506) */
>   		.driver_data = (void *)&chuwi_vi8_data,
> 

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2A780697
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2019 16:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfHCOQn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Aug 2019 10:16:43 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:47025 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfHCOQn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Aug 2019 10:16:43 -0400
Received: by mail-ed1-f68.google.com with SMTP id d4so74906851edr.13
        for <linux-input@vger.kernel.org>; Sat, 03 Aug 2019 07:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vbKcpktamOEnlA0qNqnc/w2735gi7G17BJHK0idUG/w=;
        b=QS+3qQ5UtlReBUSj1ZO0JVz16dF5vqv0KMiRIwnunGC97ec2fAUkPP+SYhtECvbuY4
         vRtnmhej1of/ts95q2khCvcLVyhbafude6TmmBaDoyAvcpLO7Q0fKDUf2pHwqFqShEDs
         cmvKUBIldqziu6J39/rDflqM7m+12BtHpy9IJtptXjhedl+ryt+JZZLWny07kE+HF3YB
         UcOcHMwL4qUiyWHMhVYQy0xVM/rl8mEHl4KaRKdxmd0BQoHHCPeesqM3vmuFyqjdU/B5
         415VUTKfTVYir1na/fSTkpm0CK4x/+5QMZ6HXRcUzYix2Yv3Jh+NbCJcFPRL3a5dmUAb
         cImA==
X-Gm-Message-State: APjAAAVYzVg2DeiYyNwQGUACmR/Pret+t1mHbCJviAysd2lgDuynx0Wv
        yV2biMiAyTg2jqNRtHLM2WsmDg==
X-Google-Smtp-Source: APXvYqwtLECPm/zSSRGyPy9t8lacqRtMGr7zWFmp/ap4I1TvbwfhW8Zps0Kfh4Pka5jx4+uk4hj1ig==
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr55137822ejf.28.1564841801189;
        Sat, 03 Aug 2019 07:16:41 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id m32sm18744055edc.89.2019.08.03.07.16.39
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Aug 2019 07:16:40 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen platform data
 for the Chuwi Surbook Mini tablet.
To:     Giang Le <ohaibuzzle@gmail.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190803141222.9460-1-ohaibuzzle@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c8b8c8c-0674-9fb2-a28e-ceaea58fcece@redhat.com>
Date:   Sat, 3 Aug 2019 16:16:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190803141222.9460-1-ohaibuzzle@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 03-08-19 16:12, Giang Le wrote:

Hmm, could have used a somewhat more verbose commit message above
the Signed-off-by line, but I guess there is not that much to write
about this patch.

> Signed-off-by: Giang Le <ohaibuzzle@gmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 4370e4add83a..72535b0268eb 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -136,6 +136,22 @@ static const struct ts_dmi_data chuwi_vi10_data = {
>   	.properties     = chuwi_vi10_props,
>   };
>   
> +static const struct property_entry chuwi_surbook_mini_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 88),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 13),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 2040),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1524),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-surbook-mini.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data chuwi_surbook_mini_data = {
> +	.acpi_name      = "MSSL1680:00",
> +	.properties     = chuwi_surbook_mini_props,
> +};
> +
>   static const struct property_entry connect_tablet9_props[] = {
>   	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
>   	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
> @@ -646,6 +662,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "S165"),
>   		},
>   	},
> +	{
> +		/* Chuwi Surbook Mini (CWI540) */
> +		.driver_data = (void *)&chuwi_surbook_mini_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "C3W6_AP108_4G"),
> +		},
> +	},
>   	{
>   		/* Connect Tablet 9 */
>   		.driver_data = (void *)&connect_tablet9_data,
> 

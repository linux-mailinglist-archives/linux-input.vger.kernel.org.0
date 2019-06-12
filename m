Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D4F426BE
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 14:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438481AbfFLMzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 08:55:22 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43731 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438441AbfFLMzW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 08:55:22 -0400
Received: by mail-ed1-f67.google.com with SMTP id w33so25571364edb.10
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 05:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aD69m6otj68UH0Q7gUM0VGrtwF15HpBY3jIEQiF8Flk=;
        b=kN3DT5xK/y8Bc4Gzgqs4Kwc9edN+58F1RWQs/A2l3x2uatO3qyYZLqf9AUN1Oe7eOh
         LFdRoLo7BfDsF5yseg6Jhw7TkOaPxOaS9DdfSoEpWGAcXnGLxTAxn/IGfDbkicvZjHoS
         ZUNtKqvG3iydDly8HAMHJJsqQt6eKVbK4beyHZTk19hbvo1fUqNlx1YOeRK9OFAr9kNE
         Jp1oBlaRR+KrQexuCjAFiuZg0H8pxXAzP5mxUrn07njccUxxQMjmlUyS2Xy6YJICLQqC
         fnTmLFVd0q9ysNlzN8hVr3L1GAdY7tYilu1E/hcuvwULv/qH2Y2G1uCZnXR9cTlgxFh1
         NJMw==
X-Gm-Message-State: APjAAAUyW8R1uUYXwHBteAAxzPn3wsGV3EjJOvd166yGVLyu/bNeWYk5
        lRlGiZ/t+XTp0iYMKEACHzf2yA==
X-Google-Smtp-Source: APXvYqyhz7ko/MVJXRvdEbK38K+R1dfbCIspcF/HYfRDUZR8RTCSLzD3QIbIVDj3ba/Wtxy12sgefQ==
X-Received: by 2002:aa7:d30d:: with SMTP id p13mr4360291edq.292.1560344120330;
        Wed, 12 Jun 2019 05:55:20 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id m4sm4526164edc.24.2019.06.12.05.55.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 05:55:19 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Update Hi10 Air filter
To:     Christian Oder <me@myself5.de>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190612124053.119182-1-me@myself5.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
Date:   Wed, 12 Jun 2019 14:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612124053.119182-1-me@myself5.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12-06-19 14:40, Christian Oder wrote:
> Turns out the Hi10 Air is built by multiple companies so using Hampoo
> as a filter is not enough to cover all variants.
> 
> This has been verified as working on the Hampoo and Morshow version.
> 
> Signed-off-by: Christian Oder <me@myself5.de>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/touchscreen_dmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index b662cb2d7cd5..61e7c4987d0d 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -597,7 +597,8 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   		/* Chuwi Hi10 Air */
>   		.driver_data = (void *)&chuwi_hi10_air_data,
>   		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "CHUWI INNOVATION AND TECHNOLOGY(SHENZHEN)CO.LTD"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>   			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
>   		},
>   	},
> 

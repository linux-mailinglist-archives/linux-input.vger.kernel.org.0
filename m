Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBC551D4E0
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386618AbiEFJrb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 05:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235926AbiEFJra (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 05:47:30 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ECBED5C84D
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651830226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kL8OXY4/2c8FmE1oNxoUhsAuDjV/FZosmDMD2hChg3Y=;
        b=PL7NR/Wo6BwIIJBmtt1V7f5ukhIZEjxdflxIb/yBh4B+BnfvFkf/3snjJDZzN2l8gV8Ycr
        /kzdH8YCvyDN0QBT2WDkOMWuBLI8SxrhE2KOdWt1WF52YLVKpUtxWHY4SaRZYwpYENTt3g
        vXCzoVo9R0Lb4KRtHeK2tHikZTVm/fE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-44Q5Mo8kORGgotvGUqMW-Q-1; Fri, 06 May 2022 05:43:45 -0400
X-MC-Unique: 44Q5Mo8kORGgotvGUqMW-Q-1
Received: by mail-ed1-f71.google.com with SMTP id b65-20020a509f47000000b00427b34634d3so3706352edf.20
        for <linux-input@vger.kernel.org>; Fri, 06 May 2022 02:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kL8OXY4/2c8FmE1oNxoUhsAuDjV/FZosmDMD2hChg3Y=;
        b=JvG0fhYYBdiybcnbrG8zFLO8Yy9B7H55oiqBD9JsAwvdCWtKfVlznjbZNWr7jvTbui
         o57054c3jz13bEXrISelYGJ4DicfRou5QOGEwRWXuaR4v/7t65jLKifaYpYP3t7Ow5bA
         vb8cszp4/CqhuZnvCRi2St87lDzJ6uUIoadweDkKMPNkk0SquiOGMwBPnYK+WrkIctz5
         HirBZ9X6F4K6Jc9/Rmz2fPLMAhx9bNxFcMMicxgwaxNXUcT7xJaCfPFbjscFDDpTcSYm
         uzqju7Oq7M7Afe5DM8YaMnKVAsTdldtD8V8S7xzMUrGYKeE3GHTI1clE58BFhTLZ08k+
         W7+A==
X-Gm-Message-State: AOAM532QtkT/KitNYy9LHCeUhQAsyvd4qS2HkCF5oQJY2GohkehydwIO
        ZY3mkWT4Mmi/p0zbHP67BJlc+Q2fmaVuWkFi0O+xf2Wqki9hL72nNRVtO5WUkji5vLRw/xsOld2
        vKtuCbbmqPSlqdRHy5D/7vyw=
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id qb18-20020a1709077e9200b006f4c553c734mr2198566ejc.286.1651830224303;
        Fri, 06 May 2022 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjxAKFCit4+skzzpUHmrYbqPIHX05aAhl3wSoQa5vQmkQWWLh6784qOiHzF/7KaTtDbtNgew==
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id qb18-20020a1709077e9200b006f4c553c734mr2198550ejc.286.1651830224008;
        Fri, 06 May 2022 02:43:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w26-20020a50fa9a000000b0041d893ed437sm2038325edr.2.2022.05.06.02.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 02:43:43 -0700 (PDT)
Message-ID: <93b8e8a4-8ed4-f400-1e06-48f620e5193e@redhat.com>
Date:   Fri, 6 May 2022 11:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] HID: apple: Properly handle function keys on Keychron
 keyboards
Content-Language: en-US
To:     Bryan Cain <bryancain3@gmail.com>, linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20220505191221.36172-1-bryancain3@gmail.com>
 <20220505191221.36172-2-bryancain3@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220505191221.36172-2-bryancain3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bryan,

On 5/5/22 21:12, Bryan Cain wrote:
> Keychron's C-series and K-series of keyboards copy the vendor and
> product IDs of an Apple keyboard, but only behave like that device when
> set to "Mac" mode. In "Windows" mode, the Fn key doesn't generate a
> scancode, so it's impossible to use the F1-F12 keys when fnmode is set
> to its default value of 1.
> 
> To fix this, make fnmode default to the new value of 3, which behaves
> like fnmode=2 for Keychron keyboards and like fnmode=1 for actual Apple
> keyboards. This way, Keychron devices are fully usable in both "Windows"
> and "Mac" modes, while behavior is unchanged for everything else.
> 
> Signed-off-by: Bryan Cain <bryancain3@gmail.com>

Thank you for doing this. This is pretty much what I had in mind
when discussing things in the previous thread, but I obviously
never got around to implementing this.

The patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/hid/hid-apple.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 0cf35caee9fa..42a568902f49 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/timer.h>
> +#include <linux/string.h>
>  
>  #include "hid-ids.h"
>  
> @@ -35,16 +36,17 @@
>  #define APPLE_NUMLOCK_EMULATION	BIT(8)
>  #define APPLE_RDESC_BATTERY	BIT(9)
>  #define APPLE_BACKLIGHT_CTL	BIT(10)
> +#define APPLE_IS_KEYCHRON	BIT(11)
>  
>  #define APPLE_FLAG_FKEY		0x01
>  
>  #define HID_COUNTRY_INTERNATIONAL_ISO	13
>  #define APPLE_BATTERY_TIMEOUT_MS	60000
>  
> -static unsigned int fnmode = 1;
> +static unsigned int fnmode = 3;
>  module_param(fnmode, uint, 0644);
>  MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
> -		"[1] = fkeyslast, 2 = fkeysfirst)");
> +		"1 = fkeyslast, 2 = fkeysfirst, [3] = auto)");
>  
>  static int iso_layout = -1;
>  module_param(iso_layout, int, 0644);
> @@ -349,6 +351,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>  	const struct apple_key_translation *trans, *table;
>  	bool do_translate;
>  	u16 code = 0;
> +	unsigned int real_fnmode;
>  
>  	u16 fn_keycode = (swap_fn_leftctrl) ? (KEY_LEFTCTRL) : (KEY_FN);
>  
> @@ -359,7 +362,13 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>  		return 1;
>  	}
>  
> -	if (fnmode) {
> +	if (fnmode == 3) {
> +		real_fnmode = (asc->quirks & APPLE_IS_KEYCHRON) ? 2 : 1;
> +	} else {
> +		real_fnmode = fnmode;
> +	}
> +
> +	if (real_fnmode) {
>  		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
>  		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
>  		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
> @@ -406,7 +415,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>  
>  			if (!code) {
>  				if (trans->flags & APPLE_FLAG_FKEY) {
> -					switch (fnmode) {
> +					switch (real_fnmode) {
>  					case 1:
>  						do_translate = !asc->fn_on;
>  						break;
> @@ -660,6 +669,11 @@ static int apple_input_configured(struct hid_device *hdev,
>  		asc->quirks &= ~APPLE_HAS_FN;
>  	}
>  
> +	if (strncmp(hdev->name, "Keychron", 8) == 0) {
> +		hid_info(hdev, "Keychron keyboard detected; function keys will default to fnmode=2 behavior\n");
> +		asc->quirks |= APPLE_IS_KEYCHRON;
> +	}
> +
>  	return 0;
>  }
>  


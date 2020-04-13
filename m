Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A421A6B2A
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 19:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732610AbgDMRQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 13:16:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47124 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732592AbgDMRQx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 13:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586798211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a7I3lQlaqmBWVO6N030Hu2jjDzGoSQucaW2WPCFrk4E=;
        b=Gz7Wj384jld52hYzYGLUxjZbH2w7D/wpgESrLLxh4Wdh3D7HBNKLelyccbbiAs4vjD3l3I
        pbfJpgk7NVgD7XgFnMoVlYZtf8eLD3CPEJ8kEP8bzPu2aa7dq0XKRtHqKeUAEBdEFBi6jB
        CldwWXhTJ/cSccwXnHj+tQ/pPvwenRE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-91DMeXA6OL6UAMKy6y4OXA-1; Mon, 13 Apr 2020 13:16:50 -0400
X-MC-Unique: 91DMeXA6OL6UAMKy6y4OXA-1
Received: by mail-wr1-f70.google.com with SMTP id m15so7084662wrb.0
        for <linux-input@vger.kernel.org>; Mon, 13 Apr 2020 10:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a7I3lQlaqmBWVO6N030Hu2jjDzGoSQucaW2WPCFrk4E=;
        b=HtTofyLAlJ6NvzXQKvxaUrj/HhsPHVC5Pi1d0daOeDfmGcR4cKK3dk5gEyNwOUwRgR
         LUqPm9/K2sSznGsbW3UCUrFO3BlU+4Yhv9kdHxcuiKP6Q70Y1zkodVu381/eHxKV0wBX
         tb+15fG+TZ1lpB48zqPukZJO4F2UTYkoIsSsNau0UefTyfN42OGl/wd1Bv9ozDOZKf44
         +KXQU1pCMukrMq8ohmkUrAWm3vLUy/LrYHlPK7nSLflQmm23Tq8xGlTyfGkBM3IeIM8T
         IFNmms7YnClJvJybq6CM7k87WLO6JYJ7SMftOvoo8l/NfUxWzeAnE7K2i49QsA/71bkN
         Dj7Q==
X-Gm-Message-State: AGi0PuY25nfqzCEWfIsyQ6Bj4qNXELg6UtbW8o6y+Roixey8eSw7Cqu2
        PKkZyWLNwwOXstMcofXYm1191nagjnOfadyizn7AXdtAzoWuRWLkGo5/T79BpMmMMq2C1V/fVa1
        Fw6iLF7VegmrhazVKXM93rYs=
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr19729770wrs.415.1586798208837;
        Mon, 13 Apr 2020 10:16:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9sGc1lAt8K2CUcDonhGGbxaseSOs3PPmBoi6ficMCdhylqQkjJaCpW0bd0DM2XyxeLnMeEg==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr19729754wrs.415.1586798208609;
        Mon, 13 Apr 2020 10:16:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s27sm6336686wra.94.2020.04.13.10.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 10:16:47 -0700 (PDT)
Subject: Re: [PATCH] HID: Add support for Logitech G11 extra keys
To:     Fabian Schindlatz <fabian.schindlatz@fau.de>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20200413164628.38283-1-fabian.schindlatz@fau.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <62bec373-529b-b5fe-c323-9cc220932dc8@redhat.com>
Date:   Mon, 13 Apr 2020 19:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200413164628.38283-1-fabian.schindlatz@fau.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/13/20 6:46 PM, Fabian Schindlatz wrote:
> The Logitech G11 keyboard is a cheap variant of the G15 without the LCD
> screen. It uses the same layout for its extra and macro keys (G1 - G18,
> M1-M3, MR) and - from the input subsystem's perspective - behaves just
> like the G15, so we can treat it as such.
> 
> Tested it with my own keyboard.
> 
> Signed-off-by: Fabian Schindlatz <fabian.schindlatz@fau.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/hid/hid-ids.h    | 1 +
>   drivers/hid/hid-lg-g15.c | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index b18b13147..c6d614413 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -759,6 +759,7 @@
>   #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
>   #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
>   #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
> +#define USB_DEVICE_ID_LOGITECH_G11		0xc225
>   #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
>   #define USB_DEVICE_ID_LOGITECH_G510		0xc22d
>   #define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index ad4b5412a..ef0cbcd75 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -872,6 +872,10 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   }
>   
>   static const struct hid_device_id lg_g15_devices[] = {
> +	/* The G11 is a G15 without the LCD, treat it as a G15 */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +		USB_DEVICE_ID_LOGITECH_G11),
> +		.driver_data = LG_G15 },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>   			 USB_DEVICE_ID_LOGITECH_G15_LCD),
>   		.driver_data = LG_G15 },
> 


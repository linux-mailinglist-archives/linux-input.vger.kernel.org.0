Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC32B2230
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 18:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgKMR1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 12:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgKMR1F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 12:27:05 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E7EC0613D1;
        Fri, 13 Nov 2020 09:27:05 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id z13so2328429ooa.5;
        Fri, 13 Nov 2020 09:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=y9K9YUhl2zYZsowQIL6lc2DNOPHGRC1ZPB3JI5P8kMw=;
        b=rM2Vr08zkOxR8FY+BqFg9Jv2Eas8KrEmQqn1Ozig0vyhZYKoMKPS7/o0U7LsevuR5h
         p3ZjkBcOlN+G6wTDB64s2eiMg6KiHDFbq1EvZOx17pVCNNXI+KWWkBX0JcSV6zOHREZA
         0XOXkO2w88UH0S/8ePYArV+l87eSI3ikYKL+S+G/3QJvPMl1Y18bwG4rQ+RSWaR8Ii4B
         r7k5j0RkvNnaZja7gMlj3PnCBd5vk4rICzn7+CU0JGaYR91Cow02BykdqMJlStRVx58t
         H/XDmDjgpGSmC4Xx3Jw2rfBscgab3n85DA033cbZ7cDIPLevTF8jVmXvXgXhdzW16BgR
         IZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=y9K9YUhl2zYZsowQIL6lc2DNOPHGRC1ZPB3JI5P8kMw=;
        b=hhwJ0SfFpurt1RLgAflO8CtWblxnzRD7DXIaqEUHW9cSQIsT4Thm+EgR+CeVDCHCBe
         Bx0Qzof9Ra7nNM/Ci82OIF78FV0I6MzxCzHU9C0sxJmjSNYkC8uOPmXDU8uRYfIggdYI
         julp979vz6DKnuB9+JH2owgqoC38ZFP5EuUfMpj/pyYSubC/IQp6VpsZpHMuu5L4/z4s
         h/0R/DElv/8dQjOQoZ9mUmo9mvIvj4Cn5CpaGbyVWOmfZY1kXokTNFiHKCCVKK3tYpeS
         mP8xGgTDKt6fOkCk07NSgxLt3XQNGvJ2VbnotCCiHnnvC98U9p7m66BPOkoaw5xCpwl0
         rzpA==
X-Gm-Message-State: AOAM530L2/W9llR4Un1hPBZGIF8Cidc1KTIhPhYiRLdjRJoElpfiixgn
        OFRbBD0pcKMBfH/Hxtk7yfpt7ki8KZSE7azV
X-Google-Smtp-Source: ABdhPJynEnA+jWaxRWcp3tlH+nY7AYxEk+eZA00tsSUPUJGJIiz+kInG7+hacEg8JSpjN8czXlUw9w==
X-Received: by 2002:a4a:5182:: with SMTP id s124mr2311444ooa.88.1605288419708;
        Fri, 13 Nov 2020 09:26:59 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::35? ([2600:1700:4a30:eaf0::35])
        by smtp.gmail.com with ESMTPSA id y8sm2083902ota.64.2020.11.13.09.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:26:58 -0800 (PST)
Subject: Re: [PATCH v2] Input: Add devices for
 HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Jiri Kosina <jikos@kernel.org>, Chris Ye <lzye@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20201101193452.678628-1-lzye@google.com>
 <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <e39fbd02-e691-010c-702d-de86ecfc8854@gmail.com>
Date:   Fri, 13 Nov 2020 09:26:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,  can I have a commit ID for 5.10? I'll need this to submit the 
patch internally.

Thanks!

Chris

On 11/9/20 3:55 AM, Jiri Kosina wrote:
> On Sun, 1 Nov 2020, Chris Ye wrote:
>
>> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>> index 74be76e848bf..cf55dca494f3 100644
>> --- a/drivers/hid/hid-ids.h
>> +++ b/drivers/hid/hid-ids.h
>> @@ -449,6 +449,10 @@
>>   #define USB_VENDOR_ID_FRUCTEL	0x25B6
>>   #define USB_DEVICE_ID_GAMETEL_MT_MODE	0x0002
>>   
>> +#define USB_VENDOR_ID_GAMEVICE	0x27F8
>> +#define USB_DEVICE_ID_GAMEVICE_GV186	0x0BBE
>> +#define USB_DEVICE_ID_GAMEVICE_KISHI	0x0BBF
>> +
>>   #define USB_VENDOR_ID_GAMERON		0x0810
>>   #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR	0x0001
>>   #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR	0x0002
>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>> index 0440e2f6e8a3..36d94e3485e3 100644
>> --- a/drivers/hid/hid-quirks.c
>> +++ b/drivers/hid/hid-quirks.c
>> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
>> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
>> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>> +	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
>> +		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
>>   	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
> Applied for 5.10, thanks.
>

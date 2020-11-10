Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB022ACF46
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 06:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgKJFwt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 00:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729801AbgKJFwt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 00:52:49 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F77BC0613CF;
        Mon,  9 Nov 2020 21:52:49 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n11so11442185ota.2;
        Mon, 09 Nov 2020 21:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4CE3C5n67hIetiEn8/iqcGtXZePuJgNk7a/ALlpUI3U=;
        b=b27p13nhbmyPJwJYnqV21PHHBDsTWkhvwsXl4pUj9gkDZfIbIp2N7RoqyE2BLMOYjo
         Qy+QhdRAg0PJqiro0GgNPnKaZ7RvZuk9ArojAH7xWK30R4u3sZD/9dclghFfNUEMc0o3
         53ndTAfFHSWmWBirK+EUGizSuUi7dzTYaSc9tQT1cpDXgJSEOvqBswXG5BToRA4dvWE2
         SuZ2uXvPVhBKObV7mxkOLHu7+cS2iHFVkfh4l9XNvUPK0SHB+d3Pn7YNupH53ysHwM6e
         WOsMnGeZHGoMnZJKpu1mPs3Qv3Dq7wziIWwOwRCDhfJlNyaZLy8JCv9ZnDBbB8MNNviz
         fvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4CE3C5n67hIetiEn8/iqcGtXZePuJgNk7a/ALlpUI3U=;
        b=K05pnTykwuOatvMOMz+7AQ8r7DjZaph4QjHO3InxW9VgjpRBoQAR5/HvHClZqTw2dg
         vWa8q/BLH0JFln1Bhz7kT3jXCpScXeKmXK2KTs0QxzdjAJ1f0DsUu9/c/CRvnzHtuaM5
         NPQML0Bw7E/YHBcA2E35O/+nNcQFugCuxhSJvcd7kyVZy0sxoHLQE2GgozaOcjbOQGg+
         EMEcbqO6bcsYiZSIhEFRkrk22xjDRfBaY22CUrM82/ghq+sJbZyfq0dsFlwv5CMdDvrZ
         +aq76g69j+kzDlyeqDDdzUGz3A7Ck83YWKDiqNmrl50YbWxhzAxTrmmF3AV5wCvdR1I8
         rucQ==
X-Gm-Message-State: AOAM533tSm1pJVifsjWcdH9sOxu+CVLyoUgIU3kyGBeQT9MhyK6/nyMG
        +6NQbh83xHG4W+mUukeUVtgJytq3cYP/Xg==
X-Google-Smtp-Source: ABdhPJybGDqAQzzaAcG92aQIqgfssM4Q63MlwOwySCrVyU/nJYYsPzdDCQONkS/yRdhNB7mI7j3URQ==
X-Received: by 2002:a9d:22a9:: with SMTP id y38mr12351151ota.122.1604987568094;
        Mon, 09 Nov 2020 21:52:48 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::21? ([2600:1700:4a30:eaf0::21])
        by smtp.gmail.com with ESMTPSA id 62sm3057574otj.37.2020.11.09.21.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 21:52:47 -0800 (PST)
Subject: Re: [PATCH v2] Input: Add devices for
 HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Jiri Kosina <jikos@kernel.org>, Chris Ye <lzye@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20201101193452.678628-1-lzye@google.com>
 <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <53596cf1-d871-fda6-db39-b13f629f44a6@gmail.com>
Date:   Mon, 9 Nov 2020 21:52:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks a lot Jiri!

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

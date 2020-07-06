Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AB421576C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 14:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgGFMlj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 08:41:39 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:43542 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728973AbgGFMli (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Jul 2020 08:41:38 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.93.0.4)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1jsQRB-0001gI-Tm; Mon, 06 Jul 2020 14:41:33 +0200
Subject: Re: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = " log
 messages
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <filipe.lains@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
 <2f76f069f2078b3d51533f772f1094dcc03685a3.camel@gmail.com>
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Autocrypt: addr=mail@maciej.szmigiero.name; prefer-encrypt=mutual; keydata=
 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 mA==
Message-ID: <6202799b-f887-a867-94b3-915607956ceb@maciej.szmigiero.name>
Date:   Mon, 6 Jul 2020 14:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2f76f069f2078b3d51533f772f1094dcc03685a3.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 06.07.2020 14:38, Filipe Laíns wrote:
> On Sun, 2020-07-05 at 19:34 +0200, Maciej S. Szmigiero wrote:
>> These messages appear each time the mouse wakes from sleep, in my
>> case
>> (Logitech M705), every minute or so.
>> Let's downgrade them to the "debug" level so they don't fill the
>> kernel log
>> by default.
>>
>> While we are at it, let's make clear that this is a wheel multiplier
>> (and
>> not, for example, XY movement multiplier).
>>
>> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling
>> on Logitech mice")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>> Sending again since the previous message bounced for most recipients.
>>
>>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
>> logitech-hidpp.c
>> index 1e1cf8eae649..b8b53dc95e86 100644
>> --- a/drivers/hid/hid-logitech-hidpp.c
>> +++ b/drivers/hid/hid-logitech-hidpp.c
>> @@ -3146,7 +3146,7 @@ static int hi_res_scroll_enable(struct
>> hidpp_device *hidpp)
>>  		multiplier = 1;
>>  
>>  	hidpp->vertical_wheel_counter.wheel_multiplier = multiplier;
>> -	hid_info(hidpp->hid_dev, "multiplier = %d\n", multiplier);
>> +	hid_dbg(hidpp->hid_dev, "wheel multiplier = %d\n", multiplier);
>>  	return 0;
>>  }
>>  
> 
> I have seen this being useful in some cases, however I do not have a
> strong opinion on it. Peter would know better.

Well, the message is not being removed, only hidden by default, so
it doesn't fill the kernel log.

One can still enable it at runtime if wanted.

> Cheers,
> Filipe Laíns
> 

Thanks,
Maciej

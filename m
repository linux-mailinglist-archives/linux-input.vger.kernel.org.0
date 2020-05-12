Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496751CF1E1
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 11:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELJqF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 05:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgELJqF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 05:46:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF1AC061A0C;
        Tue, 12 May 2020 02:46:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id BA06B2A1D4E
Subject: Re: [PATCH 3/6] tty/sysrq: Allow configurable SysRq key
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-4-andrzej.p@collabora.com>
 <20200511180145.GU89269@dtor-ws>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <51cd1a5d-70b8-de1f-cf9e-1c4182012ba5@collabora.com>
Date:   Tue, 12 May 2020 11:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511180145.GU89269@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

W dniu 11.05.2020 o 20:01, Dmitry Torokhov pisze:
> Hi Andrzej,
> 
> On Mon, May 11, 2020 at 03:59:15PM +0200, Andrzej Pietrasiewicz wrote:
>> There are existing machines which don't have SysRq key, e.g. chromebooks.
>> This patch allows configuring which key acts as SysRq. The value is passed
>> with sysrq's module parameter.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/tty/sysrq.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
>> index 93202fc24308..ebad9799fdc0 100644
>> --- a/drivers/tty/sysrq.c
>> +++ b/drivers/tty/sysrq.c
>> @@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
>>   
>>   #ifdef CONFIG_INPUT
>>   static int sysrq_reset_downtime_ms;
>> +static unsigned short sysrq_key = KEY_SYSRQ;
>>   
>>   /* Simple translation table for the SysRq keys */
>>   static const unsigned char sysrq_xlate[KEY_CNT] =
>> @@ -735,10 +736,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>>   
>>   		/* Simulate press and release of Alt + SysRq */
>>   		input_inject_event(handle, EV_KEY, alt_code, 1);
>> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
>> +		input_inject_event(handle, EV_KEY, sysrq_key, 1);
>>   		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>>   
>> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
>> +		input_inject_event(handle, EV_KEY, sysrq_key, 0);
>>   		input_inject_event(handle, EV_KEY, alt_code, 0);
>>   		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
> 
> Unfortunately this means that if I connect my external keyboard to
> chromebook SysRq there will stop working, which is not great. If we want
> to support this we need to figure out how to make this handling
> per-device.

I see your point.

So what you envision is SysRq key being configured for each input device
separately. I can see these problems:

- How to attach such a configuration information to each specific
device instance? It is easy if done framework-wise, but gets messy
if done per-device. And we are talking per-device rather than per-driver.

- If a user has multiple USB keyboards connected (possibly through a cascade
of hubs), how would they know which key is valid for which keyboard?

Wouldn't it be better if such a piece of configuration were valid for the
whole system instead of per-device?

Andrzej

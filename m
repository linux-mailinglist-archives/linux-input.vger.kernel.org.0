Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8377E445089
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 09:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhKDIrX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 04:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhKDIrX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 04:47:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8425CC061714;
        Thu,  4 Nov 2021 01:44:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D75851F45E3B
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
References: <20211103155438.11167-1-andrzej.p@collabora.com>
 <b4dfb305-38d9-9a92-df76-90b72b93705a@infradead.org>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <f9b84557-c000-fd0e-bf74-a585c23d22e6@collabora.com>
Date:   Thu, 4 Nov 2021 09:44:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b4dfb305-38d9-9a92-df76-90b72b93705a@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Randy,

W dniu 03.11.2021 o 17:19, Randy Dunlap pisze:
> On 11/3/21 8:54 AM, Andrzej Pietrasiewicz wrote:
>> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>>
>> This patch allows configuring an alternative key to act as SysRq. Devices
>> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
>> but other devices use the alternative SysRq key instead, by default F10.
>> Which key is actually used can be modified with sysrq's module parameter.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>> I'd like to resurrect an old thread regarding supporting alternative SysRq
>> key for machines which don't have a physical SysRq key at all.
>>
>> The old thread:
>>
>> https://www.spinics.net/lists/linux-input/msg67982.html
>>
>> I'm resending this patch, rebased onto v5.15.
>>
>> Any (new) thoughts about it?
>>
> 
> Hi,
> Did you test it with this patch?


Thanks... I must have sent an incorrect version (with incomplete
conflict resolution).

Andrzej

> 
> 
>>
>>   drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
>>   1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
>> index c911196ac893..6dd288e53ce9 100644
>> --- a/drivers/tty/sysrq.c
>> +++ b/drivers/tty/sysrq.c
>> @@ -634,6 +634,7 @@ EXPORT_SYMBOL(handle_sysrq);
>>   #ifdef CONFIG_INPUT
>>   static int sysrq_reset_downtime_ms;
>> +static unsigned short alternative_sysrq_key = KEY_F10;
>>   /* Simple translation table for the SysRq keys */
>>   static const unsigned char sysrq_xlate[KEY_CNT] =
>> @@ -653,6 +654,7 @@ struct sysrq_state {
>>       unsigned int alt_use;
>>       unsigned int shift;
>>       unsigned int shift_use;
>> +    unsigned short sys
> 
> That line appears to need an ending ';'.
> Or maybe that line was truncated since 'sys' isn't used anywhere in this patch.
> 
>>       bool active;
>>       bool need_reinject;
>>       bool reinjecting;
>> @@ -802,10 +804,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct 
>> *work)
>>           /* Simulate press and release of Alt + SysRq */
>>           input_inject_event(handle, EV_KEY, alt_code, 1);
>> -        input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
>> +        input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 1);
>>           input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>> -        input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
>> +        input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 0);
>>           input_inject_event(handle, EV_KEY, alt_code, 0);
>>           input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>> @@ -845,6 +847,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>>               sysrq->shift = code;
>>           break;
>> +key_sysrq:
>>       case KEY_SYSRQ:
>>           if (value == 1 && sysrq->alt != KEY_RESERVED) {
>>               sysrq->active = true;
>> @@ -867,11 +870,15 @@ static bool sysrq_handle_keypress(struct sysrq_state 
>> *sysrq,
>>            * triggering print screen function.
>>            */
>>           if (sysrq->active)
>> -            clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
>> +            clear_bit(sysrq->sysrq_key, sysrq->handle.dev->key);
>>           break;
>>       default:
>> +        /* handle non-default sysrq key */
>> +        if (code == sysrq->sysrq_key)
>> +            goto key_sysrq;
>> +
>>           if (sysrq->active && value && value != 2) {
>>               unsigned char c = sysrq_xlate[code];
>> @@ -970,6 +977,14 @@ static int sysrq_connect(struct input_handler *handler,
>>       sysrq->handle.private = sysrq;
>>       timer_setup(&sysrq->keyreset_timer, sysrq_do_reset, 0);
>> +    if (test_bit(KEY_SYSRQ, dev->keybit)) {
>> +        sysrq->sysrq_key = KEY_SYSRQ;
>> +        pr_info("%s: using default sysrq key [%x]\n", dev->name, KEY_SYSRQ);
>> +    } else {
>> +        sysrq->sysrq_key = alternative_sysrq_key;
>> +        pr_info("%s: Using alternative sysrq key: [%x]\n", dev->name, 
>> sysrq->sysrq_key);
>> +    }
>> +
>>       error = input_register_handle(&sysrq->handle);
>>       if (error) {
>>           pr_err("Failed to register input sysrq handler, error %d\n",
>> @@ -1078,6 +1093,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, 
>> sysrq_reset_seq,
>>   module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>> +module_param(alternative_sysrq_key, ushort, 0644);
>> +MODULE_PARM_DESC(alternative_sysrq_key,
>> +    "Alternative SysRq key for input devices that don't have SysRq key. F10 
>> by default.\n"
>> +    "Example\n"
>> +    "Using F9 as SysRq:\n"
>> +    "sysrq.alternative_sysrq_key=0x43\n");
>> +
>>   #else
>>   static inline void sysrq_register_handler(void)
>>
> 
> 


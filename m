Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA3E219A94
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGIIPf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 04:15:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55606 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgGIIPf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 04:15:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 3ECFB2A6173
Subject: Re: [PATCH] tty/sysrq: Add alternative SysRq key
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
References: <20200511180145.GU89269@dtor-ws>
 <20200619162819.715-1-andrzej.p@collabora.com>
 <20200709050538.GG3273837@dtor-ws>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <ceb64085-5fff-f4c8-a2e5-ea9e1a7329bf@collabora.com>
Date:   Thu, 9 Jul 2020 10:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709050538.GG3273837@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

W dniu 09.07.2020 o 07:05, Dmitry Torokhov pisze:
> Hi Andrzej,
> 
> On Fri, Jun 19, 2020 at 06:28:19PM +0200, Andrzej Pietrasiewicz wrote:
>> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>>
>> This patch allows configuring an alternative key to act as SysRq. Devices
>> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
>> but other devices use the alternative SysRq key instead, by default F10.
>> Which key is actually used can be modified with sysrq's module parameter.
> 
> I guess you will be removing KEY_SYSRQ form all Chrome OS internal AT
> keyboards and external USB keyboard with Chrome OS layouts as well? Via
> udev keymap? I suppose this could work... Or have a per device setting
> as we allocate a separate handle for each input device attached to the
> SysRq handler.
> 

To me it makes most sense to have the decision taken per each input
device - if it is capable of providing KEY_SYSRQ, then it is used,
otherwise the alternative is taken.

The question is how to provide this information at ->connect() time.

Ideally chromebook's keyboard should be modelled in such a way that
it reflects reality. And the reality is that chromebooks probably
declare they use full AT PS/2 keyboard even though they have less keys.

It is unclear to me whether it makes sense to struggle to better
reflect actual keys repertoire at the kernel level. If udev's keymap
can be used, that should do. Now, are we able to guarantee that the
modification of the keyboard layout happens before the sysrq handler
is matched against the keyboard?

Andrzej

>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
>>   1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
>> index 0dc3878794fd..e1d271c84746 100644
>> --- a/drivers/tty/sysrq.c
>> +++ b/drivers/tty/sysrq.c
>> @@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
>>   
>>   #ifdef CONFIG_INPUT
>>   static int sysrq_reset_downtime_ms;
>> +static unsigned short alternative_sysrq_key = KEY_F10;
>>   
>>   /* Simple translation table for the SysRq keys */
>>   static const unsigned char sysrq_xlate[KEY_CNT] =
>> @@ -621,6 +622,7 @@ struct sysrq_state {
>>   	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
>>   	unsigned int alt;
>>   	unsigned int alt_use;
>> +	unsigned short sysrq_key;
>>   	bool active;
>>   	bool need_reinject;
>>   	bool reinjecting;
>> @@ -770,10 +772,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>>   
>>   		/* Simulate press and release of Alt + SysRq */
>>   		input_inject_event(handle, EV_KEY, alt_code, 1);
>> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
>> +		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 1);
>>   		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>>   
>> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
>> +		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 0);
>>   		input_inject_event(handle, EV_KEY, alt_code, 0);
>>   		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>>   
>> @@ -805,6 +807,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>>   		}
>>   		break;
>>   
>> +key_sysrq:
>>   	case KEY_SYSRQ:
>>   		if (value == 1 && sysrq->alt != KEY_RESERVED) {
>>   			sysrq->active = true;
>> @@ -825,11 +828,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>>   		 * triggering print screen function.
>>   		 */
>>   		if (sysrq->active)
>> -			clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
>> +			clear_bit(sysrq->sysrq_key, sysrq->handle.dev->key);
>>   
>>   		break;
>>   
>>   	default:
>> +		/* handle non-default sysrq key */
>> +		if (code == sysrq->sysrq_key)
>> +			goto key_sysrq;
>> +
>>   		if (sysrq->active && value && value != 2) {
>>   			sysrq->need_reinject = false;
>>   			__handle_sysrq(sysrq_xlate[code], true);
>> @@ -924,6 +931,14 @@ static int sysrq_connect(struct input_handler *handler,
>>   	sysrq->handle.private = sysrq;
>>   	timer_setup(&sysrq->keyreset_timer, sysrq_do_reset, 0);
>>   
>> +	if (test_bit(KEY_SYSRQ, dev->keybit)) {
>> +		sysrq->sysrq_key = KEY_SYSRQ;
>> +		pr_info("%s: using default sysrq key [%x]\n", dev->name, KEY_SYSRQ);
>> +	} else {
>> +		sysrq->sysrq_key = alternative_sysrq_key;
>> +		pr_info("%s: Using alternative sysrq key: [%x]\n", dev->name, sysrq->sysrq_key);
>> +	}
> 
> This is way too noisy IMO.
> 
>> +
>>   	error = input_register_handle(&sysrq->handle);
>>   	if (error) {
>>   		pr_err("Failed to register input sysrq handler, error %d\n",
>> @@ -1032,6 +1047,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
>>   
>>   module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>>   
>> +module_param(alternative_sysrq_key, ushort, 0644);
>> +MODULE_PARM_DESC(alternative_sysrq_key,
>> +	"Alternative SysRq key for input devices that don't have SysRq key. F10 by default.\n"
>> +	"Example\n"
>> +	"Using F9 as SysRq:\n"
>> +	"sysrq.alternative_sysrq_key=0x43\n");
>> +
>>   #else
>>   
>>   static inline void sysrq_register_handler(void)
>>
>> base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
>> -- 
>> 2.17.1
>>
> 


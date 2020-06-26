Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFA120B0EB
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 13:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgFZLvd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 07:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgFZLvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 07:51:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC46EC08C5DB;
        Fri, 26 Jun 2020 04:51:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 836812A0056
Subject: Re: [PATCH] tty/sysrq: Add alternative SysRq key
To:     Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@collabora.com
References: <20200511180145.GU89269@dtor-ws>
 <20200619162819.715-1-andrzej.p@collabora.com>
 <7c61ac4d-959f-0069-d1db-7e1ba646ac64@suse.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <32cbe134-52fb-1478-95d9-fceadbda2177@collabora.com>
Date:   Fri, 26 Jun 2020 13:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7c61ac4d-959f-0069-d1db-7e1ba646ac64@suse.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

W dniu 22.06.2020 o 08:24, Jiri Slaby pisze:
> On 19. 06. 20, 18:28, Andrzej Pietrasiewicz wrote:
>> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>>
>> This patch allows configuring an alternative key to act as SysRq. Devices
>> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
>> but other devices use the alternative SysRq key instead, by default F10.
>> Which key is actually used can be modified with sysrq's module parameter.
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
> 
> I would go for sysrq_alternative_key to preserve the namespace naming.
> 
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
> 
> Capital U, lowercase u above. Do we want to print the info in the
> default case, actually?
> 
>> +	}
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
> 
> If you line-break here, I suggest adding a \t or two to the beginning of
> the following lines:
> 
>> +	"Example\n"
>> +	"Using F9 as SysRq:\n"
>> +	"sysrq.alternative_sysrq_key=0x43\n");
> 
> The last \n is superfluous, there would be an empty line.
> 
> Looking at emulate_raw in drivers/tty/vt/keyboard.c, you seem you need
> to update that one as well. Otherwise raw keyboard mode won't send sysrq
> sequence, when you press it, right?
> 

The way I understand the input subsystem kbd_handler and sysrq_handler are
independent. The purpose of the former is to provide keystrokes to the
(current) terminal, while the purpose of the latter is to execute predefined
actions when specific key combinations are pressed. What is more,
the sysrq_handler is actually a filter and when one of its actions is triggered
then the corresponding keystrokes are filtered-out.

Regards,

Andrzej

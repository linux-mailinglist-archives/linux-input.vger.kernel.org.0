Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1D1AAA9A
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392280AbgDOOod (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 10:44:33 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18220 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392245AbgDOOo3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 10:44:29 -0400
IronPort-SDR: yiWJWg5fstJaeCye+jYrwi2XmdAkUNvBpEGfPcGZw9gPJIUGopRumkvODChgpYBGMtUMq9kk7o
 AVr3B+xFk+JInmnu9TSqmduXw/uIoeOQKyS9ZQqj7th/A4/3QK8yi2kudpGmtuwe/qylGbbmOy
 ajFBnFi4NYYvvf8m1b8TN1HwZT6zJsGbVfjtgpdPLy2hEAPwb/4ZEM3M5nwhpKpyWNldLBiuBw
 LAe6sDaf7sQY6BDavNqqjaPJcVKRR7zW0oPZ3xjaUxPrSqEHdtY8BpkhtXNg3oNRb4NONZQvZN
 vic=
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="47787672"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 15 Apr 2020 06:44:26 -0800
IronPort-SDR: 9uYF7mvROwVlcLs7KlWHLGDv79hxkktKn1BClQTMOeVnCk2ipA8zY0UhfMJuwLEwpAErYMOw2Y
 Dd+KcymEdj4Ca97QL65oZTzpU4bFzqWsJdWUCLwtNlMR1WKykYHs2EUvu0UsbZWypIQPza+Y0m
 q4w/mtToGGWFo1tjc6jDzv7+QViR/ig/Dn+ghwLWzcSvcooZze/4EveX1EoWm6bEojEM8oaSLS
 gYcP65YhgBJ1TjPKVHBkaIheuW9B4b7zF6nr1xIkXQL+J6g4e5JGQjakM1HHVpb+EL949ZsB0S
 nnU=
Subject: Re: [PATCH v10 31/55] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-32-jiada_wang@mentor.com>
 <46e0b0cf-63f1-4b46-dc3e-0e6610e72d75@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <75f81c9a-e5ca-1382-43c9-8fd4acc36510@mentor.com>
Date:   Wed, 15 Apr 2020 23:44:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <46e0b0cf-63f1-4b46-dc3e-0e6610e72d75@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/04/11 7:38, Dmitry Osipenko wrote:
> 31.03.2020 13:50, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> The path of enabling the IRQ in the probe function is not safe in level
>> triggered operation, if it was already powered up and there is a message
>> waiting on the device (eg finger down) because the object table has not yet
>> been read. This forces the ISR into a hard loop.
>>
>> Delay enabling the interrupt until it is first needed.
> 
> 
>>
>> -	if (data->use_retrigen_workaround) {
>> +		/* Presence of data->irq means IRQ initialised */
>> +		data->irq = data->client->irq;
> 
> IIRC, IRQ=0 could be a valid interrupt since this is a "virtual"
> interrupt number.
> 
> ...
>>   	init_completion(&data->chg_completion);
>> @@ -3826,26 +3842,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   		return error;
>>   	}
> 
> What about just to tell the IRQ core not to enable the interrupt
> handling during of the devm_request_threaded_irq()?
> 
> To achieve that, add this line here:
> 
> 	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
> 
>> -	error = devm_request_threaded_irq(&client->dev, client->irq,
>> -					  NULL, mxt_interrupt, IRQF_ONESHOT,
>> -					  client->name, data);
> ...
> 
> Then the interrupt will be requested in the disabled state and it will
> be enabled only after the first enable_irq() invocation.
> 
thanks, I think your solution makes more sense,
I will replace with your suggested solution in next version

Thanks,
Jiada

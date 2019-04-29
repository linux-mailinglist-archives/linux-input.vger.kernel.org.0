Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC1CE634
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbfD2PXz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 11:23:55 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:50602 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728472AbfD2PXu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 11:23:50 -0400
Received: from [192.168.178.170] (pD95EFAD5.dip0.t-ipconnect.de [217.94.250.213])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 97DDF2A9DB0;
        Mon, 29 Apr 2019 15:21:48 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] input: touch: eeti: move ISR code to own function
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20190429063038.17773-1-daniel@zonque.org>
 <20190429073023.GA191900@dtor-ws>
From:   Daniel Mack <daniel@zonque.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel@zonque.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4eada3ca-66e7-0fc3-73af-57069cf1bf5f@zonque.org>
Date:   Mon, 29 Apr 2019 17:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190429073023.GA191900@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29/4/2019 9:30 AM, Dmitry Torokhov wrote:
> On Mon, Apr 29, 2019 at 08:30:37AM +0200, Daniel Mack wrote:
>> Move the ISR handling code to its own function and change the logic to bail
>> immediately in case of .running is false or if the attn_gpio is available
>> but unasserted.
>>
>> This allows us to call the function at any time to check for the state of
>> attn_gpio.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>> v3: break out at the end of the loop for setups with !eeti->attn_gpio
>>
>>  drivers/input/touchscreen/eeti_ts.c | 33 ++++++++++++++++++++---------
>>  1 file changed, 23 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
>> index 7fe41965c5d1..67c54413ad2b 100644
>> --- a/drivers/input/touchscreen/eeti_ts.c
>> +++ b/drivers/input/touchscreen/eeti_ts.c
>> @@ -75,14 +75,19 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
>>  	input_sync(eeti->input);
>>  }
>>  
>> -static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
>> +static void eeti_ts_read(struct eeti_ts *eeti)
>>  {
>> -	struct eeti_ts *eeti = dev_id;
>> -	int len;
>> -	int error;
>> +	int len, error;
>>  	char buf[6];
>>  
>> -	do {
>> +	for (;;) {
>> +		if (!eeti->running)
>> +			break;
>> +
>> +		if (eeti->attn_gpio &&
>> +		    gpiod_get_value_cansleep(eeti->attn_gpio) == 0)
>> +			break;
>> +
> 
> This became a bit messy IMO. Maybe we should define eeti_ts_read as only
> the code below (up to while) and from resume do:

You're right, that's cleaner. v4 coming up.

Thanks again!
Daniel

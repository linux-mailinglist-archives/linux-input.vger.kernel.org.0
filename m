Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948EB4FA6B6
	for <lists+linux-input@lfdr.de>; Sat,  9 Apr 2022 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241146AbiDIKLK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Apr 2022 06:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238771AbiDIKLJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Apr 2022 06:11:09 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BC4208331
        for <linux-input@vger.kernel.org>; Sat,  9 Apr 2022 03:09:01 -0700 (PDT)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id 3DA221BF203;
        Sat,  9 Apr 2022 10:08:57 +0000 (UTC)
MIME-Version: 1.0
Date:   Sat, 09 Apr 2022 12:08:57 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] input: adc-joystick: Stop using scan_index for reading
 data
In-Reply-To: <YlDqTKuo5rbkIL8V@google.com>
References: <20220408212857.9583-1-macroalpha82@gmail.com>
 <YlDqTKuo5rbkIL8V@google.com>
Message-ID: <2941de6570a6f808d6ea6e71d137ef87@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris & Dmitry,

On 2022-04-09 04:07, Dmitry Torokhov wrote:
> Hi Chris,
> 
> On Fri, Apr 08, 2022 at 04:28:57PM -0500, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>> 
>> For my Odroid Go Advance I noticed that the adc-joystick driver was
>> only reporting the y channel and on the x axis. After debugging, I
>> found that the driver was trying to read values from channels 0 and
>> 1 even though my device is using channels 1 and 2. By changing the 
>> code
>> to use the axis index instead of the scan index when unpacking the 
>> data
>> from the buffer, the joystick begins working as expected.
> 
> This sounds like some sort of misconfiguration, as your change
> effectively removes the ability of using just some ADC channels for
> joystick functionality...

I agree, this sounds like either a case of misconfiguration, or an issue 
in the ADC driver that this device is using.
The axis index corresponds to the iio channel associated with the 
joystick, but NOT to the order at which data is sampled by ADC.
That's why each channel has a `scan_index` field. It sounds like in 
Chris' case the channels have wrong scan indices.
I'd start by verifying that in the ADC driver that is being used.

In any case, this patch is wrong and removes functionality that existing 
devices depend on.

Cheers,
Artur

> 
> Let's add Jonathan and Arthur for their take on this.
> 
>> 
>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> ---
>>  drivers/input/joystick/adc-joystick.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/input/joystick/adc-joystick.c 
>> b/drivers/input/joystick/adc-joystick.c
>> index 78ebca7d400a..fe3bbd0d4566 100644
>> --- a/drivers/input/joystick/adc-joystick.c
>> +++ b/drivers/input/joystick/adc-joystick.c
>> @@ -32,24 +32,23 @@ static int adc_joystick_handle(const void *data, 
>> void *private)
>>  {
>>  	struct adc_joystick *joy = private;
>>  	enum iio_endian endianness;
>> -	int bytes, msb, val, idx, i;
>> +	int bytes, msb, val, i;
>>  	const u16 *data_u16;
>>  	bool sign;
>> 
>>  	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
>> 
>>  	for (i = 0; i < joy->num_chans; ++i) {
>> -		idx = joy->chans[i].channel->scan_index;
>>  		endianness = joy->chans[i].channel->scan_type.endianness;
>>  		msb = joy->chans[i].channel->scan_type.realbits - 1;
>>  		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
>> 
>>  		switch (bytes) {
>>  		case 1:
>> -			val = ((const u8 *)data)[idx];
>> +			val = ((const u8 *)data)[i];
>>  			break;
>>  		case 2:
>> -			data_u16 = (const u16 *)data + idx;
>> +			data_u16 = (const u16 *)data + i;
>> 
>>  			/*
>>  			 * Data is aligned to the sample size by IIO core.
>> --
>> 2.25.1
>> 
> 
> Thanks.

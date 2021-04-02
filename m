Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF06352D3C
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhDBPXW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 11:23:22 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:36169 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbhDBPXW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 11:23:22 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id SLdmlmMJ3LwkNSLdmleqO8; Fri, 02 Apr 2021 17:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617376999; bh=Zjgzub5UB8H8XQ9V4GX5bcr4pkotkNmq2kr2buL9Beg=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=X+qGZbDU9Q6w7LxLKkxe5wTWsTbkLVJZuooXOA+BodQ15Is0JLWXkXX/88gINGyzm
         S7Ur8zROubQakL0IE3GptcbYyzHBkQn1FzxmUuAUX53zq501EFeqmc+V/m7r1FImfn
         MlAZ4dUSALlA8hyN14yJo3xi0gDdv63FXIqTcsm/yjAA7xjg/Moq4GfNkN3mz6n5d/
         NEoPHCl1wkIfUhNhUm64Ui0gwCeI81XW3p7IEEILKVR+EZQYOlfAtFvPHs4pAl+oCB
         aHYFOMCvDUrNarcWfvRuPZmsxDE3O/adte1rzIGFYO2jMaeeCgN5XrZAfohJJobZWy
         OLlox5yKa5QCw==
Subject: Re: [PATCH v2 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
 <20210401230358.2468618-4-giulio.benetti@benettiengineering.com>
 <YGbc7Qbu6s659Mx4@latitude>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a4a060a1-8cf3-71f8-9f4a-498870a9cb53@benettiengineering.com>
Date:   Fri, 2 Apr 2021 17:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGbc7Qbu6s659Mx4@latitude>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfP0ZAjh3bi9ubFRtnjZE8kNgc6hXya9iP7Jl3K/EySvUDaWVVPU0Dx06B+pTmj0O83bOb72Isk0TMjZIeRHYRKgVDaK9J7C8eSVnJLmDxMnsi6xIZ6aL
 gpSVT1Cs6g6Ji8tQVdRRu/8rE2StHnfe1TKGJWwuMQQpI8Oj1R65ApOIIX317tPE8zjKwApmUxDxUbhkNEUokNxdK1LK3Q0Ez+QdSg3QnKHSSGdu2kjMWMhe
 4mQhKd02sTfhFDG1h/9tKn1U0fqUzLp+tunyvWmNxgYz7S2G9CMzabtvhwDIYd7oDorYp+yu1nBRYIKL+lM7EtOJBEsXzdmP84StLcVB9Mr9V0n1trMPyZbH
 Bs3i14B3ZDM9Tyuhvoo7vPy2P4HIg0zoQPGfxe8RAqCcANp9I24AUhm9/VQ5y/him10NG7SJqLEfYxq8jKeA2tQqSIO9C2PMJNqJn5DIOAmfYhms1Fk=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

On 4/2/21 10:59 AM, Jonathan Neuschäfer wrote:
> Hi,
> 
> a few remarks below.
> 
> On Fri, Apr 02, 2021 at 01:03:58AM +0200, Giulio Benetti wrote:
>> This patch adds support for Hycon HY46XX.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * removed proximity-sensor-switch property according to previous patch
>> As suggested by Dmitry Torokhov
>> * moved i2c communaction to regmap use
>> * added macro to avoid magic number
>> * removed cmd variable that could uninitiliazed since we're using regmap now
>> * removed useless byte masking
>> * removed useless struct hycon_hy46xx_i2c_chip_data
>> * used IRQF_ONESHOT only for isr
>> ---
> 
> 
>> +config TOUCHSCREEN_HYCON_HY46XX
>> +	tristate "Hycon hy46xx touchscreen support"
>> +	depends on I2C
>> +	help
>> +	  Say Y here if you have a touchscreen using Hycon hy46xx,
>> +	  or something similar enough.
> 
> The "something similar enough" part doesn't seem relevant, because the
> driver only lists HY46xx chips (in the compatible strings), and no chips
> that are similar enough to work with the driver, but have a different
> part number.

Right

>> +static void hycon_hy46xx_get_defaults(struct device *dev, struct hycon_hy46xx_data *tsdata)
>> +{
>> +	bool val_bool;
>> +	int error;
>> +	u32 val;
>> +
>> +	error = device_property_read_u32(dev, "threshold", &val);
> 
> This seems to follow the old version of the binding, where
> Hycon-specific properties didn't have the "hycon," prefix.
> Please check that the driver still works with a devicetree that follows
> the newest version of the binding.

Ah yes, I've forgotten it while changing in bindings.

>> +MODULE_AUTHOR("Giulio Benetti <giulio.benetti@micronovasrl.com>");
> 
> This is a different email address than you used in the DT binding. If
> this is intentional, no problem (Just letting you know, in case it's
> unintentional).

I've missed that

> 
> Thanks,
> Jonathan Neuschäfer
> 

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

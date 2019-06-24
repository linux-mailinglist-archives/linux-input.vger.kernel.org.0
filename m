Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E7350B34
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 14:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfFXM4i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 08:56:38 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:34046 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbfFXM4h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 08:56:37 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 6243EA3CE0;
        Mon, 24 Jun 2019 14:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1561380995;
        bh=ftLh3jjn96azi7D40yoVAcACOsELxiOylqDXhJNBYqY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F+cz7D0qNH+OMabqAaPEpFg2lOv2GVExnUwmrt73hWRux1wg4tQh8+CHFieEu6OKx
         MnWRAJFsGjVXN0Gwp9/KEsjRgt6qQWm56YgkZlqpJj8/pSve1i8mK3LqqmIzHzKvXE
         ACGqMio9jTjkklnaeoHDudWKXgSjVbgBO4bzkm0w=
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: input: Add support for the MPR121
 without interrupt line
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <1558098773-47416-2-git-send-email-michal.vokac@ysoft.com>
 <20190613223945.GA938@bogus>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <69302603-f1a3-8955-7d90-74a290071794@ysoft.com>
Date:   Mon, 24 Jun 2019 14:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190613223945.GA938@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 14. 06. 19 0:39, Rob Herring wrote:
> On Fri, May 17, 2019 at 03:12:50PM +0200, Michal Vokáč wrote:
>> Normally, the MPR121 controller uses separate interrupt line to notify
>> the I2C host that a key was touched/released. To support platforms that
>> can not use the interrupt line, polling of the MPR121 registers can be
>> used.
> 
> 'separate' from what?

"Separate" here is meant like "additional to the standard set of SCL
and SDA I2C lines". Looks like inappropriately used word by
a non-native speaker that can be omitted.

>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>> Changes since v1:
>> - Document the polled binding in the original file, do not create a new one.
>>    (Rob)
>>
>>   Documentation/devicetree/bindings/input/mpr121-touchkey.txt | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
>> index b7c61ee5841b..97f55273d473 100644
>> --- a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
>> +++ b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
>> @@ -1,9 +1,14 @@
>> -* Freescale MPR121 Controllor
>> +* Freescale MPR121 Controller
>>   
>>   Required Properties:
>> -- compatible:		Should be "fsl,mpr121-touchkey"
>> +- compatible:		Should be one of:
>> +			- "fsl,mpr121-touchkey" - MPR121 with interrupt line
>> +			- "fsl,mpr121-touchkey-polled" - MPR121 with polling
>>   - reg:			The I2C slave address of the device.
>>   - interrupts:		The interrupt number to the cpu.
>> +			In case of "fsl,mpr121-touchkey-polled" the interrupt
>> +			line is not used and hence the interrupts property is
>> +			not required.
> 
> Absence of the interrupts property is enough to determine polled mode
> and you don't need a separate compatible string.

Would not this work only if the polled mode was implemented as
part of the current driver? I raised this question in the cover letter.
I do not really know how this should be done.

So I implemented the polled mode in a new driver (taking the
gpio-keys-polled as an example). Having separate compatible string is
the only option I know of to match the right driver.

Anyway, Dmitry already commented that his addition of input_polled_dev
for creating polled input devices was not the best choice. He would
rather like to implement polling mode for all regular input devices
and that would allow to enable polling mode in existing drivers.

Since I do not know how to help with that work I am stuck with the
separate driver/compatible string solution.

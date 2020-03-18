Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B89189C7A
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 14:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCRNCv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 09:02:51 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:23793 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRNCv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 09:02:51 -0400
IronPort-SDR: VN2W5FDW5IzeIApCYsQpKfsEb9uaG+u+Mu2F3u4+xj6myHXB7ISHEGBwp6XBYzcC2ze7mt6XbU
 oOjoGUiYwtRbIW1gUvilsBg715TCMT/3cNPcV5rJ3dvZbViAO65rhje/9d5f3y0vJR0xD+KkDD
 8ijjjyVwAHKGE+LA1r/3xSl8WwjsBXiDdwkv+/fQ2ijkHo0sx71AGz9JZtfuw9D63/bw5MvCz9
 prlRGDpf7AZYTqjMzHCG0Sgc776UC0e9r8GkIRf45RszzSA3EuFGyyYfPF7RYdo+dJG6Rf5ykr
 H94=
X-IronPort-AV: E=Sophos;i="5.70,567,1574150400"; 
   d="scan'208";a="48803579"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 18 Mar 2020 05:02:50 -0800
IronPort-SDR: VOewRTdBF2YEGobwY6tYStdtlGoMq4v9FtnEeJskrsApWCEBGxSF6H1rCOwuBx/STrJDy9a27P
 EP0qvFfF3O2UIoi/y+GqslvgEhMk+tJGEi4Mmi79UypYOeJw7vrJdQvQVO+VozbhFn0IIfGDTN
 6CJcMgEpJ4+iix3DA0w7EoTQhnUrVXmXrYHcXMjO6fjeY01D1/ip8rxVmjuCZ2+QoNIpIXcR52
 3tiMEmc3eolg6ArjYINFE1qPHi9EaKysY3vrt74x/PNjHQDypo/aPyi9yOO50ICgroYeU8dogY
 Vi8=
Subject: Re: [PATCH v7 03/48] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
To:     Dmitry Osipenko <digetx@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <rydberg@bitmath.org>,
        <dmitry.torokhov@gmail.com>, <nick@shmanahar.org>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
 <20200212084218.32344-4-jiada_wang@mentor.com>
 <8ea1244b-f045-df34-b6b2-2b812ab6dee4@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <e586b057-1ec1-896e-374e-dba743709806@mentor.com>
Date:   Wed, 18 Mar 2020 22:02:36 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8ea1244b-f045-df34-b6b2-2b812ab6dee4@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/03/18 7:44, Dmitry Osipenko wrote:
> 12.02.2020 11:41, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> The workaround of reading all messages until an invalid is received is a
>> way of forcing the CHG line high, which means that when using
>> edge-triggered interrupts the interrupt can be acquired.
>>
>> With level-triggered interrupts the workaround is unnecessary.
>>
>> Also, most recent maXTouch chips have a feature called RETRIGEN which, when
>> enabled, reasserts the interrupt line every cycle if there are messages
>> waiting. This also makes the workaround unnecessary.
>>
>> Note: the RETRIGEN feature is only in some firmware versions/chips, it's
>> not valid simply to enable the bit.
> 
> ...
>> +static int mxt_check_retrigen(struct mxt_data *data)
>> +{
>> +	struct i2c_client *client = data->client;
>> +	int error;
>> +	int val;
>> +
>> +	data->use_retrigen_workaround = false;
>> +
>> +	if (irq_get_trigger_type(data->irq) & IRQF_TRIGGER_LOW)
>> +		return 0;
>> +
>> +	if (data->T18_address) {
>> +		error = __mxt_read_reg(client,
>> +				       data->T18_address + MXT_COMMS_CTRL,
>> +				       1, &val);
>> +		if (error)
>> +			return error;
>> +
>> +		if (val & MXT_COMMS_RETRIGEN)
>> +			return 0;
>> +	}
>> +
>> +	dev_warn(&client->dev, "Enabling RETRIGEN workaround\n");
>> +	data->use_retrigen_workaround = true;
>> +	return 0;
>> +}
> 
> Hello Jiada,
> 
> I'm seeing "Enabling RETRIGEN workaround" message with the following
> device-tree entry:
> 
> touchscreen@4c {
> 	compatible = "atmel,maxtouch";
> 	reg = <0x4c>;
> 
> 	interrupt-parent = <&gpio>;
> 	interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;
> 
> 	reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
> };
> 
> This happens because data->irq is NULL. Please fix it, thanks in advance.
Thanks for reporting this issue,
I will fix this issue in v8 patch-set

Thanks,
Jiada
> 

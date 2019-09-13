Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E19BB2775
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 23:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbfIMVpu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Sep 2019 17:45:50 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42477 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730990AbfIMVpu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Sep 2019 17:45:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C72AB21C39;
        Fri, 13 Sep 2019 17:45:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 13 Sep 2019 17:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=subject:to:cc:references:from:message-id
        :date:mime-version:in-reply-to:content-type
        :content-transfer-encoding; s=fm1; bh=I5KYFSSfB4WK2rrNM9kVDaLOfX
        vwrxisel5lvyCFyjY=; b=dBO2ZaWcH4b2o4/H5w7CFZxsfhZngszuT1tRyHIp1g
        +Tgo6BqwYStcsXS0NUmuNhUrJxBNMHW8kzk5W5SrGeyzWNcTNtWHymmLi0goDVtN
        NqCXvkroqxFDgfUvWS9FfdCtIhrrzI/yGbJ28ZUIzHlhFV8aNUQh8gJ8nuQzhAWD
        NI+o7i95XVG0oOToyP42DzLq12fdjq5+mRmDMZLq8SE4v/TmmQPrvTBYZhwx8BWU
        1JH/2wHsXGO22dTNOwQsHEC7Zpy2sbaQ0dtRjZ3gQsfQgxqMWwEWiSh0vpA5NJqA
        2Sfl2597+lVLriggCt4uiHTd62Xh5w2kItyBbOZOoA6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=I5KYFSSfB4WK2rrNM9kVDaLOfXvwrxisel5lvyCFy
        jY=; b=XfAkFq8qCqzv2od14xY8ZjZJpEzooNcMQZ/NfQ6rHNaxBb6kia1IsYwDi
        bT9pXG4g+Enj05qQs+hG3JfWeaauhMeS7g/qAu5+SMj8v4i78VRxvvYwgjqDHHHi
        MmzqTGSQ6zBmWaHpjdnHMzQtUV9jolC4BmmXwuTmxTINVBFY8QBBpWhNN4kP+jqq
        QdIh+tqL1CxAt+mrh8YTdDJL6Cc2c7uVclJwRCL9gsPDNVT0ykZw+NLerNT8xdxC
        pP2A6QFWZIboFVVMxDCm4/Ph1FK8eFeuLP7lu6m+6t2kV8cS65/vAc79BK1LFSZR
        GQV6D4Z5z6kLSpPkEnh7hwFOyE/XQ==
X-ME-Sender: <xms:Cw58XdY_fZS2Z1Vk9nF6lv4Kj5DJXjnt1ORAoYVlKThjVq7Jb-PDmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdejgdduieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheprfgvughr
    ohcugggrnhiivghllhgruceophgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomh
    eqnecukfhppedukeegrddugeehrddufedtrdegjeenucfrrghrrghmpehmrghilhhfrhho
    mhepphgvughrohesphgvughrohhvrghniigvlhhlrgdrtghomhenucevlhhushhtvghruf
    hiiigvpedt
X-ME-Proxy: <xmx:Cw58XZFZhZyEE1FfKODeAmyWMjQSoco98Sz_7xybwYYgPfC-qj505Q>
    <xmx:Cw58XX1LXP5yBHYDhZcM9TVTuYNCfzl-poTXEx5uqaZO126EB1lB2Q>
    <xmx:Cw58XfaeDWkhyWSjt-npZ8RlhvYPkMjyxKLU1G2K1WAH_qlgDRQg1w>
    <xmx:DA58Xd9rO8cYbbSXnN7DFy7XqMXQgftx7LKxLpa9bOPnPzYHh88i4A>
Received: from [192.168.2.43] (toroon020aw-lp130-01-184-145-130-47.dsl.bell.ca [184.145.130.47])
        by mail.messagingengine.com (Postfix) with ESMTPA id E618280064;
        Fri, 13 Sep 2019 17:45:46 -0400 (EDT)
Subject: Re: [PATCH v5] hid-logitech-hidpp: read battery voltage from newer
 devices
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
References: <20190831175659.7404-1-pedro@pedrovanzella.com>
 <80785df1c804796a01bbfbae4b2aeda66f30d7c5.camel@archlinux.org>
From:   Pedro Vanzella <pedro@pedrovanzella.com>
Message-ID: <cb3e7c8f-b8f9-7a59-d358-8682625e4adf@pedrovanzella.com>
Date:   Fri, 13 Sep 2019 17:45:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <80785df1c804796a01bbfbae4b2aeda66f30d7c5.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/9/19 8:00 AM, Filipe Laíns wrote:
> On Sat, 2019-08-31 at 13:56 -0400, Pedro Vanzella wrote:
>> +static int hidpp20_battery_map_status_voltage(u8 data[3], int
>> *voltage)
>> +{
>> +	int status;
>> +
>> +	switch (data[2]) {
>> +	case 0x00: /* discharging */
>> +		status = POWER_SUPPLY_STATUS_DISCHARGING;
>> +		break;
>> +	case 0x10: /* wireless charging */
>> +	case 0x80: /* charging */
>> +		status = POWER_SUPPLY_STATUS_CHARGING;
>> +		break;
>> +	case 0x81: /* fully charged */
>> +		status = POWER_SUPPLY_STATUS_FULL;
>> +		break;
>> +	default:
>> +		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
>> +	}
>> +
>> +	*voltage = get_unaligned_be16(data);
>> +
>> +	return status;
>> +}
> 
> Here's the missing specification:
> 
> +--------+-------------------------------------------------------------------------+
> |  byte  |                                    2                                    |
> +--------+--------------+------------+------------+----------+----------+----------+
> |   bit  |     0..2     |      3     |      4     |     5    |     6    |     7    |
> +--------+--------------+------------+------------+----------+----------+----------+
> | buffer | chargeStatus | fastCharge | slowCharge | critical | (unused) | extPower |
> +--------+--------------+------------+------------+----------+----------+----------+
> Table 1 - battery voltage (0x1001), getBatteryInfo() (ASE 0), 3rd byte
> 
> +-------+--------------------------------------+
> | value |                meaning               |
> +-------+--------------------------------------+
> |   0   | Charging                             |
> +-------+--------------------------------------+
> |   1   | End of charge (100% charged)         |
> +-------+--------------------------------------+
> |   2   | Charge stopped (any "normal" reason) |
> +-------+--------------------------------------+
> |   7   | Hardware error                       |
> +-------+--------------------------------------+
> Table 2 - chargeStatus value
> 
> I know this is already on the 5th revision but could you please change
> hidpp20_battery_map_status_voltage() to properly handle the 3rd byte?
> Also, if you could make sure those values are properly exported via
> sysfs it would be great! We will need them for proper upower support.

Sure thing. I'll have a new patch in a few days.

Thanks for figuring that stuff out, by the way.

> 
> Sorry for not saying this in my first review. Since then I have done
> some testing and I discovered that if we want to get accurate upower
> support we will need the values exposed by the 3rd byte to be
> exported properly.
> 
> I am not sure about the endianness of chargeStatus but you can find
> that easily.
> 
> Thank you!
> Filipe Laíns
> 

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F59142C70
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2020 14:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgATNnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 08:43:41 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46937 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726626AbgATNnl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 08:43:41 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id AB6F020FBE;
        Mon, 20 Jan 2020 08:43:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 20 Jan 2020 08:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        pedrovanzella.com; h=subject:to:references:from:message-id:date
        :mime-version:in-reply-to:content-type
        :content-transfer-encoding; s=fm2; bh=SibAiAd7KR/fy3khbzYlcHHfTc
        +BnLMI3tLmysU5OEo=; b=VnJdwdbNJshVQbNM/Lk4NN9O6xQrF0V99U33Ygr/hA
        FIgMUOWs5z8nPCL3ssv2WXQaPZnK680OXbtKwolLHx4brrX3KwPJfY3ozo8QaPz7
        ErVrrXb1Gf9tXc1qhdfEDlwj1mgy6coAQI6L1lVMNvBD8eeIMcMl5BWisPnuyYZ5
        sc+NktqzkobCmJJT89GSLYD2vVMxfT0dL5eAPpujpOUYJpwFK3zxHxZGAHTq50XP
        xFSf+gZVxZzAOY+Wpi/Kheg/K1Dl+e+yuLFqReWyG7JubrgaGaMt+8AWXMyMHts6
        jQDpnzF8JVbNrJyd/zkQaGPgShX2Sn+kQ3JH1H2bsuHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=SibAiAd7KR/fy3khbzYlcHHfTc+BnLMI3tLmysU5O
        Eo=; b=Zxm2g+z7kMKIU2RK3pIkM/fGqMer2XcMjqbfZKxkKRELEKplzs1RYBybQ
        2utvkqwGh9gTZVJvpu5irYIpxeAUbv3fBO9C5FAzMRqokZlR2SMRmLNOOLjGlMIB
        cC/wxPoScrTvHAMXQ1MclmL/y0+6M4zMeLsr9AkZhs0yx4Ie+wMtrXg2gSDIXTIN
        ga8LlbmhVH6d+B0lztWRJsLhs4jm85IQq41T8UJ3PRoXShabtgO9/gwpK9mE0Q+X
        6ezBEBj8JiQ92hFTlEFEMGEA+r/hdHpEZZAFVdEUfjNsA4rXvboO0wVp1NhxnHVi
        wLpsfloyLor3+0jJw4ToWoWruuk8Q==
X-ME-Sender: <xms:iq4lXnA3jozRgEEet3xEULlDr6MXtWUupTlMtX4LROhCPr5w-rkjFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefrvggurhho
    ucggrghniigvlhhlrgcuoehpvggurhhosehpvggurhhovhgrnhiivghllhgrrdgtohhmqe
    enucfkphepvddtuddrkeejrddvtdehrddvheegnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvughrohesphgvughrohhvrghniigvlhhlrg
    drtghomh
X-ME-Proxy: <xmx:iq4lXrAyDqYw_DkbDG5CVhxvKPsUkwqtBqs3H15tYoj48-Rh8C-trA>
    <xmx:iq4lXo51wh0A2BWq5Xa5BlaFGdc3Rd3J9JbclH2FmyPvGQtDSmZfDg>
    <xmx:iq4lXg7JQQull7Fo5WsWznvZBU77UDSf2DdAKRobq34bY3UgkppJLA>
    <xmx:i64lXiue1IPSGFnkdMCLD4PSgPZQogEp_QLJ__65n4_jStvSEutjVA>
Received: from [192.168.20.6] (unknown [201.87.205.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id AC5D880061;
        Mon, 20 Jan 2020 08:43:37 -0500 (EST)
Subject: Re: [PATCH] HID: logitech-hidpp: BatteryVoltage: only read
 chargeStatus if extPower is active
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200111192419.2503922-1-lains@archlinux.org>
From:   Pedro Vanzella <pedro@pedrovanzella.com>
Message-ID: <aaca852e-cb31-2690-7f90-819ed673bacb@pedrovanzella.com>
Date:   Mon, 20 Jan 2020 10:43:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200111192419.2503922-1-lains@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/11/20 4:24 PM, Filipe Laíns wrote:
> In the HID++ 2.0 function getBatteryInfo() from the BatteryVoltage
> (0x1001) feature, chargeStatus is only valid if extPower is active.
> 
> Previously we were ignoring extPower, which resulted in wrong values.

Nice catch. Sorry for missing that the first time around.

> 
> Example:
>      With an unplugged mouse
> 
>      $ cat /sys/class/power_supply/hidpp_battery_0/status
>      Charging

Tested and it works as expected now.

> 
> This patch makes fixes that, it also renames charge_sts to flags as
> charge_sts can be confused with chargeStatus from the spec.
> 
> Spec:
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
> Signed-off-by: Filipe Laíns <lains@archlinux.org>
> ---
>   drivers/hid/hid-logitech-hidpp.c | 43 ++++++++++++++++----------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index bb063e7d48df..39a5ee0aaab0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -1256,36 +1256,35 @@ static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage,
>   {
>   	int status;
>   
> -	long charge_sts = (long)data[2];
> +	long flags = (long) data[2];
>   
> -	*level = POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> -	switch (data[2] & 0xe0) {
> -	case 0x00:
> -		status = POWER_SUPPLY_STATUS_CHARGING;
> -		break;
> -	case 0x20:
> -		status = POWER_SUPPLY_STATUS_FULL;
> -		*level = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> -		break;
> -	case 0x40:
> +	if (flags & 0x80)
> +		switch (flags & 0x07) {
> +		case 0:
> +			status = POWER_SUPPLY_STATUS_CHARGING;
> +			break;
> +		case 1:
> +			status = POWER_SUPPLY_STATUS_FULL;
> +			*level = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> +			break;
> +		case 2:
> +			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +			break;
> +		default:
> +			status = POWER_SUPPLY_STATUS_UNKNOWN;
> +			break;
> +		}
> +	else
>   		status = POWER_SUPPLY_STATUS_DISCHARGING;
> -		break;
> -	case 0xe0:
> -		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
> -		break;
> -	default:
> -		status = POWER_SUPPLY_STATUS_UNKNOWN;
> -	}
>   
>   	*charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> -	if (test_bit(3, &charge_sts)) {
> +	if (test_bit(3, &flags)) {
>   		*charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
>   	}
> -	if (test_bit(4, &charge_sts)) {
> +	if (test_bit(4, &flags)) {
>   		*charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
>   	}
> -
> -	if (test_bit(5, &charge_sts)) {
> +	if (test_bit(5, &flags)) {
>   		*level = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
>   	}
>   
> 

Tested-by: Pedro Vanzella <pedro@pedrovanzella.com>
Reviewed-by: Pedro Vanzella <pedro@pedrovanzella.com>

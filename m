Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D52B11496A
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2019 14:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfEFMSI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 May 2019 08:18:08 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:44284 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfEFMSI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 May 2019 08:18:08 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 31414A444E;
        Mon,  6 May 2019 14:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1557145084;
        bh=BG1iY/eflDP17+5L43NWdu8cKBZW9ASGCdoXdZ226OE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gdLvPXKHSzo9OjUH6H9WEvCzDCqirgb69yaL1IT1G76e8mCDCrvZeRdlJV3x+xZ0Y
         PmU+iRXyaBe01dEpVOhiqHjG14O/WqSyf9oeCQx2oQh2D8cDVBMhqgin1MIGE1V88N
         ddmgi4Gj1Tb3SGzL7AbAMI7bAM3K6dlfFGPRv/h4=
Subject: Re: [RFC PATCH 1/4] dt-bindings: input: Add support for the MPR121
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
References: <1556267420-93219-1-git-send-email-michal.vokac@ysoft.com>
 <1556267420-93219-2-git-send-email-michal.vokac@ysoft.com>
 <20190502004849.GA8232@bogus>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <8dd2efa1-0fc9-d99a-d015-323350e1abdc@ysoft.com>
Date:   Mon, 6 May 2019 14:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190502004849.GA8232@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02. 05. 19 2:48, Rob Herring wrote:
> On Fri, Apr 26, 2019 at 10:30:17AM +0200, Michal Vokáč wrote:
>> Normally, the MPR121 controller uses separate interrupt line to notify
>> the I2C host that a key was touched/released. To support platforms that
>> can not use the interrupt line, polling of the MPR121 registers can be
>> used.
> 
> Other than making the 'interrupts' property optional, that's a driver
> change, not a DT change. IOW, we shouldn't need a whole new binding.
> 

OK, I will update the existing binding instead.

Thank you,
Michal

>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>>   .../bindings/input/mpr121-touchkey-polled.txt      | 26 ++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
>>
>> diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
>> new file mode 100644
>> index 000000000000..6bb1d312614c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
>> @@ -0,0 +1,26 @@
>> +* Freescale MPR121 Controller without interrupt line
>> +
>> +Required Properties:
>> +- compatible:		Should be "fsl,mpr121-touchkey-polled"
>> +- reg:			The I2C slave address of the device.
>> +- vdd-supply:		Phandle to the Vdd power supply.
>> +- linux,keycodes:	Specifies an array of numeric keycode values to
>> +			be used for reporting button presses. The array can
>> +			contain up to 12 entries.
>> +
>> +Optional Properties:
>> +- autorepeat:		Enable autorepeat feature.
>> +
>> +Example:
>> +
>> +#include "dt-bindings/input/input.h"
>> +
>> +	touchkeys: keys@5a {
>> +		compatible = "fsl,mpr121-touchkey-polled";
>> +		reg = <0x5a>;
>> +		autorepeat;
>> +		vdd-supply = <&ldo4_reg>;
>> +		linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
>> +				<KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
>> +				<KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>> +	};
>> -- 
>> 2.1.4
>>


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7DA61B7
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 08:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfICGsB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 02:48:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34299 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfICGsB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 02:48:01 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i52bf-00046q-DR; Tue, 03 Sep 2019 08:47:59 +0200
Subject: Re: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
To:     Anson Huang <anson.huang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "ronald@innovation.ch" <ronald@innovation.ch>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <21d2e400-976a-35c3-6875-4cc0c476fdf2@pengutronix.de>
 <DB3PR0402MB391656FC3603B30300ADBF27F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <7c3b6ae3-9f22-11f8-2464-79d02ac656f3@pengutronix.de>
Date:   Tue, 3 Sep 2019 08:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB391656FC3603B30300ADBF27F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:13da
X-SA-Exim-Mail-From: o.rempel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 03.09.19 08:37, Anson Huang wrote:
> Hi, Oleksij
> 
>> On 03.09.19 16:03, Anson Huang wrote:
>>> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as system
>>> controller, the system controller is in charge of system power, clock
>>> and power key event etc. management, Linux kernel has to communicate
>>> with system controller via MU (message unit) IPC to get power key
>>> event, add binding doc for i.MX system controller power key driver.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> Changes since V1:
>>> 	- remove "wakeup-source" property, as it is NOT needed for SCU
>> interrupt;
>>> 	- remove "status" in example.
>>> ---
>>>    .../devicetree/bindings/arm/freescale/fsl,scu.txt          | 14
>> ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>> index c149fad..f93e2e4 100644
>>> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>> @@ -157,6 +157,15 @@ Required properties:
>>>    Optional properties:
>>>    - timeout-sec: contains the watchdog timeout in seconds.
>>>
>>> +Power key bindings based on SCU Message Protocol
>>> +------------------------------------------------------------
>>> +
>>> +Required properties:
>>> +- compatible: should be:
>>> +              "fsl,imx8qxp-sc-pwrkey"
>>> +              followed by "fsl,imx-sc-pwrkey";
>>> +- linux,keycodes: See
>>> +Documentation/devicetree/bindings/input/keys.txt
>>
>> linux,keycodes is required parameter. So, this kay cab be anything. Why the
>> compatible is called pwrkey? Probably it is better to call it "*-sc-key"
> 
> This key is kind of special, it is ON/OFF button which is designed for power key
> purpose, it has HW function such as long pressing it would shutdown the system power,
> so we always use it as power key, NOT general key, does it make sense?

I assume, OF devs will argue: DT is describing hardware not software.
On other hand, software will get notification about assertion/deassertion of this key. So, 
it is just normal key. If, for some reason, it will trigger world destruction, if it is 
pressed too long... probably no body cares.
You can provide fsl,imx-sc-key as additional compatible. In case linux will need some 
quirks, we still can fall back to more precise compatible "fsl,imx8qxp-sc-pwrkey".

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9657AA6270
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 09:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfICH2l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 03:28:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57229 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfICH2l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 03:28:41 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i53F1-0000LY-T2; Tue, 03 Sep 2019 09:28:39 +0200
Subject: Re: [PATCH V2 2/5] input: keyboard: imx_sc: Add i.MX system
 controller power key support
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
 <1567519424-32271-2-git-send-email-Anson.Huang@nxp.com>
 <6d8dd5df-02da-b4cd-e61d-a4a15d0bf0c8@pengutronix.de>
 <DB3PR0402MB391602C6B425DD7EBFB9AF1DF5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <dbe0ba0a-29bc-ee96-541d-244b3dbf0b81@pengutronix.de>
Date:   Tue, 3 Sep 2019 09:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB391602C6B425DD7EBFB9AF1DF5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
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



On 03.09.19 08:48, Anson Huang wrote:
> Hi, Oleksij
> 
>> On 03.09.19 16:03, Anson Huang wrote:
>>> i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
>>> inside, the system controller is in charge of controlling power, clock
>>> and power key etc..
>>>
>>> Adds i.MX system controller power key driver support, Linux kernel has
>>> to communicate with system controller via MU (message unit) IPC to get
>>> power key's status.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> Changes since V1:
>>> 	- remove "wakeup-source" property operation, scu power key uses
>> generic scu irq,
>>> 	  no need to have this property for device wakeup operation.
>>> ---
>>>    drivers/input/keyboard/Kconfig         |   7 ++
>>>    drivers/input/keyboard/Makefile        |   1 +
>>>    drivers/input/keyboard/imx_sc_pwrkey.c | 169
>> +++++++++++++++++++++++++++++++++
>>>    3 files changed, 177 insertions(+)
>>>    create mode 100644 drivers/input/keyboard/imx_sc_pwrkey.c
>>>
>>> diff --git a/drivers/input/keyboard/Kconfig
>>> b/drivers/input/keyboard/Kconfig index 2e6d288..3aaeb9c 100644
>>> --- a/drivers/input/keyboard/Kconfig
>>> +++ b/drivers/input/keyboard/Kconfig
>>> @@ -469,6 +469,13 @@ config KEYBOARD_IMX
>>>    	  To compile this driver as a module, choose M here: the
>>>    	  module will be called imx_keypad.
>>>
>>> +config KEYBOARD_IMX_SC_PWRKEY
>>> +	tristate "IMX SCU Power Key Driver"
>>> +	depends on IMX_SCU
>>> +	help
>>> +	  This is the system controller powerkey driver for NXP i.MX SoCs with
>>> +	  system controller inside.
>>
>> The KEY is configurable over devicetree, why is it called PWRKEY? It looks for
>> me as generic SCU key handler.
> 
> We always use it as power key, NOT a generic key, as it has HW function designed
> for power key purpose.

gpio-key driver is mostly used for power or reboot key. And it is still called gpio-key 
driver. If it is used for power key only, why is it configurable? I can configure it as 
KEY_ENTER or some thing different. This driver has not KEY_POWER specific any thing.

> 
>>
>>>    config KEYBOARD_NEWTON
>>>    	tristate "Newton keyboard"
>>>    	select SERIO
>>> diff --git a/drivers/input/keyboard/Makefile
>>> b/drivers/input/keyboard/Makefile index 9510325..9ea5585 100644
>>> --- a/drivers/input/keyboard/Makefile
>>> +++ b/drivers/input/keyboard/Makefile
>>> @@ -29,6 +29,7 @@ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
>>>    obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
>>>    obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
>>>    obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
>>> +obj-$(CONFIG_KEYBOARD_IMX_SC_PWRKEY)	+= imx_sc_pwrkey.o
>>>    obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
>>>    obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
>>>    obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
>>> diff --git a/drivers/input/keyboard/imx_sc_pwrkey.c
>>> b/drivers/input/keyboard/imx_sc_pwrkey.c
>>> new file mode 100644
>>> index 0000000..53aa9a4
>>> --- /dev/null
>>> +++ b/drivers/input/keyboard/imx_sc_pwrkey.c
>>> @@ -0,0 +1,169 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright 2019 NXP.
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/firmware/imx/sci.h>
>>> +#include <linux/init.h>
>>> +#include <linux/input.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#define DEBOUNCE_TIME	100
>>> +#define REPEAT_INTERVAL	60
>>> +
>>> +#define SC_IRQ_BUTTON		1
>>> +#define SC_IRQ_GROUP_WAKE	3
>>> +#define IMX_SC_MISC_FUNC_GET_BUTTON_STATUS	18
>>> +
>>> +struct imx_pwrkey_drv_data {
>>> +	int keycode;
>>> +	bool keystate;  /* 1: pressed, 0: release */
>>> +	bool delay_check;
>>> +	struct delayed_work check_work;
>>> +	struct input_dev *input;
>>> +};
>>> +
>>> +struct imx_sc_msg_pwrkey {
>>> +	struct imx_sc_rpc_msg hdr;
>>> +	u8 state;
>>> +};
>>> +static struct imx_pwrkey_drv_data *pdata;
>>
>> Why is it global struct? It seems to be flexible configurable over devicetree.
>> So I would assume it should be able to handle more then one button. Please
>> remove global variables, make it allocatable per OF node.
> 
> There is ONLY one button available for SC key, but yes, I think I can make the structure
> private and get all necessary data from the structure using container_of.

And we will never need more then 640 kB RAM ;)
https://en.wikiquote.org/wiki/Talk:Bill_Gates

> 
>>
>> Please use different name "pdata" is usually used as platform data. Please,
>> use "priv".
> 
> OK.
> 
>>
>>> +static struct imx_sc_ipc *pwrkey_ipc_handle;
>>
>> same as before, no global variables.
> 
> Will move it into private platform data structure.
> 
>>
>>> +
>>> +static int imx_sc_pwrkey_notify(struct notifier_block *nb,
>>> +				unsigned long event, void *group) {
>>> +	if ((event & SC_IRQ_BUTTON) && (*(u8 *)group ==
>> SC_IRQ_GROUP_WAKE)
>>> +	    && !pdata->delay_check) {
>>> +		pdata->delay_check = 1;
>>> +		schedule_delayed_work(&pdata->check_work,
>>> +				      msecs_to_jiffies(REPEAT_INTERVAL));
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void imx_sc_check_for_events(struct work_struct *work) {
>>> +	struct input_dev *input = pdata->input;
>>> +	struct imx_sc_msg_pwrkey msg;
>>> +	struct imx_sc_rpc_msg *hdr = &msg.hdr;
>>> +	bool state;
>>> +
>>> +	hdr->ver = IMX_SC_RPC_VERSION;
>>> +	hdr->svc = IMX_SC_RPC_SVC_MISC;
>>> +	hdr->func = IMX_SC_MISC_FUNC_GET_BUTTON_STATUS;
>>> +	hdr->size = 1;
>>> +
>>> +	/*
>>> +	 * Current SCU firmware does NOT have return value for
>>> +	 * this API, that means it is always successful.
>>> +	 */
>>
>> It is not true for the kernel part:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.
>> bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Ffirmware%2Fimx%2F
>> imx-
>> scu.c%23L157&amp;data=02%7C01%7Canson.huang%40nxp.com%7C7a5ed3
>> ef3b2541e61be808d7303810a9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C
>> 0%7C0%7C637030889669489141&amp;sdata=d3uw6x6WCPeavJu3QYf9o9cxx
>> Rx4mJar04fQFLF9EhE%3D&amp;reserved=0
>>
>> imx_scu_call_rpc() may fail in different ways and provide proper error value.
>> Please use it.
> 
> There are about 3 APIs are special, this API is one of them, this API has no return value
> from SCU FW API, but it has response data from it, so that means if we set the response
> to false, the stack will be free and mailbox will have NULL pointer issue when response
> data passed from SCU FW. If we set the response to true, as the SCU FW has no return value,
> the return value will be the msg->func which will be already failed, that is why we have to skip
> the return value check. This is one restriction/bug of SCU FW, we will notify SCU FW owner to
> fix/improve.

Ok, I see. imx_scu_call_rpc() can return kernel side errors, for example from imx-scu.c 
framework EINVAL or ETIMEDOUT or what ever error mbox framework may also provide. 
Aaaannnndd... it can extract an error from SCU package and return it over same way as 
other errors.

And current SCU version has some bugs, so it is providing wrong error value. Soo... as 
usual the NXP has decided to make the linux kernel a bit more worse to make the SCU 
firmware happy? Is it what you trying to describe? Really ?! :D

Please. Fix the SCU first. The provide fixed kernel patch.

>>
>>> +	imx_scu_call_rpc(pwrkey_ipc_handle, &msg, true); > +	state =
>> msg.state;
>>
>> the conversation u8 to bool should be done here.
> 
> OK.
> 
>>
>>> +
>>> +	if (!state && !pdata->keystate)
>>> +		state = true;
>>> +
>>> +	if (state ^ pdata->keystate) {
>>> +		pm_wakeup_event(input->dev.parent, 0);
>>> +		pdata->keystate = !!state;
>>
>> 		the state is already bool. Why do you need extra
>> conversations?
> 
> Will remove it.
> 
>>
>>> +		input_event(input, EV_KEY, pdata->keycode, !!state);
>>
>> same here.
> 
> Will remove it.
> 
>>
>>> +		input_sync(input);
>>> +		if (!state)
>>> +			pdata->delay_check = 0;
>>> +		pm_relax(pdata->input->dev.parent);
>>> +	}
>>> +
>>> +	if (state)
>>> +		schedule_delayed_work(&pdata->check_work,
>>> +				      msecs_to_jiffies(DEBOUNCE_TIME)); }
>>> +
>>> +static struct notifier_block imx_sc_pwrkey_notifier = {
>>> +	.notifier_call = imx_sc_pwrkey_notify, };
>>> +
>>> +static int imx_sc_pwrkey_probe(struct platform_device *pdev) {
>>> +	struct device_node *np = pdev->dev.of_node;
>>> +	struct input_dev *input;
>>> +	int ret;
>>> +
>>> +	ret = imx_scu_get_handle(&pwrkey_ipc_handle);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>>> +	if (!pdata)
>>> +		return -ENOMEM;
>>> +
>>> +	if (of_property_read_u32(np, "linux,keycode", &pdata->keycode) > +
>> 		pdata->keycode = KEY_POWER;
>>
>> According binding documentation, linux,keycode is requered parameter, in
>> this case you should fail if it is not set.
> 
> Agreed, will add it in V3.
> 
> Thanks,
> Anson.
> 

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

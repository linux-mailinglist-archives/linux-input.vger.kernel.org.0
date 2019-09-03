Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056C9A663A
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfICKF4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 06:05:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42361 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfICKF4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 06:05:56 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i55hB-0001c2-RC; Tue, 03 Sep 2019 12:05:53 +0200
Subject: Re: [PATCH V3 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
To:     Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, mripard@kernel.org,
        olof@lixom.net, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, stefan@agner.ch,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, tglx@linutronix.de, ronald@innovation.ch,
        m.felsch@pengutronix.de, ping.bai@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
 <1567546600-21566-2-git-send-email-Anson.Huang@nxp.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <d98b20a8-17b7-b757-6e1d-89932ddbea88@pengutronix.de>
Date:   Tue, 3 Sep 2019 12:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567546600-21566-2-git-send-email-Anson.Huang@nxp.com>
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



On 03.09.19 23:36, Anson Huang wrote:
> i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
> inside, the system controller is in charge of controlling power,
> clock and scu key etc..
> 
> Adds i.MX system controller key driver support, Linux kernel has
> to communicate with system controller via MU (message unit) IPC
> to get scu key's status.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
> Changes since V2:
> 	- use private platform data instead of global data;
> 	- use "key" instead of "pwrkey";
> 	- fix some data format.
> ---
>   drivers/input/keyboard/Kconfig      |   7 ++
>   drivers/input/keyboard/Makefile     |   1 +
>   drivers/input/keyboard/imx_sc_key.c | 178 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 186 insertions(+)
>   create mode 100644 drivers/input/keyboard/imx_sc_key.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 2e6d288..607acf2 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -469,6 +469,13 @@ config KEYBOARD_IMX
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx_keypad.
>   
> +config KEYBOARD_IMX_SC_KEY
> +	tristate "IMX SCU Key Driver"
> +	depends on IMX_SCU
> +	help
> +	  This is the system controller key driver for NXP i.MX SoCs with
> +	  system controller inside.
> +
>   config KEYBOARD_NEWTON
>   	tristate "Newton keyboard"
>   	select SERIO
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 9510325..f5b1752 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
>   obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
>   obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
>   obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
> +obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
>   obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
>   obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
>   obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> new file mode 100644
> index 0000000..e69479b
> --- /dev/null
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/firmware/imx/sci.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#define DEBOUNCE_TIME	100
> +#define REPEAT_INTERVAL	60
> +
> +#define SC_IRQ_BUTTON		1
> +#define SC_IRQ_GROUP_WAKE	3
> +#define IMX_SC_MISC_FUNC_GET_BUTTON_STATUS	18
> +
> +struct imx_key_drv_data {
> +	int keycode;
> +	bool keystate;  /* 1: pressed, 0: release */
> +	bool delay_check;
> +	struct delayed_work check_work;
> +	struct input_dev *input;
> +	struct imx_sc_ipc *key_ipc_handle;
> +	struct notifier_block key_notifier;
> +};
> +
> +struct imx_sc_msg_key {
> +	struct imx_sc_rpc_msg hdr;
> +	u8 state;
> +};
> +
> +static int imx_sc_key_notify(struct notifier_block *nb,
> +			     unsigned long event, void *group)
> +{
> +	struct imx_key_drv_data *priv =
> +				 container_of(nb,
> +					      struct imx_key_drv_data,
> +					      key_notifier);
> +
> +	if ((event & SC_IRQ_BUTTON) && (*(u8 *)group == SC_IRQ_GROUP_WAKE)
> +	    && !priv->delay_check) {
> +		priv->delay_check = 1;
> +		schedule_delayed_work(&priv->check_work,
> +				      msecs_to_jiffies(REPEAT_INTERVAL));
> +	}
> +
> +	return 0;
> +}
> +
> +static void imx_sc_check_for_events(struct work_struct *work)
> +{
> +	struct imx_key_drv_data *priv =
> +				 container_of(work,
> +					      struct imx_key_drv_data,
> +					      check_work.work);
> +	struct input_dev *input = priv->input;
> +	struct imx_sc_msg_key msg;
> +	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> +	bool state;
> +	int ret;
> +
> +	hdr->ver = IMX_SC_RPC_VERSION;
> +	hdr->svc = IMX_SC_RPC_SVC_MISC;
> +	hdr->func = IMX_SC_MISC_FUNC_GET_BUTTON_STATUS;
> +	hdr->size = 1;
> +
> +	ret = imx_scu_call_rpc(priv->key_ipc_handle, &msg, true);
> +	if (ret) {
> +		dev_err(&input->dev, "read imx sc key failed, ret %d\n", ret);
> +		return;
> +	}
> +
> +	state = (bool)msg.state;
> +
> +	if (!state && !priv->keystate)
> +		state = true;
> +
> +	if (state ^ priv->keystate) {
> +		pm_wakeup_event(input->dev.parent, 0);
> +		priv->keystate = state;
> +		input_event(input, EV_KEY, priv->keycode, state);
> +		input_sync(input);
> +		if (!state)
> +			priv->delay_check = 0;
> +		pm_relax(priv->input->dev.parent);
> +	}
> +
> +	if (state)
> +		schedule_delayed_work(&priv->check_work,
> +				      msecs_to_jiffies(DEBOUNCE_TIME));
> +}
> +
> +static int imx_sc_key_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	static struct imx_key_drv_data *priv;
> +	struct input_dev *input;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&priv->key_ipc_handle);
> +	if (ret)
> +		return ret;
> +
> +	if (of_property_read_u32(np, "linux,keycode", &priv->keycode)) {
> +		dev_err(&pdev->dev, "missing KEY_POWER in DT\n");
> +		return -EINVAL;
> +	}
> +
> +	INIT_DELAYED_WORK(&priv->check_work, imx_sc_check_for_events);
> +
> +	input = devm_input_allocate_device(&pdev->dev);
> +	if (!input) {
> +		dev_err(&pdev->dev, "failed to allocate the input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	input->name = pdev->name;
> +	input->phys = "imx-sc-key/input0";
> +	input->id.bustype = BUS_HOST;
> +
> +	input_set_capability(input, EV_KEY, priv->keycode);
> +
> +	ret = input_register_device(input);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register input device\n");
> +		return ret;
> +	}
> +
> +	priv->input = input;
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, true);
> +	if (ret) {
> +		dev_warn(&pdev->dev, "enable scu group irq failed\n");
> +		return ret;
> +	}
> +
> +	priv->key_notifier.notifier_call = imx_sc_key_notify;
> +	ret = imx_scu_irq_register_notifier(&priv->key_notifier);
> +	if (ret) {
> +		imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
> +		dev_warn(&pdev->dev, "register scu notifier failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id imx_sc_key_ids[] = {
> +	{ .compatible = "fsl,imx-sc-key" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_sc_key_ids);
> +
> +static struct platform_driver imx_sc_key_driver = {
> +	.driver = {
> +		.name = "imx-sc-key",
> +		.of_match_table = imx_sc_key_ids,
> +	},
> +	.probe = imx_sc_key_probe,
> +};
> +module_platform_driver(imx_sc_key_driver);
> +
> +MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
> +MODULE_DESCRIPTION("i.MX System Controller Key Driver");
> +MODULE_LICENSE("GPL v2");
> 

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B064EB44B7
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 01:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfIPXxf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 19:53:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44268 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfIPXxf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 19:53:35 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so913943pfn.11;
        Mon, 16 Sep 2019 16:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7yM8bc9dUdHZnwXo81JLespay94Pp7w4ktcsiUR2rz0=;
        b=IiWb4+sjZ3upqo+z4y9O+5aDEK9yf3cceXa6QcMxaLH0OFv/2zLXDydVnkVUoStc09
         mePffjU3Pcztlbu0EIoryNKXgCzisGPdFI7RMHAmEh7YhKK6PAFdDE1TqTxTdaP5u93X
         6lxN6f67KdohNHPHP8/mRU9lrimUXFOy8f0H7Vdh+vQ8NO3jWgkRh0jHjQ325J3LEhNj
         qETvcUNut+25Tc6ZVpTQ9dq3iRptCo/1HW/LhJIzSmkvRlNWreTXd+fngitkhA0KkEd1
         6CGyiYxZIsfdSMrV5tyDcYU+Jsq/0H2CPkiQ3WzBVPJ72LBvWXsdMsccvIR2cxTiaIOd
         sHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7yM8bc9dUdHZnwXo81JLespay94Pp7w4ktcsiUR2rz0=;
        b=EIC5C6Qh4qTyTWw2aZFe6Y9ylF1SNzCZ6R6gGephPKN0P0+yqYI1sn+P204yUymLqo
         dy3Dm1ZeQfUANnrUdtPh+YF7a7MuyMqgJDawR0XRewc17mFeb/I835WCE7Hi9w2SsjVf
         TRihnfw9+/ZSjcETNwKPOJsLFmbpPa42bmTkZ76LXXtup+wbeQHmKHPBR9/xB3wshvQm
         bBj9r40Mgsfzhrzoy6Qrmc2guunH2hWxu+3qNCupBXt1z5YWj88kJy5YDHPw46PJhmBG
         /1ZWIY0w5SFv2LMGvF/EfyVrb4HdGjAt1nUnuZQPfWnFN5YdRRUGCrfp5HjKdn9BpOyh
         JDtg==
X-Gm-Message-State: APjAAAWovqFeySgoDUS8QagqZF3cVB5P0RJO5eRpn4nk2cg9Bb1ifNRK
        YGF40ViCpJNxPum4blqUyD4=
X-Google-Smtp-Source: APXvYqxI6uqo7dfGr8YwI6O/iAA3+texS3l1QJD5B7oqxNEFtnH+j1B8Nd7WU5Cs5gJnPgyQH4Gedg==
X-Received: by 2002:a63:904:: with SMTP id 4mr715939pgj.36.1568678014086;
        Mon, 16 Sep 2019 16:53:34 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g11sm203237pgu.11.2019.09.16.16.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 16:53:33 -0700 (PDT)
Date:   Mon, 16 Sep 2019 16:53:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        dinguyen@kernel.org, bjorn.andersson@linaro.org,
        marcin.juszkiewicz@linaro.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, cw00.choi@samsung.com,
        enric.balletbo@collabora.com, m.felsch@pengutronix.de,
        ping.bai@nxp.com, ronald@innovation.ch, stefan@agner.ch,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Message-ID: <20190916235330.GI237523@dtor-ws>
References: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
 <1568602373-14164-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568602373-14164-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 16, 2019 at 10:52:50AM +0800, Anson Huang wrote:
> i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
> inside, the system controller is in charge of controlling power,
> clock and scu key etc..
> 
> Adds i.MX system controller key driver support, Linux kernel has
> to communicate with system controller via MU (message unit) IPC
> to get scu key's status.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- switch the debounce and repeat interval time for delay work schdule;
> 	- add .remove to handle group irq and notify etc..
> ---
>  drivers/input/keyboard/Kconfig      |   7 ++
>  drivers/input/keyboard/Makefile     |   1 +
>  drivers/input/keyboard/imx_sc_key.c | 190 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 198 insertions(+)
>  create mode 100644 drivers/input/keyboard/imx_sc_key.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 8911bc2..00f8428 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -469,6 +469,13 @@ config KEYBOARD_IMX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx_keypad.
>  
> +config KEYBOARD_IMX_SC_KEY
> +	tristate "IMX SCU Key Driver"
> +	depends on IMX_SCU
> +	help
> +	  This is the system controller key driver for NXP i.MX SoCs with
> +	  system controller inside.
> +
>  config KEYBOARD_NEWTON
>  	tristate "Newton keyboard"
>  	select SERIO
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 9510325..f5b1752 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
>  obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
>  obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
>  obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
> +obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
>  obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
>  obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
>  obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> new file mode 100644
> index 0000000..59c68fa
> --- /dev/null
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -0,0 +1,190 @@
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
> +				      msecs_to_jiffies(DEBOUNCE_TIME));

If I am reading this right, you are trying to avoid scheduling the work
again if it is already scheduled. You do not need to do that, as
schedule_delayed_work() will take care of that (if you want to make sure
the work is re-scheduled with updated expiration, you need to use
mod_delayed_work).

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

This needs an explanation please.

> +
> +	if (state ^ priv->keystate) {
> +		pm_wakeup_event(input->dev.parent, 0);

I'd expect this happening in imx_sc_key_notify() so that the device
would have a change to run this work.

> +		priv->keystate = state;
> +		input_event(input, EV_KEY, priv->keycode, state);
> +		input_sync(input);
> +		if (!state)
> +			priv->delay_check = 0;
> +		pm_relax(priv->input->dev.parent);

Are you sure you want to call pm_relax() unconditionally, and not when
state == false (i.e. button released)?

> +	}
> +
> +	if (state)
> +		schedule_delayed_work(&priv->check_work,
> +				      msecs_to_jiffies(REPEAT_INTERVAL));
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

Could you please rename this (and elsewhere) from 'ret' to 'error'?

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

		return error;
> +	}
> +
> +	return ret;

	return 0;
> +}
> +
> +static int imx_sc_key_remove(struct platform_device *pdev)
> +{
> +	struct imx_key_drv_data *priv = platform_get_drvdata(pdev);
> +
> +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
> +	imx_scu_irq_unregister_notifier(&priv->key_notifier);
> +	cancel_delayed_work_sync(&priv->check_work);
> +
> +	return 0;
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
> +	.remove = imx_sc_key_remove,
> +};
> +module_platform_driver(imx_sc_key_driver);
> +
> +MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
> +MODULE_DESCRIPTION("i.MX System Controller Key Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry

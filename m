Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CF0B173C
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 04:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfIMCkg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 22:40:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41407 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfIMCkg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 22:40:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so14462408pgg.8;
        Thu, 12 Sep 2019 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UP1u+Dca8sbP4Ltz5lkNdGLJogvNgYuMygajS9RlyYE=;
        b=BlJvvwTnzkIA0n+L8NqoxzOtG9oKdjMXjIljgTUnEY4TDEIVCL98hvGYxFGso5Govp
         /mrbptuCcSCKFnR6cI8BAIPfcv/R+dhaGmRvaozpc/HHqRYObph8iyyb2msX+SgCzlWh
         bTWmHGS1fWrioNoJNz/baL1KgqSdzA8Qe1WqxMI/uxTxVSKb85Hsp2P2i1ppD2WXPfBN
         zPi6N79XOSTPwrAiMLTovC1l0BCR4JnPEsYp8WmmDPMBXJkoGksyN7xUTXU5BB+UtAX5
         SUD+MA3wDB+IFoq2E3RHRZVw+tqlpGKMxL/cIp42f66sO3gH2y1ka+rk+XBXj+xsSiR4
         atxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UP1u+Dca8sbP4Ltz5lkNdGLJogvNgYuMygajS9RlyYE=;
        b=lXtM2Aqn9xXNC1GCb7M1F4IIpw2xka0rBz4B2Et8wUuA1KFDBLn8dXpj3LmCGsqCdV
         RxuNLNP/kMH25EW775OwZWQURip9m5yj9Lzwzg6zq7JugvU/NdR5wsY+/FQc+rU9wyOI
         /Yx56F1bGQv6XGYwdDzFoGy8NNlVP502UD3+CSeaAwtkT0k6vzlKWNlRnBYxb+pkhDPD
         Hi1LAsn1LDVpgC9nrF3hzEyZBrDMflY0OFZGyzYBDfhGx6vi+v5UGSRJTFmooZ+pVt6p
         4QCg6tT6yLsR1eKgRbv5ngquFhn3Nm3AquYLQs2ElEb/6xtMa2Sf2mQ5AbR+e+kIKT1u
         GUBA==
X-Gm-Message-State: APjAAAXS6fksGiY97ViRYcOPz0evDdltI7nelSU+UQLgwfTtskPXfON8
        OoOwyRmixr0K0RANyC9Drzk=
X-Google-Smtp-Source: APXvYqxXudnFv0wlNAyfrLVbGR5PsDT0j5xxkmQaSeJwOpX52h+MqyJpzvy9Cm7IZab0s11TaKzU5Q==
X-Received: by 2002:a62:8c11:: with SMTP id m17mr22088610pfd.245.1568342434904;
        Thu, 12 Sep 2019 19:40:34 -0700 (PDT)
Received: from localhost (c-73-158-250-148.hsd1.ca.comcast.net. [73.158.250.148])
        by smtp.gmail.com with ESMTPSA id z23sm387918pje.2.2019.09.12.19.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 19:40:34 -0700 (PDT)
Date:   Thu, 12 Sep 2019 21:22:39 +0100
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, mripard@kernel.org,
        olof@lixom.net, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, stefan@agner.ch,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, tglx@linutronix.de, ronald@innovation.ch,
        m.felsch@pengutronix.de, ping.bai@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 2/5] input: keyboard: imx_sc: Add i.MX system
 controller key support
Message-ID: <20190912202239.GB636@penguin>
References: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
 <1567546600-21566-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567546600-21566-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Anson,

On Tue, Sep 03, 2019 at 05:36:37PM -0400, Anson Huang wrote:
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
> Changes since V2:
> 	- use private platform data instead of global data;
> 	- use "key" instead of "pwrkey";
> 	- fix some data format.
> ---
>  drivers/input/keyboard/Kconfig      |   7 ++
>  drivers/input/keyboard/Makefile     |   1 +
>  drivers/input/keyboard/imx_sc_key.c | 178 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 drivers/input/keyboard/imx_sc_key.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 2e6d288..607acf2 100644
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

Hmm, I am not quite sure follow the code. Judging by the name, you are
trying to handle debounce, but if I understand this correctly you
already sent out the press event for now.

Could you please explain what you are trying to do here.

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

You need a remove() handler to disable the itq group, remove the
notifier, cancel the delayed work, etc.

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

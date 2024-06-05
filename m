Return-Path: <linux-input+bounces-4111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F138FC926
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D51BC2857E1
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 10:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF47191475;
	Wed,  5 Jun 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTQWtmJ2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D591191466;
	Wed,  5 Jun 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717583596; cv=none; b=kJz+ca4WJICtK9LQK+/AlMOxzfayZkt82a/x6cr3bqigCgLsKqTTMsOGo69qExFbQQzFKOCXENr1IVXQbuKk4bo5gXz7Ax3opYJDAJ6tGp4Id8u9PWA2dn+n08iyqSU9/eKCLmEeui/LdmkV/IbXtg+PxYA9C3R/I/tWkEadr7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717583596; c=relaxed/simple;
	bh=I7P66n+OSdPW8kJ03BZQmqoFzlJDohdqidrXH+yerCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv3hRfDTv5fwNq7HZHnHskmvlkLUKUhJg4gXDEq3rVkp79wFUjg5PejsPhUAA6VYQ+pZcTlrIH/N/JbXpVqc0dAeoi5xV4WmpWigJwbNxCu/bKu/Rx3j9jgnAuZngUzrZPa/2E3UF6jAL54OggD+kKA88CVMtai6NZdb94+gcNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTQWtmJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51369C3277B;
	Wed,  5 Jun 2024 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717583596;
	bh=I7P66n+OSdPW8kJ03BZQmqoFzlJDohdqidrXH+yerCs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OTQWtmJ27ofd/eMoopUUgGUbfFiC7quhKUGR+lKEllCS+GNEwz36D7JlrxtpWmgMb
	 joKjVwPFzZ+PttcchQY3Uftv+zUBqKVmJj11P/QY0DjDYr/oVqo/L42ZAfSi3yqY+O
	 /pDhX853QIVfkfaN3MMdPuSEY8a8WSw9f7EYayllZlFOUNEyJF+t3rBtamatJBGrGM
	 KzfO8Hq7u9Pnihbx2qevQMwzGMFCxBo2+nnHh+r15yBJkk+isAiObehtUaWX/5rr8m
	 GE5LsRGOHixYJbdu3tA3y1KWxYF9qdSg0O4GtHfL7oa+Mqiuxrhdu5ZI0QucHce8PY
	 nMFmzkcowZwqA==
Message-ID: <d659cd9c-86e6-4f77-9157-fd6a7b47ea31@kernel.org>
Date: Wed, 5 Jun 2024 12:33:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] Add support for Awinic sar sensor.
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: liweilei@awinic.com, kangjiajun@awinic.com
References: <20240605091143.163789-1-wangshuaijie@awinic.com>
 <20240605091143.163789-6-wangshuaijie@awinic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240605091143.163789-6-wangshuaijie@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:
> From: shuaijie wang <wangshuaijie@awinic.com>
> 
> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/input/misc/Kconfig         |    9 +
>  drivers/input/misc/Makefile        |    1 +
>  drivers/input/misc/aw_sar/Makefile |    2 +
>  drivers/input/misc/aw_sar/aw_sar.c | 2036 ++++++++++++++++++++++++++++
>  drivers/input/misc/aw_sar/aw_sar.h |   15 +
>  5 files changed, 2063 insertions(+)
>  create mode 100644 drivers/input/misc/aw_sar/Makefile
>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.c
>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.h
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 6ba984d7f0b1..ac56fdd21839 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -939,4 +939,13 @@ config INPUT_STPMIC1_ONKEY
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stpmic1_onkey.
>  
> +config AWINIC_SAR
> +	tristate "Awinic sar sensor support"
> +	depends on I2C
> +	help
> +	  Say Y to enable support for the Awinic sar sensor driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called awinic_sar.
> +
>  endif
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 04296a4abe8e..6ee1870ea677 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -90,3 +90,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
>  obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
>  obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
>  obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
> +obj-$(CONFIG_AWINIC_SAR)		+= aw_sar/
> diff --git a/drivers/input/misc/aw_sar/Makefile b/drivers/input/misc/aw_sar/Makefile
> new file mode 100644
> index 000000000000..c357ecaa4f98
> --- /dev/null
> +++ b/drivers/input/misc/aw_sar/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_AWINIC_SAR) += awinic_sar.o
> +awinic_sar-objs := ./comm/aw_sar_comm_interface.o aw_sar.o ./aw9610x/aw9610x.o ./aw963xx/aw963xx.o
> diff --git a/drivers/input/misc/aw_sar/aw_sar.c b/drivers/input/misc/aw_sar/aw_sar.c
> new file mode 100644
> index 000000000000..ab89fed65a6a
> --- /dev/null
> +++ b/drivers/input/misc/aw_sar/aw_sar.c
> @@ -0,0 +1,2036 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AWINIC sar sensor driver
> + *
> + * Author: Shuaijie Wang<wangshuaijie@awinic.com>
> + *
> + * Copyright (c) 2024 awinic Technology CO., LTD
> + */
> +#include "./comm/aw_sar_chip_interface.h"
> +#include "aw_sar.h"
> +
> +#define AW_SAR_I2C_NAME		"awinic_sar"
> +
> +/*
> + * Please check which power_supply on your platform
> + * can get the charger insertion information, then select it.
> + * eg: "usb"/"charger"/"mtk-master-charger"/"mtk_charger_type"
> + */
> +#define USB_POWER_SUPPLY_NAME   "charger"
> +/*
> + * Check which of your power_supply properties is available
> + * for the charger insertion information and select it.
> + * eg: POWER_SUPPLY_PROP_ONLINE/POWER_SUPPLY_PROP_PRESENT
> + */
> +#define AW_USB_PROP_ONLINE	POWER_SUPPLY_PROP_ONLINE
> +
> +#define AW_I2C_RW_RETRY_TIME_MIN		(2000)
> +#define AW_I2C_RW_RETRY_TIME_MAX		(3000)
> +#define AW_RETRIES				(5)
> +
> +#define AW_SAR_AWRW_OffSET			(20)
> +#define AW_SAR_AWRW_DATA_WIDTH			(5)
> +#define AW_DATA_OffSET_2			(2)
> +#define AW_DATA_OffSET_3			(3)
> +#define AW_POWER_ON_SYSFS_DELAY_MS		(5000)
> +#define AW_SAR_MONITOR_ESD_DELAY_MS		(5000)
> +#define AW_SAR_OFFSET_LEN			(15)
> +#define AW_SAR_VCC_MIN_UV			(1700000)
> +#define AW_SAR_VCC_MAX_UV			(3600000)
> +
> +static struct mutex aw_sar_lock;
> +
> +static int32_t aw_sar_get_chip_info(struct aw_sar *p_sar);
> +static void aw_sar_sensor_free(struct aw_sar *p_sar);
> +
> +//Because disable/enable_irq api Therefore, IRQ is embedded
> +void aw_sar_disable_irq(struct aw_sar *p_sar)
> +{
> +	if (p_sar->irq_init.host_irq_stat == IRQ_ENABLE) {
> +		disable_irq(p_sar->irq_init.to_irq);
> +		p_sar->irq_init.host_irq_stat = IRQ_DISABLE;
> +	}
> +}
> +
> +void aw_sar_enable_irq(struct aw_sar *p_sar)
> +{
> +	if (p_sar->irq_init.host_irq_stat == IRQ_DISABLE) {
> +		enable_irq(p_sar->irq_init.to_irq);
> +		p_sar->irq_init.host_irq_stat = IRQ_ENABLE;
> +	}
> +}
> +
> +//Chip logic part start
> +//Load default array function
> +static int32_t
> +aw_sar_para_loaded_func(struct i2c_client *i2c, const struct aw_sar_para_load_t *para_load)
> +{
> +	int32_t ret;
> +	int32_t i;

int32_t? So you send user-space driver to the kernel? That would explain
this terrible coding style, but it is a clear no-go.


...

> +static void aw_sar_monitor_work(struct work_struct *aw_work)
> +{
> +	struct aw_sar *p_sar = container_of(aw_work, struct aw_sar, monitor_work.work);
> +	uint32_t data;
> +	int32_t ret;
> +
> +	ret = aw_sar_i2c_read(p_sar->i2c, 0x0000, &data);
> +	if (ret != 0) {
> +		dev_err(p_sar->dev, "read 0x0000 err: %d", ret);
> +		return;
> +	}
> +	if (data == 0 && p_sar->driver_code_initover_flag) {
> +		dev_err(p_sar->dev, "aw_chip may reset");
> +		aw_sar_disable_irq(p_sar);
> +		ret = aw_sar_chip_init(p_sar);
> +		if (ret != 0)
> +			return;
> +	}
> +	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,
> +			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));
> +}
> +
> +static int32_t aw_sar_monitor_esd_init(struct aw_sar *p_sar)
> +{
> +	p_sar->monitor_wq = create_singlethread_workqueue("aw_sar_workqueue");
> +	if (!p_sar->monitor_wq) {
> +		dev_err(&p_sar->i2c->dev, "aw_sar_workqueue error");
> +		return -EINVAL;
> +	}
> +	INIT_DELAYED_WORK(&p_sar->monitor_work, aw_sar_monitor_work);
> +	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,
> +			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));
> +
> +	return 0;
> +}
> +
> +static void aw_sar_sensor_free(struct aw_sar *p_sar)
> +{
> +	if (g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit != NULL)
> +		g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit(p_sar);
> +}
> +
> +
> +/* Drive logic entry */
> +static int32_t aw_sar_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct aw_sar *p_sar;
> +	int32_t ret;
> +
> +	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> +		pr_err("check_functionality failed!\n");
> +		return -EIO;
> +	}
> +
> +	p_sar = devm_kzalloc(&i2c->dev, sizeof(struct aw_sar), GFP_KERNEL);

Heh, so you upstream 10 year old code?

sizeof(*)

> +	if (!p_sar) {
> +		ret = -ENOMEM;
> +		goto err_malloc;

That's just return.

> +	}
> +
> +	p_sar->dev = &i2c->dev;
> +	p_sar->i2c = i2c;
> +	i2c_set_clientdata(i2c, p_sar);
> +
> +	//1.Judge whether to use regular power supply. If yes, supply power
> +	ret = aw_sar_regulator_power(p_sar);
> +	if (ret != 0) {
> +		dev_err(&i2c->dev, "regulator_power error!");
> +		goto err_malloc;
> +	}
> +
> +	//2.Get chip initialization resources
> +	ret = aw_sar_get_chip_info(p_sar);
> +	if (ret != 0) {
> +		dev_err(&i2c->dev, "chip_init error!");

DON't SCREAM! No need!

> +		goto err_chip_init;
> +	}
> +
> +	//3.Chip initialization process
> +	ret = aw_sar_init(p_sar);
> +	if (ret != 0) {
> +		dev_err(&i2c->dev, "sar_init error!");
> +		goto err_sar_init;
> +	}
> +
> +	if (p_sar->dts_info.monitor_esd_flag) {
> +		ret = aw_sar_monitor_esd_init(p_sar);
> +		if (ret != 0) {
> +			dev_err(&i2c->dev, "monitor_esd_init error!");
> +			goto err_esd_init;
> +		}
> +	}
> +
> +	dev_dbg(&i2c->dev, "probe success!");

No. Drop all silly function entry/exit/success messages.

EVERYWHERE.

> +
> +	return 0;
> +


> +static const struct of_device_id aw_sar_dt_match[] = {
> +	{ .compatible = "awinic,aw96103" },
> +	{ .compatible = "awinic,aw96105" },
> +	{ .compatible = "awinic,aw96303" },
> +	{ .compatible = "awinic,aw96305" },
> +	{ .compatible = "awinic,aw96308" },

So all are compatible... express it in bindings.

> +	{ },
> +};
> +
> +static const struct i2c_device_id aw_sar_i2c_id[] = {
> +	{ AW_SAR_I2C_NAME, 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, aw_sar_i2c_id);
> +
> +static struct i2c_driver aw_sar_i2c_driver = {
> +	.driver = {
> +		.name = AW_SAR_I2C_NAME,
> +		.owner = THIS_MODULE,

NAK

> +		.of_match_table = aw_sar_dt_match,
> +		.pm = &aw_sar_pm_ops,
> +	},
> +	.probe = aw_sar_i2c_probe,
> +	.remove = aw_sar_i2c_remove,
> +	.shutdown = aw_sar_i2c_shutdown,
> +	.id_table = aw_sar_i2c_id,
> +};
> +
> +static int32_t __init aw_sar_i2c_init(void)
> +{
> +	int32_t ret;
> +
> +	ret = i2c_add_driver(&aw_sar_i2c_driver);
> +	if (ret) {
> +		pr_err("fail to add aw_sar device into i2c\n");
> +		return ret;
> +	}

Srsly, this is just NAK. This code is way too poor. Get some internal
help from awinic, because this should not be sent.

> +
> +	return 0;
> +}
> +
> +module_init(aw_sar_i2c_init);
> +static void __exit aw_sar_i2c_exit(void)
> +{
> +	i2c_del_driver(&aw_sar_i2c_driver);
> +}
> +module_exit(aw_sar_i2c_exit);
> +MODULE_DESCRIPTION("AWINIC SAR Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/input/misc/aw_sar/aw_sar.h b/drivers/input/misc/aw_sar/aw_sar.h
> new file mode 100644
> index 000000000000..7a139f56e9c3
> --- /dev/null
> +++ b/drivers/input/misc/aw_sar/aw_sar.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef AW_SAR_H_
> +#define AW_SAR_H_
> +
> +void aw_sar_disable_irq(struct aw_sar *p_sar);
> +void aw_sar_enable_irq(struct aw_sar *p_sar);
> +
> +int32_t aw_sar_soft_reset(struct aw_sar *p_sar);
> +int32_t aw_sar_check_init_over_irq(struct aw_sar *p_sar);
> +int32_t aw_sar_update_fw(struct aw_sar *p_sar);
> +int32_t aw_sar_load_def_reg_bin(struct aw_sar *p_sar);
> +void aw_sar_mode_set(struct aw_sar *p_sar, uint8_t curr_mode);
> +int32_t aw_sar_update_reg_set_func(struct aw_sar *p_sar);


Why is all this needed for one file and why is it here?

Best regards,
Krzysztof



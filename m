Return-Path: <linux-input+bounces-5010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627092F874
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1836282695
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2611474CC;
	Fri, 12 Jul 2024 09:54:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721D14F9D0;
	Fri, 12 Jul 2024 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720778076; cv=none; b=DABloqSTuxl3wk1eTbPkGaCob/Phk43xCfLJP+PIpnX0xI7/qkUPluDESGA1mESOtBSp6zhrILqg4aK0il3WysdkLl36cYfMtBmNxQa6GoUcJGi4V3NW0GCZIgTQbiC939W0pQPm1i+1De3LKrNKlK92GaF7Rze3cVpV5wVWtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720778076; c=relaxed/simple;
	bh=YlQSwi0LmTuNuZ3Gjoa5u2tBF8NrkDZiazQr/V4iedU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+UrtYQeBuYOXu97R1A0riRDE16RSz1KgmpxKsl6N8e4FApwkqbomFWLjbZsT4XPZ0rBJXn1q4eKNwPtPprf0H32xDnV68YM/+c43lIVWgZS4sksW3IvZH5NvZK8RDqEzlP9e2eL+VMKGVbbdazWLQK0FLjuUdtvOIp1ig17/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00669916-0.000523345-0.992777;FP=12185036613028283619|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033055230028;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.YOP7P8n_1720777739;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YOP7P8n_1720777739)
          by smtp.aliyun-inc.com;
          Fri, 12 Jul 2024 17:49:07 +0800
From: wangshuaijie@awinic.com
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V2 5/5] Add support for Awinic sar sensor
Date: Fri, 12 Jul 2024 09:48:59 +0000
Message-ID: <20240712094859.2395364-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <d659cd9c-86e6-4f77-9157-fd6a7b47ea31@kernel.org>
References: <d659cd9c-86e6-4f77-9157-fd6a7b47ea31@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,=0D
=0D
On Wed, 5 Jun 2024 12:33:11, krzk@kernel.org wrote:=0D
>On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:=0D
>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>> =0D
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>=0D
>> | Reported-by: kernel test robot <lkp@intel.com>=0D
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>=0D
>> | Reported-by: Dan Carpenter <error27@gmail.com>=0D
>> ---=0D
>>  drivers/input/misc/Kconfig         |    9 +=0D
>>  drivers/input/misc/Makefile        |    1 +=0D
>>  drivers/input/misc/aw_sar/Makefile |    2 +=0D
>>  drivers/input/misc/aw_sar/aw_sar.c | 2036 ++++++++++++++++++++++++++++=
=0D
>>  drivers/input/misc/aw_sar/aw_sar.h |   15 +=0D
>>  5 files changed, 2063 insertions(+)=0D
>>  create mode 100644 drivers/input/misc/aw_sar/Makefile=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.h=0D
>> =0D
>> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig=0D
>> index 6ba984d7f0b1..ac56fdd21839 100644=0D
>> --- a/drivers/input/misc/Kconfig=0D
>> +++ b/drivers/input/misc/Kconfig=0D
>> @@ -939,4 +939,13 @@ config INPUT_STPMIC1_ONKEY=0D
>>  	  To compile this driver as a module, choose M here: the=0D
>>  	  module will be called stpmic1_onkey.=0D
>>  =0D
>> +config AWINIC_SAR=0D
>> +	tristate "Awinic sar sensor support"=0D
>> +	depends on I2C=0D
>> +	help=0D
>> +	  Say Y to enable support for the Awinic sar sensor driver.=0D
>> +=0D
>> +	  To compile this driver as a module, choose M here: the=0D
>> +	  module will be called awinic_sar.=0D
>> +=0D
>>  endif=0D
>> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile=0D
>> index 04296a4abe8e..6ee1870ea677 100644=0D
>> --- a/drivers/input/misc/Makefile=0D
>> +++ b/drivers/input/misc/Makefile=0D
>> @@ -90,3 +90,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+=3D wm831x-on.o=0D
>>  obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+=3D xen-kbdfront.o=0D
>>  obj-$(CONFIG_INPUT_YEALINK)		+=3D yealink.o=0D
>>  obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+=3D ideapad_slidebar.o=0D
>> +obj-$(CONFIG_AWINIC_SAR)		+=3D aw_sar/=0D
>> diff --git a/drivers/input/misc/aw_sar/Makefile b/drivers/input/misc/aw_=
sar/Makefile=0D
>> new file mode 100644=0D
>> index 000000000000..c357ecaa4f98=0D
>> --- /dev/null=0D
>> +++ b/drivers/input/misc/aw_sar/Makefile=0D
>> @@ -0,0 +1,2 @@=0D
>> +obj-$(CONFIG_AWINIC_SAR) +=3D awinic_sar.o=0D
>> +awinic_sar-objs :=3D ./comm/aw_sar_comm_interface.o aw_sar.o ./aw9610x/=
aw9610x.o ./aw963xx/aw963xx.o=0D
>> diff --git a/drivers/input/misc/aw_sar/aw_sar.c b/drivers/input/misc/aw_=
sar/aw_sar.c=0D
>> new file mode 100644=0D
>> index 000000000000..ab89fed65a6a=0D
>> --- /dev/null=0D
>> +++ b/drivers/input/misc/aw_sar/aw_sar.c=0D
>> @@ -0,0 +1,2036 @@=0D
>> +// SPDX-License-Identifier: GPL-2.0=0D
>> +/*=0D
>> + * AWINIC sar sensor driver=0D
>> + *=0D
>> + * Author: Shuaijie Wang<wangshuaijie@awinic.com>=0D
>> + *=0D
>> + * Copyright (c) 2024 awinic Technology CO., LTD=0D
>> + */=0D
>> +#include "./comm/aw_sar_chip_interface.h"=0D
>> +#include "aw_sar.h"=0D
>> +=0D
>> +#define AW_SAR_I2C_NAME		"awinic_sar"=0D
>> +=0D
>> +/*=0D
>> + * Please check which power_supply on your platform=0D
>> + * can get the charger insertion information, then select it.=0D
>> + * eg: "usb"/"charger"/"mtk-master-charger"/"mtk_charger_type"=0D
>> + */=0D
>> +#define USB_POWER_SUPPLY_NAME   "charger"=0D
>> +/*=0D
>> + * Check which of your power_supply properties is available=0D
>> + * for the charger insertion information and select it.=0D
>> + * eg: POWER_SUPPLY_PROP_ONLINE/POWER_SUPPLY_PROP_PRESENT=0D
>> + */=0D
>> +#define AW_USB_PROP_ONLINE	POWER_SUPPLY_PROP_ONLINE=0D
>> +=0D
>> +#define AW_I2C_RW_RETRY_TIME_MIN		(2000)=0D
>> +#define AW_I2C_RW_RETRY_TIME_MAX		(3000)=0D
>> +#define AW_RETRIES				(5)=0D
>> +=0D
>> +#define AW_SAR_AWRW_OffSET			(20)=0D
>> +#define AW_SAR_AWRW_DATA_WIDTH			(5)=0D
>> +#define AW_DATA_OffSET_2			(2)=0D
>> +#define AW_DATA_OffSET_3			(3)=0D
>> +#define AW_POWER_ON_SYSFS_DELAY_MS		(5000)=0D
>> +#define AW_SAR_MONITOR_ESD_DELAY_MS		(5000)=0D
>> +#define AW_SAR_OFFSET_LEN			(15)=0D
>> +#define AW_SAR_VCC_MIN_UV			(1700000)=0D
>> +#define AW_SAR_VCC_MAX_UV			(3600000)=0D
>> +=0D
>> +static struct mutex aw_sar_lock;=0D
>> +=0D
>> +static int32_t aw_sar_get_chip_info(struct aw_sar *p_sar);=0D
>> +static void aw_sar_sensor_free(struct aw_sar *p_sar);=0D
>> +=0D
>> +//Because disable/enable_irq api Therefore, IRQ is embedded=0D
>> +void aw_sar_disable_irq(struct aw_sar *p_sar)=0D
>> +{=0D
>> +	if (p_sar->irq_init.host_irq_stat =3D=3D IRQ_ENABLE) {=0D
>> +		disable_irq(p_sar->irq_init.to_irq);=0D
>> +		p_sar->irq_init.host_irq_stat =3D IRQ_DISABLE;=0D
>> +	}=0D
>> +}=0D
>> +=0D
>> +void aw_sar_enable_irq(struct aw_sar *p_sar)=0D
>> +{=0D
>> +	if (p_sar->irq_init.host_irq_stat =3D=3D IRQ_DISABLE) {=0D
>> +		enable_irq(p_sar->irq_init.to_irq);=0D
>> +		p_sar->irq_init.host_irq_stat =3D IRQ_ENABLE;=0D
>> +	}=0D
>> +}=0D
>> +=0D
>> +//Chip logic part start=0D
>> +//Load default array function=0D
>> +static int32_t=0D
>> +aw_sar_para_loaded_func(struct i2c_client *i2c, const struct aw_sar_par=
a_load_t *para_load)=0D
>> +{=0D
>> +	int32_t ret;=0D
>> +	int32_t i;=0D
>=0D
>int32_t? So you send user-space driver to the kernel? That would explain=0D
>this terrible coding style, but it is a clear no-go.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>=0D
>...=0D
>=0D
>> +static void aw_sar_monitor_work(struct work_struct *aw_work)=0D
>> +{=0D
>> +	struct aw_sar *p_sar =3D container_of(aw_work, struct aw_sar, monitor_=
work.work);=0D
>> +	uint32_t data;=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	ret =3D aw_sar_i2c_read(p_sar->i2c, 0x0000, &data);=0D
>> +	if (ret !=3D 0) {=0D
>> +		dev_err(p_sar->dev, "read 0x0000 err: %d", ret);=0D
>> +		return;=0D
>> +	}=0D
>> +	if (data =3D=3D 0 && p_sar->driver_code_initover_flag) {=0D
>> +		dev_err(p_sar->dev, "aw_chip may reset");=0D
>> +		aw_sar_disable_irq(p_sar);=0D
>> +		ret =3D aw_sar_chip_init(p_sar);=0D
>> +		if (ret !=3D 0)=0D
>> +			return;=0D
>> +	}=0D
>> +	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,=0D
>> +			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));=0D
>> +}=0D
>> +=0D
>> +static int32_t aw_sar_monitor_esd_init(struct aw_sar *p_sar)=0D
>> +{=0D
>> +	p_sar->monitor_wq =3D create_singlethread_workqueue("aw_sar_workqueue"=
);=0D
>> +	if (!p_sar->monitor_wq) {=0D
>> +		dev_err(&p_sar->i2c->dev, "aw_sar_workqueue error");=0D
>> +		return -EINVAL;=0D
>> +	}=0D
>> +	INIT_DELAYED_WORK(&p_sar->monitor_work, aw_sar_monitor_work);=0D
>> +	queue_delayed_work(p_sar->monitor_wq, &p_sar->monitor_work,=0D
>> +			msecs_to_jiffies(AW_SAR_MONITOR_ESD_DELAY_MS));=0D
>> +=0D
>> +	return 0;=0D
>> +}=0D
>> +=0D
>> +static void aw_sar_sensor_free(struct aw_sar *p_sar)=0D
>> +{=0D
>> +	if (g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit !=
=3D NULL)=0D
>> +		g_aw_sar_driver_list[p_sar->curr_use_driver_type].p_chip_deinit(p_sar=
);=0D
>> +}=0D
>> +=0D
>> +=0D
>> +/* Drive logic entry */=0D
>> +static int32_t aw_sar_i2c_probe(struct i2c_client *i2c)=0D
>> +{=0D
>> +	struct aw_sar *p_sar;=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {=0D
>> +		pr_err("check_functionality failed!\n");=0D
>> +		return -EIO;=0D
>> +	}=0D
>> +=0D
>> +	p_sar =3D devm_kzalloc(&i2c->dev, sizeof(struct aw_sar), GFP_KERNEL);=
=0D
>=0D
>Heh, so you upstream 10 year old code?=0D
>=0D
>sizeof(*)=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +	if (!p_sar) {=0D
>> +		ret =3D -ENOMEM;=0D
>> +		goto err_malloc;=0D
>=0D
>That's just return.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +	}=0D
>> +=0D
>> +	p_sar->dev =3D &i2c->dev;=0D
>> +	p_sar->i2c =3D i2c;=0D
>> +	i2c_set_clientdata(i2c, p_sar);=0D
>> +=0D
>> +	//1.Judge whether to use regular power supply. If yes, supply power=0D
>> +	ret =3D aw_sar_regulator_power(p_sar);=0D
>> +	if (ret !=3D 0) {=0D
>> +		dev_err(&i2c->dev, "regulator_power error!");=0D
>> +		goto err_malloc;=0D
>> +	}=0D
>> +=0D
>> +	//2.Get chip initialization resources=0D
>> +	ret =3D aw_sar_get_chip_info(p_sar);=0D
>> +	if (ret !=3D 0) {=0D
>> +		dev_err(&i2c->dev, "chip_init error!");=0D
>=0D
>DON't SCREAM! No need!=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +		goto err_chip_init;=0D
>> +	}=0D
>> +=0D
>> +	//3.Chip initialization process=0D
>> +	ret =3D aw_sar_init(p_sar);=0D
>> +	if (ret !=3D 0) {=0D
>> +		dev_err(&i2c->dev, "sar_init error!");=0D
>> +		goto err_sar_init;=0D
>> +	}=0D
>> +=0D
>> +	if (p_sar->dts_info.monitor_esd_flag) {=0D
>> +		ret =3D aw_sar_monitor_esd_init(p_sar);=0D
>> +		if (ret !=3D 0) {=0D
>> +			dev_err(&i2c->dev, "monitor_esd_init error!");=0D
>> +			goto err_esd_init;=0D
>> +		}=0D
>> +	}=0D
>> +=0D
>> +	dev_dbg(&i2c->dev, "probe success!");=0D
>=0D
>No. Drop all silly function entry/exit/success messages.=0D
>=0D
>EVERYWHERE.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +=0D
>> +	return 0;=0D
>> +=0D
>=0D
>=0D
>> +static const struct of_device_id aw_sar_dt_match[] =3D {=0D
>> +	{ .compatible =3D "awinic,aw96103" },=0D
>> +	{ .compatible =3D "awinic,aw96105" },=0D
>> +	{ .compatible =3D "awinic,aw96303" },=0D
>> +	{ .compatible =3D "awinic,aw96305" },=0D
>> +	{ .compatible =3D "awinic,aw96308" },=0D
>=0D
>So all are compatible... express it in bindings.=0D
>=0D
=0D
Yes, all of them are compatible.=0D
=0D
>> +	{ },=0D
>> +};=0D
>> +=0D
>> +static const struct i2c_device_id aw_sar_i2c_id[] =3D {=0D
>> +	{ AW_SAR_I2C_NAME, 0 },=0D
>> +	{ },=0D
>> +};=0D
>> +MODULE_DEVICE_TABLE(i2c, aw_sar_i2c_id);=0D
>> +=0D
>> +static struct i2c_driver aw_sar_i2c_driver =3D {=0D
>> +	.driver =3D {=0D
>> +		.name =3D AW_SAR_I2C_NAME,=0D
>> +		.owner =3D THIS_MODULE,=0D
>=0D
>NAK=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +		.of_match_table =3D aw_sar_dt_match,=0D
>> +		.pm =3D &aw_sar_pm_ops,=0D
>> +	},=0D
>> +	.probe =3D aw_sar_i2c_probe,=0D
>> +	.remove =3D aw_sar_i2c_remove,=0D
>> +	.shutdown =3D aw_sar_i2c_shutdown,=0D
>> +	.id_table =3D aw_sar_i2c_id,=0D
>> +};=0D
>> +=0D
>> +static int32_t __init aw_sar_i2c_init(void)=0D
>> +{=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	ret =3D i2c_add_driver(&aw_sar_i2c_driver);=0D
>> +	if (ret) {=0D
>> +		pr_err("fail to add aw_sar device into i2c\n");=0D
>> +		return ret;=0D
>> +	}=0D
>=0D
>Srsly, this is just NAK. This code is way too poor. Get some internal=0D
>help from awinic, because this should not be sent.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +=0D
>> +	return 0;=0D
>> +}=0D
>> +=0D
>> +module_init(aw_sar_i2c_init);=0D
>> +static void __exit aw_sar_i2c_exit(void)=0D
>> +{=0D
>> +	i2c_del_driver(&aw_sar_i2c_driver);=0D
>> +}=0D
>> +module_exit(aw_sar_i2c_exit);=0D
>> +MODULE_DESCRIPTION("AWINIC SAR Driver");=0D
>> +MODULE_LICENSE("GPL v2");=0D
>> diff --git a/drivers/input/misc/aw_sar/aw_sar.h b/drivers/input/misc/aw_=
sar/aw_sar.h=0D
>> new file mode 100644=0D
>> index 000000000000..7a139f56e9c3=0D
>> --- /dev/null=0D
>> +++ b/drivers/input/misc/aw_sar/aw_sar.h=0D
>> @@ -0,0 +1,15 @@=0D
>> +/* SPDX-License-Identifier: GPL-2.0-only */=0D
>> +#ifndef AW_SAR_H_=0D
>> +#define AW_SAR_H_=0D
>> +=0D
>> +void aw_sar_disable_irq(struct aw_sar *p_sar);=0D
>> +void aw_sar_enable_irq(struct aw_sar *p_sar);=0D
>> +=0D
>> +int32_t aw_sar_soft_reset(struct aw_sar *p_sar);=0D
>> +int32_t aw_sar_check_init_over_irq(struct aw_sar *p_sar);=0D
>> +int32_t aw_sar_update_fw(struct aw_sar *p_sar);=0D
>> +int32_t aw_sar_load_def_reg_bin(struct aw_sar *p_sar);=0D
>> +void aw_sar_mode_set(struct aw_sar *p_sar, uint8_t curr_mode);=0D
>> +int32_t aw_sar_update_reg_set_func(struct aw_sar *p_sar);=0D
>=0D
>=0D
>Why is all this needed for one file and why is it here?=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>Best regards,=0D
>Krzysztof=0D
=0D
Kind regards,=0D
Wang Shuaijie=


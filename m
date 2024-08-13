Return-Path: <linux-input+bounces-5552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F959509C9
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 18:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11CF6B28463
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 16:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B1E1A2C38;
	Tue, 13 Aug 2024 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOmkIMST"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5421A08B2;
	Tue, 13 Aug 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723565043; cv=none; b=V+a40iwYBYvxKP+fYz1n9tsTmS1YJl5ckLIw1J5BPIKPyKmwibv5IxjBS1vkoOkh0do6n+ngcd5ZRiDooVJR1S2xLpox4Evtq9aO8T412rLYEh1mZ7SLXTmNwKmj6Fq7Ca28EX5gP+Ee6wPYaiP/PsU+wqjHuyS1ebQ3jsJQKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723565043; c=relaxed/simple;
	bh=AIPOcbST12c2vP8QNHwnx4AtO2Jc6NsC/GSNSkkdmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hfm+VcWlpkqtviXydFWWy0fVmOdl5P6TvLalLzF1ZtD3vGRQWwUzDaq1vMYhakB9DukdFiADeAsvs/KQRkAwJ7wdQq8pkqUWdJyk22quWJqaozRZP4TaXCsayXTYDiTcG7KFd6v117W0EFPzJ3BU08QlZW/DekgUOxlLkA31WvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOmkIMST; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso1058a91.1;
        Tue, 13 Aug 2024 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723565041; x=1724169841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=coMKfiZLhYnLjIYcy0rQ0mgBVVo8HevD55HsBwiOU0g=;
        b=gOmkIMSTgpalJq+iHpbkGCF3DyHAz0jglOhHEJ1b7BE+Mq/8y21l3WLigRzAfzu44M
         +Reco9UjOFBSu1aOkuJ1szyIMfBOyoofZF0IiQAxIucYFMTV24m8GVQs7pKI1tOc//4u
         4JC/w3l4ZPAKTyLj9VxUKy3DP9NBtzU8j1YLmTe+ghSKw6zzIFljyQ9nBgN5UZa90oto
         yrlQ+Q6ob+bt65z9cMYpNNCTTtJcm6YSLUWEqsQfVmwL008AOZMi7s70LK5iTWKCRgfg
         9SYki8rH1ftG5ZGuMdhhWjj4vM/sUtRdeJ/K5OBD9bwnSIJ6vmWTMdYzCv2e/KMigZdX
         Z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723565041; x=1724169841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coMKfiZLhYnLjIYcy0rQ0mgBVVo8HevD55HsBwiOU0g=;
        b=T8K279mBxJ/f72EjWgN/3GfdG+KcN/UNvXCw8S6ZOrsxzrYQnRfDbEj+hTyqckQxSD
         coRBxFtvZzJ2EYJWFdfxHv9K1xCvmpdx+FzSUFgchWhlN97OAw2is9BBKsSNQ7KtnfmK
         vWSEi5ruwYdLbkSDnjsaGKvpXIEAhQkFRkKoTx9h7vOpbI+3dv6xz/vnA8BFfQynK7TM
         Bt76+x1VbIcAjYkc+bUr9K7VjeEBDdoqJ+CvBVptLjP0/K4QWpgw3vzO+iBaRp1VBgef
         AUCVmSLX9bi4HUDX4kuCWH/h1vqK4mCsMPbiAJkbstqoMCNpOOYvthEnji9UfeDWsLmu
         ax3w==
X-Forwarded-Encrypted: i=1; AJvYcCWYQd8V2laHpNF8ipXw8Nvji6TpBkcx5v9XGpJnojz9Yzq71fnVJjREdRMzSYxiFqSy/LhqwvUER/SWVjEKl4cOxAfDSOBIF7FLI+Odrf6CmTC309gq+1p5CGOK5RfsxhzXu1aPQMYjyLhFQIzGtQ6yT+Mo2I/Q239adVYEH0py5MojMB7gCwJ/4ySZkIF/kfi/NvaomRDNYRJ2OqpJ2ROPyGcnRqlyW0N5BAHLvzlUdhZrDeSy7DQjbJqfjCPu
X-Gm-Message-State: AOJu0YxF38l2gKXxy2u3b3VCJe0VeF1gFX5tbfo6edJRtiAQO5tcLyQy
	dLpxQ6O3E2U5ryWaBjywtc53QbPDYW+vqgipC3cVdHWXg0k/QUrF
X-Google-Smtp-Source: AGHT+IFSYH17aUCbzqNTOD0ezj8UoRFxVhMSEd+pvDe7v1gzzE7Ubx7bkY57TsF+FPznjELY8XdTew==
X-Received: by 2002:a17:90a:e7c3:b0:2d1:e33c:94a0 with SMTP id 98e67ed59e1d1-2d3a9e53a80mr257636a91.2.1723565040524;
        Tue, 13 Aug 2024 09:04:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcfe732bsm7539851a91.44.2024.08.13.09.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 09:03:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd1db8a4-9ea5-49b2-9316-65bf3753a7fa@roeck-us.net>
Date: Tue, 13 Aug 2024 09:03:57 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] hwmon: add driver for the hwmon parts of qnap-mcu
 devices
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org, jdelvare@suse.com,
 dmitry.torokhov@gmail.com, pavel@ucw.cz
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20240810184743.277248-1-heiko@sntech.de>
 <20240810184743.277248-6-heiko@sntech.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240810184743.277248-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/24 11:47, Heiko Stuebner wrote:
> The MCU can be found on network-attached-storage devices made by QNAP
> and provides access to fan control including reading back its RPM as
> well as reading the temperature of the NAS case.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   Documentation/hwmon/index.rst          |   1 +
>   Documentation/hwmon/qnap-mcu-hwmon.rst |  27 ++
>   MAINTAINERS                            |   1 +
>   drivers/hwmon/Kconfig                  |  12 +
>   drivers/hwmon/Makefile                 |   1 +
>   drivers/hwmon/qnap-mcu-hwmon.c         | 392 +++++++++++++++++++++++++
>   6 files changed, 434 insertions(+)
>   create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
>   create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 913c11390a457..7adbe23f06597 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -199,6 +199,7 @@ Hardware Monitoring Kernel Drivers
>      pxe1610
>      pwm-fan
>      q54sj108a2
> +   qnap-mcu-hwmon
>      raspberrypi-hwmon
>      sbrmi
>      sbtsi_temp
> diff --git a/Documentation/hwmon/qnap-mcu-hwmon.rst b/Documentation/hwmon/qnap-mcu-hwmon.rst
> new file mode 100644
> index 0000000000000..83407e3408f2b
> --- /dev/null
> +++ b/Documentation/hwmon/qnap-mcu-hwmon.rst
> @@ -0,0 +1,27 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver qnap-mcu-hwmon
> +============================
> +
> +This driver enables the use of the hardware monitoring and fan control
> +of the MCU used on some QNAP network attached storage devices.
> +
> +Author: Heiko Stuebner <heiko@sntech.de>
> +
> +Description
> +-----------
> +
> +The driver implements a simple interface for driving the fan controlled by
> +setting its PWM output value and exposes the fan rpm and case-temperature
> +to user space through hwmon's sysfs interface.
> +
> +The fan rotation speed returned via the optional 'fan1_input' is calculated
> +inside the MCU device.
> +
> +The driver provides the following sensor accesses in sysfs:
> +
> +=============== ======= =======================================================
> +fan1_input	ro	fan tachometer speed in RPM
> +pwm1		rw	relative speed (0-255), 255=max. speed.
> +temp1_input	ro	Measured temperature in millicelsius
> +=============== ======= =======================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index baaec814bea1b..282042e3d5f80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18655,6 +18655,7 @@ F:	drivers/media/tuners/qm1d1c0042*
>   QNAP MCU DRIVER
>   M:	Heiko Stuebner <heiko@sntech.de>
>   S:	Maintained
> +F:	drivers/hwmon/qnap-mcu-hwmon.c
>   F:	drivers/input/misc/qnap-mcu-input.c
>   F:	drivers/leds/leds-qnap-mcu.c
>   F:	drivers/mfd/qnap-mcu.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index b60fe2e58ad6c..0118ad91057e0 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1793,6 +1793,18 @@ config SENSORS_PWM_FAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called pwm-fan.
>   
> +config SENSORS_QNAP_MCU_HWMON
> +	tristate "QNAP MCU hardware monitoring"
> +	depends on MFD_QNAP_MCU
> +	depends on THERMAL || THERMAL=n
> +	help
> +	  Say yes here to enable support for fan and temperature sensor
> +	  connected to a QNAP MCU, as found in a number of QNAP network
> +	  attached storage devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called qnap-mcu-hwmon.
> +
>   config SENSORS_RASPBERRYPI_HWMON
>   	tristate "Raspberry Pi voltage monitor"
>   	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b1c7056c37db5..d60f46a03cc96 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
>   obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>   obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
> +obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>   obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
> diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
> new file mode 100644
> index 0000000000000..f106fe8b012ea
> --- /dev/null
> +++ b/drivers/hwmon/qnap-mcu-hwmon.c
> @@ -0,0 +1,392 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Driver for hwmon elements found on QNAP-MCU devices
> + *
> + * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
> + */
> +
> +#include <linux/fwnode.h>
> +#include <linux/hwmon.h>
> +#include <linux/mfd/qnap-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/thermal.h>
> +
> +struct qnap_mcu_hwmon {
> +	struct qnap_mcu *mcu;
> +	struct device *dev;
> +
> +	unsigned int pwm_min;
> +	unsigned int pwm_max;
> +
> +	struct fwnode_handle *fan_node;
> +	unsigned int fan_state;
> +	unsigned int fan_max_state;
> +	unsigned int *fan_cooling_levels;
> +
> +	struct thermal_cooling_device *cdev;
> +	struct hwmon_chip_info info;
> +};
> +
> +static int qnap_mcu_hwmon_get_rpm(struct qnap_mcu_hwmon *hwm)
> +{
> +	static const u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x46, /* F */
> +		[2] = 0x41  /* A */
> +	};
> +	u8 reply[6];
> +	int ret;
> +
> +	/* poll the fan rpm */
> +	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return ret;
> +
> +	/* First 2 bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, 2))
> +		return -EIO;
> +
> +	return reply[4] * 30;
> +}
> +
> +static int qnap_mcu_hwmon_get_pwm(struct qnap_mcu_hwmon *hwm)
> +{
> +	static const u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x46, /* F */
> +		[2] = 0x5a, /* Z */
> +		[3] = 0x30  /* 0 ... fan-id? */
> +	};
> +	u8 reply[4];
> +	int ret;
> +
> +	/* poll the fan pwm */
> +	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return ret;
> +
> +	/* First 3 bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, 3))
> +		return -EIO;
> +
> +	return reply[3];
> +}
> +
> +static int qnap_mcu_hwmon_set_pwm(struct qnap_mcu_hwmon *hwm, u8 pwm)
> +{
> +	const u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x46, /* F */
> +		[2] = 0x57, /* W */
> +		[3] = 0x30, /* 0 ... fan-id? */
> +		[4] = pwm
> +	};
> +
> +	/* set the fan pwm */
> +	return qnap_mcu_exec_with_ack(hwm->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_hwmon_get_temp(struct qnap_mcu_hwmon *hwm)
> +{
> +	static const u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x54, /* T */
> +		[2] = 0x33  /* 3 */
> +	};
> +	u8 reply[4];
> +	int ret;
> +
> +	/* poll the fan rpm */
> +	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return ret;
> +
> +	/* First bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, sizeof(cmd)))
> +		return -EIO;
> +
> +	/*
> +	 * There is an unknown bit set in bit7.
> +	 * Bits [6:0] report the actual temperature as returned by the
> +	 * original qnap firmware-tools, so just drop bit7 for now.
> +	 */
> +	return (reply[3] & 0x7f) * 1000;
> +}
> +
> +static int qnap_mcu_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +				u32 attr, int channel, long val)
> +{
> +	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 255)
> +			return -EINVAL;
> +
> +		if (val != 0)
> +			val = clamp_val(val, hwm->pwm_min, hwm->pwm_max);
> +
> +		return qnap_mcu_hwmon_set_pwm(hwm, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qnap_mcu_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, long *val)
> +{
> +	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = qnap_mcu_hwmon_get_pwm(hwm);
> +			if (ret < 0)
> +				return ret;
> +
> +			*val = ret;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_fan:
> +		ret = qnap_mcu_hwmon_get_rpm(hwm);
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = ret;
> +		return 0;
> +	case hwmon_temp:
> +		ret = qnap_mcu_hwmon_get_temp(hwm);
> +		if (ret < 0)
> +			return ret;
> +
> +		*val = ret;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t qnap_mcu_hwmon_is_visible(const void *data,
> +					 enum hwmon_sensor_types type,
> +					 u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return 0444;
> +
> +	case hwmon_pwm:
> +		return 0644;
> +
> +	case hwmon_fan:
> +		return 0444;
> +
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_ops qnap_mcu_hwmon_hwmon_ops = {
> +	.is_visible = qnap_mcu_hwmon_is_visible,
> +	.read = qnap_mcu_hwmon_read,
> +	.write = qnap_mcu_hwmon_write,
> +};
> +
> +/* thermal cooling device callbacks */
> +static int qnap_mcu_hwmon_get_max_state(struct thermal_cooling_device *cdev,
> +					unsigned long *state)
> +{
> +	struct qnap_mcu_hwmon *hwm = cdev->devdata;
> +
> +	if (!hwm)
> +		return -EINVAL;
> +
> +	*state = hwm->fan_max_state;
> +
> +	return 0;
> +}
> +
> +static int qnap_mcu_hwmon_get_cur_state(struct thermal_cooling_device *cdev,
> +					unsigned long *state)
> +{
> +	struct qnap_mcu_hwmon *hwm = cdev->devdata;
> +
> +	if (!hwm)
> +		return -EINVAL;
> +
> +	*state = hwm->fan_state;
> +
> +	return 0;
> +}
> +
> +static int qnap_mcu_hwmon_set_cur_state(struct thermal_cooling_device *cdev,
> +					unsigned long state)
> +{
> +	struct qnap_mcu_hwmon *hwm = cdev->devdata;
> +	int ret;
> +
> +	if (!hwm || state > hwm->fan_max_state)
> +		return -EINVAL;
> +
> +	if (state == hwm->fan_state)
> +		return 0;
> +
> +	ret = qnap_mcu_hwmon_set_pwm(hwm, hwm->fan_cooling_levels[state]);
> +	if (ret)
> +		return ret;
> +
> +	hwm->fan_state = state;
> +
> +	return ret;
> +}
> +
> +static const struct thermal_cooling_device_ops qnap_mcu_hwmon_cooling_ops = {
> +	.get_max_state = qnap_mcu_hwmon_get_max_state,
> +	.get_cur_state = qnap_mcu_hwmon_get_cur_state,
> +	.set_cur_state = qnap_mcu_hwmon_set_cur_state,
> +};
> +
> +static void devm_fan_node_release(void *data)
> +{
> +	struct qnap_mcu_hwmon *hwm = data;
> +
> +	fwnode_handle_put(hwm->fan_node);
> +}
> +
> +static int qnap_mcu_hwmon_get_cooling_data(struct device *dev, struct qnap_mcu_hwmon *hwm)
> +{
> +	struct fwnode_handle *fwnode;
> +	int num, i, ret;
> +
> +	fwnode = device_get_named_child_node(dev->parent, "fan-0");

Is the dummy "-0" index mandated somewhere ?

I don't care either way, it just seems odd. Either case,

Acked-by: Guenter Roeck <linux@roeck-us.net>

> +	if (!fwnode)
> +		return 0;
> +
> +	/* if we found the fan-node, we're keeping it until device-unbind */
> +	hwm->fan_node = fwnode;
> +	ret = devm_add_action_or_reset(dev, devm_fan_node_release, hwm);
> +	if (ret)
> +		return ret;
> +
> +	if (!fwnode_property_present(fwnode, "cooling-levels"))
> +		return 0;
> +

Side note: One could argue that a sub-node with no content does not really
make sense and should be invalid.

> +	ret = fwnode_property_count_u32(fwnode, "cooling-levels");
> +	if (ret <= 0) {
> +		dev_err(dev, "Failed to count elements in 'cooling-levels'\n");
> +		return ret ? : -EINVAL;
> +	}
> +
> +	num = ret;

Another side note: Using ret here isn't necessary. I'd just have used
'num' directly.

> +	hwm->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
> +					       GFP_KERNEL);
> +	if (!hwm->fan_cooling_levels)
> +		return -ENOMEM;
> +
> +	ret = fwnode_property_read_u32_array(fwnode, "cooling-levels",
> +					     hwm->fan_cooling_levels, num);
> +	if (ret) {
> +		dev_err(dev, "Failed to read 'cooling-levels'\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		if (hwm->fan_cooling_levels[i] > hwm->pwm_max) {
> +			dev_err(dev, "fan state[%d]:%d > %d\n", i,
> +				hwm->fan_cooling_levels[i], hwm->pwm_max);
> +			return -EINVAL;

In case you send another version, you might want to consider using dev_err_probe().

> +		}
> +	}
> +
> +	hwm->fan_max_state = num - 1;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info * const qnap_mcu_hwmon_channels[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static int qnap_mcu_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> +	const struct qnap_mcu_variant *variant = qnap_mcu_get_variant_data(mcu);
> +	struct qnap_mcu_hwmon *hwm;
> +	struct thermal_cooling_device *cdev;
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon;
> +	int ret;
> +
> +	hwm = devm_kzalloc(dev, sizeof(*hwm), GFP_KERNEL);
> +	if (!hwm)
> +		return -ENOMEM;
> +
> +	hwm->mcu = mcu;
> +	hwm->dev = &pdev->dev;
> +	hwm->pwm_min = variant->fan_pwm_min;
> +	hwm->pwm_max = variant->fan_pwm_max;
> +
> +	platform_set_drvdata(pdev, hwm);
> +
> +	/*
> +	 * Set duty cycle to maximum allowed.
> +	 */
> +	ret = qnap_mcu_hwmon_set_pwm(hwm, hwm->pwm_max);
> +	if (ret)
> +		return ret;
> +
> +	hwm->info.ops = &qnap_mcu_hwmon_hwmon_ops;
> +	hwm->info.info = qnap_mcu_hwmon_channels;
> +
> +	ret = qnap_mcu_hwmon_get_cooling_data(dev, hwm);
> +	if (ret)
> +		return ret;
> +
> +	hwm->fan_state = hwm->fan_max_state;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "qnapmcu",
> +						     hwm, &hwm->info, NULL);
> +	if (IS_ERR(hwmon))
> +		return dev_err_probe(dev, PTR_ERR(hwmon), "Failed to register hwmon device\n");
> +
> +	/*
> +	 * Only register cooling device when we found cooling-levels.
> +	 * qnap_mcu_hwmon_get_cooling_data() will fail when reading malformed
> +	 * levels and only succeed with either no or correct cooling levels.
> +	 */
> +	if (IS_ENABLED(CONFIG_THERMAL) && hwm->fan_cooling_levels) {
> +		cdev = devm_thermal_of_cooling_device_register(dev,
> +					to_of_node(hwm->fan_node), "qnap-mcu-hwmon",
> +					hwm, &qnap_mcu_hwmon_cooling_ops);
> +		if (IS_ERR(cdev))
> +			return dev_err_probe(dev, PTR_ERR(cdev),
> +				"Failed to register qnap-mcu-hwmon as cooling device\n");
> +		hwm->cdev = cdev;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qnap_mcu_hwmon_driver = {
> +	.probe = qnap_mcu_hwmon_probe,
> +	.driver = {
> +		.name = "qnap-mcu-hwmon",
> +	},
> +};
> +module_platform_driver(qnap_mcu_hwmon_driver);
> +
> +MODULE_ALIAS("platform:qnap-mcu-hwmon");
> +MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
> +MODULE_DESCRIPTION("QNAP MCU hwmon driver");
> +MODULE_LICENSE("GPL");



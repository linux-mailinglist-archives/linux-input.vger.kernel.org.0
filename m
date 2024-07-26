Return-Path: <linux-input+bounces-5168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28A93D4EC
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2024 16:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E2B286EA8
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2024 14:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFFDD51A;
	Fri, 26 Jul 2024 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7qndoa4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCC1B86CF;
	Fri, 26 Jul 2024 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003357; cv=none; b=B3NGCj9VvHihgGTg6qXZmc4ifAdjumDb8Bq0uHwLihGaGfFWRp9pP4wkAtXM7EYx840Lgg6UvjbYZDMv4BpTpa+FJBFY4uGFlW0c21EJS2Td2s1/IDTVcg2a6JKkfyQGVjohoKCaVu9ULHiIdeZfunJLt15XyIByfWadf7OFVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003357; c=relaxed/simple;
	bh=q+7vPrs9tt/3G8M1AeKN7lQVj9JjZLo0VFSqtFFUYyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4BRweoYNDmKR6Ah8YQfUMfkDqHY1Lb5jS2NAC+7auIJ+ebQAWoF6uNuk/ksDz618I2B/DtbK11E+NUXuBzvlJ9knhb57c72v5HL+A/F7EtO7YbEYVk2TJq1Vl8cJf8BTczN3aoIFcATq3LLs0com+HkXsj30gooX1r/3vleGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7qndoa4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b703eda27so685017b3a.3;
        Fri, 26 Jul 2024 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722003355; x=1722608155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IcU42lVW/EMANVHaPbsQ+AOUlbgahzpVYlZNTt0gz3c=;
        b=i7qndoa4WJAbQjj4zBG3jY9QPrjkY+Njo1Q3bzU3jOu3dCttgxDyv7idL5yfTWD32Q
         N3C2j1ieN5QA8p7pzYk+KdYmaCRybQVsmdopRIjjx/BTJbgdxvtHfTEZCXfJnrxctTZ8
         irRFLbmBqWjHRe22HeFm2YAz7/HOVu5St2xRaTqkDsY2zJOVCQWbBlP5hBVBSibp6PxZ
         OY5KmC5YDfJ6MK0LkvDLr9LZIR7cvUXb75nRu8E1T/tPnBBDJMoHt23S/Z8/YMxrwCTU
         39VjQr721Zm8TSJH1TAWpjgci+Aupqd3DC3Q1WZMKeb7XsCg3aQ5Jt1ywVf9Dfu6DFiO
         awBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003355; x=1722608155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcU42lVW/EMANVHaPbsQ+AOUlbgahzpVYlZNTt0gz3c=;
        b=IWmOltbP+IdQegYJNkTj0tJ2LYCz/apes9TRefTJsA5HvNQNC38WVSv/xJgioyLVbx
         sFohC2J7FpZSfd4dqpQlN37FRPBxPk1aSx/6nE/UMhgVDLBFDqtb+0QyBKSX1xoNLxcX
         JpKOaCcx20/J37rP2XKBePN8ebkhrkPrV8HMEdi/ZncenClrHdAdwU9m2w9EbaO3N7k9
         H9VvuIOx+79CMnNxpgqxF61h+vihMx1/7OAsFLqmM23I8v/frUVrHBZ4rt8iwcZLlYYF
         4NWrpXdF1R0fNBhTP15WqrWKb3tEMHm0qSja/3W6UPOcXaWn3/n6h/18hZVtSXgIdnTn
         UHBw==
X-Forwarded-Encrypted: i=1; AJvYcCXbNvYeUb3mBf6pTgZlOi20NFVmm3cH6qSXR09muKIeqEUtJT8Yp865feVTVBFvgfF7bwnAwoBVc2USs/V1TNklj2car/gRmTFSjuWWEbOxIOkOkQdSIerLqjPBQlT3wL/tw0vIvfnmgOoZUJbPZTw1oEzHyuBL8KUo3gcA3bfdnsWR+VksDReg0JvA83E2NOsrRtN/otOSN/I5jzDS+CN9actYFUe2tsvubpiVehifTr0Nidp8Xv1iff+TOMNp
X-Gm-Message-State: AOJu0Yw5Th0tiooUJFHIq0Jz3dv8jqa/TJLPYEp8IJafayS5bhuSe1tS
	n3yL0xLkf7ttjPBFr7FoKFhvdquC09ZaA4lbDaDJo/8uBr0yC3t5
X-Google-Smtp-Source: AGHT+IFHRgLy6fU2tz6dkC8CEuix85D6d1Htj4b3oD6BeYcL6dUKIQ0gxO+L9DALAoPyqXUn0jsW2g==
X-Received: by 2002:a05:6a21:9688:b0:1c1:61a9:de4a with SMTP id adf61e73a8af0-1c472acd1camr6581243637.24.1722003354706;
        Fri, 26 Jul 2024 07:15:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f7b7b08dsm2828561a12.19.2024.07.26.07.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 07:15:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9572496f-f6b8-4f66-b084-de7644ea60a8@roeck-us.net>
Date: Fri, 26 Jul 2024 07:15:50 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] hwmon: add driver for the hwmon parts of qnap-mcu
 devices
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org, jdelvare@suse.com,
 dmitry.torokhov@gmail.com, pavel@ucw.cz
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20240725194539.1780790-1-heiko@sntech.de>
 <20240725194539.1780790-6-heiko@sntech.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240725194539.1780790-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/24 12:45, Heiko Stuebner wrote:
> The MCU can be found on network-attached-storage devices made by QNAP
> and provides access to fan control including reading back its RPM as
> well as reading the temperature of the NAS case.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

checkpatch --strict:

total: 0 errors, 1 warnings, 9 checks, 377 lines checked

Te warning is about the MAINTAINERS file, which is your call,
but please fix the check messages.

That does make me wonder, though. It looks like you don't plan to sign up
to maintain this code. What do you expect to happen with it after it
has been accepted ?

> ---
>   drivers/hwmon/Kconfig          |  12 ++
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/qnap-mcu-hwmon.c | 352 +++++++++++++++++++++++++++++++++

Documentation (Documentation/hwmon/...) missing.

>   3 files changed, 365 insertions(+)
>   create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e14ae18a973b3..87b6ee463a967 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1806,6 +1806,18 @@ config SENSORS_PWM_FAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called pwm-fan.
>   
> +config SENSORS_QNAP_MCU_HWMON
> +	tristate "QNAP MCU hardware monitoring"
> +	depends on MFD_QNAP_MCU
> +	depends on THERMAL || THERMAL=n
> +	help
> +	  Say yes here to enable support for fans and temperatures sensors

s/temperatures/temperature/

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
> index e3f25475d1f04..b72c6a059e4af 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -188,6 +188,7 @@ obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
>   obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>   obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
> +obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>   obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
> diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
> new file mode 100644
> index 0000000000000..c4925ece165e2
> --- /dev/null
> +++ b/drivers/hwmon/qnap-mcu-hwmon.c
> @@ -0,0 +1,352 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Driver for hwmon elements found on QNAP-MCU devices
> + *
> + * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/hwmon.h>
> +#include <linux/mfd/qnap-mcu.h>
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
> +	unsigned int pwm_value;
> +	bool pwm_enabled;
> +
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
> +	u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x46, /* F */
> +		[2] = 0x41  /* A */
> +	};

Can this be static ?

> +	u8 reply[6];
> +	int ret;
> +
> +	/* poll the fan rpm */
> +	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return ret;
> +
> +	/* First 2 bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, 2)) {
> +		dev_err(hwm->dev, "malformed data received\n");

Pleas drop those error messages.

> +		return -EIO;
> +	}
> +
> +	return reply[4] * 450;
> +}
> +
> +static int qnap_mcu_hwmon_update_fan(struct qnap_mcu_hwmon *hwm)
> +{
> +	u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x46, /* F */
> +		[2] = 0x57, /* W */
> +		[3] = 0x30, /* 0 ... fan-id? */
> +		[4] = hwm->pwm_enabled ? hwm->pwm_value : 0

Per ABI, pwm_enabled == 0 is
		- 0: no fan speed control (i.e. fan at full speed)
This does the opposite.

I am not sure I understand the intent of pwm_enable.
It seems to me it is supposed to turn off the fan, which
is identical to just setting the pwm value to 0.
If so, why have this attribute in the first place ?

> +	};
> +
> +	/* poll the fan rpm */
> +	return qnap_mcu_exec_with_ack(hwm->mcu, cmd, sizeof(cmd));
> +}
> +
> +static int qnap_mcu_hwmon_get_temp(struct qnap_mcu_hwmon *hwm)
> +{
> +	u8 cmd[] = {
> +		[0] = 0x40, /* @ */
> +		[1] = 0x54, /* T */
> +		[2] = 0x33  /* 3 */
> +	};

static ?

> +	u8 reply[4];
> +	int ret;
> +
> +	/* poll the fan rpm */
> +	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
> +	if (ret)
> +		return ret;
> +
> +	/* First bytes must mirror the sent command */
> +	if (memcmp(cmd, reply, sizeof(cmd))) {
> +		dev_err(hwm->dev, "malformed data received\n");

Same as above.

> +		return -EIO;
> +	}
> +
> +	/*
> +	 * There is an unknown bit set in bit7.
> +	 * Bits [6:0] report the actual temperature as returned by the
> +	 * original qnap firmware-tools, so just drop bit7 for now.
> +	 */
> +	return reply[3] & 0x7f;
> +}
> +
> +static int qnap_mcu_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < hwm->pwm_min || val > hwm->pwm_max)
> +			return -EINVAL;
> +

I'd suggest to bail out if the value is outside (0, 255) and then
clamp to (pwm_min, pwm_max). Users of the API are expected to know that
pwm values are between 0 and 255, but not what the actual value range is.

> +		hwm->pwm_value = val;
> +		return qnap_mcu_hwmon_update_fan(hwm);
> +	case hwmon_pwm_enable:
> +		if (val < 0 || val > 1)
> +			return -EINVAL;
> +
> +		hwm->pwm_enabled = val;
> +		return qnap_mcu_hwmon_update_fan(hwm);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qnap_mcu_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, long *val)
> +{
> +	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			*val = hwm->pwm_value;

This doesn't return a real pwm value. It returns the most recently configured
value, or 0 if no value was ever set. That makes me really unhappy. At the very least,
if it is indeed impossible to get the actual pwm value from the device, it needs to be
very clearly documented.

> +			return 0;
> +		case hwmon_pwm_enable:
> +			*val = hwm->pwm_enabled;
> +			return 0;

		default:
missing

> +		}
> +		return -EOPNOTSUPP;
> +	case hwmon_fan:
> +		*val = qnap_mcu_hwmon_get_rpm(hwm);

This returns errors as negative rpm values.

> +		return 0;
> +	case hwmon_temp:
> +		*val = qnap_mcu_hwmon_get_temp(hwm);

hwmon ABI expects the temperature in degrees C. This returns
a value between 0 and 0x7f, or in other words temperatures
between 0 and 0.127 degrees C. On top of that, it returns errors
as negative temperatures.

Your call how to fix this. Either
		ret = qnap_mcu_hwmon_get_temp(hwm);
		if (ret < 0)
			return ret;
		*val = ret * 1000;
		return 0;
or
		return qnap_mcu_hwmon_get_temp(hwm, val);

and implement the conversion and return value assignment in
qnap_mcu_hwmon_get_temp().

> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t qnap_mcu_hwmon_is_visible(const void *data,
> +				       enum hwmon_sensor_types type,
> +				       u32 attr, int channel)
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
> +				      unsigned long *state)
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
> +				      unsigned long *state)
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
> +				      unsigned long state)
> +{
> +	struct qnap_mcu_hwmon *hwm = cdev->devdata;
> +	int ret;
> +
> +	if (!hwm || (state > hwm->fan_max_state))

Extra ( )

> +		return -EINVAL;
> +
> +	if (state == hwm->fan_state)
> +		return 0;
> +
> +	if (hwm->fan_cooling_levels[state]) {
> +		hwm->pwm_enabled = 1;
> +		hwm->pwm_value = hwm->fan_cooling_levels[state];
> +	} else {
> +		hwm->pwm_enabled = 0;
> +	}
> +
> +	ret = qnap_mcu_hwmon_update_fan(hwm);
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
> +static int qnap_mcu_hwmon_get_cooling_data(struct device *dev, struct qnap_mcu_hwmon *hwm)
> +{
> +	int num, i, ret;
> +
> +	if (!device_property_present(dev->parent, "cooling-levels"))
> +		return 0;
> +
> +	ret = device_property_count_u32(dev->parent, "cooling-levels");
> +	if (ret <= 0) {
> +		dev_err(dev, "Wrong data!\n");

That doesn't really mean anything to the user. Please refer to
'cooling-levels' like below.

> +		return ret ? : -EINVAL;
> +	}
> +
> +	num = ret;
> +	hwm->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
> +						   GFP_KERNEL);
> +	if (!hwm->fan_cooling_levels)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32_array(dev->parent, "cooling-levels",
> +					     hwm->fan_cooling_levels, num);
> +	if (ret) {
> +		dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		if (hwm->fan_cooling_levels[i] > hwm->pwm_max) {
> +			dev_err(dev, "fan state[%d]:%d > %d\n", i,
> +				hwm->fan_cooling_levels[i], hwm->pwm_max);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	hwm->fan_max_state = num - 1;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info * const qnap_mcu_hwmon_channels[] = {
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
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
> +	 * Set duty cycle to maximum allowed and enable PWM output as well as
> +	 * the regulator. In case of error nothing is changed
> +	 */
> +	hwm->pwm_value = hwm->pwm_max;
> +	hwm->pwm_enabled = 1;
> +	qnap_mcu_hwmon_update_fan(hwm);
> +
> +	hwm->info.ops = &qnap_mcu_hwmon_hwmon_ops;
> +	hwm->info.info = qnap_mcu_hwmon_channels;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "qnapmcu",
> +						     hwm, &hwm->info, NULL);
> +	if (IS_ERR(hwmon))
> +		return dev_err_probe(dev, PTR_ERR(hwmon), "Failed to register hwmon device\n");
> +
> +	ret = qnap_mcu_hwmon_get_cooling_data(dev, hwm);
> +	if (ret)
> +		return ret;
> +

Please move ahead of hwmon device registration. It doesn't make sense to register
the hwmon device only to unregister it because of bad devicetree data.

> +	hwm->fan_state = hwm->fan_max_state;
> +
> +	if (IS_ENABLED(CONFIG_THERMAL)) {
> +		cdev = devm_thermal_of_cooling_device_register(dev,
> +				dev->parent->of_node, "qnap-mcu-hwmon",
> +				hwm, &qnap_mcu_hwmon_cooling_ops);

Does it make sense to register the cooling device even if there is no
cooling device data ?

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



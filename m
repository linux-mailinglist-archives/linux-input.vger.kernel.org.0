Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBFB20756D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 16:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390018AbgFXOPe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 10:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389682AbgFXOPe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 10:15:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFF8C061573;
        Wed, 24 Jun 2020 07:15:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d4so1488828pgk.4;
        Wed, 24 Jun 2020 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZNRCI6hOoZvLDW7csrUHiTuWPwM0GIWjlmANsXCItDs=;
        b=HAt+y7Yz6E0uiC9udzA1ae7w5Xq9QEwc5PmBtJK1aX2oGZX/FGUxZwpkmW/A6wf3sP
         ehD7tvJDZpZCqiPowDxd/uYWGLAhy62UftQfJjb4dE2dgyonkBx6OLzDAjU1OvghJb0k
         QTCw6FCRlfeVxRHGH/bQn+oQlsxXUZmLWWrKR/yQYJIyBw2GD6defV7xKd04kB0FQ+xn
         iB9r9fBVZluajXwHk9d2Qd/smcr4IgtcmFVVzyPBcPByMWg3C2ZJwD6OvOFyUHwm7CCw
         2JAtfuS/zJMCJopahT0DkvX6g24H9uhRsA3fzMRei0izvbk1/0i+W94ILonDrb+YXURD
         g6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZNRCI6hOoZvLDW7csrUHiTuWPwM0GIWjlmANsXCItDs=;
        b=Py1lZR89Pkncnjx5TTZdWTm+fosQnhpeAgGBx+bUUJKEgCZoaXj8nJxPxDj2Kta5sK
         0FwlDXLfiEn+4njqmwR1SY4xYM3BEeRZW/mIIWywXlLkYB2orAMuVrJbnuxpgWNMcaJQ
         rzHJdBzeM4DedmpU6AEGl9+75dKzKCGtgsShgiRkJdnPuB0sPJk8yrGfg/yAGmmWlJex
         4eh6yb25WwOmMpejMPh0Cg/qxCM6UKUdtrO//bnd9pa40kCdjYJdhPu7SyT3W8r3pLEE
         8PQ14hlhOawYCEiRpVEPkkhfH/s3NXHrZfSBp6asHeJfRTDPtOzDnGjiTeCOh1PiRLRI
         Mzpw==
X-Gm-Message-State: AOAM530vX+8EncMrAdHXJAt8AH009bkQ+u5qrwHfKOxu+KIwBlqhzsUu
        KhKe7v1OSE5Nxh28i1C63lKAOget
X-Google-Smtp-Source: ABdhPJxXW8+vDNgYmBuKadNRnxWfm/Wux9+sOvDz8S+e+E+rSNyaHNwAu5MHKbBMKPW79LgaT4pOTw==
X-Received: by 2002:a63:7453:: with SMTP id e19mr22166952pgn.450.1593008131457;
        Wed, 24 Jun 2020 07:15:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5sm5232976pfa.71.2020.06.24.07.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 07:15:30 -0700 (PDT)
Subject: Re: [PATCH v5] hwmon: add Corsair Commander Pro driver
To:     Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20200624124704.247940-1-mail@mariuszachmann.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a3192196-70c8-2dfd-bd3b-0539b71b4bc4@roeck-us.net>
Date:   Wed, 24 Jun 2020 07:15:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624124704.247940-1-mail@mariuszachmann.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/24/20 5:47 AM, Marius Zachmann wrote:
> As requested I have squashed the 3 commits into one.
> Sorry for the confusion.
> 
> This is v5 of a driver for the Corsair Commander Pro.
> It provides sysfs attributes for:
> - Reading fan speed
> - Reading temp sensors
> - Reading voltage values
> - Writing pwm and reading last written pwm
> - Reading fan and temp connection status
> 
> It is an usb driver, so it needs to be ignored by usbhid.
> The Corsair Commander Pro is a fan controller and provides
> no means for user interaction.
> The two device numbers are because there is a slightly
> different version of the same device. (Only difference
> seem to be in some presets.)
> 
> This is based on the staging/hwmon tree.
> 
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> ---
> 
> Changes from v4
> - squashed 3 commits into one.
> 
> Changes from v3
> - add device ids to hid_ignore_list in hid-quirks.h
> - removed unused update_interval
> - ccp_disconnect is static
> 
> Changes from v2
> - add corsair-cpro to Documentation/hwmon/index.rst
> - add SPDX license identifier to corsair-cpro.rst
> - remove fanX_enable from Documentation and driver
> - changed comment style
> - clarified protocol in comments
> - add get_temp_cnct for reading temperature sensor
>   connection status
> - added temp_cnct and temp_label in ccp_device
> - added tempX_label, showing connection status
> - renamed get_fan_mode_label to get_fan_cnct
> - get_temp_cnct and get_fan_cnct only called in probe
> - send_usb_cmd checks errors in the device response
> - send_usb_cmd clears the buffer and sets the
>   command
> - inlined get_fan_rpm and get_voltage and removed
>   functions
> - more reverse christmas tree
> 
> ---
>  Documentation/hwmon/corsair-cpro.rst |  40 +++
>  Documentation/hwmon/index.rst        |   1 +
>  MAINTAINERS                          |   6 +
>  drivers/hid/hid-quirks.c             |   2 +
>  drivers/hwmon/Kconfig                |  10 +
>  drivers/hwmon/Makefile               |   1 +
>  drivers/hwmon/corsair-cpro.c         | 489 +++++++++++++++++++++++++++
>  7 files changed, 549 insertions(+)
>  create mode 100644 Documentation/hwmon/corsair-cpro.rst
>  create mode 100644 drivers/hwmon/corsair-cpro.c
> 
> diff --git a/Documentation/hwmon/corsair-cpro.rst b/Documentation/hwmon/corsair-cpro.rst
> new file mode 100644
> index 000000000000..2383c6f72115
> --- /dev/null
> +++ b/Documentation/hwmon/corsair-cpro.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver corsair-cpro
> +==========================
> +
> +Supported devices:
> +
> +  * Corsair Commander Pro
> +  * Corsair Commander Pro (1000D)
> +
> +Author: Marius Zachmann
> +
> +Description
> +-----------
> +
> +This driver implements the sysfs interface for the Corsair Commander Pro.
> +The Corsair Commander Pro is a USB device with 6 fan connectors,
> +4 temperature sensor connectors and 2 Corsair LED connectors.
> +It can read the voltage levels on the SATA power connector.
> +
> +Usage Notes
> +-----------
> +
> +Since it is a USB device, hotswapping is possible. The device is autodetected.
> +
> +Sysfs entries
> +-------------
> +
> +======================= =====================================================================
> +in0_input		Voltage on SATA 12v
> +in1_input		Voltage on SATA 5v
> +in2_input		Voltage on SATA 3.3v
> +temp[1-4]_input		Temperature on connected temperature sensors
> +temp[1-4] label		Shows "nc" after name, when not connected
> +fan[1-6]_input		Connected fan rpm.
> +fan[1-6]_label		Shows connection status of the fan as detected by the device.
> +pwm[1-6]		Sets the fan speed. Values from 0-255.
> +			When reading, it reports the last value if it was set by the driver.
> +			Otherwise returns 0.
> +======================= =====================================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 55ff4b7c5349..750d3a975d82 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -47,6 +47,7 @@ Hardware Monitoring Kernel Drivers
>     bel-pfe
>     bt1-pvt
>     coretemp
> +   corsair-cpro
>     da9052
>     da9055
>     dell-smm-hwmon
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..47b0361718f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4400,6 +4400,12 @@ S:	Maintained
>  F:	Documentation/hwmon/coretemp.rst
>  F:	drivers/hwmon/coretemp.c
>  
> +CORSAIR-CPRO HARDWARE MONITOR DRIVER
> +M:	Marius  <mail@mariuszachmann.de>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/corsair-cpro.c
> +
>  COSA/SRP SYNC SERIAL DRIVER
>  M:	Jan "Yenya" Kasprzak <kas@fi.muni.cz>
>  S:	Maintained
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index ca8b5c261c7c..7b7bc7737c53 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -699,6 +699,8 @@ static const struct hid_device_id hid_ignore_list[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x0c10) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 0x1d00) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM109) },
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588..8b046a5dfa40 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -439,6 +439,16 @@ config SENSORS_BT1_PVT_ALARMS
>  	  the data conversion will be periodically performed and the data will be
>  	  saved in the internal driver cache.
>  
> +config SENSORS_CORSAIR_CPRO
> +	tristate "Corsair Commander Pro controller"
> +	depends on USB
> +	help
> +	  If you say yes here you get support for the Corsair Commander Pro
> +	  controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called corsair-cpro.
> +
>  config SENSORS_DRIVETEMP
>  	tristate "Hard disk drives with temperature sensors"
>  	depends on SCSI && ATA
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3e32c21f5efe..18e1ef74ade7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
>  obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
>  obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
>  obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
> +obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
>  obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
>  obj-$(CONFIG_SENSORS_DELL_SMM)	+= dell-smm-hwmon.o
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> new file mode 100644
> index 000000000000..b07a42041187
> --- /dev/null
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * corsair-cpro.c - Linux driver for Corsair Commander Pro
> + * Copyright (C) 2020 Marius Zachmann <mail@mariuszachmann.de>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +#define USB_VENDOR_ID_CORSAIR               0x1b1c
> +#define USB_PRODUCT_ID_CORSAIR_COMMANDERPRO 0x0c10
> +#define USB_PRODUCT_ID_CORSAIR_1000D	    0x1d00
> +
> +#define OUT_BUFFER_SIZE	63
> +#define IN_BUFFER_SIZE	16
> +#define LABEL_LENGTH	12
> +
> +#define CTL_GET_TMP_CNCT 0x10 /*
> +			       * returns in bytes 1-4 for each temp sensor:
> +			       * 0 not connected
> +			       * 1 connected
> +			       */

Alignments are odd. Please use tabs. Maximum number of columns is now 100,
so there should be enough space to avoid odd line breaks. Example:

#define CTL_GET_TMP_CNCT	0x10	/*
					 * returns in bytes 1-4 for each temp sensor:
					 * 0 not connected
					 * 1 connected
					 */

> +#define CTL_GET_TMP	 0x11 /*
> +			       * send: byte 1 is channel, rest zero
> +			       * rcv:  returns temp for channel in bytes 1 and 2

Add units (centi-degrees C ?)

> +			       * returns 17 in byte 0 if no sensor is connected
> +			       */
> +#define CTL_GET_VOLT	 0x12 /*
> +			       * send: byte 1 is rail number: 0 = 12v, 1 = 5v, 2 = 3.3v
> +			       * rcv:  returns volt in bytes 1,2

Add units (mV ?)

> +			       */
> +#define CTL_GET_FAN_CNCT 0x20 /*
> +			       * returns in bytes 1-6 for each fan:
> +			       * 0 not connected
> +			       * 1 3pin
> +			       * 2 4pin
> +			       */
> +#define CTL_GET_FAN_RPM	 0x21 /*
> +			       * send: byte 1 is channel, rest zero
> +			       * rcv:  returns rpm in bytes 1,2
> +			       */
> +#define CTL_SET_FAN_FPWM 0x23 /*
> +			       * set fixed pwm
> +			       * send: byte 1 is fan number
> +			       * send: byte 2 is percentage from 0 - 100
> +			       */
> +
> +struct ccp_device {
> +	struct usb_device *udev;
> +	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
> +	u8 *buffer;
> +	int pwm[6];
> +	char fan_label[6][LABEL_LENGTH];
> +	int temp_cnct[4];
> +	char temp_label[4][LABEL_LENGTH];
> +};
> +
> +/* send command, check for error in response, response in ccp->buffer */
> +static int send_usb_cmd(struct ccp_device *ccp, u8 command, u8 byte1, u8 byte2)
> +{
> +	int actual_length;
> +	int ret;
> +
> +	memset(ccp->buffer, 0x00, OUT_BUFFER_SIZE);
> +	ccp->buffer[0] = command;
> +	ccp->buffer[1] = byte1;
> +	ccp->buffer[2] = byte2;
> +
> +	ret = usb_bulk_msg(ccp->udev, usb_sndintpipe(ccp->udev, 2), ccp->buffer, OUT_BUFFER_SIZE,
> +			   &actual_length, 1000);
> +	if (ret) {
> +		dev_err(&ccp->udev->dev, "usb_bulk_msg send failed: %d", ret);
> +		return ret;
> +	}
> +
> +	/* response needs to be received every time */
> +	ret = usb_bulk_msg(ccp->udev, usb_rcvintpipe(ccp->udev, 1), ccp->buffer, IN_BUFFER_SIZE,
> +			   &actual_length, 1000);
> +	if (ret) {
> +		dev_err(&ccp->udev->dev, "usb_bulk_msg receive failed: %d", ret);
> +		return ret;
> +	}
> +
> +	/* first byte of response is error code */
> +	if (ccp->buffer[0] != 0x00) {
> +		dev_err(&ccp->udev->dev, "device response error: %d", ccp->buffer[0]);

I'd prefer if you drop those error messages. I am concerned about clogging the log
if the device is prone to return errors.

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/* for commands, which return just a number depending on a channel: */

s/,//
s/://

Also, it would be better to actually describe the function, not its callers

> +static int get_data(struct ccp_device *ccp, int command, int channel, long *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&ccp->mutex);
> +
> +	ret = send_usb_cmd(ccp, command, channel, 0);
> +	if (ret)
> +		goto exit;
> +
> +	*val = (ccp->buffer[1] << 8) + ccp->buffer[2];
> +

Since the data returned from the device is always >= 0, it is unnecessary to have
long *val as parameter. Instead, the return value can be used to return both error
and the value itself.
	ret = (ccp->buffer[1] << 8) + ccp->buffer[2];

Then the calling code can use this value as needed (see below).

> +exit:
> +	mutex_unlock(&ccp->mutex);
> +	return ret;> +}
> +
> +static int set_pwm(struct ccp_device *ccp, int channel, long val)
> +{
> +	int ret;
> +
> +	if (val < 0 || val > 255)
> +		return -EINVAL;
> +
> +	ccp->pwm[channel] = val;
> +
> +	/* The Corsair Commander Pro uses values from 0-100 */
> +	val = DIV_ROUND_CLOSEST(val * 100, 255);
> +
> +	mutex_lock(&ccp->mutex);
> +
> +	ret = send_usb_cmd(ccp, CTL_SET_FAN_FPWM, channel, val);
> +
> +	mutex_unlock(&ccp->mutex);
> +	return ret;
> +}
> +
> +/* read fan connection status and set labels */
> +static int get_fan_cnct(struct ccp_device *ccp)
> +{
> +	int channel;
> +	int mode;
> +	int ret;
> +
> +	mutex_lock(&ccp->mutex);
> +
> +	ret = send_usb_cmd(ccp, CTL_GET_FAN_CNCT, 0, 0);
> +	if (ret)
> +		goto exit;
> +
> +	for (channel = 0; channel < 6; channel++) {
> +		mode = ccp->buffer[channel + 1];
> +
> +		switch (mode) {
> +		case 0:
> +			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
> +				  "fan%d nc", channel + 1);
> +			break;
> +		case 1:
> +			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
> +				  "fan%d 3pin", channel + 1);
> +			break;
> +		case 2:
> +			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
> +				  "fan%d 4pin", channel + 1);
> +			break;
> +		default:
> +			scnprintf(ccp->fan_label[channel], LABEL_LENGTH,
> +				  "fan%d other", channel + 1);
> +			break;
> +		}
> +	}
> +
> +exit:

Nit: Coding style says:
	"Choose label names which say what the goto does or why the goto exists"
So a label such as "unlock" would be more appropriate. See
Documentation/process/coding-style.rst (Centralized exiting of functions)
for details.

> +	mutex_unlock(&ccp->mutex);
> +	return ret;
> +}
> +
> +/* read temp sensor connection status and set labels */
> +static int get_temp_cnct(struct ccp_device *ccp)
> +{
> +	int channel;
> +	int mode;
> +	int ret;
> +
> +	mutex_lock(&ccp->mutex);
> +

Actually, since the function is only called from probe, the mutex
is not needed here. Same for get_fan_cnct().

> +	ret = send_usb_cmd(ccp, CTL_GET_TMP_CNCT, 0, 0);
> +	if (ret)
> +		goto exit;
> +
> +	for (channel = 0; channel < 4; channel++) {
> +		mode = ccp->buffer[channel + 1];
> +		ccp->temp_cnct[channel] = mode;
> +
> +		switch (mode) {
> +		case 0:
> +			scnprintf(ccp->temp_label[channel], LABEL_LENGTH,
> +				  "temp%d nc", channel + 1);
> +			break;

Sorry I didn't realize this earlier: Since you know that the temperature
sensor is not connected, it would be better to mark it as such and have
the is_visible function return 0. The same applied to fans.
The easiest way to do that is to add bitmaps to struct ccp_device,
one for fans and one for temperature sensors, and set BIT(channel)
if the fan/sensor is installed.

> +		case 1:
> +			scnprintf(ccp->temp_label[channel], LABEL_LENGTH,
> +				  "temp%d", channel + 1);
> +			break;
> +		default:
> +			scnprintf(ccp->temp_label[channel], LABEL_LENGTH,
> +				  "temp%d other", channel + 1);
> +			break;
> +		}
> +	}
> +
> +exit:
> +	mutex_unlock(&ccp->mutex);
> +	return ret;
> +}
> +
> +static int get_temp(struct ccp_device *ccp, int channel, long *val)
> +{
> +	int ret;
> +
> +	if (ccp->temp_cnct[channel] != 1)
> +		return -ENODATA;
> +
When you do as suggested the above (use is_visible), this won't be needed,
and the code does not depend on the magic '1'. Actually, you could then drop
this function entirely; mor eon that see below.

> +	ret = get_data(ccp, CTL_GET_TMP, channel, val);
> +	*val = *val * 10;
> +
> +	return ret;
> +}
> +
> +static int ccp_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, const char **str)
> +{
> +	struct ccp_device *ccp = dev_get_drvdata(dev);
> +	int ret = 0;
> +

See below on pre-assignment.

> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			*str = ccp->fan_label[channel];
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			*str = ccp->temp_label[channel];
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ccp_read(struct device *dev, enum hwmon_sensor_types type,
> +		    u32 attr, int channel, long *val)
> +{
> +	struct ccp_device *ccp = dev_get_drvdata(dev);
> +	int ret = 0;
> +

Every code path sets ret, so pre-initializing it is not necessary.
If you want to pre-initialize, initialize it with -EOPNOTSUPP
and drop all the respective assignments below. Same goes for other
similar functions.


> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			ret = get_temp(ccp, channel, val);

Better:
			ret = get_data(ccp, CTL_GET_TMP, channel);
			if (ret < 0)
				break;
			*val = ret * 10;

> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			ret = get_data(ccp, CTL_GET_FAN_RPM, channel, val);

or:
			ret = get_data(ccp, CTL_GET_FAN_RPM, channel);
			if (ret < 0)
				break;
			*val = ret;

> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			/* how to read pwm values from the device is currently unknown */
> +			/* driver returns last set value or 0		               */
> +			*val = ccp->pwm[channel];
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			ret = get_data(ccp, CTL_GET_VOLT, channel, val);

or:
			ret = get_data(ccp, CTL_GET_VOLT, channel);
			if (ret < 0)
				break;
			*val = ret;

> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +};
> +
> +static int ccp_write(struct device *dev, enum hwmon_sensor_types type,
> +		     u32 attr, int channel, long val)
> +{
> +	struct ccp_device *ccp = dev_get_drvdata(dev);
> +	int ret = 0;
> +

Every code path sets ret, so pre-initializing it is not necessary.

> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			ret = set_pwm(ccp, channel, val);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +};
> +
> +static umode_t ccp_is_visible(const void *data, enum hwmon_sensor_types type,
> +			      u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return 0444;
> +		case hwmon_temp_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +};
> +
> +static const struct hwmon_ops ccp_hwmon_ops = {
> +	.is_visible = ccp_is_visible,
> +	.read = ccp_read,
> +	.read_string = ccp_read_string,
> +	.write = ccp_write,
> +};
> +
> +static const struct hwmon_channel_info *ccp_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL
> +			   ),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT
> +			   ),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT,
> +			   HWMON_I_INPUT
> +			   ),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info ccp_chip_info = {
> +	.ops = &ccp_hwmon_ops,
> +	.info = ccp_info,
> +};
> +
> +static int ccp_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +{
> +	struct device *hwmon_dev;
> +	struct ccp_device *ccp;
> +	int ret;
> +
> +	ccp = devm_kzalloc(&intf->dev, sizeof(struct ccp_device), GFP_KERNEL);
> +	if (!ccp)
> +		return -ENOMEM;
> +
> +	ccp->buffer = devm_kmalloc(&intf->dev, OUT_BUFFER_SIZE, GFP_KERNEL);
> +	if (!ccp->buffer)
> +		return -ENOMEM;
> +
> +	mutex_init(&ccp->mutex);
> +
> +	ccp->udev = interface_to_usbdev(intf);
> +
> +	/* temp and fan connection status only updates, when device is powered on */

s/,//

> +	ret = get_temp_cnct(ccp);
> +	if (ret)
> +		return ret;
> +
> +	ret = get_fan_cnct(ccp);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&intf->dev, "corsaircpro", ccp,
> +							 &ccp_chip_info, 0);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static void ccp_disconnect(struct usb_interface *intf)
> +{
> +}
> +
> +static const struct usb_device_id ccp_devices[] = {
> +	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_CORSAIR_COMMANDERPRO) },
> +	{ USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_PRODUCT_ID_CORSAIR_1000D) },
> +	{ }
> +};
> +
> +static struct usb_driver ccp_driver = {
> +	.name = "corsair-cpro",
> +	.probe = ccp_probe,
> +	.disconnect = ccp_disconnect,
> +	.id_table = ccp_devices
> +};
> +
> +MODULE_DEVICE_TABLE(usb, ccp_devices);
> +MODULE_LICENSE("GPL");
> +
> +module_usb_driver(ccp_driver);
> 


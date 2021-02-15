Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688AD31BBB9
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 16:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhBOPAJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 10:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhBOO6m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:58:42 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF6CC061574
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:58:01 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t15so9201208wrx.13
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=EQyJs/iEg/npeUZLSW+Wjr1l15AOYPepbhqAO1PccBg=;
        b=oTugsPD2EcpA4ATg5GL1iSnHYeLh8EQo9h9aA++kIDxx2OG8a/Pn/3InIKa3bMyv+x
         iWEujpWXi+AI3dUxFiKGWQbLCyf/5iIN2a0vLcYAvYVzka/XAoSCNadb9tJenK/Zikj8
         8hHZV0aEEmUXYFsft3mzEib906Ycrm0djbKt/kAS4GmYzw55KKt2SPAAxXZ0vQn7bPV6
         MQPrC/XA7ojAj4gebS1TQcJIoTPDmn/4NldYVDCxRFhJY8M69eHDFW+bF14B4pWo5k2i
         6+KTPotHioer/6b+veS39UePgyzl9w/7qAq1SHqvTR5YYZGbFcW7PvlKmLN9Qws/6/tp
         n0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=EQyJs/iEg/npeUZLSW+Wjr1l15AOYPepbhqAO1PccBg=;
        b=EsN7cdg6g1vSw4c4JUG+BI7ud7MWCiBzr2W8QtENWdsRF55RY6lPzEXc7jjSVrwy3S
         mhM7Ta2su3Ag294H/y2FldWDgIiSJfW4cP1UWOX0npHI7yYXk5g6wijPi7NIzLlpXjnA
         Yf3ZjqQzr8O9X+uG1uGtCCms0MkdDmbVyz8IijRARBMvedxFMizWBIZ8qCTgB8mUwjr+
         DGoHbbb1c20VmGPoI3KJ6izx9vJAO6KPe7gf6qLRtrieLvjcrcIaqBymiFwMmI3663E3
         HgRn22gxd0PSTNSh2bXkG2Ms3udZI2E8Oig8FOG3AGv7Caf43Z7l8IHSCKq7bbEc6Ucw
         RdpQ==
X-Gm-Message-State: AOAM532HuQOYBtZ/hxAXipqRU3itTRUze7CWjRJEs9VOh/otryauMD8c
        Ww9e5K0yI6QIsoSLNz9o0rw=
X-Google-Smtp-Source: ABdhPJw0/mXrdRYnmkt0TAWKe6prLSZuFMxWLyl9HGv8hIA/SSzLXxRiQiFBw14rDpwGJY2vXcPScQ==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr18558409wrb.180.1613401080627;
        Mon, 15 Feb 2021 06:58:00 -0800 (PST)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id i7sm125385wmq.2.2021.02.15.06.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:58:00 -0800 (PST)
Date:   Mon, 15 Feb 2021 15:15:30 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v12 01/14] HID: nintendo: add nintendo switch controller
 driver
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
 <20200823044157.339677-2-djogorchock@gmail.com>
In-Reply-To: <20200823044157.339677-2-djogorchock@gmail.com>
Message-Id: <397W9XBVTSEVU.3BYQZPZFRB3OO@homearch.localdomain>
User-Agent: mblaze/1.1-4-g36df5fe (2021-01-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

Just some small things (inline below) that I found when reviewing
the code.

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> The hid-nintendo driver supports the Nintendo Switch Pro Controllers and
> the Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
>=20
> The Joy-Cons each create their own, independent input devices, so it is
> up to userspace to combine them if desired.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  MAINTAINERS                |   6 +
>  drivers/hid/Kconfig        |  11 +
>  drivers/hid/Makefile       |   1 +
>  drivers/hid/hid-ids.h      |   3 +
>  drivers/hid/hid-nintendo.c | 871 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 892 insertions(+)
>  create mode 100644 drivers/hid/hid-nintendo.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e2698cc7e23..47e5a2a04665 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12121,6 +12121,12 @@ W:	http://www.netlab.is.tsukuba.ac.jp/~yokota/iz=
umi/ninja/
>  F:	Documentation/scsi/NinjaSCSI.rst
>  F:	drivers/scsi/nsp32*
> =20
> +NINTENDO HID DRIVER
> +M:	Daniel J. Ogorchock <djogorchock@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hid/hid-nintendo*
> +
>  NIOS2 ARCHITECTURE
>  M:	Ley Foon Tan <ley.foon.tan@intel.com>
>  S:	Maintained
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 45e87dc59d4e..b5cd42ed3b04 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -710,6 +710,17 @@ config HID_MULTITOUCH
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hid-multitouch.
> =20
> +config HID_NINTENDO
> +	tristate "Nintendo Joy-Con and Pro Controller support"
> +	depends on HID
> +	help
> +	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
> +	All controllers support bluetooth, and the Pro Controller also supports=

> +	its USB mode.
> +
> +	To compile this driver as a module, choose M here: the
> +	module will be called hid-nintendo.
> +
>  config HID_NTI
>  	tristate "NTI keyboard adapters"
>  	help
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index d8ea4b8c95af..d0cc21b38251 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -76,6 +76,7 @@ obj-$(CONFIG_HID_MAYFLASH)	+=3D hid-mf.o
>  obj-$(CONFIG_HID_MICROSOFT)	+=3D hid-microsoft.o
>  obj-$(CONFIG_HID_MONTEREY)	+=3D hid-monterey.o
>  obj-$(CONFIG_HID_MULTITOUCH)	+=3D hid-multitouch.o
> +obj-$(CONFIG_HID_NINTENDO)	+=3D hid-nintendo.o
>  obj-$(CONFIG_HID_NTI)			+=3D hid-nti.o
>  obj-$(CONFIG_HID_NTRIG)		+=3D hid-ntrig.o
>  obj-$(CONFIG_HID_ORTEK)		+=3D hid-ortek.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 6f370e020feb..605c4bdaeb85 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -878,6 +878,9 @@
>  #define USB_VENDOR_ID_NINTENDO		0x057e
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE	0x0306
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE2	0x0330
> +#define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
> +#define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
> +#define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
> =20
>  #define USB_VENDOR_ID_NOVATEK		0x0603
>  #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> new file mode 100644
> index 000000000000..7273ddf033e2
> --- /dev/null
> +++ b/drivers/hid/hid-nintendo.c
> @@ -0,0 +1,871 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
> + *
> + * Copyright (c) 2019 Daniel J. Ogorchock <djogorchock@gmail.com>
> + *
> + * The following resources/projects were referenced for this driver:
> + *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
> + *   https://gitlab.com/pjranki/joycon-linux-kernel (Peter Rankin)
> + *   https://github.com/FrotBot/SwitchProConLinuxUSB
> + *   https://github.com/MTCKC/ProconXInput
> + *   hid-wiimote kernel hid driver
> + *   hid-logitech-hidpp driver
> + *
> + * This driver supports the Nintendo Switch Joy-Cons and Pro Controllers=
. The
> + * Pro Controllers can either be used over USB or Bluetooth.
> + *
> + * The driver will retrieve the factory calibration info from the contro=
llers,
> + * so little to no user calibration should be required.
> + *
> + */
> +
> +#include "hid-ids.h"
> +#include <linux/delay.h>

This include doesn't seem to be used and can be removed.


> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +
> +/*
> + * Reference the url below for the following HID report defines:
> + * https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
> + */
> +
> +/* Output Reports */
> +static const u8 JC_OUTPUT_RUMBLE_AND_SUBCMD	=3D 0x01;
> +static const u8 JC_OUTPUT_FW_UPDATE_PKT		=3D 0x03;
> +static const u8 JC_OUTPUT_RUMBLE_ONLY		=3D 0x10;
> +static const u8 JC_OUTPUT_MCU_DATA		=3D 0x11;
> +static const u8 JC_OUTPUT_USB_CMD		=3D 0x80;
> +
> +/* Subcommand IDs */
> +static const u8 JC_SUBCMD_STATE			/*=3D 0x00*/;
> +static const u8 JC_SUBCMD_MANUAL_BT_PAIRING	=3D 0x01;
> +static const u8 JC_SUBCMD_REQ_DEV_INFO		=3D 0x02;
> +static const u8 JC_SUBCMD_SET_REPORT_MODE	=3D 0x03;
> +static const u8 JC_SUBCMD_TRIGGERS_ELAPSED	=3D 0x04;
> +static const u8 JC_SUBCMD_GET_PAGE_LIST_STATE	=3D 0x05;
> +static const u8 JC_SUBCMD_SET_HCI_STATE		=3D 0x06;
> +static const u8 JC_SUBCMD_RESET_PAIRING_INFO	=3D 0x07;
> +static const u8 JC_SUBCMD_LOW_POWER_MODE	=3D 0x08;
> +static const u8 JC_SUBCMD_SPI_FLASH_READ	=3D 0x10;
> +static const u8 JC_SUBCMD_SPI_FLASH_WRITE	=3D 0x11;
> +static const u8 JC_SUBCMD_RESET_MCU		=3D 0x20;
> +static const u8 JC_SUBCMD_SET_MCU_CONFIG	=3D 0x21;
> +static const u8 JC_SUBCMD_SET_MCU_STATE		=3D 0x22;
> +static const u8 JC_SUBCMD_SET_PLAYER_LIGHTS	=3D 0x30;
> +static const u8 JC_SUBCMD_GET_PLAYER_LIGHTS	=3D 0x31;
> +static const u8 JC_SUBCMD_SET_HOME_LIGHT	=3D 0x38;
> +static const u8 JC_SUBCMD_ENABLE_IMU		=3D 0x40;
> +static const u8 JC_SUBCMD_SET_IMU_SENSITIVITY	=3D 0x41;
> +static const u8 JC_SUBCMD_WRITE_IMU_REG		=3D 0x42;
> +static const u8 JC_SUBCMD_READ_IMU_REG		=3D 0x43;
> +static const u8 JC_SUBCMD_ENABLE_VIBRATION	=3D 0x48;
> +static const u8 JC_SUBCMD_GET_REGULATED_VOLTAGE	=3D 0x50;
> +
> +/* Input Reports */
> +static const u8 JC_INPUT_BUTTON_EVENT		=3D 0x3F;
> +static const u8 JC_INPUT_SUBCMD_REPLY		=3D 0x21;
> +static const u8 JC_INPUT_IMU_DATA		=3D 0x30;
> +static const u8 JC_INPUT_MCU_DATA		=3D 0x31;
> +static const u8 JC_INPUT_USB_RESPONSE		=3D 0x81;
> +
> +/* Feature Reports */
> +static const u8 JC_FEATURE_LAST_SUBCMD		=3D 0x02;
> +static const u8 JC_FEATURE_OTA_FW_UPGRADE	=3D 0x70;
> +static const u8 JC_FEATURE_SETUP_MEM_READ	=3D 0x71;
> +static const u8 JC_FEATURE_MEM_READ		=3D 0x72;
> +static const u8 JC_FEATURE_ERASE_MEM_SECTOR	=3D 0x73;
> +static const u8 JC_FEATURE_MEM_WRITE		=3D 0x74;
> +static const u8 JC_FEATURE_LAUNCH		=3D 0x75;
> +
> +/* USB Commands */
> +static const u8 JC_USB_CMD_CONN_STATUS		=3D 0x01;
> +static const u8 JC_USB_CMD_HANDSHAKE		=3D 0x02;
> +static const u8 JC_USB_CMD_BAUDRATE_3M		=3D 0x03;
> +static const u8 JC_USB_CMD_NO_TIMEOUT		=3D 0x04;
> +static const u8 JC_USB_CMD_EN_TIMEOUT		=3D 0x05;
> +static const u8 JC_USB_RESET			=3D 0x06;
> +static const u8 JC_USB_PRE_HANDSHAKE		=3D 0x91;
> +static const u8 JC_USB_SEND_UART		=3D 0x92;
> +
> +/* SPI storage addresses of factory calibration data */
> +static const u16 JC_CAL_DATA_START		=3D 0x603d;
> +static const u16 JC_CAL_DATA_END		=3D 0x604e;
> +#define JC_CAL_DATA_SIZE	(JC_CAL_DATA_END - JC_CAL_DATA_START + 1)
> +
> +
> +/* The raw analog joystick values will be mapped in terms of this magnit=
ude */
> +static const u16 JC_MAX_STICK_MAG		=3D 32767;
> +static const u16 JC_STICK_FUZZ			=3D 250;
> +static const u16 JC_STICK_FLAT			=3D 500;
> +
> +/* Hat values for pro controller's d-pad */
> +static const u16 JC_MAX_DPAD_MAG		=3D 1;
> +static const u16 JC_DPAD_FUZZ			/*=3D 0*/;
> +static const u16 JC_DPAD_FLAT			/*=3D 0*/;
> +
> +/* States for controller state machine */
> +enum joycon_ctlr_state {
> +	JOYCON_CTLR_STATE_INIT,
> +	JOYCON_CTLR_STATE_READ,
> +};
> +
> +struct joycon_stick_cal {
> +	s32 max;
> +	s32 min;
> +	s32 center;
> +};
> +
> +/*
> + * All the controller's button values are stored in a u32.
> + * They can be accessed with bitwise ANDs.
> + */
> +static const u32 JC_BTN_Y	=3D BIT(0);
> +static const u32 JC_BTN_X	=3D BIT(1);
> +static const u32 JC_BTN_B	=3D BIT(2);
> +static const u32 JC_BTN_A	=3D BIT(3);
> +static const u32 JC_BTN_SR_R	=3D BIT(4);
> +static const u32 JC_BTN_SL_R	=3D BIT(5);
> +static const u32 JC_BTN_R	=3D BIT(6);
> +static const u32 JC_BTN_ZR	=3D BIT(7);
> +static const u32 JC_BTN_MINUS	=3D BIT(8);
> +static const u32 JC_BTN_PLUS	=3D BIT(9);
> +static const u32 JC_BTN_RSTICK	=3D BIT(10);
> +static const u32 JC_BTN_LSTICK	=3D BIT(11);
> +static const u32 JC_BTN_HOME	=3D BIT(12);
> +static const u32 JC_BTN_CAP	=3D BIT(13); /* capture button */
> +static const u32 JC_BTN_DOWN	=3D BIT(16);
> +static const u32 JC_BTN_UP	=3D BIT(17);
> +static const u32 JC_BTN_RIGHT	=3D BIT(18);
> +static const u32 JC_BTN_LEFT	=3D BIT(19);
> +static const u32 JC_BTN_SR_L	=3D BIT(20);
> +static const u32 JC_BTN_SL_L	=3D BIT(21);
> +static const u32 JC_BTN_L	=3D BIT(22);
> +static const u32 JC_BTN_ZL	=3D BIT(23);
> +
> +enum joycon_msg_type {
> +	JOYCON_MSG_TYPE_NONE,
> +	JOYCON_MSG_TYPE_USB,
> +	JOYCON_MSG_TYPE_SUBCMD,
> +};
> +
> +struct joycon_subcmd_request {
> +	u8 output_id; /* must be 0x01 for subcommand, 0x10 for rumble only */
> +	u8 packet_num; /* incremented every send */
> +	u8 rumble_data[8];
> +	u8 subcmd_id;
> +	u8 data[0]; /* length depends on the subcommand */

Apparently zero length elements are deprecated:
Documentation/process/deprecated.rst

What is recommended to use instead is.
+       u8 data[]; /* length depends on the subcommand */


> +} __packed;
> +
> +struct joycon_subcmd_reply {
> +	u8 ack; /* MSB 1 for ACK, 0 for NACK */
> +	u8 id; /* id of requested subcmd */
> +	u8 data[0]; /* will be at most 35 bytes */

See above.


> +} __packed;
> +
> +struct joycon_input_report {
> +	u8 id;
> +	u8 timer;
> +	u8 bat_con; /* battery and connection info */
> +	u8 button_status[3];
> +	u8 left_stick[3];
> +	u8 right_stick[3];
> +	u8 vibrator_report;
> +
> +	/*
> +	 * If support for firmware updates, gyroscope data, and/or NFC/IR
> +	 * are added in the future, this can be swapped for a union.
> +	 */
> +	struct joycon_subcmd_reply reply;
> +} __packed;
> +
> +#define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
> +
> +/* Each physical controller is associated with a joycon_ctlr struct */
> +struct joycon_ctlr {
> +	struct hid_device *hdev;
> +	struct input_dev *input;
> +	enum joycon_ctlr_state ctlr_state;
> +
> +	/* The following members are used for synchronous sends/receives */
> +	enum joycon_msg_type msg_type;
> +	u8 subcmd_num;
> +	struct mutex output_mutex;
> +	u8 input_buf[JC_MAX_RESP_SIZE];
> +	wait_queue_head_t wait;
> +	bool received_resp;
> +	u8 usb_ack_match;
> +	u8 subcmd_ack_match;
> +
> +	/* factory calibration data */
> +	struct joycon_stick_cal left_stick_cal_x;
> +	struct joycon_stick_cal left_stick_cal_y;
> +	struct joycon_stick_cal right_stick_cal_x;
> +	struct joycon_stick_cal right_stick_cal_y;
> +
> +};
> +
> +static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t l=
en)
> +{
> +	u8 *buf;
> +	int ret;
> +
> +	buf =3D kmemdup(data, len, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +	ret =3D hid_hw_output_report(hdev, buf, len);
> +	kfree(buf);
> +	if (ret < 0)
> +		hid_dbg(hdev, "Failed to send output report ret=3D%d\n", ret);
> +	return ret;
> +}
> +
> +static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size=
_t len)
> +{
> +	int ret;
> +
> +	ret =3D __joycon_hid_send(ctlr->hdev, data, len);
> +	if (ret < 0) {
> +		memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
> +		return ret;
> +	}
> +
> +	if (!wait_event_timeout(ctlr->wait, ctlr->received_resp, HZ)) {
> +		hid_dbg(ctlr->hdev, "synchronous send/receive timed out\n");
> +		memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctlr->received_resp =3D false;
> +	return 0;
> +}
> +
> +static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
> +{
> +	int ret;
> +	u8 buf[2] =3D {JC_OUTPUT_USB_CMD};
> +
> +	buf[1] =3D cmd;
> +	ctlr->usb_ack_match =3D cmd;
> +	ctlr->msg_type =3D JOYCON_MSG_TYPE_USB;
> +	ret =3D joycon_hid_send_sync(ctlr, buf, sizeof(buf));
> +	if (ret)
> +		hid_dbg(ctlr->hdev, "send usb command failed; ret=3D%d\n", ret);
> +	return ret;
> +}
> +
> +static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
> +			      struct joycon_subcmd_request *subcmd,
> +			      size_t data_len)
> +{
> +	int ret;
> +
> +	subcmd->output_id =3D JC_OUTPUT_RUMBLE_AND_SUBCMD;
> +	subcmd->packet_num =3D ctlr->subcmd_num;
> +	if (++ctlr->subcmd_num > 0xF)
> +		ctlr->subcmd_num =3D 0;
> +	ctlr->subcmd_ack_match =3D subcmd->subcmd_id;
> +	ctlr->msg_type =3D JOYCON_MSG_TYPE_SUBCMD;
> +
> +	ret =3D joycon_hid_send_sync(ctlr, (u8 *)subcmd,
> +				   sizeof(*subcmd) + data_len);
> +	if (ret < 0)
> +		hid_dbg(ctlr->hdev, "send subcommand failed; ret=3D%d\n", ret);
> +	else
> +		ret =3D 0;
> +	return ret;
> +}
> +
> +/* Supply nibbles for flash and on. Ones correspond to active */
> +static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8=
 on)
> +{
> +	struct joycon_subcmd_request *req;
> +	u8 buffer[sizeof(*req) + 1] =3D { 0 };
> +
> +	req =3D (struct joycon_subcmd_request *)buffer;
> +	req->subcmd_id =3D JC_SUBCMD_SET_PLAYER_LIGHTS;
> +	req->data[0] =3D (flash << 4) | on;
> +
> +	hid_dbg(ctlr->hdev, "setting player leds\n");
> +	return joycon_send_subcmd(ctlr, req, 1);
> +}
> +
> +static const u16 DFLT_STICK_CAL_CEN =3D 2000;
> +static const u16 DFLT_STICK_CAL_MAX =3D 3500;
> +static const u16 DFLT_STICK_CAL_MIN =3D 500;
> +static int joycon_request_calibration(struct joycon_ctlr *ctlr)
> +{
> +	struct joycon_subcmd_request *req;
> +	u8 buffer[sizeof(*req) + 5] =3D { 0 };
> +	struct joycon_input_report *report;
> +	struct joycon_stick_cal *cal_x;
> +	struct joycon_stick_cal *cal_y;
> +	s32 x_max_above;
> +	s32 x_min_below;
> +	s32 y_max_above;
> +	s32 y_min_below;
> +	u8 *data;
> +	u8 *raw_cal;
> +	int ret;
> +
> +	req =3D (struct joycon_subcmd_request *)buffer;
> +	req->subcmd_id =3D JC_SUBCMD_SPI_FLASH_READ;
> +	data =3D req->data;
> +	data[0] =3D 0xFF & JC_CAL_DATA_START;
> +	data[1] =3D 0xFF & (JC_CAL_DATA_START >> 8);
> +	data[2] =3D 0xFF & (JC_CAL_DATA_START >> 16);
> +	data[3] =3D 0xFF & (JC_CAL_DATA_START >> 24);
> +	data[4] =3D JC_CAL_DATA_SIZE;
> +
> +	hid_dbg(ctlr->hdev, "requesting cal data\n");
> +	ret =3D joycon_send_subcmd(ctlr, req, 5);
> +	if (ret) {
> +		hid_warn(ctlr->hdev,
> +			 "Failed to read stick cal, using defaults; ret=3D%d\n",
> +			 ret);
> +
> +		ctlr->left_stick_cal_x.center =3D DFLT_STICK_CAL_CEN;
> +		ctlr->left_stick_cal_x.max =3D DFLT_STICK_CAL_MAX;
> +		ctlr->left_stick_cal_x.min =3D DFLT_STICK_CAL_MIN;
> +
> +		ctlr->left_stick_cal_y.center =3D DFLT_STICK_CAL_CEN;
> +		ctlr->left_stick_cal_y.max =3D DFLT_STICK_CAL_MAX;
> +		ctlr->left_stick_cal_y.min =3D DFLT_STICK_CAL_MIN;
> +
> +		ctlr->right_stick_cal_x.center =3D DFLT_STICK_CAL_CEN;
> +		ctlr->right_stick_cal_x.max =3D DFLT_STICK_CAL_MAX;
> +		ctlr->right_stick_cal_x.min =3D DFLT_STICK_CAL_MIN;
> +
> +		ctlr->right_stick_cal_y.center =3D DFLT_STICK_CAL_CEN;
> +		ctlr->right_stick_cal_y.max =3D DFLT_STICK_CAL_MAX;
> +		ctlr->right_stick_cal_y.min =3D DFLT_STICK_CAL_MIN;
> +
> +		return ret;
> +	}
> +
> +	report =3D (struct joycon_input_report *)ctlr->input_buf;
> +	raw_cal =3D &report->reply.data[5];
> +
> +	/* left stick calibration parsing */
> +	cal_x =3D &ctlr->left_stick_cal_x;
> +	cal_y =3D &ctlr->left_stick_cal_y;
> +
> +	x_max_above =3D hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
> +	y_max_above =3D hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
> +	cal_x->center =3D hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
> +	cal_y->center =3D hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
> +	x_min_below =3D hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
> +	y_min_below =3D hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
> +	cal_x->max =3D cal_x->center + x_max_above;
> +	cal_x->min =3D cal_x->center - x_min_below;
> +	cal_y->max =3D cal_y->center + y_max_above;
> +	cal_y->min =3D cal_y->center - y_min_below;
> +
> +	/* right stick calibration parsing */
> +	raw_cal +=3D 9;
> +	cal_x =3D &ctlr->right_stick_cal_x;
> +	cal_y =3D &ctlr->right_stick_cal_y;
> +
> +	cal_x->center =3D hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
> +	cal_y->center =3D hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
> +	x_min_below =3D hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
> +	y_min_below =3D hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
> +	x_max_above =3D hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
> +	y_max_above =3D hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
> +	cal_x->max =3D cal_x->center + x_max_above;
> +	cal_x->min =3D cal_x->center - x_min_below;
> +	cal_y->max =3D cal_y->center + y_max_above;
> +	cal_y->min =3D cal_y->center - y_min_below;
> +
> +	hid_dbg(ctlr->hdev, "calibration:\n"
> +			    "l_x_c=3D%d l_x_max=3D%d l_x_min=3D%d\n"
> +			    "l_y_c=3D%d l_y_max=3D%d l_y_min=3D%d\n"
> +			    "r_x_c=3D%d r_x_max=3D%d r_x_min=3D%d\n"
> +			    "r_y_c=3D%d r_y_max=3D%d r_y_min=3D%d\n",
> +			    ctlr->left_stick_cal_x.center,
> +			    ctlr->left_stick_cal_x.max,
> +			    ctlr->left_stick_cal_x.min,
> +			    ctlr->left_stick_cal_y.center,
> +			    ctlr->left_stick_cal_y.max,
> +			    ctlr->left_stick_cal_y.min,
> +			    ctlr->right_stick_cal_x.center,
> +			    ctlr->right_stick_cal_x.max,
> +			    ctlr->right_stick_cal_x.min,
> +			    ctlr->right_stick_cal_y.center,
> +			    ctlr->right_stick_cal_y.max,
> +			    ctlr->right_stick_cal_y.min);
> +
> +	return 0;
> +}
> +
> +static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
> +{
> +	struct joycon_subcmd_request *req;
> +	u8 buffer[sizeof(*req) + 1] =3D { 0 };
> +
> +	req =3D (struct joycon_subcmd_request *)buffer;
> +	req->subcmd_id =3D JC_SUBCMD_SET_REPORT_MODE;
> +	req->data[0] =3D 0x30; /* standard, full report mode */
> +
> +	hid_dbg(ctlr->hdev, "setting controller report mode\n");
> +	return joycon_send_subcmd(ctlr, req, 1);
> +}
> +
> +static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
> +{
> +	s32 center =3D cal->center;
> +	s32 min =3D cal->min;
> +	s32 max =3D cal->max;
> +	s32 new_val;
> +
> +	if (val > center) {
> +		new_val =3D (val - center) * JC_MAX_STICK_MAG;
> +		new_val /=3D (max - center);
> +	} else {
> +		new_val =3D (center - val) * -JC_MAX_STICK_MAG;
> +		new_val /=3D (center - min);
> +	}
> +	new_val =3D clamp(new_val, (s32)-JC_MAX_STICK_MAG, (s32)JC_MAX_STICK_MA=
G);
> +	return new_val;
> +}
> +
> +static void joycon_parse_report(struct joycon_ctlr *ctlr,
> +				struct joycon_input_report *rep)
> +{
> +	struct input_dev *dev =3D ctlr->input;
> +	u32 btns;
> +	u32 id =3D ctlr->hdev->product;
> +
> +	btns =3D hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
> +
> +	if (id !=3D USB_DEVICE_ID_NINTENDO_JOYCONR) {
> +		u16 raw_x;
> +		u16 raw_y;
> +		s32 x;
> +		s32 y;
> +
> +		/* get raw stick values */
> +		raw_x =3D hid_field_extract(ctlr->hdev, rep->left_stick, 0, 12);
> +		raw_y =3D hid_field_extract(ctlr->hdev,
> +					  rep->left_stick + 1, 4, 12);
> +		/* map the stick values */
> +		x =3D joycon_map_stick_val(&ctlr->left_stick_cal_x, raw_x);
> +		y =3D -joycon_map_stick_val(&ctlr->left_stick_cal_y, raw_y);
> +		/* report sticks */
> +		input_report_abs(dev, ABS_X, x);
> +		input_report_abs(dev, ABS_Y, y);
> +
> +		/* report buttons */
> +		input_report_key(dev, BTN_TL, btns & JC_BTN_L);
> +		input_report_key(dev, BTN_TL2, btns & JC_BTN_ZL);
> +		input_report_key(dev, BTN_SELECT, btns & JC_BTN_MINUS);
> +		input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
> +		input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
> +
> +		if (id !=3D USB_DEVICE_ID_NINTENDO_PROCON) {
> +			/* Report the S buttons as the non-existent triggers */
> +			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
> +			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
> +
> +			/* Report d-pad as digital buttons for the joy-cons */
> +			input_report_key(dev, BTN_DPAD_DOWN,
> +					 btns & JC_BTN_DOWN);
> +			input_report_key(dev, BTN_DPAD_UP, btns & JC_BTN_UP);
> +			input_report_key(dev, BTN_DPAD_RIGHT,
> +					 btns & JC_BTN_RIGHT);
> +			input_report_key(dev, BTN_DPAD_LEFT,
> +					 btns & JC_BTN_LEFT);
> +		} else {
> +			int hatx =3D 0;
> +			int haty =3D 0;
> +
> +			/* d-pad x */
> +			if (btns & JC_BTN_LEFT)
> +				hatx =3D -1;
> +			else if (btns & JC_BTN_RIGHT)
> +				hatx =3D 1;
> +			input_report_abs(dev, ABS_HAT0X, hatx);
> +
> +			/* d-pad y */
> +			if (btns & JC_BTN_UP)
> +				haty =3D -1;
> +			else if (btns & JC_BTN_DOWN)
> +				haty =3D 1;
> +			input_report_abs(dev, ABS_HAT0Y, haty);
> +		}
> +	}
> +	if (id !=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		u16 raw_x;
> +		u16 raw_y;
> +		s32 x;
> +		s32 y;
> +
> +		/* get raw stick values */
> +		raw_x =3D hid_field_extract(ctlr->hdev, rep->right_stick, 0, 12);
> +		raw_y =3D hid_field_extract(ctlr->hdev,
> +					  rep->right_stick + 1, 4, 12);
> +		/* map stick values */
> +		x =3D joycon_map_stick_val(&ctlr->right_stick_cal_x, raw_x);
> +		y =3D -joycon_map_stick_val(&ctlr->right_stick_cal_y, raw_y);
> +		/* report sticks */
> +		input_report_abs(dev, ABS_RX, x);
> +		input_report_abs(dev, ABS_RY, y);
> +
> +		/* report buttons */
> +		input_report_key(dev, BTN_TR, btns & JC_BTN_R);
> +		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
> +		if (id !=3D USB_DEVICE_ID_NINTENDO_PROCON) {
> +			/* Report the S buttons as the non-existent triggers */
> +			input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R);
> +			input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R);
> +		}
> +		input_report_key(dev, BTN_START, btns & JC_BTN_PLUS);
> +		input_report_key(dev, BTN_THUMBR, btns & JC_BTN_RSTICK);
> +		input_report_key(dev, BTN_MODE, btns & JC_BTN_HOME);
> +		input_report_key(dev, BTN_WEST, btns & JC_BTN_Y);
> +		input_report_key(dev, BTN_NORTH, btns & JC_BTN_X);
> +		input_report_key(dev, BTN_EAST, btns & JC_BTN_A);
> +		input_report_key(dev, BTN_SOUTH, btns & JC_BTN_B);
> +	}
> +
> +	input_sync(dev);
> +}
> +
> +
> +static const unsigned int joycon_button_inputs_l[] =3D {
> +	BTN_SELECT, BTN_Z, BTN_THUMBL,
> +	BTN_TL, BTN_TL2,
> +	0 /* 0 signals end of array */
> +};
> +
> +static const unsigned int joycon_button_inputs_r[] =3D {
> +	BTN_START, BTN_MODE, BTN_THUMBR,
> +	BTN_SOUTH, BTN_EAST, BTN_NORTH, BTN_WEST,
> +	BTN_TR, BTN_TR2,
> +	0 /* 0 signals end of array */
> +};
> +
> +/* We report joy-con d-pad inputs as buttons and pro controller as a hat=
. */
> +static const unsigned int joycon_dpad_inputs_jc[] =3D {
> +	BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
> +};
> +
> +static DEFINE_MUTEX(joycon_input_num_mutex);
> +static int joycon_input_create(struct joycon_ctlr *ctlr)
> +{
> +	struct hid_device *hdev;
> +	static int input_num =3D 1;
> +	const char *name;
> +	int ret;
> +	int i;
> +
> +	hdev =3D ctlr->hdev;
> +
> +	switch (hdev->product) {
> +	case USB_DEVICE_ID_NINTENDO_PROCON:
> +		name =3D "Nintendo Switch Pro Controller";
> +		break;
> +	case USB_DEVICE_ID_NINTENDO_JOYCONL:
> +		name =3D "Nintendo Switch Left Joy-Con";
> +		break;
> +	case USB_DEVICE_ID_NINTENDO_JOYCONR:
> +		name =3D "Nintendo Switch Right Joy-Con";
> +		break;
> +	default: /* Should be impossible */
> +		hid_err(hdev, "Invalid hid product\n");
> +		return -EINVAL;
> +	}
> +
> +	ctlr->input =3D devm_input_allocate_device(&hdev->dev);
> +	if (!ctlr->input)
> +		return -ENOMEM;
> +	ctlr->input->id.bustype =3D hdev->bus;
> +	ctlr->input->id.vendor =3D hdev->vendor;
> +	ctlr->input->id.product =3D hdev->product;
> +	ctlr->input->id.version =3D hdev->version;
> +	ctlr->input->name =3D name;
> +	input_set_drvdata(ctlr->input, ctlr);
> +
> +
> +	/* set up sticks and buttons */
> +	if (hdev->product !=3D USB_DEVICE_ID_NINTENDO_JOYCONR) {
> +		input_set_abs_params(ctlr->input, ABS_X,
> +				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +				     JC_STICK_FUZZ, JC_STICK_FLAT);
> +		input_set_abs_params(ctlr->input, ABS_Y,
> +				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +				     JC_STICK_FUZZ, JC_STICK_FLAT);
> +
> +		for (i =3D 0; joycon_button_inputs_l[i] > 0; i++)
> +			input_set_capability(ctlr->input, EV_KEY,
> +					     joycon_button_inputs_l[i]);
> +
> +		/* configure d-pad differently for joy-con vs pro controller */
> +		if (hdev->product !=3D USB_DEVICE_ID_NINTENDO_PROCON) {
> +			for (i =3D 0; joycon_dpad_inputs_jc[i] > 0; i++)
> +				input_set_capability(ctlr->input, EV_KEY,
> +						     joycon_dpad_inputs_jc[i]);
> +		} else {
> +			input_set_abs_params(ctlr->input, ABS_HAT0X,
> +					     -JC_MAX_DPAD_MAG, JC_MAX_DPAD_MAG,
> +					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
> +			input_set_abs_params(ctlr->input, ABS_HAT0Y,
> +					     -JC_MAX_DPAD_MAG, JC_MAX_DPAD_MAG,
> +					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
> +		}
> +	}
> +	if (hdev->product !=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		input_set_abs_params(ctlr->input, ABS_RX,
> +				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +				     JC_STICK_FUZZ, JC_STICK_FLAT);
> +		input_set_abs_params(ctlr->input, ABS_RY,
> +				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +				     JC_STICK_FUZZ, JC_STICK_FLAT);
> +
> +		for (i =3D 0; joycon_button_inputs_r[i] > 0; i++)
> +			input_set_capability(ctlr->input, EV_KEY,
> +					     joycon_button_inputs_r[i]);
> +	}
> +
> +	/* Let's report joy-con S triggers separately */
> +	if (hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		input_set_capability(ctlr->input, EV_KEY, BTN_TR);
> +		input_set_capability(ctlr->input, EV_KEY, BTN_TR2);
> +	} else if (hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONR) {
> +		input_set_capability(ctlr->input, EV_KEY, BTN_TL);
> +		input_set_capability(ctlr->input, EV_KEY, BTN_TL2);
> +	}
> +
> +	ret =3D input_register_device(ctlr->input);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the default controller player leds based on controller number */=

> +	mutex_lock(&joycon_input_num_mutex);
> +	mutex_lock(&ctlr->output_mutex);
> +	ret =3D joycon_set_player_leds(ctlr, 0, 0xF >> (4 - input_num));
> +	if (ret)
> +		hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", ret);
> +	mutex_unlock(&ctlr->output_mutex);
> +	if (++input_num > 4)
> +		input_num =3D 1;
> +	mutex_unlock(&joycon_input_num_mutex);
> +
> +	return 0;
> +}
> +
> +/* Common handler for parsing inputs */
> +static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
> +							      int size)
> +{
> +	int ret =3D 0;
> +
> +	if (data[0] =3D=3D JC_INPUT_SUBCMD_REPLY || data[0] =3D=3D JC_INPUT_IMU=
_DATA ||
> +	    data[0] =3D=3D JC_INPUT_MCU_DATA) {
> +		if (size >=3D 12) /* make sure it contains the input report */
> +			joycon_parse_report(ctlr,
> +					    (struct joycon_input_report *)data);
> +	}
> +
> +	return ret;

We could just return 0 here directly (a bot on the mailing list pointed
this out as well).


> +}
> +
> +static int joycon_ctlr_handle_event(struct joycon_ctlr *ctlr, u8 *data,
> +							      int size)
> +{
> +	int ret =3D 0;
> +	bool match =3D false;
> +	struct joycon_input_report *report;
> +
> +	if (unlikely(mutex_is_locked(&ctlr->output_mutex)) &&
> +	    ctlr->msg_type !=3D JOYCON_MSG_TYPE_NONE) {
> +		switch (ctlr->msg_type) {
> +		case JOYCON_MSG_TYPE_USB:
> +			if (size < 2)
> +				break;
> +			if (data[0] =3D=3D JC_INPUT_USB_RESPONSE &&
> +			    data[1] =3D=3D ctlr->usb_ack_match)
> +				match =3D true;
> +			break;
> +		case JOYCON_MSG_TYPE_SUBCMD:
> +			if (size < sizeof(struct joycon_input_report) ||
> +			    data[0] !=3D JC_INPUT_SUBCMD_REPLY)
> +				break;
> +			report =3D (struct joycon_input_report *)data;
> +			if (report->reply.id =3D=3D ctlr->subcmd_ack_match)
> +				match =3D true;
> +			break;
> +		default:
> +			break;

This break is not necessary but maybe this is a conscious choice since
there is a break in a few "default:" cases in the code?

Many thanks for the driver! Hope it will land in mainline in the near
future!


Cheers,

Silvan

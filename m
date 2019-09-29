Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F85C15E5
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2019 17:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfI2PM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Sep 2019 11:12:59 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40980 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfI2PM7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Sep 2019 11:12:59 -0400
Received: by mail-ed1-f68.google.com with SMTP id f20so6332972edv.8
        for <linux-input@vger.kernel.org>; Sun, 29 Sep 2019 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZgNWrI1dOHHe160fS90ol+0UMu+YRr3iqC1GOWkIA7s=;
        b=Vc6UnERavkUzrWDgdfCCCnHwrD4AMnK9gEwVNx0gW6r9sj3Ld+YqWgiJ1WCw2pM+Gi
         xpxvvHE+xYBIhvfbVjJyQIpRpBgSEREKiqNFyrYU0JxH+i/sIo7Jfjhba63rc3m8unMW
         l/tX/zd6q9dM3kNFXmNFgXLn7frona7vVkngtJAQCLaYrk2TKWjVfAOzmO1erjc6eWlt
         hN/O0uubQUkP2aUE1yQzleiQYNpk9d4+tdyDv+nh9dHP2ng5lsOWGQM32B0I2FA9ch+T
         RW6keEu5EfjBzeP/YdoNO9fnV60CeeUIH8h6RumlN0EYkvktVSGIheZCyzdj1DKt63Jx
         q61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=ZgNWrI1dOHHe160fS90ol+0UMu+YRr3iqC1GOWkIA7s=;
        b=fIA8VrioGlEwhxU+CDxTUsGtV1b9thetuDoazAKitRaHClARwGcXdi4VDnLDcjUGl7
         V9ZSESxJYc9oZ+fMZQpfEJiHxvsD625Qk4oGTXTpNQlxJV2c4+dpDXfA502r8vc4W4l8
         +G4Ta2jYAGwtjzccP1EogNEidCFawtcemUI/RhTDOyEcpF01vHm1CNaRogMP0ZtWy7Kx
         NkfJ+Kpn0l8hZRjdiWhVaHvJBhRFEkAnBOJPT7ud2tzVM8r98UlWsihUjOHOYrv5mMtt
         /C7tb+KlqxkFXOdkHY/hPJHSdpXWZ96ja4s+fUs8P3rF3dzsylRWrhcoDQQe3tTMlZbT
         smNg==
X-Gm-Message-State: APjAAAUi4o9wn61Qs0Ea/ju3HwxoX4SP7lKB0Ksviqi61keXGJSEWaq0
        ezU6XiBelScdsIf/VJTOzTw=
X-Google-Smtp-Source: APXvYqyW4VGrNdeWqNH8IdhxQ+cXVEUZcZodTikh4vKqKadVGeUyur5G4nEo92IktT0vgUC5XGdgRg==
X-Received: by 2002:a17:906:6d1:: with SMTP id v17mr15239457ejb.74.1569769974059;
        Sun, 29 Sep 2019 08:12:54 -0700 (PDT)
Received: from localhost ([2a02:169:ed::acc])
        by smtp.gmail.com with ESMTPSA id x5sm1189783ejc.53.2019.09.29.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 08:12:53 -0700 (PDT)
Date:   Sun, 29 Sep 2019 17:12:52 +0200
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com
Subject: Re: [PATCH v6 1/6] HID: joycon: add nintendo switch controller
 driver
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20190915233140.244347-1-djogorchock@gmail.com>
 <20190915233140.244347-2-djogorchock@gmail.com>
In-Reply-To: <20190915233140.244347-2-djogorchock@gmail.com>
Message-Id: <3FHY6EG79INRB.2GX4QK4UPLP5Q@homearch.localdomain>
User-Agent: mblaze/0.5.1-13-g1ed8a0a-dirty (2019-09-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

I have missed the previous iterations but I wanted to add some comments
(inline below) after looking through the code.

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> The joycon driver supports the Nintendo Switch Pro Controllers and the
> Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
>=20
> The Joy-Cons each create their own, independent input devices, so it is
> up to userspace to combine them if desired.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  MAINTAINERS              |   6 +
>  drivers/hid/Kconfig      |  11 +
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ids.h    |   3 +
>  drivers/hid/hid-joycon.c | 820 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 841 insertions(+)
>  create mode 100644 drivers/hid/hid-joycon.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a50e97a63bc8..ef4b307365f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8684,6 +8684,12 @@ S:	Maintained
>  F:	fs/jbd2/
>  F:	include/linux/jbd2.h
> =20
> +JOYCON HID DRIVER
> +M:	Daniel J. Ogorchock <djogorchock@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hid/hid-joycon*
> +
>  JPU V4L2 MEM2MEM DRIVER FOR RENESAS
>  M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 3872e03d9a59..233e03ac68e2 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -463,6 +463,17 @@ config HID_JABRA
>  	mouse button events.
>  	Say M here if you may ever plug in a Jabra USB device.
> =20
> +config HID_JOYCON
> +	tristate "Nintendo Joy-Con and Pro Controller support"
> +	depends on HID
> +	help
> +	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
> +	All controllers support bluetooth, and the Pro Controller also supports=

> +	its USB mode.
> +
> +	To compile this driver as a module, choose M here: the
> +	module will be called hid-joycon.
> +
>  config HID_TWINHAN
>  	tristate "Twinhan IR remote control"
>  	depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cc5d827c9164..7046c3b7e313 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_HID_HYPERV_MOUSE)	+=3D hid-hyperv.o
>  obj-$(CONFIG_HID_ICADE)		+=3D hid-icade.o
>  obj-$(CONFIG_HID_ITE)		+=3D hid-ite.o
>  obj-$(CONFIG_HID_JABRA)		+=3D hid-jabra.o
> +obj-$(CONFIG_HID_JOYCON)	+=3D hid-joycon.o
>  obj-$(CONFIG_HID_KENSINGTON)	+=3D hid-kensington.o
>  obj-$(CONFIG_HID_KEYTOUCH)	+=3D hid-keytouch.o
>  obj-$(CONFIG_HID_KYE)		+=3D hid-kye.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0a00be19f7a0..cbdec980a989 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -863,6 +863,9 @@
>  #define USB_VENDOR_ID_NINTENDO		0x057e
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE	0x0306
>  #define USB_DEVICE_ID_NINTENDO_WIIMOTE2	0x0330
> +#define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
> +#define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
> +#define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
> =20
>  #define USB_VENDOR_ID_NOVATEK		0x0603
>  #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
> diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
> new file mode 100644
> index 000000000000..c2715edc1bae
> --- /dev/null
> +++ b/drivers/hid/hid-joycon.c
> @@ -0,0 +1,820 @@
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
> +static const u8 JC_SUBCMD_STATE			=3D 0x00;
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
> +static const u16 JC_CAL_DATA_SIZE =3D JC_CAL_DATA_END - JC_CAL_DATA_STAR=
T + 1;
> +
> +
> +/* The raw analog joystick values will be mapped in terms of this magnit=
ude */
> +static const u16 JC_MAX_STICK_MAG		=3D 32767;
> +static const u16 JC_STICK_FUZZ			=3D 250;
> +static const u16 JC_STICK_FLAT			=3D 500;
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
> +} __packed;
> +
> +struct joycon_subcmd_reply {
> +	u8 ack; /* MSB 1 for ACK, 0 for NACK */
> +	u8 id; /* id of requested subcmd */
> +	u8 data[0]; /* will be at most 35 bytes */
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
> +static void joycon_parse_report(struct joycon_ctlr *ctlr, u8 *data)
> +{

joycon_parse_report is only called with a 'struct joycon_input_report
*' parameter. We could make this explicit by changing the function
signature into

static void joycon_parse_report(struct joycon_ctlr *ctlr,
               struct joycon_input_report *rep)

and getting rid of the cast of data further down.

> +	struct input_dev *dev =3D ctlr->input;
> +	u32 btns;
> +	u32 id =3D ctlr->hdev->product;
> +	struct joycon_input_report *rep =3D (struct joycon_input_report *) data=
;
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
> +		raw_x =3D hid_field_extract(ctlr->hdev,
> +					  rep->left_stick, 0, 12);
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
> +		if (id !=3D USB_DEVICE_ID_NINTENDO_PROCON) {
> +			/* Report the S buttons as the non-existent triggers */
> +			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
> +			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
> +		}
> +		input_report_key(dev, BTN_SELECT, btns & JC_BTN_MINUS);
> +		input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
> +		input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
> +		input_report_key(dev, BTN_DPAD_DOWN, btns & JC_BTN_DOWN);
> +		input_report_key(dev, BTN_DPAD_UP, btns & JC_BTN_UP);
> +		input_report_key(dev, BTN_DPAD_RIGHT, btns & JC_BTN_RIGHT);
> +		input_report_key(dev, BTN_DPAD_LEFT, btns & JC_BTN_LEFT);
> +	}
> +	if (id !=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		u16 raw_x;
> +		u16 raw_y;
> +		s32 x;
> +		s32 y;
> +
> +		/* get raw stick values */
> +		raw_x =3D hid_field_extract(ctlr->hdev,
> +					  rep->right_stick, 0, 12);
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
> +		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
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
> +static const unsigned int joycon_button_inputs[] =3D {
> +	BTN_SELECT, BTN_Z, BTN_THUMBL,
> +	BTN_START, BTN_MODE, BTN_THUMBR,
> +	BTN_SOUTH, BTN_EAST, BTN_NORTH, BTN_WEST,
> +	BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
> +	BTN_TL, BTN_TR, BTN_TL2, BTN_TR2,
> +	0 /* 0 signals end of array */
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
> +		ret =3D -EINVAL;

Getting rid of the goto and just returning the errors directly in this
function feels like the simpler and cleaner way of handling errors to
me. There is no cleanup to be done in the error case anyways.


> +		goto err;
> +	}
> +
> +	ctlr->input =3D devm_input_allocate_device(&hdev->dev);
> +	if (!ctlr->input) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +	ctlr->input->dev.parent =3D &hdev->dev;

The parent is already set in devm_input_allocate_device so setting
it here again is not necessary.

Thanks for all the work on this driver!


Cheers,

Silvan


> +	ctlr->input->id.bustype =3D hdev->bus;
> +	ctlr->input->id.vendor =3D hdev->vendor;
> +	ctlr->input->id.product =3D hdev->product;
> +	ctlr->input->id.version =3D hdev->version;
> +	ctlr->input->name =3D name;
> +	input_set_drvdata(ctlr->input, ctlr);
> +
> +
> +	/* set up sticks */
> +	input_set_abs_params(ctlr->input, ABS_X,
> +			     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +			     JC_STICK_FUZZ, JC_STICK_FLAT);
> +	input_set_abs_params(ctlr->input, ABS_Y,
> +			     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +			     JC_STICK_FUZZ, JC_STICK_FLAT);
> +	input_set_abs_params(ctlr->input, ABS_RX,
> +			     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +			     JC_STICK_FUZZ, JC_STICK_FLAT);
> +	input_set_abs_params(ctlr->input, ABS_RY,
> +			     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> +			     JC_STICK_FUZZ, JC_STICK_FLAT);
> +	/* set up buttons */
> +	for (i =3D 0; joycon_button_inputs[i] > 0; i++)
> +		input_set_capability(ctlr->input, EV_KEY,
> +				     joycon_button_inputs[i]);
> +
> +	ret =3D input_register_device(ctlr->input);
> +	if (ret)
> +		goto err;
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
> +
> +err:
> +	return ret;
> +}
> +
> +/* Common handler for parsing inputs */
> +static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
> +							      int size)
> +{
> +	int ret =3D 0;
> +
> +	switch (data[0]) {
> +	case JC_INPUT_SUBCMD_REPLY:
> +	case JC_INPUT_IMU_DATA:
> +	case JC_INPUT_MCU_DATA:
> +		if (size >=3D 12) /* make sure it contains the input report */
> +			joycon_parse_report(ctlr, data);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
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
> +		}
> +
> +		if (match) {
> +			memcpy(ctlr->input_buf, data,
> +			       min(size, (int)JC_MAX_RESP_SIZE));
> +			ctlr->msg_type =3D JOYCON_MSG_TYPE_NONE;
> +			ctlr->received_resp =3D true;
> +			wake_up(&ctlr->wait);
> +
> +			/* This message has been handled */
> +			return 1;
> +		}
> +	}
> +
> +	if (ctlr->ctlr_state =3D=3D JOYCON_CTLR_STATE_READ)
> +		ret =3D joycon_ctlr_read_handler(ctlr, data, size);
> +
> +	return ret;
> +}
> +
> +static int joycon_hid_event(struct hid_device *hdev,
> +			    struct hid_report *report, u8 *raw_data, int size)
> +{
> +	struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> +
> +	if (size < 1)
> +		return -EINVAL;
> +
> +	return joycon_ctlr_handle_event(ctlr, raw_data, size);
> +}
> +
> +static void joycon_ctlr_destroy(struct joycon_ctlr *ctlr)
> +{
> +	mutex_destroy(&ctlr->output_mutex);
> +}
> +
> +static int joycon_hid_probe(struct hid_device *hdev,
> +			    const struct hid_device_id *id)
> +{
> +	int ret;
> +	struct joycon_ctlr *ctlr;
> +
> +	hid_dbg(hdev, "probe - start\n");
> +
> +	ctlr =3D devm_kzalloc(&hdev->dev, sizeof(*ctlr), GFP_KERNEL);
> +	if (!ctlr) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	ctlr->hdev =3D hdev;
> +	ctlr->ctlr_state =3D JOYCON_CTLR_STATE_INIT;
> +	hid_set_drvdata(hdev, ctlr);
> +	mutex_init(&ctlr->output_mutex);
> +	init_waitqueue_head(&ctlr->wait);
> +
> +	ret =3D hid_parse(hdev);
> +	if (ret) {
> +		hid_err(hdev, "HID parse failed\n");
> +		goto err;
> +	}
> +
> +	ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	if (ret) {
> +		hid_err(hdev, "HW start failed\n");
> +		goto err;
> +	}
> +
> +	ret =3D hid_hw_open(hdev);
> +	if (ret) {
> +		hid_err(hdev, "cannot start hardware I/O\n");
> +		goto err_stop;
> +	}
> +
> +	hid_device_io_start(hdev);
> +
> +	/* Initialize the controller */
> +	mutex_lock(&ctlr->output_mutex);
> +	/* if baudrate command fails, assume ble pro controller */
> +	if (hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_PROCON &&
> +	    !joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M)) {
> +		/* handshake */
> +		ret =3D joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE);
> +		if (ret) {
> +			hid_err(hdev, "Failed handshake; ret=3D%d\n", ret);
> +			goto err_mutex;
> +		}
> +		/*
> +		 * Set no timeout (to keep controller in USB mode).
> +		 * This doesn't send a response, so ignore the timeout.
> +		 */
> +		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT);
> +	}
> +
> +	/* get controller calibration data, and parse it */
> +	ret =3D joycon_request_calibration(ctlr);
> +	if (ret) {
> +		/*
> +		 * We can function with default calibration, but it may be
> +		 * inaccurate. Provide a warning, and continue on.
> +		 */
> +		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
> +	}
> +
> +	/* Set the reporting mode to 0x30, which is the full report mode */
> +	ret =3D joycon_set_report_mode(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set report mode; ret=3D%d\n", ret);
> +		goto err_mutex;
> +	}
> +
> +	mutex_unlock(&ctlr->output_mutex);
> +
> +	ret =3D joycon_input_create(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to create input device; ret=3D%d\n", ret);
> +		goto err_close;
> +	}
> +
> +	ctlr->ctlr_state =3D JOYCON_CTLR_STATE_READ;
> +
> +	hid_dbg(hdev, "probe - success\n");
> +	return 0;
> +
> +err_mutex:
> +	mutex_unlock(&ctlr->output_mutex);
> +err_close:
> +	joycon_ctlr_destroy(ctlr);
> +	hid_hw_close(hdev);
> +err_stop:
> +	hid_hw_stop(hdev);
> +err:
> +	hid_err(hdev, "probe - fail =3D %d\n", ret);
> +	return ret;
> +}
> +
> +static void joycon_hid_remove(struct hid_device *hdev)
> +{
> +	struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> +
> +	hid_dbg(hdev, "remove\n");
> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +
> +	joycon_ctlr_destroy(ctlr);
> +}
> +
> +static const struct hid_device_id joycon_hid_devices[] =3D {
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> +			 USB_DEVICE_ID_NINTENDO_PROCON) },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +			 USB_DEVICE_ID_NINTENDO_PROCON) },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +			 USB_DEVICE_ID_NINTENDO_JOYCONL) },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +			 USB_DEVICE_ID_NINTENDO_JOYCONR) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, joycon_hid_devices);
> +
> +static struct hid_driver joycon_hid_driver =3D {
> +	.name		=3D "joycon",
> +	.id_table	=3D joycon_hid_devices,
> +	.probe		=3D joycon_hid_probe,
> +	.remove		=3D joycon_hid_remove,
> +	.raw_event	=3D joycon_hid_event,
> +};
> +module_hid_driver(joycon_hid_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Daniel J. Ogorchock <djogorchock@gmail.com>");
> +MODULE_DESCRIPTION("Driver for Nintendo Switch Controllers");



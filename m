Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADA86E491
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2019 12:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfGSKxt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jul 2019 06:53:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34993 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfGSKxt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jul 2019 06:53:49 -0400
Received: from [192.168.178.182] ([46.223.2.3]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1McHM2-1iQnfq0JgK-00cdoo; Fri, 19 Jul 2019 12:53:46 +0200
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, markus@notsyncing.net
References: <20190501122745.1322-1-markus@notsyncing.net>
From:   Markus Koch <markus@notsyncing.net>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@notsyncing.net; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] Input: add support for the FlySky FS-iA6B RC receiver
Message-ID: <62316d21-ba0a-f160-504b-f0de7fe5f5fc@notsyncing.net>
Date:   Fri, 19 Jul 2019 12:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190501122745.1322-1-markus@notsyncing.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:okjJdtfeZM043yQIbw/ZEzgVPVN8928dUYvR/dsiCeWoMBuJey0
 bqP+hIM5a9dkXclfJexKuRRZ05bHkVr/SJPvAQM3DSSgsU9HMjOQc8by/OVpXTa9UaseYuy
 WgIjiUYgL3qurFDbgfww2xwDTy3kAsxSN9ScWAzVE0V/6c/apfdOysVvuDATbOHp8tAVVZ0
 pyC6ZNXIy30ZiA5UjvG1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EvV/ti6zEXk=:QN42e72QHiXvk2w3KVZhwF
 8pD9H9YLuUpcptz/pO2ZNnNdo7f2pFBFIBoJ6EAayyjrwa7zpzdRnX9ADCrJkjcskpkyZ47+q
 Ue2npDP217HfYljAMEfexdIRDSUo0RgApwXmNowcqeVjgVkaE3ip3s0dTSZooJ7Fs/0WDhJ4T
 /zJ9YMmPFx3mAtcwCcyHtMUPLaxc9EdtzFjNpS6ecTfg7o+tz6YRh0a4jpOUCwmwGXPiteuYU
 65ekM9wqPJPNljx4tRvFhQLN5OAoWgxfmPa0JjM53SjWefgyS4Eg6X8+8xkbeg0QJcQNvHHV3
 xsrEr73mA48Hb8H/fMm5gHlqZOyb0MsEU3cCl0PIJn9XUAqUJIDEGusSc8sMQqmASYI14p3j0
 6yXR31LZUMHOFlpcfngFYBP48jKwnArnwQ13Gq5rHluDFYW4v7yoQEi0qdhABrx+uVGvA1eE1
 ay8zF+SIJSZ/Otaw8KhujmM9VzN3lImN5ObXMyl9upPNIrn69+y0M3j5oTXBd/UOmKq4Ku5VG
 YweF2ziR3KV/20C17JETBtC2JYOKlMrgxElgXuMwfHxBEjFEV9MftAhVgO8NyzLkpefx3fCfG
 di5blET3Gk5a1Z/ramZNFP8t2Y7pu0Mv71oky6Yqd3ehG6EtesGwCRW6jqwJxYTPpTi0EOaEF
 09gbIzDctiwHtdwzdEmcD7VsRZZF6i6nJgYw8C9T6jjETGWhZ1q55wIchsjrQKIivAG9pbWn+
 rNjFXqmAu4C/CM5Th6DTBsgYZ8mFi/BcjXHAGq7JXGix8K/zQ9Nb1ynCg8w=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

a while back, I sent a patch to support the FS-iA6B RC receiver as a joystick: https://patchwork.kernel.org/patch/10925041/

I haven't heard back about it yet, so I just wanted to follow up.

Is this patch not relevant enough for the mainline kernel? Or did I just make a mistake with the way I submitted it? It was my first patch to the kernel, and I tried to follow the guidelines as much as possible. Still, sorry if I overlooked something.

Thanks,
Markus


On 5/1/19 2:27 PM, Markus Koch wrote:
> This patch adds support for the FlySky FS-iA6B RC receiver (serial IBUS).
> 
> It allows the usage of the FlySky FS-i6 and other AFHDS compliant remote
> controls as a joystick input device.
> 
> To use it, a patch to inputattach which adds the FS-iA6B as a 115200 baud
> serial device is required. I will upstream it after this patch is merged.
> 
> More information about the hardware can be found here:
> 
> https://notsyncing.net/?p=blog&b=2018.linux-fsia6b
> 
> Signed-off-by: Markus Koch <markus@notsyncing.net>
> ---
>  MAINTAINERS                     |   6 +
>  drivers/input/joystick/Kconfig  |  10 ++
>  drivers/input/joystick/Makefile |   1 +
>  drivers/input/joystick/fsia6b.c | 255 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/serio.h      |   1 +
>  5 files changed, 273 insertions(+)
>  create mode 100644 drivers/input/joystick/fsia6b.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3a5c97e3419..f6d404274d45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11779,6 +11779,12 @@ S:	Maintained
>  F:	Documentation/input/devices/pxrc.rst
>  F:	drivers/input/joystick/pxrc.c
>  
> +FLYSKY FSIA6B RC RECEIVER
> +M:	Markus Koch <markus@notsyncing.net>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/input/joystick/fsia6b.c
> +
>  PHONET PROTOCOL
>  M:	Remi Denis-Courmont <courmisch@gmail.com>
>  S:	Supported
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index d8f9c6e1fc08..0eb87013823d 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -361,4 +361,14 @@ config JOYSTICK_PXRC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pxrc.
>  
> +config JOYSTICK_FSIA6B
> +	tristate "FlySky FS-iA6B RC Receiver"
> +	select SERIO
> +	help
> +	  Say Y here if you use a FlySky FS-i6 RC remote control along with the
> +	  FS-iA6B RC receiver as a joystick input device.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called fsia6b.
> +
>  endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index dd0492ebbed7..aae4477a92a9 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -35,4 +35,5 @@ obj-$(CONFIG_JOYSTICK_WARRIOR)		+= warrior.o
>  obj-$(CONFIG_JOYSTICK_XPAD)		+= xpad.o
>  obj-$(CONFIG_JOYSTICK_ZHENHUA)		+= zhenhua.o
>  obj-$(CONFIG_JOYSTICK_WALKERA0701)	+= walkera0701.o
> +obj-$(CONFIG_JOYSTICK_FSIA6B)		+= fsia6b.o
>  
> diff --git a/drivers/input/joystick/fsia6b.c b/drivers/input/joystick/fsia6b.c
> new file mode 100644
> index 000000000000..587c2260a56f
> --- /dev/null
> +++ b/drivers/input/joystick/fsia6b.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + *  FS-iA6B iBus RC receiver kernel driver
> + *  Copyright (C) 2018 - 2019  Markus Koch <markus@notsyncing.net>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program.
> + *
> + */
> +
> +/*
> + * This driver will provide all 14 channels of the FlySky FS-ia6B RC receiver
> + * as analog values.
> + *
> + * Additionally, the channels can be converted to discrete switch values.
> + * By default, it is configured for the offical FS-i6 remote control.
> + * If you use a different hardware configuration, you can configure it
> + * using the `switch_config` parameter.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/serio.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +
> +#define DRIVER_DESC	"FS-iA6B iBus RC receiver"
> +
> +MODULE_AUTHOR("Markus Koch <markus@notsyncing.net>");
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> +
> +#define IBUS_SERVO_COUNT 14
> +
> +static char *switch_config = "00000022320000";
> +module_param(switch_config, charp, 0444);
> +MODULE_PARM_DESC(switch_config,
> +		 "Amount of switch positions per channel (14 characters, 0-3)");
> +
> +static int fsia6b_axes[IBUS_SERVO_COUNT] = {
> +	ABS_X, ABS_Y,
> +	ABS_Z, ABS_RX,
> +	ABS_RY, ABS_RZ,
> +	ABS_HAT0X, ABS_HAT0Y,
> +	ABS_HAT1X, ABS_HAT1Y,
> +	ABS_HAT2X, ABS_HAT2Y,
> +	ABS_HAT3X, ABS_HAT3Y
> +};
> +
> +enum ibus_state {SYNC, COLLECT, PROCESS};
> +
> +struct ibus_packet {
> +	enum ibus_state state;
> +
> +	int offset;
> +	uint16_t ibuf;
> +	uint16_t channel[IBUS_SERVO_COUNT];
> +};
> +
> +struct fsia6b {
> +	struct input_dev *dev;
> +	struct ibus_packet packet;
> +
> +	char phys[32];
> +};
> +
> +static irqreturn_t fsia6b_serio_irq(struct serio *serio,
> +				    unsigned char data, unsigned int flags)
> +{
> +	struct fsia6b *fsia6b = serio_get_drvdata(serio);
> +	int i;
> +	int sw_state;
> +	int sw_id = BTN_0;
> +
> +	fsia6b->packet.ibuf = (data << 8) | ((fsia6b->packet.ibuf >> 8) & 0xFF);
> +
> +	switch (fsia6b->packet.state) {
> +	case SYNC:
> +		if (fsia6b->packet.ibuf == 0x4020)
> +			fsia6b->packet.state = COLLECT;
> +		break;
> +
> +	case COLLECT:
> +		fsia6b->packet.state = PROCESS;
> +		break;
> +
> +	case PROCESS:
> +		fsia6b->packet.channel[fsia6b->packet.offset] =
> +				fsia6b->packet.ibuf;
> +		fsia6b->packet.offset++;
> +
> +		if (fsia6b->packet.offset == IBUS_SERVO_COUNT) {
> +			fsia6b->packet.offset = 0;
> +			fsia6b->packet.state = SYNC;
> +			for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
> +				input_report_abs(fsia6b->dev, fsia6b_axes[i],
> +						 fsia6b->packet.channel[i]);
> +
> +				sw_state = 0;
> +				if (fsia6b->packet.channel[i] > 1900)
> +					sw_state = 1;
> +				else if (fsia6b->packet.channel[i] < 1100)
> +					sw_state = 2;
> +
> +				switch (switch_config[i]) {
> +				case '3':
> +					input_report_key(fsia6b->dev,
> +							 sw_id++,
> +							 sw_state == 0);
> +					/* fall-through */
> +				case '2':
> +					input_report_key(fsia6b->dev,
> +							 sw_id++,
> +							 sw_state == 1);
> +					/* fall-through */
> +				case '1':
> +					input_report_key(fsia6b->dev,
> +							 sw_id++,
> +							 sw_state == 2);
> +				}
> +			}
> +			input_sync(fsia6b->dev);
> +		} else {
> +			fsia6b->packet.state = COLLECT;
> +		}
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
> +{
> +	struct fsia6b *fsia6b;
> +	struct input_dev *input_dev;
> +	int err;
> +	int i, j;
> +	int sw_id = BTN_0;
> +
> +	fsia6b = kzalloc(sizeof(struct fsia6b), GFP_KERNEL);
> +	if (!fsia6b)
> +		return -ENOMEM;
> +
> +	fsia6b->packet.ibuf = 0;
> +	fsia6b->packet.offset = 0;
> +	fsia6b->packet.state = SYNC;
> +
> +	serio_set_drvdata(serio, fsia6b);
> +
> +	err = serio_open(serio, drv);
> +	if (err)
> +		goto fail1;
> +
> +
> +	input_dev = input_allocate_device();
> +	err = -ENODEV;
> +	if (!input_dev)
> +		goto fail2;
> +	fsia6b->dev = input_dev;
> +
> +	snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
> +
> +	input_dev->name = DRIVER_DESC;
> +	input_dev->phys = fsia6b->phys;
> +	input_dev->id.bustype = BUS_RS232;
> +	input_dev->id.vendor = SERIO_FSIA6B;
> +	input_dev->id.product = serio->id.id;
> +	input_dev->id.version = 0x0100;
> +	input_dev->dev.parent = &serio->dev;
> +
> +	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
> +
> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
> +		input_set_abs_params(input_dev, fsia6b_axes[i],
> +				     1000, 2000, 2, 2);
> +	}
> +
> +	// Register switch configuration
> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
> +		if (((switch_config[i] == '\0') && (i != IBUS_SERVO_COUNT)) ||
> +				(switch_config[i] < '0') ||
> +				(switch_config[i] > '3')) {
> +			dev_err(&fsia6b->dev->dev,
> +				"Invalid switch configuration supplied for fsia6b.\n");
> +			err = -EINVAL;
> +			goto fail3;
> +		}
> +
> +		for (j = '1'; j <= switch_config[i]; ++j) {
> +			input_dev->keybit[BIT_WORD(BTN_0)] |=
> +					BIT_MASK(sw_id++);
> +		}
> +
> +	}
> +
> +	err = input_register_device(fsia6b->dev);
> +	if (err)
> +		goto fail3;
> +
> +	return 0;
> +
> +fail3:	input_free_device(input_dev);
> +fail2:	serio_close(serio);
> +fail1:	serio_set_drvdata(serio, NULL);
> +	kfree(fsia6b);
> +	return err;
> +}
> +
> +static void fsia6b_serio_disconnect(struct serio *serio)
> +{
> +	struct fsia6b *fsia6b = serio_get_drvdata(serio);
> +
> +	serio_close(serio);
> +	serio_set_drvdata(serio, NULL);
> +	input_unregister_device(fsia6b->dev);
> +	kfree(fsia6b);
> +}
> +
> +static const struct serio_device_id fsia6b_serio_ids[] = {
> +{
> +	.type	= SERIO_RS232,
> +	.proto	= SERIO_FSIA6B,
> +	.id	= SERIO_ANY,
> +	.extra	= SERIO_ANY,
> +},
> +{ 0 }
> +};
> +
> +MODULE_DEVICE_TABLE(serio, fsia6b_serio_ids);
> +
> +struct serio_driver fsia6b_serio_drv = {
> +	.driver		= {
> +		.name	= "fsia6b"
> +	},
> +	.description	= DRIVER_DESC,
> +	.id_table	= fsia6b_serio_ids,
> +	.interrupt	= fsia6b_serio_irq,
> +	.connect	= fsia6b_serio_connect,
> +	.disconnect	= fsia6b_serio_disconnect
> +};
> +
> +module_serio_driver(fsia6b_serio_drv)
> diff --git a/include/uapi/linux/serio.h b/include/uapi/linux/serio.h
> index a0cac1d8670d..50e991952c97 100644
> --- a/include/uapi/linux/serio.h
> +++ b/include/uapi/linux/serio.h
> @@ -82,5 +82,6 @@
>  #define SERIO_EGALAX	0x3f
>  #define SERIO_PULSE8_CEC	0x40
>  #define SERIO_RAINSHADOW_CEC	0x41
> +#define SERIO_FSIA6B	0x42
>  
>  #endif /* _UAPI_SERIO_H */
> 

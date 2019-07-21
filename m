Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADA906F227
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 09:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfGUHXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 03:23:10 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35325 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfGUHXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 03:23:10 -0400
Received: by mail-lf1-f68.google.com with SMTP id p197so24381679lfa.2
        for <linux-input@vger.kernel.org>; Sun, 21 Jul 2019 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jrSB7FaJ2MsK/IDGedJLL6kSrt2F/cXFqWQ9JVOb0sQ=;
        b=TIxcWx13z1gGJDmT952T96ENF9JeUgB3aFYrAsQFDRGeTHNB59yvVy5Pfm+iJWb6ev
         vhJuIdnFnVKvQGpGn/DXDMINj9CpiLNyYNDBAmWua7jzQ6pM+sAuxFpwgWtpfE32u4Ec
         OTsi3Hqjsk0qrLUDPbfvVHBrn3jUpVYaB45mZ0y+WjhhqCXZ0KLPg2QHa3KGqEAUi9Ul
         g6l6NZszMlVKfPYiqRS9cZq2Qaq8MAIHk7Bo/6lLihZdJs3InY+qgJHVHzSyYCYKRIJb
         eiXJa9FeouQXSjEMEpRnC3m1AkMDQwtbSrCigrp97or8hXHCQn9010M83xhqixGtEbrK
         SJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jrSB7FaJ2MsK/IDGedJLL6kSrt2F/cXFqWQ9JVOb0sQ=;
        b=UWe7RcV3LuSUBfYJ25LM5mXzgazivM3dcmPPfLx/aeEcw6qKbd/eE8bsdmTBGaePve
         kl/TPObmdE/OaMkQ1BBKsoyOjz+OVskRs/YBXTrjkematjoaxaYV7tfsPg4fZjET5BiY
         xVXl/66do+bqp3wZfFQDKknyVmUoYZ2m5sjwJ9G+gX8JESMj1Gprrea024ovPT1k/BYU
         E0auVnlP7nEetY3heCkIDLOEB6LKDW+lcNynMNQgd65KKLSVobXROcZT+IETcwxmh16a
         HBCk4wIFRlfVdXdFvPIiqj22hVBbUy7HX3+uV/HCGLZFTYY9+N0Nfubjs7PvgjpGnN2O
         oxFA==
X-Gm-Message-State: APjAAAW7sVpMnJKzRnl05absfWsf4ET+CjWkVpM4GDU7vODjW8t9SeZx
        BgjbsrargobSwAUYMjX3GXM=
X-Google-Smtp-Source: APXvYqz/4KwzoZM41Ce9+pRWi+GNFzaryF0nHtRqBgJt88Kl1WvO2h9BGhCGK6d9sFgFxByMLNfoMQ==
X-Received: by 2002:a05:6512:51c:: with SMTP id o28mr29769205lfb.67.1563693787032;
        Sun, 21 Jul 2019 00:23:07 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id v202sm5534640lfa.28.2019.07.21.00.23.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2019 00:23:06 -0700 (PDT)
Date:   Sun, 21 Jul 2019 10:23:03 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Markus Koch <markus@notsyncing.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: add support for the FlySky FS-iA6B RC receiver
Message-ID: <20190721072303.GA607@penguin>
References: <20190501122745.1322-1-markus@notsyncing.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501122745.1322-1-markus@notsyncing.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Markus,

On Wed, May 01, 2019 at 02:27:47PM +0200, Markus Koch wrote:
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

This looks pretty good, just few nits below.

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

You do not need to include license boilerplate when we have SPDX tag.

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

Please sort includes alphabetically.

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

Simply u16 when in kernel. Also #include <linux/types.h>

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

sizeof(*fsia6b)

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

-ENOMEM and would prefer if it was set in the error handling/goto
branch.

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

Not needed with input_set_abs_params() and input_set_capability().
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

			input_set_capability(input_dev, EV_KEY, BTN_0 + sw_id);
			sw_id++;
> +		}
> +
> +	}

Thanks.

-- 
Dmitry

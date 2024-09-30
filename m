Return-Path: <linux-input+bounces-6910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD998A941
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 17:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EB5BB20A22
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F3618BBA9;
	Mon, 30 Sep 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVQZb6WU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEB13634C
	for <linux-input@vger.kernel.org>; Mon, 30 Sep 2024 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727711947; cv=none; b=YOljkOW/EpkCUTmYedTVrxkupr//kqg89rOYKp4LkxN7AJyR3CL4Sxktr7xbYx1B4ky2v/154jY5fmw5sUhulHlsaraHQVAo4JsiXksMftAiEL2TSELCTWtib3ujI0gyk9gXxKHFpa3mPb+AoI+ZWlsRtiPlB3lUwRHea04UouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727711947; c=relaxed/simple;
	bh=VYyZt2vD47fDt191jcjDznoTZ9Zjy3xJG3xnBZ8DQOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9u/t2M3TlGtvxvnK2V2NzebU4SXEGGCdNLoJYAuoTV9k2zcixoR/vl7IH+j/XpIVwNvRi5u8ou8/fVLVaOC6grf1AnhaO7u7OW5jzzRf58RPBn+9RuyidyfS7jTqQvxY1bBxCre1i0llRsLUBDdjaFx5rYr8WhkhPsJFhtYVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVQZb6WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC878C4CEC7;
	Mon, 30 Sep 2024 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727711946;
	bh=VYyZt2vD47fDt191jcjDznoTZ9Zjy3xJG3xnBZ8DQOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVQZb6WUdqrJahkXVZG/0u/WWIwlCsKT2l3TWQ4is64QMXYf/xKwPiE6PkkTCvJ2q
	 UL2hSspoMaNzUiMk9pBoizngLFz3gfHlBS3uUaHeeLr/mw0v7WRYUa8V0sE6za3iAd
	 O64AVE/nYnoX+vyiFzho6ySinG7vk9GSfShjDfDaZ+usND3j7k1ZBk+OFVDixc2iLy
	 +9Tz2DorDGCmyE3ZUBeb5JB+t+s3DlKIZ8XkxQJI7wNk7dzAU8JekD8j8kPwQHUF4o
	 klhdJFKb9mLdnMxIKovJXR2V+PRx5UtO1x3uDzIn0+rFtnrk1x+rwriDFPfiVy48qz
	 /qvhCUbj7Y53w==
Date: Mon, 30 Sep 2024 17:59:01 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704125243.3633569-1-zhoubinbin@loongson.cn>

Hi,

On Jul 04 2024, Binbin Zhou wrote:
> This patch introduces a driver for the PixArt PS/2 touchpad, which
> supports both clickpad and touchpad types.
> 
> At the same time, we extended the single data packet length to 16,
> because according to the current PixArt hardware and FW design, we need
> 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> 
> Co-developed-by: Jon Xie <jon_xie@pixart.com>
> Signed-off-by: Jon Xie <jon_xie@pixart.com>
> Co-developed-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

It looks like this new driver made in v6.12-rc1 but is already breaking
other touchpads in fedora:

https://bugzilla.redhat.com/show_bug.cgi?id=2314756

The reported touchpads used to work properly but are now directed to use
the PixArt PS2 driver instead of the old one (I would say it should be
using Synaptics).

I haven't touched PS/2 in a long time, so it's going to be hard to
pinpoint the error from my side, but it seems that the new driver is a
little bit too greedy.

Cheers,
Benjamin

> ---
> V4:
>  - Thanks Dmitry for the review.
>    - Just return what ps2_command() reports, instead of replacing it with
>      -EIO;
>    - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
>      value and errors/success;
>    - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
>      some redundant code, like the call to input_mt_report_finger_count()
>      and the setting of bits in the touchpad section.
> 
> Link to V3:
> https://lore.kernel.org/all/20240701094953.3195501-1-zhoubinbin@loongson.cn/
> 
> V3:
>  - Rebased on input/next;
>  - Added comment to msleep() in pixart_reset() as suggested by Aseda, no
> functional change, thanks.
> 
> Link to V2:
> https://lore.kernel.org/all/20240624065359.2985060-1-zhoubinbin@loongson.cn/
> 
> V2:
>  - Rebased on input/next;
>  - Merge two patches from the V1 patchset;
>  - Initialize local variables to prevent random garbage;
>  - Remove some noisy debug message;
>  - Check ps2_command() return value;
>  - Use macros to represent bit operations for better readability, such
>    as abs_x;
>  - Remove the code related to rel packets, for the normal
>    intellimouse detection is well in PixArt.
> 
> Link to V1:
> https://lore.kernel.org/all/cover.1715224143.git.zhoubinbin@loongson.cn/
> 
>  drivers/input/mouse/Kconfig        |  12 ++
>  drivers/input/mouse/Makefile       |   1 +
>  drivers/input/mouse/pixart_ps2.c   | 277 +++++++++++++++++++++++++++++
>  drivers/input/mouse/pixart_ps2.h   |  36 ++++
>  drivers/input/mouse/psmouse-base.c |  17 ++
>  drivers/input/mouse/psmouse.h      |   3 +-
>  6 files changed, 345 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/input/mouse/pixart_ps2.c
>  create mode 100644 drivers/input/mouse/pixart_ps2.h
> 
> diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
> index 833b643f0616..8a27a20d04b0 100644
> --- a/drivers/input/mouse/Kconfig
> +++ b/drivers/input/mouse/Kconfig
> @@ -69,6 +69,18 @@ config MOUSE_PS2_LOGIPS2PP
>  
>  	  If unsure, say Y.
>  
> +config MOUSE_PS2_PIXART
> +	bool "PixArt PS/2 touchpad protocol extension" if EXPERT
> +	default y
> +	depends on MOUSE_PS2
> +	help
> +	  This driver supports the PixArt PS/2 touchpad found in some
> +	  laptops.
> +	  Say Y here if you have a PixArt PS/2 TouchPad connected to
> +	  your system.
> +
> +	  If unsure, say Y.
> +
>  config MOUSE_PS2_SYNAPTICS
>  	bool "Synaptics PS/2 mouse protocol extension" if EXPERT
>  	default y
> diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
> index a1336d5bee6f..563029551529 100644
> --- a/drivers/input/mouse/Makefile
> +++ b/drivers/input/mouse/Makefile
> @@ -32,6 +32,7 @@ psmouse-$(CONFIG_MOUSE_PS2_ELANTECH)	+= elantech.o
>  psmouse-$(CONFIG_MOUSE_PS2_OLPC)	+= hgpk.o
>  psmouse-$(CONFIG_MOUSE_PS2_LOGIPS2PP)	+= logips2pp.o
>  psmouse-$(CONFIG_MOUSE_PS2_LIFEBOOK)	+= lifebook.o
> +psmouse-$(CONFIG_MOUSE_PS2_PIXART)	+= pixart_ps2.o
>  psmouse-$(CONFIG_MOUSE_PS2_SENTELIC)	+= sentelic.o
>  psmouse-$(CONFIG_MOUSE_PS2_TRACKPOINT)	+= trackpoint.o
>  psmouse-$(CONFIG_MOUSE_PS2_TOUCHKIT)	+= touchkit_ps2.o
> diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pixart_ps2.c
> new file mode 100644
> index 000000000000..6d78c4157abe
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Pixart Touchpad Controller 1336U PS2 driver
> + *
> + * Author: Jon Xie <jon_xie@pixart.com>
> + *         Jay Lee <jay_lee@pixart.com>
> + * Further cleanup and restructuring by:
> + *         Binbin Zhou <zhoubinbin@loongson.cn>
> + *
> + * Copyright (C) 2021-2024 Pixart Imaging.
> + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> + *
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/libps2.h>
> +#include <linux/input/mt.h>
> +#include <linux/serio.h>
> +#include <linux/slab.h>
> +
> +#include "pixart_ps2.h"
> +
> +static int pixart_read_tp_mode(struct ps2dev *ps2dev, u8 *mode)
> +{
> +	int error;
> +	u8 param[1] = { 0 };
> +
> +	error = ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT);
> +	if (error)
> +		return error;
> +
> +	*mode = (param[0] == 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
> +
> +	return 0;
> +}
> +
> +static int pixart_read_tp_type(struct ps2dev *ps2dev, u8 *type)
> +{
> +	int error;
> +	u8 param[3] = { 0 };
> +
> +	param[0] = 0x0a;
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +	if (error)
> +		return error;
> +
> +	param[0] = 0x0;
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	if (error)
> +		return error;
> +
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	if (error)
> +		return error;
> +
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	if (error)
> +		return error;
> +
> +	param[0] = 0x03;
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	if (error)
> +		return error;
> +
> +	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +	if (error)
> +		return error;
> +
> +	*type = (param[0] == 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
> +
> +	return 0;
> +}
> +
> +static void pixart_reset(struct psmouse *psmouse)
> +{
> +	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> +
> +	/* according to PixArt, 100ms is required for the upcoming reset */
> +	msleep(100);
> +	psmouse_reset(psmouse);
> +}
> +
> +static void pixart_process_packet(struct psmouse *psmouse)
> +{
> +	struct pixart_data *priv = psmouse->private;
> +	struct input_dev *dev = psmouse->dev;
> +	int i, id, fingers = 0, abs_x, abs_y;
> +	u8 *pkt = psmouse->packet;
> +	u8 contact_cnt = CONTACT_CNT(pkt[0]);
> +	bool tip;
> +
> +	for (i = 0; i < contact_cnt; i++) {
> +		id = SLOT_ID_MASK(pkt[3 * i + 3]);
> +		abs_y = ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> +		abs_x = ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
> +
> +		if (i == PIXART_MAX_FINGERS - 1)
> +			tip = pkt[14] & BIT(1);
> +		else
> +			tip = pkt[3 * contact_cnt + 1] & BIT(2 * i + 1);
> +
> +		input_mt_slot(dev, id);
> +		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip)) {
> +			fingers++;
> +			input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
> +			input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
> +		}
> +	}
> +
> +	input_mt_sync_frame(dev);
> +
> +	if (priv->type == PIXART_TYPE_CLICKPAD) {
> +		input_report_key(dev, BTN_LEFT, pkt[0] & 0x03);
> +	} else {
> +		input_report_key(dev, BTN_LEFT, pkt[0] & 0x01);
> +		input_report_key(dev, BTN_RIGHT, pkt[0] & 0x02);
> +	}
> +
> +	input_sync(dev);
> +}
> +
> +static psmouse_ret_t pixart_protocol_handler(struct psmouse *psmouse)
> +{
> +	u8 *pkt = psmouse->packet;
> +	u8 contact_cnt = CONTACT_CNT(pkt[0]);
> +
> +	if (contact_cnt > PIXART_MAX_FINGERS || ((pkt[0] & 0x8c) != 0x80))
> +		return PSMOUSE_BAD_DATA;
> +
> +	if (contact_cnt == PIXART_MAX_FINGERS && psmouse->pktcnt < psmouse->pktsize)
> +		return PSMOUSE_GOOD_DATA;
> +
> +	if (contact_cnt == 0 && psmouse->pktcnt < 5)
> +		return PSMOUSE_GOOD_DATA;
> +
> +	if (psmouse->pktcnt < (3 * contact_cnt + 2))
> +		return PSMOUSE_GOOD_DATA;
> +
> +	pixart_process_packet(psmouse);
> +
> +	return PSMOUSE_FULL_PACKET;
> +}
> +
> +static void pixart_disconnect(struct psmouse *psmouse)
> +{
> +	pixart_reset(psmouse);
> +	kfree(psmouse->private);
> +	psmouse->private = NULL;
> +}
> +
> +static int pixart_reconnect(struct psmouse *psmouse)
> +{
> +	u8 mode;
> +	int error;
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +
> +	pixart_reset(psmouse);
> +	error = pixart_read_tp_mode(ps2dev, &mode);
> +	if (error)
> +		return error;
> +
> +	if (mode != PIXART_MODE_ABS)
> +		return mode;
> +
> +	return ps2_command(ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
> +}
> +
> +static int pixart_set_input_params(struct input_dev *dev, struct pixart_data *priv)
> +{
> +	/* No relative support */
> +	__clear_bit(EV_REL, dev->evbit);
> +	__clear_bit(REL_X, dev->relbit);
> +	__clear_bit(REL_Y, dev->relbit);
> +	__clear_bit(BTN_MIDDLE, dev->keybit);
> +
> +	/* Buttons */
> +	__set_bit(EV_KEY, dev->evbit);
> +	__set_bit(BTN_LEFT, dev->keybit);
> +	if (priv->type == PIXART_TYPE_CLICKPAD)
> +		__set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
> +	else
> +		__set_bit(BTN_RIGHT, dev->keybit);
> +
> +	/* Absolute position */
> +	input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
> +	input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, PIXART_PAD_WIDTH, 0, 0);
> +	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +	return input_mt_init_slots(dev, PIXART_SLOTS_NUM, INPUT_MT_POINTER);
> +}
> +
> +static int pixart_query_hardware(struct ps2dev *ps2dev, u8 *mode, u8 *type)
> +{
> +	int error;
> +
> +	error = pixart_read_tp_type(ps2dev, type);
> +	if (error)
> +		return error;
> +
> +	return pixart_read_tp_mode(ps2dev, mode);
> +}
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> +{
> +	u8 type;
> +	int error;
> +
> +	pixart_reset(psmouse);
> +	error = pixart_read_tp_type(&psmouse->ps2dev, &type);
> +	if (error)
> +		return error;
> +
> +	if (set_properties) {
> +		psmouse->vendor = "PixArt";
> +		psmouse->name = (type == PIXART_TYPE_TOUCHPAD) ?
> +				"touchpad" : "clickpad";
> +	}
> +
> +	return 0;
> +}
> +
> +int pixart_init(struct psmouse *psmouse)
> +{
> +	int error;
> +	struct pixart_data *priv;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	psmouse->private = priv;
> +	pixart_reset(psmouse);
> +
> +	error = pixart_query_hardware(&psmouse->ps2dev, &priv->mode, &priv->type);
> +	if (error) {
> +		psmouse_err(psmouse, "init: Unable to query PixArt touchpad hardware.\n");
> +		goto err_exit;
> +	}
> +
> +	/* Relative mode follows standard PS/2 mouse protocol */
> +	if (priv->mode != PIXART_MODE_ABS) {
> +		error = -EIO;
> +		goto err_exit;
> +	}
> +
> +	/* Set absolute mode */
> +	error = ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
> +	if (error) {
> +		psmouse_err(psmouse, "init: Unable to initialize PixArt absolute mode.\n");
> +		goto err_exit;
> +	}
> +
> +	error = pixart_set_input_params(psmouse->dev, priv);
> +	if (error) {
> +		psmouse_err(psmouse, "init: Unable to set input params.\n");
> +		goto err_exit;
> +	}
> +
> +	psmouse->pktsize = 15;
> +	psmouse->protocol_handler = pixart_protocol_handler;
> +	psmouse->disconnect = pixart_disconnect;
> +	psmouse->reconnect = pixart_reconnect;
> +	psmouse->cleanup = pixart_reset;
> +	/* resync is not supported yet */
> +	psmouse->resync_time = 0;
> +
> +	return 0;
> +
> +err_exit:
> +	pixart_reset(psmouse);
> +	kfree(priv);
> +	psmouse->private = NULL;
> +	return error;
> +}
> diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
> new file mode 100644
> index 000000000000..ecc0f715b291
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _PIXART_PS2_H
> +#define _PIXART_PS2_H
> +
> +#include "psmouse.h"
> +
> +#define PIXART_PAD_WIDTH	1023
> +#define PIXART_PAD_HEIGHT	579
> +#define PIXART_MAX_FINGERS	4
> +#define PIXART_SLOTS_NUM	PIXART_MAX_FINGERS
> +
> +#define PIXART_CMD_REPORT_FORMAT	0x01d8
> +#define PIXART_CMD_SWITCH_PROTO		0x00de
> +
> +#define PIXART_MODE_REL	0
> +#define PIXART_MODE_ABS	1
> +
> +#define PIXART_TYPE_CLICKPAD	0
> +#define PIXART_TYPE_TOUCHPAD	1
> +
> +#define CONTACT_CNT(m)	(((m) & GENMASK(6, 4)) >> 4)
> +#define SLOT_ID_MASK(m)	((m) & GENMASK(2, 0))
> +#define ABS_Y_MASK(m)	(((m) & GENMASK(5, 4)) << 4)
> +#define ABS_X_MASK(m)	(((m) & GENMASK(7, 6)) << 2)
> +
> +struct pixart_data {
> +	u8 mode;
> +	u8 type;
> +	int x_max;
> +	int y_max;
> +};
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties);
> +int pixart_init(struct psmouse *psmouse);
> +
> +#endif  /* _PIXART_PS2_H */
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index a0aac76b1e41..41af3460077d 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -36,6 +36,7 @@
>  #include "focaltech.h"
>  #include "vmmouse.h"
>  #include "byd.h"
> +#include "pixart_ps2.h"
>  
>  #define DRIVER_DESC	"PS/2 mouse driver"
>  
> @@ -905,6 +906,15 @@ static const struct psmouse_protocol psmouse_protocols[] = {
>  		.detect		= byd_detect,
>  		.init		= byd_init,
>  	},
> +#endif
> +#ifdef CONFIG_MOUSE_PS2_PIXART
> +	{
> +		.type		= PSMOUSE_PIXART,
> +		.name		= "PixArtPS/2",
> +		.alias		= "pixart",
> +		.detect		= pixart_detect,
> +		.init		= pixart_init,
> +	},
>  #endif
>  	{
>  		.type		= PSMOUSE_AUTO,
> @@ -1172,6 +1182,13 @@ static int psmouse_extensions(struct psmouse *psmouse,
>  			return ret;
>  	}
>  
> +	/* Try PixArt touchpad */
> +	if (max_proto > PSMOUSE_IMEX &&
> +	    psmouse_try_protocol(psmouse, PSMOUSE_PIXART, &max_proto,
> +				 set_properties, true)) {
> +		return PSMOUSE_PIXART;
> +	}
> +
>  	if (max_proto > PSMOUSE_IMEX) {
>  		if (psmouse_try_protocol(psmouse, PSMOUSE_GENPS,
>  					 &max_proto, set_properties, true))
> diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.h
> index 4d8acfe0d82a..23f7fa7243cb 100644
> --- a/drivers/input/mouse/psmouse.h
> +++ b/drivers/input/mouse/psmouse.h
> @@ -69,6 +69,7 @@ enum psmouse_type {
>  	PSMOUSE_BYD,
>  	PSMOUSE_SYNAPTICS_SMBUS,
>  	PSMOUSE_ELANTECH_SMBUS,
> +	PSMOUSE_PIXART,
>  	PSMOUSE_AUTO		/* This one should always be last */
>  };
>  
> @@ -94,7 +95,7 @@ struct psmouse {
>  	const char *vendor;
>  	const char *name;
>  	const struct psmouse_protocol *protocol;
> -	unsigned char packet[8];
> +	unsigned char packet[16];
>  	unsigned char badbyte;
>  	unsigned char pktcnt;
>  	unsigned char pktsize;
> -- 
> 2.43.0
> 
> 
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B67EC0
> 	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 04:31:09 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
> ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1721795471; cv=none; b=XzP+E04fc+LCqK7y5o60gzZIZ+eJJ6/nlhp9a68uaDfQZZ1XzhTr4asJEPZjJrwJSD3DybtJD3KYVxVulf7vvyVLa+SmCx/EvawZo/lmfx+ylpHKUYisU6t5s2Tg8Nk9OJxMFwYs/Gr2bgVKOGuCHpbz94LNuAHjIaNMOJFty/c=
> ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1721795471; c=relaxed/simple;
> 	bh=infD5wfWmNAoADbQrefqBGp0WvYoPFzE7ht+lAz4aQU=;
> 	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
> 	 Content-Type:Content-Disposition:In-Reply-To; b=FC3nRYiIaGRDRQU+gXabIrp5oJc+0QuimwtcKEYFOrVtgQT5ce7cEjyJhTf0D1DgVS9d8tuRTHRbkra7B8+/zQcVKCkgvw9FSARYi58FotDVxlL4L8wDcW5qQwbqhS9dd4OyXacvyK56cFfIs4Ym+GtrFD4D9lpLwUsJNrOQEZ4=
> ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgTyowDy; arc=none smtp.client-ip=209.85.210.175
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgTyowDy"
> Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2e68f5a8so1871717b3a.3
>         for <linux-input@vger.kernel.org>; Tue, 23 Jul 2024 21:31:09 -0700 (PDT)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>         d=gmail.com; s=20230601; t=1721795469; x=1722400269; darn=vger.kernel.org;
>         h=in-reply-to:content-disposition:mime-version:references:message-id
>          :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
>         bh=x8swcF7yHTLWGcwHSeve6s2uaXwzuJNaHFfTPKs41cs=;
>         b=OgTyowDyUnC1u1rzg7dAqATmqWFPMMEUrg3+U0+sgseF3ArO6stadrBbFi2JhpV6VA
>          EI5Ma1OE730M+examBDLGYRV/WHq7vWkUVZneLHCbEE80eQjFoBDh5//pWLUOa0KoxMz
>          Dyo9MKKdQqsLStmEsTnU4hkTF2FRdpWY/iikO5+SpFQmRIfR6pyDbONF+F2ggY/agguv
>          RHPR7zQqYafoNCk4ddxFgMNxoK1M7dqPWjHFdAQQttGvfqOhm/kCEsLWdD2gQdax9wWx
>          6qVEkz9nU91PLbbDUi6exUrAoP4DatU4LMZSp4I6F1RYnd4t8ba/FnEasTAOB3kUROkr
>          tF0w==
> X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>         d=1e100.net; s=20230601; t=1721795469; x=1722400269;
>         h=in-reply-to:content-disposition:mime-version:references:message-id
>          :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
>          :message-id:reply-to;
>         bh=x8swcF7yHTLWGcwHSeve6s2uaXwzuJNaHFfTPKs41cs=;
>         b=kFyNXM4KCmaZK3R1j2KvsrZmSmC8HKtetHktJNmIzdoGWa8UW3nXx5t9NH/PE5oNZF
>          /3YUBH1eMhQCuVbgCwLj2gvbuMVb1sbpIaeC6oJ8akLGuRJqRcRaCLhC3UFPq5OmliaJ
>          SwpYGmLGG6hw1iESKVsD2reMyPCLSmqSR7/UjNwrYxBH7ILmeUJjVb8NSN8GFXBfAjYr
>          uq+Ur/NFMjJjaM1mFz5YhoOXt8QF82mWyc2J2Hq8xtlwWhPyQbNnYgGveXsFfCyPznIC
>          KUn3txzkYJ8mlyYwaL8A41ckDeKYFBfOcTynAgbTNvG8VERbBdWIjvFUv6EvoySVGdtu
>          9uhA==
> X-Forwarded-Encrypted: i=1; AJvYcCXzAsnKvq0uKkWbKp/+a9D5myuiCkqLjoUnh8hUvIq80MJeAy6NxOmlVnJuyEvsRKW1v4iRXDWP2RthgzSqRw6ALurqRnR3ZnKdh9I=
> X-Gm-Message-State: AOJu0YxHQcjWsgv8gWw/0dCVxhQqCkTs4tZoxy+kUsHFT4KKexh6ClRn
> 	ratUFSrd4RKxADrzyts3kUXp3dw4wWz4iL2HP6Iw4eUAkwFa0+xI
> X-Google-Smtp-Source: AGHT+IFf+3IzlZF+3UsKCaGeiqMGV9MhFgko/ICTfRjy4+0dZi7xW7dZeOrCX33QZ813NhBCGuyO1Q==
> X-Received: by 2002:a05:6a00:170c:b0:706:5dfc:7b73 with SMTP id d2e1a72fcca58-70d084fc220mr17203451b3a.16.1721795468836;
>         Tue, 23 Jul 2024 21:31:08 -0700 (PDT)
> Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
>         by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d24a1d62fsm4533728b3a.184.2024.07.23.21.31.07
>         (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
>         Tue, 23 Jul 2024 21:31:08 -0700 (PDT)
> Date: Tue, 23 Jul 2024 21:31:05 -0700
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> To: Binbin Zhou <zhoubinbin@loongson.cn>
> Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
> 	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
> 	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
> 	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
> Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
> Message-ID: <ZqCDiTOl1GEuZUWb@google.com>
> References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
> Precedence: bulk
> X-Mailing-List: linux-input@vger.kernel.org
> List-Id: <linux-input.vger.kernel.org>
> List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=us-ascii
> Content-Disposition: inline
> In-Reply-To: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
> 
> Hi Binbin,
> 
> On Thu, Jul 04, 2024 at 08:52:43PM +0800, Binbin Zhou wrote:
> > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > supports both clickpad and touchpad types.
> > 
> > At the same time, we extended the single data packet length to 16,
> > because according to the current PixArt hardware and FW design, we need
> > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > 
> > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> > V4:
> >  - Thanks Dmitry for the review.
> >    - Just return what ps2_command() reports, instead of replacing it with
> >      -EIO;
> >    - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
> >      value and errors/success;
> >    - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
> >      some redundant code, like the call to input_mt_report_finger_count()
> >      and the setting of bits in the touchpad section.
> 
> Thank you for making the change. I noticed a couple more things that I
> fixed up on my side and applied. Please take a look and shout if you
> see something wrong.
> 
> > +
> > +static void pixart_process_packet(struct psmouse *psmouse)
> > +{
> > +	struct pixart_data *priv = psmouse->private;
> > +	struct input_dev *dev = psmouse->dev;
> > +	int i, id, fingers = 0, abs_x, abs_y;
> > +	u8 *pkt = psmouse->packet;
> > +	u8 contact_cnt = CONTACT_CNT(pkt[0]);
> 
> We have a nice FIELD_GET() macro that operates on a bitmask and value,
> so I changed CONTACT_CNT(m) to CONTACT_CNT_MASK and converted this to:
> 
> 
> 	unsigned int contact_cnt = FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
> 
> Same for SLOT_ID_MASK, ABS_Y_MASK, and ABS_X_MASK.
> 
> > +	bool tip;
> > +
> > +	for (i = 0; i < contact_cnt; i++) {
> > +		id = SLOT_ID_MASK(pkt[3 * i + 3]);
> > +		abs_y = ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> > +		abs_x = ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
> 
> That's way too many of pkt[3 * i + offset] repetitions, I made
> 
> 		const u8 *p = &pkt[3 * i];
> 
> temporary.
> 
> <...>
> 
> > +
> > +static int pixart_reconnect(struct psmouse *psmouse)
> > +{
> > +	u8 mode;
> > +	int error;
> > +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> > +
> > +	pixart_reset(psmouse);
> > +	error = pixart_read_tp_mode(ps2dev, &mode);
> > +	if (error)
> > +		return error;
> > +
> > +	if (mode != PIXART_MODE_ABS)
> > +		return mode;
> 
> This should be "return -EIO".
> 
> Thanks.
> 
> -- 
> Dmitry
> 
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF811C2AD
> 	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 10:01:08 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
> ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1721815269; cv=none; b=RElKLW4jshtL8YENgDbIP7UqsRf7brq7mma2b8tnBGoP9Ixaiy6ee0oBHe7P8MP4HHwvDqMjBobv/PUP7Kk6zTmQ61HMbhj93tZhNQy2zm1g8hOyPoeadKS5NK9wWMg5TsLuzbOdFL1hISqT9DpBVUZlZNL0zjoIFm/FECncDp8=
> ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1721815269; c=relaxed/simple;
> 	bh=VbSQK0fdGjniX4+zl374bMY8WnqvEh7sCQzLeQlT8bk=;
> 	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
> 	 To:Cc:Content-Type; b=ZR2O2R9aYDitVEbMvuYP5M3a4wCP3Me+dMMYK2wnI7uLtMlVC5QLK0sC0NHcGntC2213kPEx1kuXr2J+aWyCECdr0enxrU7GhxyCFlI4hIgbXzS4ksX9btD2yfJEo2F9G+BIdPAU2y7WPoz0Tuqjvc/bxaVKRW98xpoNmOm+jkc=
> ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghycBVCb; arc=none smtp.client-ip=209.85.128.173
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghycBVCb"
> Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66ca536621cso35516297b3.3
>         for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 03:01:08 -0700 (PDT)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>         d=gmail.com; s=20230601; t=1721815267; x=1722420067; darn=vger.kernel.org;
>         h=content-transfer-encoding:cc:to:subject:message-id:date:from
>          :in-reply-to:references:mime-version:from:to:cc:subject:date
>          :message-id:reply-to;
>         bh=9kZDSflsFCEdGyx8834Dut9V56TuNQx+VBD2xZVv4Wg=;
>         b=ghycBVCbel68QSHAFFeb3J9hfn1EBKTTF+PoBE70SWiWAfpgJdJ651GKZa5j2Yk5I0
>          n3ZpcrTgh5B6Qb4/3Xrg70v+xdIrySy4oEPuEs3OU6M3Mfaj//IwUn8e12hv7RA6bdXb
>          hAGLBTF49pVNVVAclrp2XclUs2F4YSIWHkeoMVAWIT49QT9/vtjbEGwDe/VL41P77jFK
>          7VlnpRfvbn1TkiWq1THyQyluKW4TuWCrrsg99Ku3+/O73/PWD4mW8zoQgwXLzz3ezCkJ
>          GCgoSkj4ByFuWt0sHk8pOqCdNl7Rtwz6iXDSj0r7Gm77P5I9J+YIholoMHyhTsmjd0DW
>          qawQ==
> X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>         d=1e100.net; s=20230601; t=1721815267; x=1722420067;
>         h=content-transfer-encoding:cc:to:subject:message-id:date:from
>          :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
>          :subject:date:message-id:reply-to;
>         bh=9kZDSflsFCEdGyx8834Dut9V56TuNQx+VBD2xZVv4Wg=;
>         b=KL7yYXR+RkTYLwXPYXY2ncgWg8Ulfred2bGf+5AuvR/siIswW2+XWDPSBKe97DUiUg
>          iSCrYQ2EMVmOPHLxwPampWQBEnrWXq5s7vB8m8nw+i9Pp7V8BR3/lLP2IpjpyB3V5Ozn
>          eitNl4a7FNcqwU8iRNeV98vtmcgMShoaxCZCi6kL7PfwtvO+Sh0Lr+mZBLdAf5tfI3SJ
>          Gb6/2wOxpHACBAtIWnpmwd0mj7ZdKqBXXACijgOBYitzqT0016/2JFm0MRpm2pXaNNBY
>          Z624jtnMmOqYb91gKI0GVYMnfrwHlP/ghlsp4z0Igd5i5SjmmXeN0qRbJpF0+oba7rCZ
>          kX7Q==
> X-Forwarded-Encrypted: i=1; AJvYcCX7jKQnobgiM00+9sqLuG6S8VqoJ17YwS/mhrgzaevq3oDTOg/2I9tmOsxGMHJI7quEMcua3wLLPrcOouvUKdh48hIMgmbDBNO1cd0=
> X-Gm-Message-State: AOJu0Yy9ycSrs2/qSW7XZB90Pb+vtXXtW9MoWe6QfOX1nLUMGa5xLQhK
> 	IZMsA09+0hEelou6UIRIUf7K60sR7tS98zUTbBwAFppiJgj59p1NGqjEM+2+aCNrjXq6J+DSm9A
> 	HREYMCnSL600o4C+juYNYaBAeKwqS0PzUcxU=
> X-Google-Smtp-Source: AGHT+IEVeNO+2Cfb9V9/2c/6KUmzuCdkES7EuYq31KmkN850YaqTHVXMbo+cS4HBIjKjQEOyJN5G6QMSJFg13/KnwzA=
> X-Received: by 2002:a05:690c:288c:b0:65f:8973:31a2 with SMTP id
>  00721157ae682-67279fca551mr16673217b3.13.1721815267127; Wed, 24 Jul 2024
>  03:01:07 -0700 (PDT)
> Precedence: bulk
> X-Mailing-List: linux-input@vger.kernel.org
> List-Id: <linux-input.vger.kernel.org>
> List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> References: <20240704125243.3633569-1-zhoubinbin@loongson.cn> <ZqCDiTOl1GEuZUWb@google.com>
> In-Reply-To: <ZqCDiTOl1GEuZUWb@google.com>
> From: Binbin Zhou <zhoubb.aaron@gmail.com>
> Date: Wed, 24 Jul 2024 16:00:55 +0600
> Message-ID: <CAMpQs4+OR96VZ4qQvqQAEAprfPVNWHQ8F-2vKTDDfQf40M_rLQ@mail.gmail.com>
> Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
> 	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
> 	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
> 	Xiaotian Wu <wuxiaotian@loongson.cn>
> Content-Type: text/plain; charset="UTF-8"
> Content-Transfer-Encoding: quoted-printable
> 
> On Wed, Jul 24, 2024 at 10:31=E2=80=AFAM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Binbin,
> >
> > On Thu, Jul 04, 2024 at 08:52:43PM +0800, Binbin Zhou wrote:
> > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > supports both clickpad and touchpad types.
> > >
> > > At the same time, we extended the single data packet length to 16,
> > > because according to the current PixArt hardware and FW design, we need
> > > 11 bytes/15 bytes to represent the complete three-finger/four-finger da=
> ta.
> > >
> > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > > V4:
> > >  - Thanks Dmitry for the review.
> > >    - Just return what ps2_command() reports, instead of replacing it wi=
> th
> > >      -EIO;
> > >    - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
> > >      value and errors/success;
> > >    - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
> > >      some redundant code, like the call to input_mt_report_finger_count=
> ()
> > >      and the setting of bits in the touchpad section.
> >
> > Thank you for making the change. I noticed a couple more things that I
> > fixed up on my side and applied. Please take a look and shout if you
> > see something wrong.
> 
> Hi Dmitry:
> 
> When I tried to fix it, I found that you had already fixed it for me
> and merged it into your input/next branch. Thank you for your
> corrections.
> Also thank you very much for reviewing this patch series. I also
> learned a lot about the input subsystem from it.
> 
> Of course I have tested it and it is good.
> 
> Thanks.
> Binbin
> >
> > > +
> > > +static void pixart_process_packet(struct psmouse *psmouse)
> > > +{
> > > +     struct pixart_data *priv =3D psmouse->private;
> > > +     struct input_dev *dev =3D psmouse->dev;
> > > +     int i, id, fingers =3D 0, abs_x, abs_y;
> > > +     u8 *pkt =3D psmouse->packet;
> > > +     u8 contact_cnt =3D CONTACT_CNT(pkt[0]);
> >
> > We have a nice FIELD_GET() macro that operates on a bitmask and value,
> > so I changed CONTACT_CNT(m) to CONTACT_CNT_MASK and converted this to:
> >
> >
> >         unsigned int contact_cnt =3D FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
> >
> > Same for SLOT_ID_MASK, ABS_Y_MASK, and ABS_X_MASK.
> >
> > > +     bool tip;
> > > +
> > > +     for (i =3D 0; i < contact_cnt; i++) {
> > > +             id =3D SLOT_ID_MASK(pkt[3 * i + 3]);
> > > +             abs_y =3D ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> > > +             abs_x =3D ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
> >
> > That's way too many of pkt[3 * i + offset] repetitions, I made
> >
> >                 const u8 *p =3D &pkt[3 * i];
> >
> > temporary.
> >
> > <...>
> >
> > > +
> > > +static int pixart_reconnect(struct psmouse *psmouse)
> > > +{
> > > +     u8 mode;
> > > +     int error;
> > > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > > +
> > > +     pixart_reset(psmouse);
> > > +     error =3D pixart_read_tp_mode(ps2dev, &mode);
> > > +     if (error)
> > > +             return error;
> > > +
> > > +     if (mode !=3D PIXART_MODE_ABS)
> > > +             return mode;
> >
> > This should be "return -EIO".
> >
> > Thanks.
> >
> > --
> > Dmitry
> 


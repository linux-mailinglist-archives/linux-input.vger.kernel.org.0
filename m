Return-Path: <linux-input+bounces-4828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C46926A4F
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE841F22C97
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F160E17A5B0;
	Wed,  3 Jul 2024 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUyAECOY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117F32BD19
	for <linux-input@vger.kernel.org>; Wed,  3 Jul 2024 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042390; cv=none; b=R4RqNaMDD4mCEGFdetVzGIbAYeu9alRCrbYGXPy9Du1EUs3EgUuJujTAadn8w4k0k87zn+yTZwzgqeUzqKGtv8xLGRNjfUimRqRKvXmo+22TewNiwAPDDKdyLQd1x7A4/g343Y3km8sLk7JYY0abf7D3IHRUB/Th27hDCK6Exek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042390; c=relaxed/simple;
	bh=xWzALgk1mhx+LeL2Hbt661k7zVGFf7xfxG6rG8HxY5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq/+2VJ7hpryfZZ2tANZzLqoCGFI5bziVg/Iek3gi0g1YpZJTNN5whkER7SSJumlZnSAfxctcmVEjMIYVn0/yr3xmbB2H5Y9J8IDpmPZ3U5HPLYvGld71CEV0X2MLWE3mcPcPOZe/39lOKrAPe4y4mcYVdTq2xuLbGqrf4fGRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUyAECOY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f9e2affc8cso37899405ad.2
        for <linux-input@vger.kernel.org>; Wed, 03 Jul 2024 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042388; x=1720647188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsnJgBzXiRk1/jarWF7VCuBifQvsKyMgbarzvJJg/Wo=;
        b=GUyAECOYxOL6P2L2qEk1Lxo5Uzbn4mq9KCFfLN7Jn9aR2aq9Swdg9xShpKIriOPqsL
         UgAToznVgBXRN1e+gUnBa7KffG90UMhISiPqmopKRYyUb0H7gitHhJMx6323tu2w6F0o
         7FC2+wTPUzDJig1hFC69lhhFZUyWm0Et3hN4HSbJ19gpkS5ESj2O5PyF57duiET5bcUU
         ZSBHkXqA0uei2P+0+gRv16UQ7FhLl/zt3A1F9u7SsjaMuw+Tiyd8wOcu0U0f/4DJphrD
         5gl8ikrtRb4YCeXGzhVNBOol6M3nNizMsrCJD+osCsL7TaUrON28RWYHH5bwFEAaXtAe
         uzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042388; x=1720647188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsnJgBzXiRk1/jarWF7VCuBifQvsKyMgbarzvJJg/Wo=;
        b=uU+ske/NGVWfOV61Jf5uGg5mmIJgBHee5E8QETbPmFIfPEwgiyyI8jpHsEaQENyMur
         ZKnM8a1wtANgCuIktwuzxaMMHxFihtwlUjj4M3Sun3cB9t+fGWLsyhd+M2K83I0ryEUO
         g9GiR9GD4TqbBnuhSCpmbHH5Oq1pOgkPFCYOhOF1JWP7GSszoz1Fu9lOw9XAsdH9TVwV
         UQT7e1vUxsAOCQgDz/ndeMtWTtSmGQkoRdrRoPJueBxsHv9zlbBCbX+3ptVoSuRJPCwr
         S4VZauMxOhCSzTNek4wOZfzYsS09TO0QwLMFclDXlBYOTxla5XDkvyw1PCABsb1UMT+r
         yvmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPj5XKqMym0e/u3yjN3GfIueWEGrjnUTli1tOS6Gi+mVkcuqhA9ZyoaogKF+7NxrPnIL89iFnsSCcJBXL01dvmDrRmPXtU6PyKt/A=
X-Gm-Message-State: AOJu0YyKtZPHPx76icvgy18WADm3awMT/CSK1F76gCFGfrXN9tEtsWm3
	Xum2hy8RcI2tqPkFxcjUXXIvdkF8BRl9wcigKqe4iCJ3cECroWuk
X-Google-Smtp-Source: AGHT+IFDpYgu3LvmiwkSexHpCGqlcIsVnsldzp45XHLAPaq7lxdvyyTZCrrck9vlCOatu/11vmimYQ==
X-Received: by 2002:a17:902:e810:b0:1fa:ae:f383 with SMTP id d9443c01a7336-1fadbcf4671mr106308365ad.48.1720042387999;
        Wed, 03 Jul 2024 14:33:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d20c1sm108193135ad.30.2024.07.03.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:33:07 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:33:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v3] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <ZoXDkcn7O5a8a3l3@google.com>
References: <20240701094953.3195501-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701094953.3195501-1-zhoubinbin@loongson.cn>

Hi Binbin,

On Mon, Jul 01, 2024 at 05:49:53PM +0800, Binbin Zhou wrote:
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

A few more comments below...

> ---
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
>  drivers/input/mouse/pixart_ps2.c   | 269 +++++++++++++++++++++++++++++
>  drivers/input/mouse/pixart_ps2.h   |  36 ++++
>  drivers/input/mouse/psmouse-base.c |  17 ++
>  drivers/input/mouse/psmouse.h      |   3 +-
>  6 files changed, 337 insertions(+), 1 deletion(-)
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
> index 000000000000..a089beb2b00e
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.c
> @@ -0,0 +1,269 @@
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
> +static int pixart_read_tp_mode(struct psmouse *psmouse)

Maybe make it

static int pixart_read_tp_mode(struct ps2dev *ps2dev, u8 *mode)

to separate mode value and errors/success?

> +{
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +	u8 param[1] = { 0 };
> +
> +	if (ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT))
> +		return -EIO;

Just return what ps2_command() reported, no need to change everything to
-EIO.

> +
> +	return (param[0] == 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
> +}
> +
> +static int pixart_read_tp_type(struct psmouse *psmouse)

Same here:

static int pixart_read_tp_type(struct ps2dev *ps2dev, u8 *type)

> +{
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +	u8 param[3] = { 0 };
> +
> +	param[0] = 0x0a;
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE))
> +		return -EIO;

Same here and below, do not clobber with -EIO.

> +
> +	param[0] = 0x0;
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> +		return -EIO;
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> +		return -EIO;
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> +		return -EIO;
> +
> +	param[0] = 0x03;
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> +		return -EIO;
> +
> +	if (ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO))
> +		return -EIO;
> +
> +	return (param[0] == 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
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
> +			tip = pkt[3 * contact_cnt + 1] & (0x01 << (2 * i + 1));

BIT(2 * i + 1)?

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
> +	input_mt_report_finger_count(dev, fingers);

I believe if you pass INPUT_MT_POINTER flag to input_mt_init_slots()
below you will not need to call input_mt_report_finger_count() because
input_mt_sync_frame() will do it for you.

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
> +	int mode;
> +
> +	pixart_reset(psmouse);
> +	mode = pixart_read_tp_mode(psmouse);

	error = pixart_read_tp_mode(&psmouse->ps2dev, &mode);
	if (error)
		return error;

> +	if (mode != PIXART_MODE_ABS)
> +		return mode;
		return -ENODEV;
> +
> +	if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO))
> +		return -EIO;

	error = ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
	if (error)
		return error;

> +
> +	return 0;
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
> +	/* Touchpad */
> +	__set_bit(BTN_TOUCH, dev->keybit);
> +	__set_bit(BTN_TOOL_FINGER, dev->keybit);
> +	__set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
> +	__set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
> +	__set_bit(BTN_TOOL_QUADTAP, dev->keybit);
> +	__set_bit(INPUT_PROP_POINTER, dev->propbit);

If you pass INPUT_MT_POINTER to input_mt_init_slots() then you will not
need to set any of these bits in the "touchpad" section.

> +
> +	/* Absolute position */
> +	__set_bit(EV_ABS, dev->evbit);

No need to call __set_bit(EV_ABS, dev->evbit) when using
input_set_abs_params().


> +	input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
> +	input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, PIXART_PAD_WIDTH, 0, 0);
> +	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +	return input_mt_init_slots(dev, PIXART_SLOTS_NUM, 0);
> +}
> +
> +static int pixart_query_hardware(struct psmouse *psmouse)
> +{
> +	struct pixart_data *priv = psmouse->private;
> +
> +	priv->type = pixart_read_tp_type(psmouse);
> +	if (priv->type < 0)
> +		return -EIO;
> +
> +	priv->mode = pixart_read_tp_mode(psmouse);
> +	if (priv->mode < 0)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> +{
> +	int type;
> +
> +	pixart_reset(psmouse);
> +	type = pixart_read_tp_type(psmouse);
> +	if (type < 0)
> +		return -EIO;
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
> +	struct pixart_data *priv;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	psmouse->private = priv;
> +	pixart_reset(psmouse);
> +
> +	if (pixart_query_hardware(psmouse)) {
> +		psmouse_err(psmouse, "Unable to query PixArt touchpad hardware.\n");
> +		goto err_exit;
> +	}
> +
> +	/* Relative mode follows standard PS/2 mouse protocol */
> +	if (priv->mode != PIXART_MODE_ABS)
> +		goto err_exit;
> +
> +	/* Set absolute mode */
> +	if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO)) {
> +		psmouse_err(psmouse, "init: Unable to initialize PixArt absolute mode.\n");
> +		goto err_exit;
> +	}
> +
> +	if (pixart_set_input_params(psmouse->dev, priv) < 0) {
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
> +	return -EIO;
> +}
> diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
> new file mode 100644
> index 000000000000..f7f16cb9fbb0
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
> +	int mode;
> +	int type;
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

Thanks.

-- 
Dmitry


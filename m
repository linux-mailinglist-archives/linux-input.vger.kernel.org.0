Return-Path: <linux-input+bounces-3780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA738CC789
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 21:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20330282D1E
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF39146588;
	Wed, 22 May 2024 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkIjln/8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36842224FA
	for <linux-input@vger.kernel.org>; Wed, 22 May 2024 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716407908; cv=none; b=bopk8hfxRqd9XbkxKqqCc6o2HsApLBhy4obN8oOPD0sD+ncgVyrKYZIBlh3g30m0tWmdHwvzb3tmzZrJoL6GPISImsqcnaXeM5BEn7BPwUv/oA+wZgl7hzNmyiizy06CixY83ydFJnwKecncxSZ2WEULs/sVg1vwxAtuMyDxnhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716407908; c=relaxed/simple;
	bh=PmQwTsi0MYxft80BE6jfOStWmSGNfOP17nkGl80PpMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5F8J6RaOYu0VgPZHXEYMwi5vlQBOLTlhGojRniloCBLMeJvonZMiNjgQ5tC3G7PDLYDy1ptE/f2NE+8+TtcqGHNJWldX0+wCMSSAnSA8C79vi3xynVok+gAZhAaJPPYN8sfx+A0M28dkh6vxgsKGSTIXEkSZJL1NzkheKK98Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkIjln/8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f32864bcc7so7040695ad.3
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716407905; x=1717012705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a/NwiGktK/sZ0svqTjFzw+gyec7nSQtEsdFc1yHyiw=;
        b=FkIjln/8igxIMMHAaKCozWaz93QwM8SrpghV41m0H5E/7vMlonLQzbiqV6ZuWUKOy+
         B6q76I05aJPUrBlnS+nf5KcwTrTfNe3E6lvZn60VkgODW3DuelINquoJ+IKfi2vw5uq8
         JgF5l2aSKZIitmsA1JgThHx1kF23taGxhY5FJf/MAIlLjGcDV+51fLWxSHgvtFeSrzy9
         e4EhnVcd2XYW+kUGBNtboVPlKym/o6nkeUs2lpNiqi7G1Gk53xUFJH9teqaaaRATiiSi
         gBTMHJ5tOGyAjvTsQWmUKY+oc81Bf+b48SrZSKtV8Fw9yvaI7/38tg9kqkWTG7baR9FF
         FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716407905; x=1717012705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a/NwiGktK/sZ0svqTjFzw+gyec7nSQtEsdFc1yHyiw=;
        b=NkuQHcJt0F5/Yht72s52suGol+PnedTom4siZ8UQymh8hmeK7WRCMjXAMATEFYXYuB
         MArnFsTSZ9YT+BP3JGkuiiNvRYtvBsN5g0gGHrCeJa4Q4yEVCb3XyguogHiEA+zjCwRv
         0xNbsi2iXUUyYnX9WwcY5XZvBqWWsHPGTEXcSJPHmaTiMSQSqqYrMu74G3OyCe5PQ1iC
         /q+5OGALGPjpYQRMRZo14NDvyofP8lARZY+dnzdDIj84JFBWQHEc2kETxC8WsVCcDQWy
         Dc0zHW9o3doJtx1ISytC5LzfKWgXrsRGt5+V0EiY9+P8Q49xpBq6alu8XVJonPwoyAeb
         Z/rw==
X-Forwarded-Encrypted: i=1; AJvYcCWjLBV/7zLzGbGSbZn32q3nAwU9Y7ZdXizDE3T/JadBQNlKZmbfdqZVUBwx2RqRpvJVgNBrjrJjY3Njdy2Ad1OIbp5sZUnKdcpUW7Q=
X-Gm-Message-State: AOJu0YydW5XJXhBFVoy7yADHUOWBaODwPTQ5sQxhlMYDvzWPkAatADba
	k6B3nB02gtU4cW4bUlp1QlLZE2VDgJlM8WvxJJDzhsRsanRdxJC2
X-Google-Smtp-Source: AGHT+IH5ne8gBG8/7G6lfZ/7VWDHxnnQz/ahAjrGApBn1S9e3SN+qfLR1WtJTev10061ZBEs5eMGyg==
X-Received: by 2002:a17:902:7846:b0:1f2:f115:4d87 with SMTP id d9443c01a7336-1f31c9e7b85mr26841065ad.48.1716407905371;
        Wed, 22 May 2024 12:58:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f31ca5947csm17858325ad.218.2024.05.22.12.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 12:58:24 -0700 (PDT)
Date: Wed, 22 May 2024 12:58:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>
Subject: Re: [PATCH v1 2/2] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zk5OXnPT64AkEftJ@google.com>
References: <cover.1715224143.git.zhoubinbin@loongson.cn>
 <c200b74b5db63ae544be2bc037e6afa12137aa98.1715224143.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c200b74b5db63ae544be2bc037e6afa12137aa98.1715224143.git.zhoubinbin@loongson.cn>

Hi Binbin,

On Wed, May 15, 2024 at 04:58:57PM +0800, Binbin Zhou wrote:
> This patch introduces a driver for the PixArt PS/2 touchpad, which
> supports both clickpad and touchpad types.
> 
> Co-developed-by: Jon Xie <jon_xie@pixart.com>
> Signed-off-by: Jon Xie <jon_xie@pixart.com>
> Co-developed-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/input/mouse/Kconfig        |  12 ++
>  drivers/input/mouse/Makefile       |   1 +
>  drivers/input/mouse/pixart_ps2.c   | 294 +++++++++++++++++++++++++++++
>  drivers/input/mouse/pixart_ps2.h   |  31 +++
>  drivers/input/mouse/psmouse-base.c |  17 ++
>  drivers/input/mouse/psmouse.h      |   1 +
>  6 files changed, 356 insertions(+)
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
> index 000000000000..532d84ab7654
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Pixart Touchpad Controller 1336U PS2 driver
> + *
> + * Author: Jon Xie <jon_xie@pixart.com>
> + *         Jay Lee <jay_lee@pixart.com>
> + * Further cleanup and restructuring by:
> + *         Binbin Zhou <zhoubinbin@loongson.cn>
> + *
> + * Copyright (C) 2021-2024 Pixart Imaging
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
> +#include "pixart_ps2.h"
> +
> +static int pixart_mode_detect(struct psmouse *psmouse)
> +{
> +	u8 param[1];
> +
> +	if (ps2_command(&psmouse->ps2dev, param, PIXART_CMD_REPORT_FORMAT))
> +		return -EIO;
> +
> +	return (param[0] == 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
> +}
> +
> +static int pixart_type_detect(struct psmouse *psmouse)
> +{
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +	u8 param[3];

You are not initializing this.

> +
> +	param[0] = 0x0a;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +	param[0] = 0x0;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	param[0] = 0x0;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	param[0] = 0x0;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	param[0] = 0x03;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +

So here you might be comparing with random garbage.

I think it would be better if "param" was initialized and at least the
return value of the last ps2_command() checked to make sure the device
ACKed it and returned proper amount of data.

> +	return (param[0] == 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
> +}
> +
> +static int pixart_intellimouse_detect(struct psmouse *psmouse)
> +{
> +	struct ps2dev *ps2dev = &psmouse->ps2dev;
> +	u8 param[2];
> +
> +	param[0] = 200;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +	param[0] = 100;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +	param[0] = 80;
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +	ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
> +
> +	return (param[0] == 3) ? 0 : -1;
> +}
> +
> +static void pixart_reset(struct psmouse *psmouse)
> +{
> +	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> +	msleep(100);
> +	psmouse_reset(psmouse);
> +}
> +
> +static psmouse_ret_t pixart_process_abs_packet(struct psmouse *psmouse)
> +{
> +	struct pixart_data *priv = psmouse->private;
> +	struct input_dev *dev = psmouse->dev;
> +	u8 *packet = psmouse->packet;
> +	u8 contact_cnt = (packet[0] >> 4) & 0x07;
> +	unsigned int abs_x, abs_y;
> +	int i, id, fingers = 0;
> +	bool tip;
> +
> +	if (contact_cnt > MAX_FINGERS || ((packet[0] & 0x8c) != 0x80))
> +		return PSMOUSE_BAD_DATA;
> +
> +	if (contact_cnt == MAX_FINGERS && psmouse->pktcnt < psmouse->pktsize)
> +		return PSMOUSE_GOOD_DATA;
> +	else if (contact_cnt == 0 && psmouse->pktcnt < 5)
> +		return PSMOUSE_GOOD_DATA;
> +	else if (psmouse->pktcnt < (3 * contact_cnt + 2))
> +		return PSMOUSE_GOOD_DATA;
> +
> +	for (i = 0; i < contact_cnt; i++) {
> +		id = packet[3 * i + 3] & 0x07;
> +		abs_y = ((packet[3 * i + 3] & 0x30) << 4) | packet[3 * i + 1];
> +		abs_x = ((packet[3 * i + 3] & 0xc0) << 2) | packet[3 * i + 2];
> +
> +		if (i == MAX_FINGERS - 1)
> +			tip = packet[14] & (0x01 << 1);

Please use BIT().

> +		else
> +			tip = packet[3 * contact_cnt + 1] & (0x01 << (2 * i + 1));
> +
> +		input_mt_slot(dev, id);
> +		input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip);
> +		if (tip) {

		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip)) { 

> +			fingers++;
> +			input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
> +			input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
> +		}
> +	}
> +
> +	input_mt_drop_unused(dev);

Could you explain the protocol please? Does the device produce "lift
off" packets for contacts? Why do you need to call
input_mt_drop_unused() explicitly?

> +	input_mt_report_pointer_emulation(dev, false);
> +	input_mt_report_finger_count(dev, fingers);
> +
> +	if (priv->type == PIXART_TYPE_CLICKPAD) {
> +		input_report_key(dev, BTN_LEFT, packet[0] & 0x03);
> +	} else {
> +		input_report_key(dev, BTN_LEFT, packet[0] & 0x01);
> +		input_report_key(dev, BTN_RIGHT, packet[0] & 0x02);
> +	}
> +
> +	input_mt_report_pointer_emulation(dev, true);

Why the 2 calls to input_mt_report_pointer_emulation()?

> +	input_sync(dev);
> +
> +	return PSMOUSE_FULL_PACKET;
> +}
> +
> +static psmouse_ret_t pixart_process_rel_packet(struct psmouse *psmouse)
> +{
> +	struct input_dev *dev = psmouse->dev;
> +	u8 *packet = psmouse->packet;
> +	int x = packet[1] ? packet[1] - ((packet[0] << 4) & 0x100) : 0;
> +	int y = packet[2] ? ((packet[0] << 3) & 0x100) - packet[2] : 0;
> +	int w = -(s8)packet[3];
> +
> +	if (psmouse->pktcnt < psmouse->pktsize)
> +		return PSMOUSE_GOOD_DATA;
> +
> +	psmouse_report_standard_buttons(dev, packet[0]);
> +	input_report_rel(dev, REL_X, x);
> +	input_report_rel(dev, REL_Y, y);
> +	input_report_rel(dev, REL_WHEEL, w);
> +	input_sync(dev);
> +
> +	return PSMOUSE_FULL_PACKET;
> +}
> +
> +static void pixart_disconnect(struct psmouse *psmouse)
> +{
> +	psmouse_info(psmouse, "Device disconnect");

Please remove, no need to be noisy.

> +	pixart_reset(psmouse);
> +	kfree(psmouse->private);
> +	psmouse->private = NULL;
> +}
> +
> +static int pixart_reconnect(struct psmouse *psmouse)
> +{
> +	struct pixart_data *priv = psmouse->private;
> +
> +	psmouse_info(psmouse, "Device reconnect");
> +	pixart_reset(psmouse);
> +
> +	priv->mode = pixart_mode_detect(psmouse);
> +	if (priv->mode < 0) {
> +		psmouse_err(psmouse, "Unable to detect the PixArt device");
> +		return -EIO;
> +	}
> +
> +	if (priv->mode == PIXART_MODE_ABS)
> +		ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
> +
> +	return 0;
> +}
> +
> +static void pixart_set_abs_input_params(struct input_dev *dev, struct pixart_data *priv)
> +{
> +	__clear_bit(EV_REL, dev->evbit);
> +	__clear_bit(REL_X, dev->relbit);
> +	__clear_bit(REL_Y, dev->relbit);
> +	__clear_bit(BTN_MIDDLE, dev->keybit);
> +
> +	__set_bit(EV_KEY, dev->evbit);
> +	__set_bit(BTN_LEFT, dev->keybit);
> +	__set_bit(BTN_RIGHT, dev->keybit);
> +	if (priv->type == PIXART_TYPE_CLICKPAD) {
> +		__set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
> +		__clear_bit(BTN_RIGHT, dev->keybit);
> +	}
> +	__set_bit(BTN_TOUCH, dev->keybit);
> +	__set_bit(BTN_TOOL_FINGER, dev->keybit);
> +	__set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
> +	__set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
> +	__set_bit(BTN_TOOL_QUADTAP, dev->keybit);
> +	__set_bit(INPUT_PROP_POINTER, dev->propbit);
> +
> +	__set_bit(EV_ABS, dev->evbit);
> +	input_set_abs_params(dev, ABS_X, 0, ABS_MAX_X, 0, 0);
> +	input_set_abs_params(dev, ABS_Y, 0, ABS_MAX_Y, 0, 0);
> +
> +	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, ABS_MAX_X, 0, 0);
> +	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, ABS_MAX_Y, 0, 0);
> +
> +	input_mt_init_slots(dev, SLOTS_NUMBER, 0);
> +}
> +
> +static void pixart_set_rel_input_params(struct input_dev *dev, struct pixart_data *priv)
> +{
> +	__set_bit(EV_KEY, dev->evbit);
> +	__set_bit(EV_REL, dev->evbit);
> +	__set_bit(BTN_LEFT, dev->keybit);
> +	__set_bit(BTN_RIGHT, dev->keybit);
> +	__set_bit(REL_X, dev->relbit);
> +	__set_bit(REL_Y, dev->relbit);
> +	__set_bit(REL_WHEEL, dev->relbit);
> +	__set_bit(INPUT_PROP_POINTER, dev->propbit);
> +}
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> +{
> +	int mode, type;
> +
> +	pixart_reset(psmouse);
> +
> +	type = pixart_type_detect(psmouse);

This returns PIXART_TYPE_TOUCHPAD or PIXART_TYPE_CLICKPAD, and never
negative value.

> +	if (type < 0)
> +		return -ENODEV;
> +
> +	mode = pixart_mode_detect(psmouse);

This relies on non-PixArt devices NAKing PIXART_CMD_REPORT_FORMAT
command. What other touchpad/mice have you tested this on to make sure
it does not mis-detect them?

> +	if (mode < 0)
> +		return -ENODEV;
> +
> +	psmouse_info(psmouse, "Detect PixArt Device.");

No need to be this noisy.

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
> +	priv->type = pixart_type_detect(psmouse);
> +	if (priv->type < 0)
> +		goto fail;
> +
> +	priv->mode = pixart_mode_detect(psmouse);
> +	if (priv->mode < 0) {
> +		psmouse_err(psmouse, "Unable to initialize the PixArt device\n");
> +		goto fail;
> +	}
> +
> +	if (priv->mode == PIXART_MODE_ABS) {
> +		ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
> +		pixart_set_abs_input_params(psmouse->dev, priv);
> +		psmouse->protocol_handler = pixart_process_abs_packet;
> +		psmouse->pktsize = 15;
> +	} else {
> +		pixart_reset(psmouse);
> +		pixart_intellimouse_detect(psmouse);
> +		pixart_set_rel_input_params(psmouse->dev, priv);
> +		psmouse->protocol_handler = pixart_process_rel_packet;
> +		psmouse->pktsize = 4;

Do we really need to handle this case? If the touchpad does not support
absolute packets can we fail the detection and simply rely on the normal
intellimouse detection and packet handling?

> +	}
> +
> +	psmouse->disconnect = pixart_disconnect;
> +	psmouse->reconnect = pixart_reconnect;
> +	psmouse->cleanup = pixart_reset;
> +	/* resync is not supported yet */
> +	psmouse->resync_time = 0;
> +
> +	psmouse_info(psmouse, "Set device as Type: %x, mode: %x", priv->type, priv->mode);
> +	return 0;
> +
> +fail:
> +	pixart_reset(psmouse);
> +	kfree(priv);
> +	psmouse->private = NULL;
> +	return -1;
> +}
> diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
> new file mode 100644
> index 000000000000..224ab3a4f739
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _PIXART_PS2_H
> +#define _PIXART_PS2_H
> +
> +#include "psmouse.h"
> +
> +#define ABS_MAX_X	1023
> +#define ABS_MAX_Y	579
> +#define MAX_FINGERS	4
> +#define SLOTS_NUMBER	MAX_FINGERS
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
> index b05c6fbae7e3..23f7fa7243cb 100644
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
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry


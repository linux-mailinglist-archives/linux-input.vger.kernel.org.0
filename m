Return-Path: <linux-input+bounces-8625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93B9F4A1A
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 12:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CB2188C5C3
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 11:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF121E3DF7;
	Tue, 17 Dec 2024 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd81ArR9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA61DDA35
	for <linux-input@vger.kernel.org>; Tue, 17 Dec 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435719; cv=none; b=Qli9S+sWE9ak6+maYPU375XmpMuMeaZckEUfLueN12klyY3CJqWpeL5dwA63awrQe8YZH9Tl3cd0JK2Ui6HTkf4FrUzXb6GY8/CvwRbdftPhVFO5DOj/xyXdSLJikliIJvy/FHN8yI33BdAUi1IVMRADHPd35XunevmElgGmALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435719; c=relaxed/simple;
	bh=l3eBIPfC4SeY+w+4vcZBBGEs9SE0tu7yDYyUECdoQiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1ZXXEAdMsLMbhYYuXpss22Wqd59/6adf+bipE1b592xnEFjMtOi0L8/PDug6bsN/w3uHgtGm060RXErZvTtF1cDFdEOp7nPojxvHHE09wlN4k+b1PWuMg0nTtwrV9MMHzFE3FBhHuijfSyWl4TnhtWmgxgg59pPYjT6CY0xF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd81ArR9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso9226466a12.0
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2024 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734435715; x=1735040515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg+amwRdKJ2t9WRA2GVkV1lxTvhekxK+bFAafbOkkMs=;
        b=gd81ArR9EwfFpXeAwuReLDsl5dhs9WztAVGrRZI5L8UUfdxdLPGjDTyAxflPsPvnNH
         s7AqCyQnPH4suhMgdfUUx3bzTNcXZGuz4+FJ0zEvq80zoLKkW1R1auSN8jZVPjVnnY3f
         UHfReo1YTTQ13fY7ZEnC5QJrTIK+untULRHtSm/OPLmlQct6dOxoCwK+83YaiAN1QKqn
         uXz5S5KwX+yQCEUmXcdIf42ttXa+0Iyx7UuqNGMNMACDgz9vbD1utdFi2+J6n05JUtVU
         nn2+Ck3EO8zIxlzZPch8sORPKFv3W5RzxJlaPkwJQmF4OtDPwE45ekosZkCDgqlpKHWc
         39ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734435715; x=1735040515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg+amwRdKJ2t9WRA2GVkV1lxTvhekxK+bFAafbOkkMs=;
        b=xQh9h+zshbkC0h+G9AdUifT2DTUlrJ5gREzepCLCkTM8erLcUsy1kK2GlS6HkaJog/
         ASXd1SrHPgwLxpJJwB9cEy6tMFWP8InN+HWqNsfXzAw9XGp05vMUof36CaWY3wZX4OLM
         bKCz7CjnO2AY74q6cK1ImX2nmveGfKQ/aPUB70RF4+KAAKDq8LXyf5XgRG45KwLP2wag
         rm1mITJy9RNJjyc3PhpK9cKvBTWu+ifyTdsQi5KccMZXlCEK0RzeqeH20e/qKP78MGcc
         TF5rZnQd8J7AkR3dV4kKGlZK0134g6sFn29xeQ+90iTn6Es/suWUxW9xlCbt40GIR2i/
         Mlqg==
X-Forwarded-Encrypted: i=1; AJvYcCVAnPKCEKEyd1KHpfQNTKl3cjm6ng55YFZJdMpgP0wZ9YMYXeaslaSZImWQdWBWkzV/Ci75UnCNp+jSsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZetTTqz6byFjm5plVffLJYtj+m9yv+9IEBTVfZP8gGfqH4S9
	VQR/JdA6eumh6v52b1kJEc0RkvjceW+CSAMzp27U3agTzRqYMPk7U1oKzOzgKUZfWB+9nLwlvqi
	TznQVJa5pCR5+cA9hSfXgnCodd0o=
X-Gm-Gg: ASbGncu1Z37EWc+0dkhewwVASYi7w6wuJgwcaVd3PG3HvmJM0rCeofGlGZIALpel3ym
	koV3La71ljZB3K0nmtY03WlaIPbwV2mwVGK8xA86P
X-Google-Smtp-Source: AGHT+IGCkz/d4MzyGWXTdRegbp/lb1bj395ly+nNx5VzG0aDILa5uzrYLxv1C/BBSMNKNk2butHEfn29feLqHKup9r0=
X-Received: by 2002:a05:6402:274e:b0:5d0:d208:4cad with SMTP id
 4fb4d7f45d1cf-5d7d556c491mr2939638a12.2.1734435714926; Tue, 17 Dec 2024
 03:41:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023083805.2164641-1-zhoubinbin@loongson.cn>
In-Reply-To: <20241023083805.2164641-1-zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 17 Dec 2024 19:41:42 +0800
Message-ID: <CAMpQs4LRju8SndNp_OmZtTa4OH1MHqW9wRmQe_SkOgDxPox0nw@mail.gmail.com>
Subject: Re: [PATCH v5] Input: Add driver for PixArt PS/2 touchpad
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>, 
	Jay Lee <jay_lee@pixart.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>, Benjamin Tissoires <bentiss@kernel.org>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry:

On Wed, Oct 23, 2024 at 4:38=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> This patch introduces a driver for the PixArt PS/2 touchpad, which
> supports both clickpad and touchpad types.
>
> At the same time, we extended the single data packet length to 16,
> because according to the current PixArt hardware and FW design, we need
> 11 bytes/15 bytes to represent the complete three-finger/four-finger data=
.
>
> Co-developed-by: Jon Xie <jon_xie@pixart.com>
> Signed-off-by: Jon Xie <jon_xie@pixart.com>
> Co-developed-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Jay Lee <jay_lee@pixart.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Tested-by: Kexy Biscuit <kexybiscuit@aosc.io>
> ---
> V5:
>  - Rebased on input/for-linus;
>  - Fix wide PixArt TP type judgment in pixart_read_tp_type().
>    Each type has a unique FW return value to avoid non-pixart touchpads
>    being misjudged.
>  - Thanks to Kexy for testing on non-pixart devices.
>    The List of tested touchpad devices:
>      - TPPS/2(broken on V4)
>      - SynPS/2 Synaptics TouchPad

Gentle ping.

I tried to rebase the patch to your for-linus branch (commit:
0201710ba6308a61f1a775c418fe74b8a31ace08).
And tested on Pixart TouchPad and SynPS/2 Synaptics TouchPad
(non-Pixart) devices with no errors similar to a miscue.

Is it appropriate to be merged now or do you have any other comments
regarding this patch?

>
> Link to V4:
> https://lore.kernel.org/all/20240704125243.3633569-1-zhoubinbin@loongson.=
cn/
>
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
> https://lore.kernel.org/all/20240701094953.3195501-1-zhoubinbin@loongson.=
cn/
>
> V3:
>  - Rebased on input/next;
>  - Added comment to msleep() in pixart_reset() as suggested by Aseda, no
> functional change, thanks.
>
> Link to V2:
> https://lore.kernel.org/all/20240624065359.2985060-1-zhoubinbin@loongson.=
cn/
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
>  drivers/input/mouse/pixart_ps2.c   | 310 +++++++++++++++++++++++++++++
>  drivers/input/mouse/pixart_ps2.h   |  36 ++++
>  drivers/input/mouse/psmouse-base.c |  17 ++
>  drivers/input/mouse/psmouse.h      |   3 +-
>  6 files changed, 378 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/input/mouse/pixart_ps2.c
>  create mode 100644 drivers/input/mouse/pixart_ps2.h
>
> diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
> index 833b643f0616..8a27a20d04b0 100644
> --- a/drivers/input/mouse/Kconfig
> +++ b/drivers/input/mouse/Kconfig
> @@ -69,6 +69,18 @@ config MOUSE_PS2_LOGIPS2PP
>
>           If unsure, say Y.
>
> +config MOUSE_PS2_PIXART
> +       bool "PixArt PS/2 touchpad protocol extension" if EXPERT
> +       default y
> +       depends on MOUSE_PS2
> +       help
> +         This driver supports the PixArt PS/2 touchpad found in some
> +         laptops.
> +         Say Y here if you have a PixArt PS/2 TouchPad connected to
> +         your system.
> +
> +         If unsure, say Y.
> +
>  config MOUSE_PS2_SYNAPTICS
>         bool "Synaptics PS/2 mouse protocol extension" if EXPERT
>         default y
> diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
> index a1336d5bee6f..563029551529 100644
> --- a/drivers/input/mouse/Makefile
> +++ b/drivers/input/mouse/Makefile
> @@ -32,6 +32,7 @@ psmouse-$(CONFIG_MOUSE_PS2_ELANTECH)  +=3D elantech.o
>  psmouse-$(CONFIG_MOUSE_PS2_OLPC)       +=3D hgpk.o
>  psmouse-$(CONFIG_MOUSE_PS2_LOGIPS2PP)  +=3D logips2pp.o
>  psmouse-$(CONFIG_MOUSE_PS2_LIFEBOOK)   +=3D lifebook.o
> +psmouse-$(CONFIG_MOUSE_PS2_PIXART)     +=3D pixart_ps2.o
>  psmouse-$(CONFIG_MOUSE_PS2_SENTELIC)   +=3D sentelic.o
>  psmouse-$(CONFIG_MOUSE_PS2_TRACKPOINT) +=3D trackpoint.o
>  psmouse-$(CONFIG_MOUSE_PS2_TOUCHKIT)   +=3D touchkit_ps2.o
> diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pixar=
t_ps2.c
> new file mode 100644
> index 000000000000..d5cd00936171
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.c
> @@ -0,0 +1,310 @@
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
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/libps2.h>
> +#include <linux/serio.h>
> +#include <linux/slab.h>
> +
> +#include "pixart_ps2.h"
> +
> +static int pixart_read_tp_mode(struct ps2dev *ps2dev, u8 *mode)
> +{
> +       int error;
> +       u8 param[1] =3D { 0 };
> +
> +       error =3D ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT);
> +       if (error)
> +               return error;
> +
> +       *mode =3D param[0] =3D=3D 1 ? PIXART_MODE_ABS : PIXART_MODE_REL;
> +
> +       return 0;
> +}
> +
> +static int pixart_read_tp_type(struct ps2dev *ps2dev, u8 *type)
> +{
> +       int error;
> +       u8 param[3] =3D { 0 };
> +
> +       param[0] =3D 0xa;
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> +       if (error)
> +               return error;
> +
> +       param[0] =3D 0x0;
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +       if (error)
> +               return error;
> +
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +       if (error)
> +               return error;
> +
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +       if (error)
> +               return error;
> +
> +       param[0] =3D 0x3;
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> +       if (error)
> +               return error;
> +
> +       error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +       if (error)
> +               return error;
> +
> +       switch (param[0]) {
> +       case 0xc:
> +               *type =3D PIXART_TYPE_CLICKPAD;
> +               break;
> +       case 0xe:
> +               *type =3D PIXART_TYPE_TOUCHPAD;
> +               break;
> +       default:
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static void pixart_reset(struct psmouse *psmouse)
> +{
> +       ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> +
> +       /* according to PixArt, 100ms is required for the upcoming reset =
*/
> +       msleep(100);
> +       psmouse_reset(psmouse);
> +}
> +
> +static void pixart_process_packet(struct psmouse *psmouse)
> +{
> +       struct pixart_data *priv =3D psmouse->private;
> +       struct input_dev *dev =3D psmouse->dev;
> +       const u8 *pkt =3D psmouse->packet;
> +       unsigned int contact_cnt =3D FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
> +       unsigned int i, id, abs_x, abs_y;
> +       bool tip;
> +
> +       for (i =3D 0; i < contact_cnt; i++) {
> +               const u8 *p =3D &pkt[i * 3];
> +
> +               id =3D FIELD_GET(SLOT_ID_MASK, p[3]);
> +               abs_y =3D FIELD_GET(ABS_Y_MASK, p[3]) << 8 | p[1];
> +               abs_x =3D FIELD_GET(ABS_X_MASK, p[3]) << 8 | p[2];
> +
> +               if (i =3D=3D PIXART_MAX_FINGERS - 1)
> +                       tip =3D pkt[14] & BIT(1);
> +               else
> +                       tip =3D pkt[3 * contact_cnt + 1] & BIT(2 * i + 1)=
;
> +
> +               input_mt_slot(dev, id);
> +               if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip))=
 {
> +                       input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
> +                       input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
> +               }
> +       }
> +
> +       input_mt_sync_frame(dev);
> +
> +       if (priv->type =3D=3D PIXART_TYPE_CLICKPAD) {
> +               input_report_key(dev, BTN_LEFT, pkt[0] & 0x03);
> +       } else {
> +               input_report_key(dev, BTN_LEFT, pkt[0] & BIT(0));
> +               input_report_key(dev, BTN_RIGHT, pkt[0] & BIT(1));
> +       }
> +
> +       input_sync(dev);
> +}
> +
> +static psmouse_ret_t pixart_protocol_handler(struct psmouse *psmouse)
> +{
> +       u8 *pkt =3D psmouse->packet;
> +       u8 contact_cnt;
> +
> +       if ((pkt[0] & 0x8c) !=3D 0x80)
> +               return PSMOUSE_BAD_DATA;
> +
> +       contact_cnt =3D FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
> +       if (contact_cnt > PIXART_MAX_FINGERS)
> +               return PSMOUSE_BAD_DATA;
> +
> +       if (contact_cnt =3D=3D PIXART_MAX_FINGERS &&
> +           psmouse->pktcnt < psmouse->pktsize) {
> +               return PSMOUSE_GOOD_DATA;
> +       }
> +
> +       if (contact_cnt =3D=3D 0 && psmouse->pktcnt < 5)
> +               return PSMOUSE_GOOD_DATA;
> +
> +       if (psmouse->pktcnt < 3 * contact_cnt + 2)
> +               return PSMOUSE_GOOD_DATA;
> +
> +       pixart_process_packet(psmouse);
> +
> +       return PSMOUSE_FULL_PACKET;
> +}
> +
> +static void pixart_disconnect(struct psmouse *psmouse)
> +{
> +       pixart_reset(psmouse);
> +       kfree(psmouse->private);
> +       psmouse->private =3D NULL;
> +}
> +
> +static int pixart_reconnect(struct psmouse *psmouse)
> +{
> +       struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> +       u8 mode;
> +       int error;
> +
> +       pixart_reset(psmouse);
> +
> +       error =3D pixart_read_tp_mode(ps2dev, &mode);
> +       if (error)
> +               return error;
> +
> +       if (mode !=3D PIXART_MODE_ABS)
> +               return -EIO;
> +
> +       error =3D ps2_command(ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
> +       if (error)
> +               return error;
> +
> +       return 0;
> +}
> +
> +static int pixart_set_input_params(struct input_dev *dev,
> +                                  struct pixart_data *priv)
> +{
> +       /* No relative support */
> +       __clear_bit(EV_REL, dev->evbit);
> +       __clear_bit(REL_X, dev->relbit);
> +       __clear_bit(REL_Y, dev->relbit);
> +       __clear_bit(BTN_MIDDLE, dev->keybit);
> +
> +       /* Buttons */
> +       __set_bit(EV_KEY, dev->evbit);
> +       __set_bit(BTN_LEFT, dev->keybit);
> +       if (priv->type =3D=3D PIXART_TYPE_CLICKPAD)
> +               __set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
> +       else
> +               __set_bit(BTN_RIGHT, dev->keybit);
> +
> +       /* Absolute position */
> +       input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
> +       input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +       input_set_abs_params(dev, ABS_MT_POSITION_X,
> +                            0, PIXART_PAD_WIDTH, 0, 0);
> +       input_set_abs_params(dev, ABS_MT_POSITION_Y,
> +                            0, PIXART_PAD_HEIGHT, 0, 0);
> +
> +       return input_mt_init_slots(dev, PIXART_MAX_FINGERS,
> +                                  INPUT_MT_POINTER | INPUT_MT_DROP_UNUSE=
D);
> +}
> +
> +static int pixart_query_hardware(struct ps2dev *ps2dev, u8 *mode, u8 *ty=
pe)
> +{
> +       int error;
> +
> +       error =3D pixart_read_tp_type(ps2dev, type);
> +       if (error)
> +               return error;
> +
> +       error =3D pixart_read_tp_mode(ps2dev, mode);
> +       if (error)
> +               return error;
> +
> +       return 0;
> +}
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> +{
> +       u8 type;
> +       int error;
> +
> +       pixart_reset(psmouse);
> +
> +       error =3D pixart_read_tp_type(&psmouse->ps2dev, &type);
> +       if (error)
> +               return error;
> +
> +       if (set_properties) {
> +               psmouse->vendor =3D "PixArt";
> +               psmouse->name =3D (type =3D=3D PIXART_TYPE_TOUCHPAD) ?
> +                               "touchpad" : "clickpad";
> +       }
> +
> +       return 0;
> +}
> +
> +int pixart_init(struct psmouse *psmouse)
> +{
> +       int error;
> +       struct pixart_data *priv;
> +
> +       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       psmouse->private =3D priv;
> +       pixart_reset(psmouse);
> +
> +       error =3D pixart_query_hardware(&psmouse->ps2dev,
> +                                     &priv->mode, &priv->type);
> +       if (error) {
> +               psmouse_err(psmouse, "init: Unable to query PixArt touchp=
ad hardware.\n");
> +               goto err_exit;
> +       }
> +
> +       /* Relative mode follows standard PS/2 mouse protocol */
> +       if (priv->mode !=3D PIXART_MODE_ABS) {
> +               error =3D -EIO;
> +               goto err_exit;
> +       }
> +
> +       /* Set absolute mode */
> +       error =3D ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_P=
ROTO);
> +       if (error) {
> +               psmouse_err(psmouse, "init: Unable to initialize PixArt a=
bsolute mode.\n");
> +               goto err_exit;
> +       }
> +
> +       error =3D pixart_set_input_params(psmouse->dev, priv);
> +       if (error) {
> +               psmouse_err(psmouse, "init: Unable to set input params.\n=
");
> +               goto err_exit;
> +       }
> +
> +       psmouse->pktsize =3D 15;
> +       psmouse->protocol_handler =3D pixart_protocol_handler;
> +       psmouse->disconnect =3D pixart_disconnect;
> +       psmouse->reconnect =3D pixart_reconnect;
> +       psmouse->cleanup =3D pixart_reset;
> +       /* resync is not supported yet */
> +       psmouse->resync_time =3D 0;
> +
> +       return 0;
> +
> +err_exit:
> +       pixart_reset(psmouse);
> +       kfree(priv);
> +       psmouse->private =3D NULL;
> +       return error;
> +}
> diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixar=
t_ps2.h
> new file mode 100644
> index 000000000000..47a1d040f2d1
> --- /dev/null
> +++ b/drivers/input/mouse/pixart_ps2.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _PIXART_PS2_H
> +#define _PIXART_PS2_H
> +
> +#include "psmouse.h"
> +
> +#define PIXART_PAD_WIDTH               1023
> +#define PIXART_PAD_HEIGHT              579
> +#define PIXART_MAX_FINGERS             4
> +
> +#define PIXART_CMD_REPORT_FORMAT       0x01d8
> +#define PIXART_CMD_SWITCH_PROTO                0x00de
> +
> +#define PIXART_MODE_REL                        0
> +#define PIXART_MODE_ABS                        1
> +
> +#define PIXART_TYPE_CLICKPAD           0
> +#define PIXART_TYPE_TOUCHPAD           1
> +
> +#define CONTACT_CNT_MASK               GENMASK(6, 4)
> +
> +#define SLOT_ID_MASK                   GENMASK(2, 0)
> +#define ABS_Y_MASK                     GENMASK(5, 4)
> +#define ABS_X_MASK                     GENMASK(7, 6)
> +
> +struct pixart_data {
> +       u8 mode;
> +       u8 type;
> +       int x_max;
> +       int y_max;
> +};
> +
> +int pixart_detect(struct psmouse *psmouse, bool set_properties);
> +int pixart_init(struct psmouse *psmouse);
> +
> +#endif  /* _PIXART_PS2_H */
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psm=
ouse-base.c
> index a2c9f7144864..5a4defe9cf32 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -36,6 +36,7 @@
>  #include "focaltech.h"
>  #include "vmmouse.h"
>  #include "byd.h"
> +#include "pixart_ps2.h"
>
>  #define DRIVER_DESC    "PS/2 mouse driver"
>
> @@ -905,6 +906,15 @@ static const struct psmouse_protocol psmouse_protoco=
ls[] =3D {
>                 .detect         =3D byd_detect,
>                 .init           =3D byd_init,
>         },
> +#endif
> +#ifdef CONFIG_MOUSE_PS2_PIXART
> +       {
> +               .type           =3D PSMOUSE_PIXART,
> +               .name           =3D "PixArtPS/2",
> +               .alias          =3D "pixart",
> +               .detect         =3D pixart_detect,
> +               .init           =3D pixart_init,
> +       },
>  #endif
>         {
>                 .type           =3D PSMOUSE_AUTO,
> @@ -1172,6 +1182,13 @@ static int psmouse_extensions(struct psmouse *psmo=
use,
>                         return ret;
>         }
>
> +       /* Try PixArt touchpad */
> +       if (max_proto > PSMOUSE_IMEX &&
> +           psmouse_try_protocol(psmouse, PSMOUSE_PIXART, &max_proto,
> +                                set_properties, true)) {
> +               return PSMOUSE_PIXART;
> +       }
> +
>         if (max_proto > PSMOUSE_IMEX) {
>                 if (psmouse_try_protocol(psmouse, PSMOUSE_GENPS,
>                                          &max_proto, set_properties, true=
))
> diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.=
h
> index 4d8acfe0d82a..23f7fa7243cb 100644
> --- a/drivers/input/mouse/psmouse.h
> +++ b/drivers/input/mouse/psmouse.h
> @@ -69,6 +69,7 @@ enum psmouse_type {
>         PSMOUSE_BYD,
>         PSMOUSE_SYNAPTICS_SMBUS,
>         PSMOUSE_ELANTECH_SMBUS,
> +       PSMOUSE_PIXART,
>         PSMOUSE_AUTO            /* This one should always be last */
>  };
>
> @@ -94,7 +95,7 @@ struct psmouse {
>         const char *vendor;
>         const char *name;
>         const struct psmouse_protocol *protocol;
> -       unsigned char packet[8];
> +       unsigned char packet[16];
>         unsigned char badbyte;
>         unsigned char pktcnt;
>         unsigned char pktsize;
>
> base-commit: 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f
> --
> 2.43.5
>
--
Thanks.
Binbin


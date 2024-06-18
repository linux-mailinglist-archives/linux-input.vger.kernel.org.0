Return-Path: <linux-input+bounces-4400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175990C1DA
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 04:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B79A1F21DE7
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 02:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D951865C;
	Tue, 18 Jun 2024 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwJtWW8k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479188480
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718677734; cv=none; b=Le1dAldU8r4Wt+nVQoxKJJPNMb30CfRWxSPHUvPWfRWIEO1jFxi+WR2YUhjd+g1gFYJHMDQqUMBWHI91q2f/2T5bcmC8Rm25TxM3oniASRKSC0YoEOHaHEAHVnyRtD52p7IOeWiClpc+sAq39LAXD9ctb6CV82QyWV345ZgV73E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718677734; c=relaxed/simple;
	bh=izEnRjnbG82QoczTsMPLk2OS09lp6QTdPIMq+HE+/NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdaL1E/diAizIN3H1rqsDBinhFi6Rn9LTDZdLlity69YMffGkFXLTdkOOudC4ek4zgxJUzW/ErH4pof3fW2UdyDddVVQhP8UCBcRgPE8NR4p7P/Pz7FLbH5bDWT5R5MXR0XVr61cm3PWvEBjdsR5l3ujZmlV2oaqVxSI3sb96Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwJtWW8k; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62f3ccc877eso40164017b3.1
        for <linux-input@vger.kernel.org>; Mon, 17 Jun 2024 19:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718677731; x=1719282531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYPgxnZgthCrk3j2sLPp92UmepNmESsP+hIY6/y8ur4=;
        b=cwJtWW8klp3YCg5gI5UH210MDFuCx01isaMYvhHQU7Zktx34+K/+Lt8RFgsT1Rq8xL
         swQOyJZXzap8khMUB+8/yMOEipZkzGTjbayezSG/RPSp+0oQnHLd8tJv/vDerAxc/q5o
         x5Yl3PGyD+DXq74BSLnzVXTyYVlx4VG3m0GlM8lO1RBi6oxRVlbctqOC9QB57PgkbI+4
         ZyrqpsQ6r7DXWoKL8VBExbBWu3US0LNyvQ83zipU791IVvi0pMag60iA8vf+YWTYGvZl
         9mHng8lDEI2qK2/8zeHexX/GkjZm83qhqDomWI50rg6BCbPN4lUy2RFiPdTaqtwEAgfs
         c/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718677731; x=1719282531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYPgxnZgthCrk3j2sLPp92UmepNmESsP+hIY6/y8ur4=;
        b=P0KHEcZ6a80M/bW38BHyVoR6KczC35zzGTk2L3sRCN+jef3DLCHfVGguxHpEp7C9eA
         IWBslvli2iEC+p5bZO0WxAwrvlsdivizT3kWLGGp2gWD2XL6Rf7YI8wLRd47yrtJrI2Z
         G14w4ZvoQ4+QssZ8tR0ua4mAzGvyh/7qpnnQM1b1MChbs6zC0svZL33qNtDiveFb+xk/
         Ey8rvo0S+01C0tP2MVYWH+IhuoWttIgK7S0jzdmvt7b2IsMGZ/C16rrGahyrnogbk0dn
         bWptjwzN0LSwr5k9cQ1tXdqamivIBJN11l5lS+Uc72AMcS6ub4Bi/GGVMEflDVV3OpHv
         I4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUHF+K3dRstzFXGN3FfEeAehdCQ673mIhLv2V/CRMnwxWf4lE/p0YTavMD07/vSuNmFbmaNw6I6cnYzduDXHeKEZQxvr2qQDVXbR+4=
X-Gm-Message-State: AOJu0YyQYugGJR/ZPNtfdh5sJIfCyFkSwi64qhe30bAzqYlouc6IQU6W
	QeIy1LCrJrSPJ8NtJ/mcFAZE3cCoF4Avcq4kO9+SwNLpuNrrBOARay8GfHQtT8gDTPt8O4QUBMY
	cnsBpjQH9WFMnnq7O0JMdjYtRhT/dyA0LB6s/Fw==
X-Google-Smtp-Source: AGHT+IGSO4+j+oqK9QHKFh/Ch+sDdQ0tUGZBMxnauknWoHalhj6jRPZ8Rij5lEeKGTtAZIz+r+tbkK2XAS0LWsoPBjE=
X-Received: by 2002:a81:8b51:0:b0:61a:ffe0:a1d7 with SMTP id
 00721157ae682-6394934479fmr9401357b3.13.1718677731026; Mon, 17 Jun 2024
 19:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715224143.git.zhoubinbin@loongson.cn> <c200b74b5db63ae544be2bc037e6afa12137aa98.1715224143.git.zhoubinbin@loongson.cn>
 <Zk5OXnPT64AkEftJ@google.com>
In-Reply-To: <Zk5OXnPT64AkEftJ@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 18 Jun 2024 08:28:39 +0600
Message-ID: <CAMpQs4JRGMsvHKQL6f-7oL70-bh-_ed3Xu7Ng5Pg4AgER=L6KA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Input: Add driver for PixArt PS/2 touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry:

Sorry for the late reply and thanks for your detailed review.

On Thu, May 23, 2024 at 1:58=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Binbin,
>
> On Wed, May 15, 2024 at 04:58:57PM +0800, Binbin Zhou wrote:
> > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > supports both clickpad and touchpad types.
> >
> > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/input/mouse/Kconfig        |  12 ++
> >  drivers/input/mouse/Makefile       |   1 +
> >  drivers/input/mouse/pixart_ps2.c   | 294 +++++++++++++++++++++++++++++
> >  drivers/input/mouse/pixart_ps2.h   |  31 +++
> >  drivers/input/mouse/psmouse-base.c |  17 ++
> >  drivers/input/mouse/psmouse.h      |   1 +
> >  6 files changed, 356 insertions(+)
> >  create mode 100644 drivers/input/mouse/pixart_ps2.c
> >  create mode 100644 drivers/input/mouse/pixart_ps2.h
> >
> > diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
> > index 833b643f0616..8a27a20d04b0 100644
> > --- a/drivers/input/mouse/Kconfig
> > +++ b/drivers/input/mouse/Kconfig
> > @@ -69,6 +69,18 @@ config MOUSE_PS2_LOGIPS2PP
> >
> >         If unsure, say Y.
> >
> > +config MOUSE_PS2_PIXART
> > +     bool "PixArt PS/2 touchpad protocol extension" if EXPERT
> > +     default y
> > +     depends on MOUSE_PS2
> > +     help
> > +       This driver supports the PixArt PS/2 touchpad found in some
> > +       laptops.
> > +       Say Y here if you have a PixArt PS/2 TouchPad connected to
> > +       your system.
> > +
> > +       If unsure, say Y.
> > +
> >  config MOUSE_PS2_SYNAPTICS
> >       bool "Synaptics PS/2 mouse protocol extension" if EXPERT
> >       default y
> > diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefil=
e
> > index a1336d5bee6f..563029551529 100644
> > --- a/drivers/input/mouse/Makefile
> > +++ b/drivers/input/mouse/Makefile
> > @@ -32,6 +32,7 @@ psmouse-$(CONFIG_MOUSE_PS2_ELANTECH)        +=3D elan=
tech.o
> >  psmouse-$(CONFIG_MOUSE_PS2_OLPC)     +=3D hgpk.o
> >  psmouse-$(CONFIG_MOUSE_PS2_LOGIPS2PP)        +=3D logips2pp.o
> >  psmouse-$(CONFIG_MOUSE_PS2_LIFEBOOK) +=3D lifebook.o
> > +psmouse-$(CONFIG_MOUSE_PS2_PIXART)   +=3D pixart_ps2.o
> >  psmouse-$(CONFIG_MOUSE_PS2_SENTELIC) +=3D sentelic.o
> >  psmouse-$(CONFIG_MOUSE_PS2_TRACKPOINT)       +=3D trackpoint.o
> >  psmouse-$(CONFIG_MOUSE_PS2_TOUCHKIT) +=3D touchkit_ps2.o
> > diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pix=
art_ps2.c
> > new file mode 100644
> > index 000000000000..532d84ab7654
> > --- /dev/null
> > +++ b/drivers/input/mouse/pixart_ps2.c
> > @@ -0,0 +1,294 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Pixart Touchpad Controller 1336U PS2 driver
> > + *
> > + * Author: Jon Xie <jon_xie@pixart.com>
> > + *         Jay Lee <jay_lee@pixart.com>
> > + * Further cleanup and restructuring by:
> > + *         Binbin Zhou <zhoubinbin@loongson.cn>
> > + *
> > + * Copyright (C) 2021-2024 Pixart Imaging
> > + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> > + *
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/libps2.h>
> > +#include <linux/input/mt.h>
> > +#include <linux/serio.h>
> > +#include <linux/slab.h>
> > +#include "pixart_ps2.h"
> > +
> > +static int pixart_mode_detect(struct psmouse *psmouse)
> > +{
> > +     u8 param[1];
> > +
> > +     if (ps2_command(&psmouse->ps2dev, param, PIXART_CMD_REPORT_FORMAT=
))
> > +             return -EIO;
> > +
> > +     return (param[0] =3D=3D 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
> > +}
> > +
> > +static int pixart_type_detect(struct psmouse *psmouse)
> > +{
> > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > +     u8 param[3];
>
> You are not initializing this.
>
> > +
> > +     param[0] =3D 0x0a;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> > +     param[0] =3D 0x0;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> > +     param[0] =3D 0x0;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> > +     param[0] =3D 0x0;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> > +     param[0] =3D 0x03;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> > +
>
> So here you might be comparing with random garbage.
>
> I think it would be better if "param" was initialized and at least the
> return value of the last ps2_command() checked to make sure the device
> ACKed it and returned proper amount of data.

OK, I will do it and check for all uninitialized variables.
I see that other drivers basically check every ps2_command(). I need
to do something similar, which will be more rigorous.
>
> > +     return (param[0] =3D=3D 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYP=
E_CLICKPAD;
> > +}
> > +
> > +static int pixart_intellimouse_detect(struct psmouse *psmouse)
> > +{
> > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > +     u8 param[2];
> > +
> > +     param[0] =3D 200;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> > +     param[0] =3D 100;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> > +     param[0] =3D 80;
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
> > +     ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
> > +
> > +     return (param[0] =3D=3D 3) ? 0 : -1;
> > +}
> > +
> > +static void pixart_reset(struct psmouse *psmouse)
> > +{
> > +     ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> > +     msleep(100);
> > +     psmouse_reset(psmouse);
> > +}
> > +
> > +static psmouse_ret_t pixart_process_abs_packet(struct psmouse *psmouse=
)
> > +{
> > +     struct pixart_data *priv =3D psmouse->private;
> > +     struct input_dev *dev =3D psmouse->dev;
> > +     u8 *packet =3D psmouse->packet;
> > +     u8 contact_cnt =3D (packet[0] >> 4) & 0x07;
> > +     unsigned int abs_x, abs_y;
> > +     int i, id, fingers =3D 0;
> > +     bool tip;
> > +
> > +     if (contact_cnt > MAX_FINGERS || ((packet[0] & 0x8c) !=3D 0x80))
> > +             return PSMOUSE_BAD_DATA;
> > +
> > +     if (contact_cnt =3D=3D MAX_FINGERS && psmouse->pktcnt < psmouse->=
pktsize)
> > +             return PSMOUSE_GOOD_DATA;
> > +     else if (contact_cnt =3D=3D 0 && psmouse->pktcnt < 5)
> > +             return PSMOUSE_GOOD_DATA;
> > +     else if (psmouse->pktcnt < (3 * contact_cnt + 2))
> > +             return PSMOUSE_GOOD_DATA;
> > +
> > +     for (i =3D 0; i < contact_cnt; i++) {
> > +             id =3D packet[3 * i + 3] & 0x07;
> > +             abs_y =3D ((packet[3 * i + 3] & 0x30) << 4) | packet[3 * =
i + 1];
> > +             abs_x =3D ((packet[3 * i + 3] & 0xc0) << 2) | packet[3 * =
i + 2];
> > +
> > +             if (i =3D=3D MAX_FINGERS - 1)
> > +                     tip =3D packet[14] & (0x01 << 1);
>
> Please use BIT().

OK..
>
> > +             else
> > +                     tip =3D packet[3 * contact_cnt + 1] & (0x01 << (2=
 * i + 1));
> > +
> > +             input_mt_slot(dev, id);
> > +             input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip);
> > +             if (tip) {
>
>                 if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip))=
 {
>

OK..
> > +                     fingers++;
> > +                     input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
> > +                     input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
> > +             }
> > +     }
> > +
> > +     input_mt_drop_unused(dev);
>
> Could you explain the protocol please? Does the device produce "lift
> off" packets for contacts? Why do you need to call
> input_mt_drop_unused() explicitly?
>
> > +     input_mt_report_pointer_emulation(dev, false);
> > +     input_mt_report_finger_count(dev, fingers);
> > +
> > +     if (priv->type =3D=3D PIXART_TYPE_CLICKPAD) {
> > +             input_report_key(dev, BTN_LEFT, packet[0] & 0x03);
> > +     } else {z
> > +             input_report_key(dev, BTN_LEFT, packet[0] & 0x01);
> > +             input_report_key(dev, BTN_RIGHT, packet[0] & 0x02);
> > +     }
> > +
> > +     input_mt_report_pointer_emulation(dev, true);
>
> Why the 2 calls to input_mt_report_pointer_emulation()?
>
> > +     input_sync(dev);
> > +
> > +     return PSMOUSE_FULL_PACKET;
> > +}
> > +
> > +static psmouse_ret_t pixart_process_rel_packet(struct psmouse *psmouse=
)
> > +{
> > +     struct input_dev *dev =3D psmouse->dev;
> > +     u8 *packet =3D psmouse->packet;
> > +     int x =3D packet[1] ? packet[1] - ((packet[0] << 4) & 0x100) : 0;
> > +     int y =3D packet[2] ? ((packet[0] << 3) & 0x100) - packet[2] : 0;
> > +     int w =3D -(s8)packet[3];
> > +
> > +     if (psmouse->pktcnt < psmouse->pktsize)
> > +             return PSMOUSE_GOOD_DATA;
> > +
> > +     psmouse_report_standard_buttons(dev, packet[0]);
> > +     input_report_rel(dev, REL_X, x);
> > +     input_report_rel(dev, REL_Y, y);
> > +     input_report_rel(dev, REL_WHEEL, w);
> > +     input_sync(dev);
> > +
> > +     return PSMOUSE_FULL_PACKET;
> > +}
> > +
> > +static void pixart_disconnect(struct psmouse *psmouse)
> > +{
> > +     psmouse_info(psmouse, "Device disconnect");
>
> Please remove, no need to be noisy.

OK, I will drop it.
>
> > +     pixart_reset(psmouse);
> > +     kfree(psmouse->private);
> > +     psmouse->private =3D NULL;
> > +}
> > +
> > +static int pixart_reconnect(struct psmouse *psmouse)
> > +{
> > +     struct pixart_data *priv =3D psmouse->private;
> > +
> > +     psmouse_info(psmouse, "Device reconnect");
> > +     pixart_reset(psmouse);
> > +
> > +     priv->mode =3D pixart_mode_detect(psmouse);
> > +     if (priv->mode < 0) {
> > +             psmouse_err(psmouse, "Unable to detect the PixArt device"=
);
> > +             return -EIO;
> > +     }
> > +
> > +     if (priv->mode =3D=3D PIXART_MODE_ABS)
> > +             ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PRO=
TO);
> > +
> > +     return 0;
> > +}
> > +
> > +static void pixart_set_abs_input_params(struct input_dev *dev, struct =
pixart_data *priv)
> > +{
> > +     __clear_bit(EV_REL, dev->evbit);
> > +     __clear_bit(REL_X, dev->relbit);
> > +     __clear_bit(REL_Y, dev->relbit);
> > +     __clear_bit(BTN_MIDDLE, dev->keybit);
> > +
> > +     __set_bit(EV_KEY, dev->evbit);
> > +     __set_bit(BTN_LEFT, dev->keybit);
> > +     __set_bit(BTN_RIGHT, dev->keybit);
> > +     if (priv->type =3D=3D PIXART_TYPE_CLICKPAD) {
> > +             __set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
> > +             __clear_bit(BTN_RIGHT, dev->keybit);
> > +     }
> > +     __set_bit(BTN_TOUCH, dev->keybit);
> > +     __set_bit(BTN_TOOL_FINGER, dev->keybit);
> > +     __set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
> > +     __set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
> > +     __set_bit(BTN_TOOL_QUADTAP, dev->keybit);
> > +     __set_bit(INPUT_PROP_POINTER, dev->propbit);
> > +
> > +     __set_bit(EV_ABS, dev->evbit);
> > +     input_set_abs_params(dev, ABS_X, 0, ABS_MAX_X, 0, 0);
> > +     input_set_abs_params(dev, ABS_Y, 0, ABS_MAX_Y, 0, 0);
> > +
> > +     input_set_abs_params(dev, ABS_MT_POSITION_X, 0, ABS_MAX_X, 0, 0);
> > +     input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, ABS_MAX_Y, 0, 0);
> > +
> > +     input_mt_init_slots(dev, SLOTS_NUMBER, 0);
> > +}
> > +
> > +static void pixart_set_rel_input_params(struct input_dev *dev, struct =
pixart_data *priv)
> > +{
> > +     __set_bit(EV_KEY, dev->evbit);
> > +     __set_bit(EV_REL, dev->evbit);
> > +     __set_bit(BTN_LEFT, dev->keybit);
> > +     __set_bit(BTN_RIGHT, dev->keybit);
> > +     __set_bit(REL_X, dev->relbit);
> > +     __set_bit(REL_Y, dev->relbit);
> > +     __set_bit(REL_WHEEL, dev->relbit);
> > +     __set_bit(INPUT_PROP_POINTER, dev->propbit);
> > +}
> > +
> > +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> > +{
> > +     int mode, type;
> > +
> > +     pixart_reset(psmouse);
> > +
> > +     type =3D pixart_type_detect(psmouse);
>
> This returns PIXART_TYPE_TOUCHPAD or PIXART_TYPE_CLICKPAD, and never
> negative value.
>

I will try to check the ps2_command() return value in the
pixart_type_detect() and pixart_mode_detect(), so I think the check
here is still necessary.
> > +     if (type < 0)
> > +             return -ENODEV;
> > +
> > +     mode =3D pixart_mode_detect(psmouse);
>
> This relies on non-PixArt devices NAKing PIXART_CMD_REPORT_FORMAT
> command. What other touchpad/mice have you tested this on to make sure
> it does not mis-detect them?
>
> > +     if (mode < 0)
> > +             return -ENODEV;
> > +
> > +     psmouse_info(psmouse, "Detect PixArt Device.");
>
> No need to be this noisy.

OK, I will drop it.
>
> > +     if (set_properties) {
> > +             psmouse->vendor =3D "PixArt";
> > +             psmouse->name =3D (type =3D=3D PIXART_TYPE_TOUCHPAD) ?
> > +                             "touchpad" : "clickpad";
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +int pixart_init(struct psmouse *psmouse)
> > +{
> > +     struct pixart_data *priv;
> > +
> > +     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     psmouse->private =3D priv;
> > +     pixart_reset(psmouse);
> > +
> > +     priv->type =3D pixart_type_detect(psmouse);
> > +     if (priv->type < 0)
> > +             goto fail;
> > +
> > +     priv->mode =3D pixart_mode_detect(psmouse);
> > +     if (priv->mode < 0) {
> > +             psmouse_err(psmouse, "Unable to initialize the PixArt dev=
ice\n");
> > +             goto fail;
> > +     }
> > +
> > +     if (priv->mode =3D=3D PIXART_MODE_ABS) {
> > +             ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PRO=
TO);
> > +             pixart_set_abs_input_params(psmouse->dev, priv);
> > +             psmouse->protocol_handler =3D pixart_process_abs_packet;
> > +             psmouse->pktsize =3D 15;
> > +     } else {
> > +             pixart_reset(psmouse);
> > +             pixart_intellimouse_detect(psmouse);
> > +             pixart_set_rel_input_params(psmouse->dev, priv);
> > +             psmouse->protocol_handler =3D pixart_process_rel_packet;
> > +             psmouse->pktsize =3D 4;
>
> Do we really need to handle this case? If the touchpad does not support
> absolute packets can we fail the detection and simply rely on the normal
> intellimouse detection and packet handling?
>

After some tests, the normal detection is well in PixArt, and I will
drop this case.

Thanks.
Binbin
> > +     }
> > +
> > +     psmouse->disconnect =3D pixart_disconnect;
> > +     psmouse->reconnect =3D pixart_reconnect;
> > +     psmouse->cleanup =3D pixart_reset;
> > +     /* resync is not supported yet */
> > +     psmouse->resync_time =3D 0;
> > +
> > +     psmouse_info(psmouse, "Set device as Type: %x, mode: %x", priv->t=
ype, priv->mode);
> > +     return 0;
> > +
> > +fail:
> > +     pixart_reset(psmouse);
> > +     kfree(priv);
> > +     psmouse->private =3D NULL;
> > +     return -1;
> > +}
> > diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pix=
art_ps2.h
> > new file mode 100644
> > index 000000000000..224ab3a4f739
> > --- /dev/null
> > +++ b/drivers/input/mouse/pixart_ps2.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#ifndef _PIXART_PS2_H
> > +#define _PIXART_PS2_H
> > +
> > +#include "psmouse.h"
> > +
> > +#define ABS_MAX_X    1023
> > +#define ABS_MAX_Y    579
> > +#define MAX_FINGERS  4
> > +#define SLOTS_NUMBER MAX_FINGERS
> > +
> > +#define PIXART_CMD_REPORT_FORMAT     0x01d8
> > +#define PIXART_CMD_SWITCH_PROTO              0x00de
> > +
> > +#define PIXART_MODE_REL      0
> > +#define PIXART_MODE_ABS      1
> > +
> > +#define PIXART_TYPE_CLICKPAD 0
> > +#define PIXART_TYPE_TOUCHPAD 1
> > +
> > +struct pixart_data {
> > +     int mode;
> > +     int type;
> > +     int x_max;
> > +     int y_max;
> > +};
> > +
> > +int pixart_detect(struct psmouse *psmouse, bool set_properties);
> > +int pixart_init(struct psmouse *psmouse);
> > +
> > +#endif  /* _PIXART_PS2_H */
> > diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/p=
smouse-base.c
> > index a0aac76b1e41..41af3460077d 100644
> > --- a/drivers/input/mouse/psmouse-base.c
> > +++ b/drivers/input/mouse/psmouse-base.c
> > @@ -36,6 +36,7 @@
> >  #include "focaltech.h"
> >  #include "vmmouse.h"
> >  #include "byd.h"
> > +#include "pixart_ps2.h"
> >
> >  #define DRIVER_DESC  "PS/2 mouse driver"
> >
> > @@ -905,6 +906,15 @@ static const struct psmouse_protocol psmouse_proto=
cols[] =3D {
> >               .detect         =3D byd_detect,
> >               .init           =3D byd_init,
> >       },
> > +#endif
> > +#ifdef CONFIG_MOUSE_PS2_PIXART
> > +     {
> > +             .type           =3D PSMOUSE_PIXART,
> > +             .name           =3D "PixArtPS/2",
> > +             .alias          =3D "pixart",
> > +             .detect         =3D pixart_detect,
> > +             .init           =3D pixart_init,
> > +     },
> >  #endif
> >       {
> >               .type           =3D PSMOUSE_AUTO,
> > @@ -1172,6 +1182,13 @@ static int psmouse_extensions(struct psmouse *ps=
mouse,
> >                       return ret;
> >       }
> >
> > +     /* Try PixArt touchpad */
> > +     if (max_proto > PSMOUSE_IMEX &&
> > +         psmouse_try_protocol(psmouse, PSMOUSE_PIXART, &max_proto,
> > +                              set_properties, true)) {
> > +             return PSMOUSE_PIXART;
> > +     }
> > +
> >       if (max_proto > PSMOUSE_IMEX) {
> >               if (psmouse_try_protocol(psmouse, PSMOUSE_GENPS,
> >                                        &max_proto, set_properties, true=
))
> > diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmous=
e.h
> > index b05c6fbae7e3..23f7fa7243cb 100644
> > --- a/drivers/input/mouse/psmouse.h
> > +++ b/drivers/input/mouse/psmouse.h
> > @@ -69,6 +69,7 @@ enum psmouse_type {
> >       PSMOUSE_BYD,
> >       PSMOUSE_SYNAPTICS_SMBUS,
> >       PSMOUSE_ELANTECH_SMBUS,
> > +     PSMOUSE_PIXART,
> >       PSMOUSE_AUTO            /* This one should always be last */
> >  };
> >
> > --
> > 2.43.0
> >
>
> Thanks.
>
> --
> Dmitry


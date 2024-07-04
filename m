Return-Path: <linux-input+bounces-4840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73633927034
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 09:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94DD21C21D57
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC31A01B8;
	Thu,  4 Jul 2024 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knFfad84"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687DB13E024
	for <linux-input@vger.kernel.org>; Thu,  4 Jul 2024 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076729; cv=none; b=RfaHURXM9YVJVa5vA+fskrVx5lHQOV4HljhDYxyTq2frwGcqy6wO4CDap4MLuEd59UgucKjs2c/egxZdqX8TzzYJAkxXv+8oLDB5IzOF+Kp9GITC9eU9cpvE05MUXJfCV0eUZOqHa2qZgylJZGB4ioCxdivh0ZGjlhyZzPhb8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076729; c=relaxed/simple;
	bh=CrtzkpwwWFWb2zJBtbG0WDLK2Kk1s4XNf+uFSfyNQSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/4akSbxqxd3l4dNs1izSWHUPdIew5XKRA4LuWAemg0bYKxJEyG5brgsvK3pjtun7UgglUUViWZBOzmSc8RL43cNydwQIoZ67/0/L7xshBtKEDJ6u1Trs74TxY8RY1NRXliQKsVPMgplxneWASyxs9a8SBzdqh/694BjhvPgcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knFfad84; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so329680276.1
        for <linux-input@vger.kernel.org>; Thu, 04 Jul 2024 00:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720076725; x=1720681525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UCyXbwFLC36PVJUeM/fF/OrPOPOwiGUP0m3qjGynjE=;
        b=knFfad84ArqEtzWJ0MdUeonB5sELRxwcFthgGxk31E5n06v0wzWcm6W68kWj5ujTrF
         d7QyOzaf4WiES6/4vY6DuD3TrI7NQjaqSMvnpNUfKRBucukAKWR6MDDQeOFQlMp6HRql
         tu+q8rf3IigsE9LjmG8l3a7G7v8uKebxfkqooMLSkiJnzVc0eRLuCBWLPcP77nstvxfd
         cXFUhZHFrHCxiZ/kfgF8nUh40bwP8shzJ8hPHY6RsBuBsS4JpsBpRK+wXfcS89H1vDl8
         BeITBojbS9TZbdX5X1qW9f0HbafKhbKoy12ngwv6V6wUXA7meTgBImUaVOYGJqX34MTw
         YRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076725; x=1720681525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UCyXbwFLC36PVJUeM/fF/OrPOPOwiGUP0m3qjGynjE=;
        b=O9RFolhH938xTlWtUN9dq1WAmBi5yTbCQBmrNeP/NOGgpgyVTTlED4I/uiIq7+pJoi
         Yh2CYP8y2vNfMLNgQ46+P37wwV48dQZrT8llxVhy34ru/PeXr/QV6wudo66OviJlS5oO
         XzMVFS9ewNix+yHPeYv0tSMJhWOqwoY92JI5Hp73w3smNdTiwgdYr3r3GcCLuQ/t/1DR
         bBDWIHWX1kxwWlXfSGoB4Q1Ha1NXA0EtVw2i4E/Db9jp9HvbothmJrmBkDcGJ0Y0/a+A
         nrvmp18h6ZnULli5WrvZJkIIr5Q+601j8DotJsMyjMokdmRzM1gdixHDbOM1pYCQxCym
         fSvA==
X-Forwarded-Encrypted: i=1; AJvYcCXdTrb2C5AGEjxWuF6Ehg11jWUBfF3SGtBoKeM7nQKjUArrN/bQrhkI+2LIY3vvvP5fB+eqP/D05thI6oGJPhr2s8A9MuHA/+nfQlM=
X-Gm-Message-State: AOJu0Ywu64ZLosn5klTmC9PhdAjv6eFCPEevstsPQz1HF5czpEj0Jlcm
	vRlxIK9fasaazlGpI9+ZOH4wnVuXIWBSo8PXf6gqgwGmYPUEE2lXsyilZLjRElGSQXZ+/15FL+/
	bzng9X/k3LtzrMKxgIxGypuoxRIU=
X-Google-Smtp-Source: AGHT+IFeSF+7HaaG9Za410DawBW4J4Lvo9hnaPm8V5PRXqgq3wzJP6MW0u242ThuYBIzjXDhM0TU3x6Wmx9liYRdamM=
X-Received: by 2002:a25:ac4b:0:b0:e03:a4ca:bfb2 with SMTP id
 3f1490d57ef6-e03c18e26f0mr759260276.12.1720076725246; Thu, 04 Jul 2024
 00:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701094953.3195501-1-zhoubinbin@loongson.cn> <ZoXDkcn7O5a8a3l3@google.com>
In-Reply-To: <ZoXDkcn7O5a8a3l3@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 4 Jul 2024 13:05:12 +0600
Message-ID: <CAMpQs4KDe0eichb=rzeMVLq1u3uUtnu5ms2M7XnPULwedMuZ3w@mail.gmail.com>
Subject: Re: [PATCH v3] Input: Add driver for PixArt PS/2 touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry:

Thanks for your detailed revierw.

On Thu, Jul 4, 2024 at 3:33=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Binbin,
>
> On Mon, Jul 01, 2024 at 05:49:53PM +0800, Binbin Zhou wrote:
> > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > supports both clickpad and touchpad types.
> >
> > At the same time, we extended the single data packet length to 16,
> > because according to the current PixArt hardware and FW design, we need
> > 11 bytes/15 bytes to represent the complete three-finger/four-finger da=
ta.
> >
> > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> A few more comments below...
>
> > ---
> > V3:
> >  - Rebased on input/next;
> >  - Added comment to msleep() in pixart_reset() as suggested by Aseda, n=
o
> > functional change, thanks.
> >
> > Link to V2:
> > https://lore.kernel.org/all/20240624065359.2985060-1-zhoubinbin@loongso=
n.cn/
> >
> > V2:
> >  - Rebased on input/next;
> >  - Merge two patches from the V1 patchset;
> >  - Initialize local variables to prevent random garbage;
> >  - Remove some noisy debug message;
> >  - Check ps2_command() return value;
> >  - Use macros to represent bit operations for better readability, such
> >    as abs_x;
> >  - Remove the code related to rel packets, for the normal
> >    intellimouse detection is well in PixArt.
> >
> > Link to V1:
> > https://lore.kernel.org/all/cover.1715224143.git.zhoubinbin@loongson.cn=
/
> >
> >  drivers/input/mouse/Kconfig        |  12 ++
> >  drivers/input/mouse/Makefile       |   1 +
> >  drivers/input/mouse/pixart_ps2.c   | 269 +++++++++++++++++++++++++++++
> >  drivers/input/mouse/pixart_ps2.h   |  36 ++++
> >  drivers/input/mouse/psmouse-base.c |  17 ++
> >  drivers/input/mouse/psmouse.h      |   3 +-
> >  6 files changed, 337 insertions(+), 1 deletion(-)
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
> > index 000000000000..a089beb2b00e
> > --- /dev/null
> > +++ b/drivers/input/mouse/pixart_ps2.c
> > @@ -0,0 +1,269 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Pixart Touchpad Controller 1336U PS2 driver
> > + *
> > + * Author: Jon Xie <jon_xie@pixart.com>
> > + *         Jay Lee <jay_lee@pixart.com>
> > + * Further cleanup and restructuring by:
> > + *         Binbin Zhou <zhoubinbin@loongson.cn>
> > + *
> > + * Copyright (C) 2021-2024 Pixart Imaging.
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
> > +
> > +#include "pixart_ps2.h"
> > +
> > +static int pixart_read_tp_mode(struct psmouse *psmouse)
>
> Maybe make it
>
> static int pixart_read_tp_mode(struct ps2dev *ps2dev, u8 *mode)
>
> to separate mode value and errors/success?

Yes, that would be much more clearer.
>
> > +{
> > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > +     u8 param[1] =3D { 0 };
> > +
> > +     if (ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT))
> > +             return -EIO;
>
> Just return what ps2_command() reported, no need to change everything to
> -EIO.
>
OK.
> > +
> > +     return (param[0] =3D=3D 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
> > +}
> > +
> > +static int pixart_read_tp_type(struct psmouse *psmouse)
>
> Same here:
>
> static int pixart_read_tp_type(struct ps2dev *ps2dev, u8 *type)
>
> > +{
> > +     struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > +     u8 param[3] =3D { 0 };
> > +
> > +     param[0] =3D 0x0a;
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE))
> > +             return -EIO;
>
> Same here and below, do not clobber with -EIO.
>
> > +
> > +     param[0] =3D 0x0;
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> > +             return -EIO;
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> > +             return -EIO;
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> > +             return -EIO;
> > +
> > +     param[0] =3D 0x03;
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
> > +             return -EIO;
> > +
> > +     if (ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO))
> > +             return -EIO;
> > +
> > +     return (param[0] =3D=3D 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYP=
E_CLICKPAD;
> > +}
> > +
> > +static void pixart_reset(struct psmouse *psmouse)
> > +{
> > +     ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> > +
> > +     /* according to PixArt, 100ms is required for the upcoming reset =
*/
> > +     msleep(100);
> > +     psmouse_reset(psmouse);
> > +}
> > +
> > +static void pixart_process_packet(struct psmouse *psmouse)
> > +{
> > +     struct pixart_data *priv =3D psmouse->private;
> > +     struct input_dev *dev =3D psmouse->dev;
> > +     int i, id, fingers =3D 0, abs_x, abs_y;
> > +     u8 *pkt =3D psmouse->packet;
> > +     u8 contact_cnt =3D CONTACT_CNT(pkt[0]);
> > +     bool tip;
> > +
> > +     for (i =3D 0; i < contact_cnt; i++) {
> > +             id =3D SLOT_ID_MASK(pkt[3 * i + 3]);
> > +             abs_y =3D ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
> > +             abs_x =3D ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
> > +
> > +             if (i =3D=3D PIXART_MAX_FINGERS - 1)
> > +                     tip =3D pkt[14] & BIT(1);
> > +             else
> > +                     tip =3D pkt[3 * contact_cnt + 1] & (0x01 << (2 * =
i + 1));
>
> BIT(2 * i + 1)?
>
> > +
> > +             input_mt_slot(dev, id);
> > +             if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip))=
 {
> > +                     fingers++;
> > +                     input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
> > +                     input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
> > +             }
> > +     }
> > +
> > +     input_mt_sync_frame(dev);
> > +     input_mt_report_finger_count(dev, fingers);
>
> I believe if you pass INPUT_MT_POINTER flag to input_mt_init_slots()
> below you will not need to call input_mt_report_finger_count() because
> input_mt_sync_frame() will do it for you.

Sorry, this is my fault, I didn't fully understand these APIs before.
I will remove the redundant code.
>
> > +
> > +     if (priv->type =3D=3D PIXART_TYPE_CLICKPAD) {
> > +             input_report_key(dev, BTN_LEFT, pkt[0] & 0x03);
> > +     } else {
> > +             input_report_key(dev, BTN_LEFT, pkt[0] & 0x01);
> > +             input_report_key(dev, BTN_RIGHT, pkt[0] & 0x02);
> > +     }
> > +
> > +     input_sync(dev);
> > +}
> > +
> > +static psmouse_ret_t pixart_protocol_handler(struct psmouse *psmouse)
> > +{
> > +     u8 *pkt =3D psmouse->packet;
> > +     u8 contact_cnt =3D CONTACT_CNT(pkt[0]);
> > +
> > +     if (contact_cnt > PIXART_MAX_FINGERS || ((pkt[0] & 0x8c) !=3D 0x8=
0))
> > +             return PSMOUSE_BAD_DATA;
> > +
> > +     if (contact_cnt =3D=3D PIXART_MAX_FINGERS && psmouse->pktcnt < ps=
mouse->pktsize)
> > +             return PSMOUSE_GOOD_DATA;
> > +
> > +     if (contact_cnt =3D=3D 0 && psmouse->pktcnt < 5)
> > +             return PSMOUSE_GOOD_DATA;
> > +
> > +     if (psmouse->pktcnt < (3 * contact_cnt + 2))
> > +             return PSMOUSE_GOOD_DATA;
> > +
> > +     pixart_process_packet(psmouse);
> > +
> > +     return PSMOUSE_FULL_PACKET;
> > +}
> > +
> > +static void pixart_disconnect(struct psmouse *psmouse)
> > +{
> > +     pixart_reset(psmouse);
> > +     kfree(psmouse->private);
> > +     psmouse->private =3D NULL;
> > +}
> > +
> > +static int pixart_reconnect(struct psmouse *psmouse)
> > +{
> > +     int mode;
> > +
> > +     pixart_reset(psmouse);
> > +     mode =3D pixart_read_tp_mode(psmouse);
>
>         error =3D pixart_read_tp_mode(&psmouse->ps2dev, &mode);
>         if (error)
>                 return error;
>
> > +     if (mode !=3D PIXART_MODE_ABS)
> > +             return mode;
>                 return -ENODEV;
> > +
> > +     if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO))
> > +             return -EIO;
>
>         error =3D ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_P=
ROTO);
>         if (error)
>                 return error;
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int pixart_set_input_params(struct input_dev *dev, struct pixar=
t_data *priv)
> > +{
> > +     /* No relative support */
> > +     __clear_bit(EV_REL, dev->evbit);
> > +     __clear_bit(REL_X, dev->relbit);
> > +     __clear_bit(REL_Y, dev->relbit);
> > +     __clear_bit(BTN_MIDDLE, dev->keybit);
> > +
> > +     /* Buttons */
> > +     __set_bit(EV_KEY, dev->evbit);
> > +     __set_bit(BTN_LEFT, dev->keybit);
> > +     if (priv->type =3D=3D PIXART_TYPE_CLICKPAD)
> > +             __set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
> > +     else
> > +             __set_bit(BTN_RIGHT, dev->keybit);
> > +
> > +     /* Touchpad */
> > +     __set_bit(BTN_TOUCH, dev->keybit);
> > +     __set_bit(BTN_TOOL_FINGER, dev->keybit);
> > +     __set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
> > +     __set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
> > +     __set_bit(BTN_TOOL_QUADTAP, dev->keybit);
> > +     __set_bit(INPUT_PROP_POINTER, dev->propbit);
>
> If you pass INPUT_MT_POINTER to input_mt_init_slots() then you will not
> need to set any of these bits in the "touchpad" section.

Yes, this is already done in input_mt_init_slots().
I will drop it.
>
> > +

> > +     /* Absolute position */
> > +     __set_bit(EV_ABS, dev->evbit);
>
> No need to call __set_bit(EV_ABS, dev->evbit) when using
> input_set_abs_params().
>
OK, I will drop it.

Thanks.
Binbin
>
> > +     input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
> > +     input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
> > +
> > +     input_set_abs_params(dev, ABS_MT_POSITION_X, 0, PIXART_PAD_WIDTH,=
 0, 0);
> > +     input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, PIXART_PAD_HEIGHT=
, 0, 0);
> > +
> > +     return input_mt_init_slots(dev, PIXART_SLOTS_NUM, 0);
> > +}
> > +
> > +static int pixart_query_hardware(struct psmouse *psmouse)
> > +{
> > +     struct pixart_data *priv =3D psmouse->private;
> > +
> > +     priv->type =3D pixart_read_tp_type(psmouse);
> > +     if (priv->type < 0)
> > +             return -EIO;
> > +
> > +     priv->mode =3D pixart_read_tp_mode(psmouse);
> > +     if (priv->mode < 0)
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +int pixart_detect(struct psmouse *psmouse, bool set_properties)
> > +{
> > +     int type;
> > +
> > +     pixart_reset(psmouse);
> > +     type =3D pixart_read_tp_type(psmouse);
> > +     if (type < 0)
> > +             return -EIO;
> > +
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
> > +     if (pixart_query_hardware(psmouse)) {
> > +             psmouse_err(psmouse, "Unable to query PixArt touchpad har=
dware.\n");
> > +             goto err_exit;
> > +     }
> > +
> > +     /* Relative mode follows standard PS/2 mouse protocol */
> > +     if (priv->mode !=3D PIXART_MODE_ABS)
> > +             goto err_exit;
> > +
> > +     /* Set absolute mode */
> > +     if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO))=
 {
> > +             psmouse_err(psmouse, "init: Unable to initialize PixArt a=
bsolute mode.\n");
> > +             goto err_exit;
> > +     }
> > +
> > +     if (pixart_set_input_params(psmouse->dev, priv) < 0) {
> > +             psmouse_err(psmouse, "init: Unable to set input params.\n=
");
> > +             goto err_exit;
> > +     }
> > +
> > +     psmouse->pktsize =3D 15;
> > +     psmouse->protocol_handler =3D pixart_protocol_handler;
> > +     psmouse->disconnect =3D pixart_disconnect;
> > +     psmouse->reconnect =3D pixart_reconnect;
> > +     psmouse->cleanup =3D pixart_reset;
> > +     /* resync is not supported yet */
> > +     psmouse->resync_time =3D 0;
> > +
> > +     return 0;
> > +
> > +err_exit:
> > +     pixart_reset(psmouse);
> > +     kfree(priv);
> > +     psmouse->private =3D NULL;
> > +     return -EIO;
> > +}
> > diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pix=
art_ps2.h
> > new file mode 100644
> > index 000000000000..f7f16cb9fbb0
> > --- /dev/null
> > +++ b/drivers/input/mouse/pixart_ps2.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#ifndef _PIXART_PS2_H
> > +#define _PIXART_PS2_H
> > +
> > +#include "psmouse.h"
> > +
> > +#define PIXART_PAD_WIDTH     1023
> > +#define PIXART_PAD_HEIGHT    579
> > +#define PIXART_MAX_FINGERS   4
> > +#define PIXART_SLOTS_NUM     PIXART_MAX_FINGERS
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
> > +#define CONTACT_CNT(m)       (((m) & GENMASK(6, 4)) >> 4)
> > +#define SLOT_ID_MASK(m)      ((m) & GENMASK(2, 0))
> > +#define ABS_Y_MASK(m)        (((m) & GENMASK(5, 4)) << 4)
> > +#define ABS_X_MASK(m)        (((m) & GENMASK(7, 6)) << 2)
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
> > index 4d8acfe0d82a..23f7fa7243cb 100644
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
> > @@ -94,7 +95,7 @@ struct psmouse {
> >       const char *vendor;
> >       const char *name;
> >       const struct psmouse_protocol *protocol;
> > -     unsigned char packet[8];
> > +     unsigned char packet[16];
> >       unsigned char badbyte;
> >       unsigned char pktcnt;
> >       unsigned char pktsize;
> > --
> > 2.43.0
> >
>
> Thanks.
>
> --
> Dmitry


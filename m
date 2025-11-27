Return-Path: <linux-input+bounces-16381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F7C8D94E
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 10:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D26E64E66C8
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 09:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4C3329383;
	Thu, 27 Nov 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOi/m8KO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DE324718
	for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236268; cv=none; b=OyGV9TiCSDwO4SK32T/Kf3e5nsXa49aj8mfKFd0E9ELQdwSNm6Vk78RByszgd3Rhqxl+FgLtfqll5JMxZfLGb+CIKWWml3KN0bgE/LsVrqWiXzUsS4j91quThhL12X7i91quWXbzuBPDIwTcUMvcJT+sY2OTgQJrZ+AfMbHTn2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236268; c=relaxed/simple;
	bh=9X/qMEpurcx9WY3hZNWgVUTHUb7B4POPuKGi7ALhIVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjPpJ2PzZ6OH9kN/UKCQKxj5Gd2fBC/GLanVb4Gfv6Mdr0gNMBZzULUK1/at9qYDV0MfSLfB1m2aPnYamDplIwjNgqYd+InXmlKVOoNag58fVpj9jCEK+xWF2CGukZsKoRJvVyr4OQNieLUwHCXpx3ZnrXNnywy0Sf7JnotUBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOi/m8KO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6299C4CEF8
	for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764236267;
	bh=9X/qMEpurcx9WY3hZNWgVUTHUb7B4POPuKGi7ALhIVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AOi/m8KOGUVBggPQsg3Bz+yS7lksPGL5QEFvLGoeB24SOAlOfsX8RC7e2pF4zUZgo
	 q1LbMM08WfecNEImTlu4Je6+21YRU9X+vHGQl5SyHvFN5eO3LHD0F4v5K6oZXuobV6
	 68sboEwI8qIjGBtlFx93QpEEp2ItyRdYpSu/3aOws8m61rcG9kglA/ysQ1EFucwKXc
	 xv9UbCNEI1zuceFJti+8pgp0xK4JCiof8OazJIuL2HyJPEkCZiMs8qFSqQFaCLWZWy
	 y9U8jo7dWCyPeQZ7Uzx1Q5MdbuCy+KIZu+5g0TBe5c8L/QGBdRbWat2VGHrq1Lhc0c
	 bVv9cwFUtDapA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b737cd03d46so100549266b.0
        for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 01:37:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdNuiCG5kHtmRgxz1FxrXs6Jz1mnQxIHrRWWFvcB0dL816vkyXUHqrGotG67QbHwTmNJmFENCFs5Rtug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXxwOYO2aHt2EnsVMn/LEvzLH8JywsVC1vcexiTg0t5cvoiDQ
	ED5+pChJkgeWYa4Q4Djn+Z+iY5CT+aoG5KtDQXpUYyPZ4s9LTCDC+1eeQMWnEARiCZrqCQB1Ne/
	5WG2pvbwA8blTLnJB8i6+evyXdDcWa80=
X-Google-Smtp-Source: AGHT+IG4Ccx64hHrpU2S+cOatWy0qaA+nxPqikJdLsrWugjVcWQ3Yl/yfnlCWRqnnZ1fnaRVdeyf0ZJbYOcdXDl4UNQ=
X-Received: by 2002:a17:906:50e:b0:b76:bb8e:9291 with SMTP id
 a640c23a62f3a-b76bb8e9627mr908410466b.0.1764236266362; Thu, 27 Nov 2025
 01:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127080203.3218018-1-zhoubinbin@loongson.cn>
In-Reply-To: <20251127080203.3218018-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 27 Nov 2025 17:37:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5yvhfTRSpiLniPFXwrmh-kPxMu+tr+BaNZDYeU9b+NrQ@mail.gmail.com>
X-Gm-Features: AWmQ_blNEjk_7rCXw5T_AhLLsHAxqPsfKDFMk7IomRBSWd45GusBWChSgWdcHHA
Message-ID: <CAAhV-H5yvhfTRSpiLniPFXwrmh-kPxMu+tr+BaNZDYeU9b+NrQ@mail.gmail.com>
Subject: Re: [RESEND v5] Input: Add driver for PixArt PS/2 touchpad
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>, jeffbai@aosc.io, 
	Benjamin Tissoires <bentiss@kernel.org>, Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 4:04=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
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
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
> After rewriting the determination conditions for the PixArt touchpad type=
,
> we tested multiple types of touchpads and no longer get false positives f=
or
> non-PixArt devices.
>
> So, I am attempting to resend the patch, thanks.
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
> index 000000000000..682aa6499e63
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
> + * Copyright (C) 2024-2025 Loongson Technology Corporation Limited.
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
> index 77ea7da3b1c5..f708b75eb91b 100644
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
> base-commit: a311c777f2987e6ddba2d2dd2f82f2135d65f8aa
> --
> 2.47.3
>
>


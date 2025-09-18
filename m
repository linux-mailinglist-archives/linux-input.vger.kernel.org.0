Return-Path: <linux-input+bounces-14829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC698B82AA5
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 04:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72B6B3B0FD7
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 02:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB26722069A;
	Thu, 18 Sep 2025 02:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn3ZtGw2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C5F18DB26
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758163112; cv=none; b=Lgz3nHHAjbdh4kOFPP8G2/Wy/GxsptBBluycsvSq6yt22uzUq0PjLPfnKUlqxiUwcGCtOULfj+fchlxaOGNVXaetSVkJxQVIDu+Htb23Bsu3ZiAgUtwJMEvUko7oSerbCb10vIxyfPdBa53/H9mG/0spE1WtdGj19xV7lQelO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758163112; c=relaxed/simple;
	bh=HI6HcO70ptXiTtuatuoe1VtEMK97D9GPkSxbJi8sIOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixDg/gkMJd/L19dPneaE9Oygz/N5mnNTsRVReEHbabta2YGjqGokmWN6KCyfU0fWRWsY9u3eMBpSB212G4yEHt0i+NLCDr/uvqt86RhChM2Kt8DANErHWu9dw8GHtKUHevV5e3qLKvrAI7+KQu2dViMANfVRN/Iv9ic2Trkfmg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn3ZtGw2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445806e03cso6281805ad.1
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 19:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758163109; x=1758767909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJNd3yfJgxStjopMM/qaDqdKdgg40ASoXsttk3Hv7R8=;
        b=Qn3ZtGw2U3EF9TWoLmhKIr79I0Ji5QzEigLNDYAXWtAVuvWRfJGoanYo9+0E+eDSsM
         A6KJWqhVYmHMVO2rkh/gdIpno9+GTOYRS8OXvGd/AKPVJCVzHhBtC564HssDuiFdSFJH
         M6zQxi+qj/L5VjGVWhkZKgE1uE8RG5jBtVXOcWzySEtW9QLbXksBoZt4F/z7PVfxZfpf
         Dhz+X5o8XTcMSOcGAG36DhC66/AavBbQidU/nMlhpTpkOVPEKsRIETwKPhKbBNr295wJ
         eynw/NPDliWpkYo6XrAJIGoBubqTyP6t+eQs72BFJeh4Ktnv5pfjt1nd0C+MUxvW06i8
         ugFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758163109; x=1758767909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJNd3yfJgxStjopMM/qaDqdKdgg40ASoXsttk3Hv7R8=;
        b=SpFtaOuD6KU4N0FqJiaAriQD6PRLspZmQ00y53xyGrAB3DmHOqvsUu/V56vtKzJLDV
         daeVKUJDSJ9OsTavNrIKlqsM8agd2rr+CaYk5GsbxlRKB6SKNNelgBVnoAbV2xoiOqB3
         K27WKyoa6HImMUdTurrfWkKKIdY4CmiT19EBQNlkMHdNf3KGXQdNWHz7mbGh0YVbxg9u
         iDwGRKmHOrjO9UQMvFTTRf9yoz+0FWXkhCJykriRNOirxkhabAw7eHftgI6MWXGuI2pB
         Ixp7S2oLIF5z99MIqBmWEKp7B8KTLH7j4aCx1zJYPuktLX7SzQtgxzrhVW/U5d70BwYA
         g/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlCzCrPQ2hQql8QYv3CuTfsSe5TEd3h4oqINSy3d5qSPIvLN53W04Clz+ganhBPxwxDPvsJ12psYMhcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGBCFdRorQphJ2d4Aj4q58mqz+9DfAzngUQt2mY8LuGVCfUlR
	c+uXhEupoauDfP/Y6/popemfYhOvE9fdtoH4yZrTs2ajgRRsdStqPut9t8stU+ZD7rUim3zyXgU
	pR8iBhs6RmfJUxwpS74JZyi2gje5/bmQ=
X-Gm-Gg: ASbGncv6AM6OdkR2Y+LopJtFB9z7qbf/w+Pyjjh6ty3hC8o5YpRXokzAb/zN9rjiUVh
	T9mEOjaAoaTUs0+YCCx/rR2SUQbJ8qVzYoaGvPlLsbzRhC6OEveuMtY8s8xgcRGNrt+H140eoPG
	nVXd+89Tyca4TiZJ4710qkRZCN4sM3kzy2HWy6W/2NCVN9TuqriIF6nc8O1QEuHbVQ8YEvwuyxB
	la/MZYthuPzFAZRiKTMT9yeAZCS
X-Google-Smtp-Source: AGHT+IHR/Lstf+d8gAmVY4eP4Jbj73F9ZpgaTWMsPkVd6UA9tZSvTP4KwZf9sfP5GiemUyYGydb3TBlghzlmQJDytc0=
X-Received: by 2002:a17:902:f650:b0:24e:2ede:f9c3 with SMTP id
 d9443c01a7336-2681218aca2mr46594685ad.25.1758163108898; Wed, 17 Sep 2025
 19:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901135308.52340-1-vishnuocv@gmail.com>
In-Reply-To: <20250901135308.52340-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 18 Sep 2025 11:37:52 +0900
X-Gm-Features: AS18NWAFgis_V3VMxJBNqg4SB_q8S8rehxr3LSEw03NvqC3hTty7QHQC2oeRfmU
Message-ID: <CABxCQKtEcFozTtuV3sutU3OyobTbpA82Uy=MyU0FQePPT7S2Wg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap
 enable/disable support
To: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

Do we have any questions or concerns?
Thanks in advance!

On Mon, Sep 1, 2025 at 10:53=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> Add support for enabling and disabling doubletap on TrackPoint devices
> that support this functionality. The feature is detected using firmware
> ID and exposed via sysfs as `doubletap_enabled`.
>
> The feature is only available on newer ThinkPads (2023 and later).The dri=
ver
> exposes this capability via a new sysfs attribute:
> "/sys/bus/serio/devices/seriox/doubletap_enabled".
>
> The attribute is only created if the device is detected to be capable of
> doubletap via firmware and variant ID checks. This functionality will be
> used by platform drivers such as thinkpad_acpi to expose and control doub=
letap
> via user interfaces.
>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Changes in v2:
> - Improve commit messages
> - Sysfs attributes moved to trackpoint.c
> - Removed unnecessary comments
> - Removed unnecessary debug messages
> - Using strstarts() instead of strcmp()
> - is_trackpoint_dt_capable() modified
> - Removed _BIT suffix and used BIT() define.
> - Reverse the trackpoint_doubletap_status() logic to return error first.
> - Removed export functions as a result of the design change
> - Changed trackpoint_dev->psmouse to parent_psmouse
> - The path of trackpoint.h is not changed.
> Changes in v3:
> - No changes.
> ---
>  drivers/input/mouse/trackpoint.c | 149 +++++++++++++++++++++++++++++++
>  drivers/input/mouse/trackpoint.h |  15 ++++
>  2 files changed, 164 insertions(+)
>
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/track=
point.c
> index 5f6643b69a2c..c6f17b0dec3a 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -16,6 +16,8 @@
>  #include "psmouse.h"
>  #include "trackpoint.h"
>
> +static struct trackpoint_data *trackpoint_dev;
> +
>  static const char * const trackpoint_variants[] =3D {
>         [TP_VARIANT_IBM]                =3D "IBM",
>         [TP_VARIANT_ALPS]               =3D "ALPS",
> @@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, u8 =
loc, u8 val)
>         return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAND))=
;
>  }
>
> +/* Read function for TrackPoint extended registers */
> +static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8 *v=
al)
> +{
> +       u8 ext_param[2] =3D {TP_READ_MEM, loc};
> +       int error;
> +
> +       error =3D ps2_command(ps2dev,
> +                           ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND));
> +
> +       if (!error)
> +               *val =3D ext_param[0];
> +
> +       return error;
> +}
> +
>  static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 mask)
>  {
>         u8 param[3] =3D { TP_TOGGLE, loc, mask };
> @@ -393,6 +410,131 @@ static int trackpoint_reconnect(struct psmouse *psm=
ouse)
>         return 0;
>  }
>
> +/* List of known incapable device PNP IDs */
> +static const char * const dt_incompatible_devices[] =3D {
> +       "LEN0304",
> +       "LEN0306",
> +       "LEN0317",
> +       "LEN031A",
> +       "LEN031B",
> +       "LEN031C",
> +       "LEN031D",
> +};
> +
> +/*
> + * checks if it=E2=80=99s a doubletap capable device
> + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
> + */
> +static bool is_trackpoint_dt_capable(const char *pnp_id)
> +{
> +       const char *id_start;
> +       char id[8];
> +
> +       if (!strstarts(pnp_id, "PNP: LEN03"))
> +               return false;
> +
> +       /* Points to "LEN03xxxx" */
> +       id_start =3D pnp_id + 5;
> +       if (sscanf(id_start, "%7s", id) !=3D 1)
> +               return false;
> +
> +       /* Check if it's blacklisted */
> +       for (size_t i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i=
) {
> +               if (strcmp(id, dt_incompatible_devices[i]) =3D=3D 0)
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* Trackpoint doubletap status function */
> +static int trackpoint_doubletap_status(bool *status)
> +{
> +       struct trackpoint_data *tp =3D trackpoint_dev;
> +       struct ps2dev *ps2dev =3D &tp->parent_psmouse->ps2dev;
> +       u8 reg_val;
> +       int rc;
> +
> +       /* Reading the Doubletap register using extended read */
> +       rc =3D trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
> +       if (rc)
> +               return rc;
> +
> +       *status =3D reg_val & TP_DOUBLETAP_STATUS ? true : false;
> +
> +       return 0;
> +}
> +
> +/* Trackpoint doubletap enable/disable function */
> +static int trackpoint_set_doubletap(bool enable)
> +{
> +       struct trackpoint_data *tp =3D trackpoint_dev;
> +       struct ps2dev *ps2dev =3D &tp->parent_psmouse->ps2dev;
> +       static u8 doubletap_state;
> +       u8 new_val;
> +
> +       if (!tp)
> +               return -ENODEV;
> +
> +       new_val =3D enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
> +
> +       if (doubletap_state =3D=3D new_val)
> +               return 0;
> +
> +       doubletap_state =3D new_val;
> +
> +       return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
> +}
> +
> +/*
> + * Trackpoint Doubletap Interface
> + * Control/Monitoring of Trackpoint Doubletap from:
> + * /sys/bus/serio/devices/seriox/doubletap_enabled
> + */
> +static ssize_t doubletap_enabled_show(struct device *dev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +       struct serio *serio =3D to_serio_port(dev);
> +       struct psmouse *psmouse =3D psmouse_from_serio(serio);
> +       struct trackpoint_data *tp =3D psmouse->private;
> +       bool status;
> +       int rc;
> +
> +       if (!tp || !tp->doubletap_capable)
> +               return -ENODEV;
> +
> +       rc =3D trackpoint_doubletap_status(&status);
> +       if (rc)
> +               return rc;
> +
> +       return sysfs_emit(buf, "%d\n", status ? 1 : 0);
> +}
> +
> +static ssize_t doubletap_enabled_store(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       const char *buf, size_t count)
> +{
> +       struct serio *serio =3D to_serio_port(dev);
> +       struct psmouse *psmouse =3D psmouse_from_serio(serio);
> +       struct trackpoint_data *tp =3D psmouse->private;
> +       bool enable;
> +       int err;
> +
> +       if (!tp || !tp->doubletap_capable)
> +               return -ENODEV;
> +
> +       err =3D kstrtobool(buf, &enable);
> +       if (err)
> +               return err;
> +
> +       err =3D trackpoint_set_doubletap(enable);
> +       if (err)
> +               return err;
> +
> +       return count;
> +}
> +
> +static DEVICE_ATTR_RW(doubletap_enabled);
> +
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  {
>         struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> @@ -425,6 +567,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool s=
et_properties)
>         psmouse->reconnect =3D trackpoint_reconnect;
>         psmouse->disconnect =3D trackpoint_disconnect;
>
> +       trackpoint_dev =3D psmouse->private;
> +       trackpoint_dev->parent_psmouse =3D psmouse;
> +
>         if (variant_id !=3D TP_VARIANT_IBM) {
>                 /* Newer variants do not support extended button query. *=
/
>                 button_info =3D 0x33;
> @@ -470,6 +615,10 @@ int trackpoint_detect(struct psmouse *psmouse, bool =
set_properties)
>                      psmouse->vendor, firmware_id,
>                      (button_info & 0xf0) >> 4, button_info & 0x0f);
>
> +       tp->doubletap_capable =3D is_trackpoint_dt_capable(ps2dev->serio-=
>firmware_id);
> +       if (tp->doubletap_capable)
> +               device_create_file(&psmouse->ps2dev.serio->dev, &dev_attr=
_doubletap_enabled);
> +
>         return 0;
>  }
>
> diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/track=
point.h
> index eb5412904fe0..256e8cb35581 100644
> --- a/drivers/input/mouse/trackpoint.h
> +++ b/drivers/input/mouse/trackpoint.h
> @@ -8,6 +8,8 @@
>  #ifndef _TRACKPOINT_H
>  #define _TRACKPOINT_H
>
> +#include <linux/bitops.h>
> +
>  /*
>   * These constants are from the TrackPoint System
>   * Engineering documentation Version 4 from IBM Watson
> @@ -69,6 +71,8 @@
>                                         /* (how hard it is to drag */
>                                         /* with Z-axis pressed) */
>
> +#define TP_DOUBLETAP           0x58    /* TrackPoint doubletap register =
*/
> +
>  #define TP_MINDRAG             0x59    /* Minimum amount of force needed=
 */
>                                         /* to trigger dragging */
>
> @@ -139,6 +143,14 @@
>  #define TP_DEF_TWOHAND         0x00
>  #define TP_DEF_SOURCE_TAG      0x00
>
> +/* Doubletap register values */
> +#define TP_DOUBLETAP_ENABLE    0xFF    /* Enable value */
> +#define TP_DOUBLETAP_DISABLE   0xFE    /* Disable value */
> +
> +#define TP_DOUBLETAP_STATUS_BIT 0      /* 0th bit defines enable/disable=
 */
> +
> +#define TP_DOUBLETAP_STATUS   BIT(TP_DOUBLETAP_STATUS_BIT)
> +
>  #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<8) =
| (cmd))
>
>  struct trackpoint_data {
> @@ -150,11 +162,14 @@ struct trackpoint_data {
>         u8 thresh, upthresh;
>         u8 ztime, jenks;
>         u8 drift_time;
> +       bool doubletap_capable;
>
>         /* toggles */
>         bool press_to_select;
>         bool skipback;
>         bool ext_dev;
> +
> +       struct psmouse *parent_psmouse;
>  };
>
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
> --
> 2.48.1
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)


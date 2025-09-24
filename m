Return-Path: <linux-input+bounces-15025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92843B98407
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 06:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB123B8DD4
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 04:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E6822156A;
	Wed, 24 Sep 2025 04:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo4vNzI/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE21C8606
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 04:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758689764; cv=none; b=BFsYNjTuFe447bn1YV0/kDTO9KmV7Yy2qrRVxu72vzPq7dSt5UhCi5WpC905pjoyOXiPRwEBkFHfWiAFPNOS+41Xpe65dHQ6WBJIjYikOg/ipBydh/oKrL2HsuuTwNeD+nee75DX37ComlCAW1/eT0kv0S0STSO7UGVK7R+vuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758689764; c=relaxed/simple;
	bh=5xDbl/LTIY63Pj+BNwFnS8JoKqzM6x2WufzcXdr+5c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQKGvbSKO3t8I8y+VdBhLAJqj//katPEd9WBbjI6dlS/o3zEjgV5YGi1NpAR7VX9SWKB6bOygjY44uMzQlwOhMI4wZsSdgdH1caF4Q1ZSZ373zKFIEF6z4xj2qCjNlQerD8FReqB6pM5CR0MSKYgFoJML8iPT/NliSCLLJedpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo4vNzI/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so4056516a91.3
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 21:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758689761; x=1759294561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og6jJaE/MSJu3yv2azFheZTgSMSCVoJT1cjUb4ZWxKc=;
        b=Jo4vNzI/azbRFcF19H0vAGZ926zbcME+niP/o2WGGTZt2DDqNBQ0tK4JipScY0OCe8
         c4UcCNGNzpCNkwhUlQU6UGJEDV8HGPBAzL2uJf9kRWyrUX6KihRK/rUDoueBm2RMbRUx
         UgWwcKMWM/NPfq1B6bc88VteX7v6u7GNfO57/ej6j4KD22NmsCube+oP52KaAGwTm8WY
         CV0KUzGHWX2ROvESo6twyBYStS/GPTExAp5K0IMbiDpB8eYqMsWWTD7SSfxeOrTV0Pbn
         +YEnd6yswL74+8nxrQbnBOJu/tkDh/ki2cN8hahlavlnZ8bFeGFJMcsPgfrGWmMzCIck
         BmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758689761; x=1759294561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og6jJaE/MSJu3yv2azFheZTgSMSCVoJT1cjUb4ZWxKc=;
        b=lpzAEDkCJ5JEqKiKhmHGSUkcWWYZYzkCor27rD1wfQ0WFX06G2xjaViMPAuN2+amhx
         A0xobNK/axbuTZYnRi2Mbb2/jr5wKx1cRziBfbJ4FyPZOKTeW1ANBMLXqdf5tOeZT9uT
         yXKCLUa4Vq3t6yS1S+Fo/ioIvXK/YXcbueslz27klnIxeCiyvSpfxPwJ1B6+aMhpxZt7
         DNBDP9gkNkYGJZX1UiJjxAwp968pI69nr/x0uCq0Yrmv/ngKL1LqtmjJyfHPUDY8zcqW
         C7u+P9ZvKHv9j2mAR0xEza7bWokXJsmvKRhBgNwrqXn7cg7KyIOgX9+eIhcVYoG1jom/
         eecQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFX64OQrMfSA7R6i8fi6GMhVrEYMT+2rYpYVvw6oyK3xMuZwGMFg/oXZNV0x6qmA/xRIe+VB69Uf44vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMzQaNXqIUChRLE1zz2zxZoyDkOLVq2CocDon7rkbQ9gl9xwD
	aEncgJObY178XEwO1oENS48brsxcM6H16zBQk7csAt6hVOezupoH+eWqCq51U6cvU3Ya0LuGZjA
	AakSW8VwRHxtbmNSwxPSTjaAAUW++XeE=
X-Gm-Gg: ASbGnct7nm3ksvdVlLzm6SXRXPnpZ2nC8NaFNyhslvz/IznzbSRqP1WBd42WdmajHUm
	I0OXi8Ihi1gZAhBIaqbCifmclNvQRC2WnhSTcuHBUaBDiRHc3mPiwv7LMObWPeEYkv7WTJ1wRl8
	7zuBxbAsf2ns5Lwtwcmqc+mkCWTX2A8dWTS/NFpx4Vjb+qI6XEN5AQAtsFh2OTnmpNPe0wsCSWD
	lAh
X-Google-Smtp-Source: AGHT+IGNYEEhGY+4/Xl///dhwY1gyqNOnrQJYkupePwdw1LNuySS0P0qZ/4895J6xr7yd0v9gPleKvsXc+hnyDLLs4E=
X-Received: by 2002:a17:90b:5109:b0:32b:8b8d:c2c6 with SMTP id
 98e67ed59e1d1-332a950f797mr6018180a91.14.1758689760827; Tue, 23 Sep 2025
 21:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901135308.52340-1-vishnuocv@gmail.com> <CABxCQKtEcFozTtuV3sutU3OyobTbpA82Uy=MyU0FQePPT7S2Wg@mail.gmail.com>
 <6e834cb7-565b-4a4b-bf90-4765f5fc9cc9@kernel.org>
In-Reply-To: <6e834cb7-565b-4a4b-bf90-4765f5fc9cc9@kernel.org>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 24 Sep 2025 13:55:24 +0900
X-Gm-Features: AS18NWCEyuCHZIpU7SrNZx8NcIlX4L1PUd6TIgX19YtqAD1qcnlXST6ezEgtQQc
Message-ID: <CABxCQKvvjcapsW3rs3JUMGM6FCppojC-sJxnZBZcrL=rfw92Mg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap
 enable/disable support
To: Hans de Goede <hansg@kernel.org>
Cc: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, ilpo.jarvinen@linux.intel.com, 
	derekjohn.clark@gmail.com, mpearson-lenovo@squebb.ca, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thank you so much for your review.
Sorry for the delay in response.

On Thu, Sep 18, 2025 at 4:31=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi Vishnu,
>
> On 18-Sep-25 4:37 AM, Vishnu Sankar wrote:
> > Hello all,
> >
> > Do we have any questions or concerns?
> > Thanks in advance!
> >
> > On Mon, Sep 1, 2025 at 10:53=E2=80=AFPM Vishnu Sankar <vishnuocv@gmail.=
com> wrote:
> >>
> >> Add support for enabling and disabling doubletap on TrackPoint devices
> >> that support this functionality. The feature is detected using firmwar=
e
> >> ID and exposed via sysfs as `doubletap_enabled`.
>
> Hmm, you seem to be using a firmware ID prefix match, combined with
> a deny list of some firmware IDs with that prefix which do not support
> this. How do we know this deny list is complete?
We confirmed with the Lenovo product team, and this is what they
recommended using. Internal Documentation has listed these as the only
ID's that don't have double-tap support. And the trackpoint CO
confirmed that all future trackpoints will support the double-tap
feature.
>
> Also as Dmitry says you really should use the is_visible() callback
> to not show the attribute at all on unsupported systems.
Understood.
>
> >> The feature is only available on newer ThinkPads (2023 and later).The =
driver
> >> exposes this capability via a new sysfs attribute:
> >> "/sys/bus/serio/devices/seriox/doubletap_enabled".
> >>
> >> The attribute is only created if the device is detected to be capable =
of
> >> doubletap via firmware and variant ID checks. This functionality will =
be
> >> used by platform drivers such as thinkpad_acpi to expose and control d=
oubletap
> >> via user interfaces.
>
> Hmm, you refer to thinkpad_acpi as a possible consumer of this
> functionality. But you only add a sysfs interface.
>
> thinkpad_acpi will need some in kernel interface to use this.
>
This was what I understood from the review of v1 of the patch, to just
use sysfs in thinkpad_acpi.
I'm sorry if my understanding was incorrect.

> Which brings me to my main question: thinkpad_acpi is the driver
> receiving the doubletap events since these are send out-of-bound
> and not through the ps/2 trackpoint protocol.
>
> thinkpad_acpi already has the capability to filter out these doubletap
> events and report nothing. Why is it necessary / better to disable
> the doubletap at the trackpoint fw-level, rather then just filtering
> it at the thinkpad_acpi level ?
On Windows, Lenovo=E2=80=99s driver toggles the firmware register (fn + G)
rather than just filtering in software. We thought that exposing the
same mechanism in Linux ensures consistent behavior across operating
systems.
>
> I don't really see a big advantage in filtering these events at
> the fw-level rather then in the kernel and we already have the
> in kernel filtering.
understood
>
> Since this is highly ThinkPad specific it seems that the current
> handling in thinkpad_acpi also logically is the best place to
> handle this.
Originally, when this feature was provided, it was enabled by default,
so nothing extra was needed to use it.
With new ThinkPads, it is disabled by default, and we need to change
the setting in the trackpoint registers.
In doing this, we thought it was better to make this enable/disable
use the register (Similar to Windows), but we understood that we can
just enable it and handle the masking/unmasking in thinkpad_acpi. This
will make it easier and not require communication between the drivers.
>
> What new use-cases if any does this enable?
Allows users to use the trackpoint doubletap as an input for whatever
they want. It's an HW feature, and we're trying to make sure Linux
users can access the same features that Windows (Quick launch) has.
>
> If you e.g. want some Lenovo specific control-panel GUI to
> enable/disable this, why not expose the existing filtering
> in thinkpad_acpi (which is hotkey controller only atm)
> in sysfs through thinkpad_acpi ?
>
No, we just want it to be enabled and usable by default for now.
The register needs to be set for the hotkey enable/disable to work.

> If we go the route of using the trackpoint fw-level filtering
> as is done in this patch, then IMHO we really also should
> make the existing code in thinkpad_acpi:
>
> static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
> {
>         switch (hkey) {
>         case TP_HKEY_EV_TRACK_DOUBLETAP:
>                 if (tp_features.trackpoint_doubletap)
>                         tpacpi_input_send_key(hkey, send_acpi_ev);
>
>                 return true;
>         default:
>                 return false;
>         }
> }
>
> static bool tpacpi_driver_event(const unsigned int hkey_event)
> {
>         ...
>         case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>                 tp_features.trackpoint_doubletap =3D !tp_features.trackpo=
int_doubletap;
>                 return true;
>         ...
> }
>
> Also use the fw-level filtering rather then having 2 different
> filters/enable-flags active with events only coming through if
> both let them through.
>
> But making the thinkpad_acpi code use the fw-level filtering
> will require some sort of in kernel API for this which is
> going to be tricky since these are 2 completely different
> subsystems ...
>
> So to me it seems KISS to just stick with the existing thinkpad_acpi
> level filtering.
Understood.
>
> TL;DR:
> - What use-cases does this new code enable ?
Enables the trackpoint doubletap so it works by default.
> - Why can't those use-cases be implemented with
>   the thinkpad_acpi level filtering?
As mentioned earlier, this feature is off by default.
It needs to be enabled before we get the enable/disable hotkeys.

>
>
> Regards,
>
> Hans
>
>
>
>
>
>
> >>
> >> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> >> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> ---
> >> Changes in v2:
> >> - Improve commit messages
> >> - Sysfs attributes moved to trackpoint.c
> >> - Removed unnecessary comments
> >> - Removed unnecessary debug messages
> >> - Using strstarts() instead of strcmp()
> >> - is_trackpoint_dt_capable() modified
> >> - Removed _BIT suffix and used BIT() define.
> >> - Reverse the trackpoint_doubletap_status() logic to return error firs=
t.
> >> - Removed export functions as a result of the design change
> >> - Changed trackpoint_dev->psmouse to parent_psmouse
> >> - The path of trackpoint.h is not changed.
> >> Changes in v3:
> >> - No changes.
> >> ---
> >>  drivers/input/mouse/trackpoint.c | 149 ++++++++++++++++++++++++++++++=
+
> >>  drivers/input/mouse/trackpoint.h |  15 ++++
> >>  2 files changed, 164 insertions(+)
> >>
> >> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/tr=
ackpoint.c
> >> index 5f6643b69a2c..c6f17b0dec3a 100644
> >> --- a/drivers/input/mouse/trackpoint.c
> >> +++ b/drivers/input/mouse/trackpoint.c
> >> @@ -16,6 +16,8 @@
> >>  #include "psmouse.h"
> >>  #include "trackpoint.h"
> >>
> >> +static struct trackpoint_data *trackpoint_dev;
> >> +
> >>  static const char * const trackpoint_variants[] =3D {
> >>         [TP_VARIANT_IBM]                =3D "IBM",
> >>         [TP_VARIANT_ALPS]               =3D "ALPS",
> >> @@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, =
u8 loc, u8 val)
> >>         return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAN=
D));
> >>  }
> >>
> >> +/* Read function for TrackPoint extended registers */
> >> +static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8=
 *val)
> >> +{
> >> +       u8 ext_param[2] =3D {TP_READ_MEM, loc};
> >> +       int error;
> >> +
> >> +       error =3D ps2_command(ps2dev,
> >> +                           ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND))=
;
> >> +
> >> +       if (!error)
> >> +               *val =3D ext_param[0];
> >> +
> >> +       return error;
> >> +}
> >> +
> >>  static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 ma=
sk)
> >>  {
> >>         u8 param[3] =3D { TP_TOGGLE, loc, mask };
> >> @@ -393,6 +410,131 @@ static int trackpoint_reconnect(struct psmouse *=
psmouse)
> >>         return 0;
> >>  }
> >>
> >> +/* List of known incapable device PNP IDs */
> >> +static const char * const dt_incompatible_devices[] =3D {
> >> +       "LEN0304",
> >> +       "LEN0306",
> >> +       "LEN0317",
> >> +       "LEN031A",
> >> +       "LEN031B",
> >> +       "LEN031C",
> >> +       "LEN031D",
> >> +};
> >> +
> >> +/*
> >> + * checks if it=E2=80=99s a doubletap capable device
> >> + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
> >> + */
> >> +static bool is_trackpoint_dt_capable(const char *pnp_id)
> >> +{
> >> +       const char *id_start;
> >> +       char id[8];
> >> +
> >> +       if (!strstarts(pnp_id, "PNP: LEN03"))
> >> +               return false;
> >> +
> >> +       /* Points to "LEN03xxxx" */
> >> +       id_start =3D pnp_id + 5;
> >> +       if (sscanf(id_start, "%7s", id) !=3D 1)
> >> +               return false;
> >> +
> >> +       /* Check if it's blacklisted */
> >> +       for (size_t i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); =
++i) {
> >> +               if (strcmp(id, dt_incompatible_devices[i]) =3D=3D 0)
> >> +                       return false;
> >> +       }
> >> +       return true;
> >> +}
> >> +
> >> +/* Trackpoint doubletap status function */
> >> +static int trackpoint_doubletap_status(bool *status)
> >> +{
> >> +       struct trackpoint_data *tp =3D trackpoint_dev;
> >> +       struct ps2dev *ps2dev =3D &tp->parent_psmouse->ps2dev;
> >> +       u8 reg_val;
> >> +       int rc;
> >> +
> >> +       /* Reading the Doubletap register using extended read */
> >> +       rc =3D trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val=
);
> >> +       if (rc)
> >> +               return rc;
> >> +
> >> +       *status =3D reg_val & TP_DOUBLETAP_STATUS ? true : false;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +/* Trackpoint doubletap enable/disable function */
> >> +static int trackpoint_set_doubletap(bool enable)
> >> +{
> >> +       struct trackpoint_data *tp =3D trackpoint_dev;
> >> +       struct ps2dev *ps2dev =3D &tp->parent_psmouse->ps2dev;
> >> +       static u8 doubletap_state;
> >> +       u8 new_val;
> >> +
> >> +       if (!tp)
> >> +               return -ENODEV;
> >> +
> >> +       new_val =3D enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABL=
E;
> >> +
> >> +       if (doubletap_state =3D=3D new_val)
> >> +               return 0;
> >> +
> >> +       doubletap_state =3D new_val;
> >> +
> >> +       return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
> >> +}
> >> +
> >> +/*
> >> + * Trackpoint Doubletap Interface
> >> + * Control/Monitoring of Trackpoint Doubletap from:
> >> + * /sys/bus/serio/devices/seriox/doubletap_enabled
> >> + */
> >> +static ssize_t doubletap_enabled_show(struct device *dev,
> >> +                               struct device_attribute *attr, char *b=
uf)
> >> +{
> >> +       struct serio *serio =3D to_serio_port(dev);
> >> +       struct psmouse *psmouse =3D psmouse_from_serio(serio);
> >> +       struct trackpoint_data *tp =3D psmouse->private;
> >> +       bool status;
> >> +       int rc;
> >> +
> >> +       if (!tp || !tp->doubletap_capable)
> >> +               return -ENODEV;
> >> +
> >> +       rc =3D trackpoint_doubletap_status(&status);
> >> +       if (rc)
> >> +               return rc;
> >> +
> >> +       return sysfs_emit(buf, "%d\n", status ? 1 : 0);
> >> +}
> >> +
> >> +static ssize_t doubletap_enabled_store(struct device *dev,
> >> +                                       struct device_attribute *attr,
> >> +                                       const char *buf, size_t count)
> >> +{
> >> +       struct serio *serio =3D to_serio_port(dev);
> >> +       struct psmouse *psmouse =3D psmouse_from_serio(serio);
> >> +       struct trackpoint_data *tp =3D psmouse->private;
> >> +       bool enable;
> >> +       int err;
> >> +
> >> +       if (!tp || !tp->doubletap_capable)
> >> +               return -ENODEV;
> >> +
> >> +       err =3D kstrtobool(buf, &enable);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       err =3D trackpoint_set_doubletap(enable);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       return count;
> >> +}
> >> +
> >> +static DEVICE_ATTR_RW(doubletap_enabled);
> >> +
> >>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
> >>  {
> >>         struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> >> @@ -425,6 +567,9 @@ int trackpoint_detect(struct psmouse *psmouse, boo=
l set_properties)
> >>         psmouse->reconnect =3D trackpoint_reconnect;
> >>         psmouse->disconnect =3D trackpoint_disconnect;
> >>
> >> +       trackpoint_dev =3D psmouse->private;
> >> +       trackpoint_dev->parent_psmouse =3D psmouse;
> >> +
> >>         if (variant_id !=3D TP_VARIANT_IBM) {
> >>                 /* Newer variants do not support extended button query=
. */
> >>                 button_info =3D 0x33;
> >> @@ -470,6 +615,10 @@ int trackpoint_detect(struct psmouse *psmouse, bo=
ol set_properties)
> >>                      psmouse->vendor, firmware_id,
> >>                      (button_info & 0xf0) >> 4, button_info & 0x0f);
> >>
> >> +       tp->doubletap_capable =3D is_trackpoint_dt_capable(ps2dev->ser=
io->firmware_id);
> >> +       if (tp->doubletap_capable)
> >> +               device_create_file(&psmouse->ps2dev.serio->dev, &dev_a=
ttr_doubletap_enabled);
> >> +
> >>         return 0;
> >>  }
> >>
> >> diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/tr=
ackpoint.h
> >> index eb5412904fe0..256e8cb35581 100644
> >> --- a/drivers/input/mouse/trackpoint.h
> >> +++ b/drivers/input/mouse/trackpoint.h
> >> @@ -8,6 +8,8 @@
> >>  #ifndef _TRACKPOINT_H
> >>  #define _TRACKPOINT_H
> >>
> >> +#include <linux/bitops.h>
> >> +
> >>  /*
> >>   * These constants are from the TrackPoint System
> >>   * Engineering documentation Version 4 from IBM Watson
> >> @@ -69,6 +71,8 @@
> >>                                         /* (how hard it is to drag */
> >>                                         /* with Z-axis pressed) */
> >>
> >> +#define TP_DOUBLETAP           0x58    /* TrackPoint doubletap regist=
er */
> >> +
> >>  #define TP_MINDRAG             0x59    /* Minimum amount of force nee=
ded */
> >>                                         /* to trigger dragging */
> >>
> >> @@ -139,6 +143,14 @@
> >>  #define TP_DEF_TWOHAND         0x00
> >>  #define TP_DEF_SOURCE_TAG      0x00
> >>
> >> +/* Doubletap register values */
> >> +#define TP_DOUBLETAP_ENABLE    0xFF    /* Enable value */
> >> +#define TP_DOUBLETAP_DISABLE   0xFE    /* Disable value */
> >> +
> >> +#define TP_DOUBLETAP_STATUS_BIT 0      /* 0th bit defines enable/disa=
ble */
> >> +
> >> +#define TP_DOUBLETAP_STATUS   BIT(TP_DOUBLETAP_STATUS_BIT)
> >> +
> >>  #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<=
8) | (cmd))
> >>
> >>  struct trackpoint_data {
> >> @@ -150,11 +162,14 @@ struct trackpoint_data {
> >>         u8 thresh, upthresh;
> >>         u8 ztime, jenks;
> >>         u8 drift_time;
> >> +       bool doubletap_capable;
> >>
> >>         /* toggles */
> >>         bool press_to_select;
> >>         bool skipback;
> >>         bool ext_dev;
> >> +
> >> +       struct psmouse *parent_psmouse;
> >>  };
> >>
> >>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
> >> --
> >> 2.48.1
> >>
> >
> >
>


--

Regards,

      Vishnu Sankar
     +817015150407 (Japan)


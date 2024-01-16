Return-Path: <linux-input+bounces-1265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A982EFC6
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 14:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DBB284870
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 13:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00251BDC3;
	Tue, 16 Jan 2024 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="uKXCkENf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04731BDC2
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1705411961; x=1705671161;
	bh=OO/DkqT772YDQtwR8RaCKjkqx3kPH5xxaQGQQMyd2Jo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uKXCkENf4AqhkwInUqeaaLafx8NfJTHphKEq5i/npFfnsjWu0QX1DuP28wXmLNMqH
	 Do+MHvcNFFi5U2cKTTHP+FVJvC5ZdVVkYwUW0HpDsPSYJLbPtG1PZYEvBXrSDzDGYV
	 y4Vg9aZ8gI1EbSSjeocqFlY4/j6CWHBV2wXjp6FNqfpuveb3THxnWkuKvVCbJRUczQ
	 gsJ3a6VYJvIcuBLSqCkjC7Q/KZDYYdGTwdZHqlDaHhnXVZVeAU14q0yT/vQ9IyWy74
	 9HP9whMk4VkcoSL2H7EORm1vr3s4lftpuTZroohxtESpjyFnq6qXCQLmfuBYaZ+cQk
	 H/WJgaRPbw+ZA==
Date: Tue, 16 Jan 2024 13:32:30 +0000
To: Hans de Goede <hdegoede@redhat.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>, gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>, Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
In-Reply-To: <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
References: <20231115174625.7462-1-hdegoede@redhat.com> <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com> <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
Feedback-ID: 20568564:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi


2024. janu=C3=A1r 16., kedd 10:34 keltez=C3=A9ssel, Hans de Goede =C3=ADrta=
:

> [...]
> > 2023. november 15., szerda 18:46 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:
> >
> >> There have been multiple reports of keyboard issues on recent laptop m=
odels
> >> which can be worked around by setting i8042.dumbkbd, with the downside
> >> being this breaks the capslock LED.
> >>
> >> It seems that these issues are caused by recent laptops getting confus=
ed by
> >> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks=
 for
> >> this, just skip ATKBD_CMD_GETID alltogether on laptops in translated m=
ode.
> >>
> >> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
> >> mice/touchpads and those are never used in translated mode.
> >>
> >> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
> >>
> >> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2=
xxx"
> >>   models the kbd stops working for the first 2 - 5 minutes after boot
> >>   (waiting for EC watchdog reset?)
> >>
> >> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
> >>
> >> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID,=
 see:
> >>   https://github.com/yescallop/atkbd-nogetid
> >>
> >> This has been tested on:
> >>
> >> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
> >>    in translated mode when no keyboard is plugged in and with a ps/2 k=
bd
> >>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
> >>
> >> 2. A Lenovo ThinkPad X1 Yoga gen 8 (always has a translated set 2 keyb=
oard)
> >
> > Just wanted to briefly mention that this broke my hwdb configuration be=
cause the
> > version field of the device (as shown in `/proc/bus/input/devices`) has=
 changed
> > and it was included in the hwdb match rule.
>=20
> That is unfortunate. Was this a custom rule or one from
> the hwdb shipped with systemd ?
>=20
> Either way can you share the match pattern of the rule before and
> after? I want to check if there are any similar cases in
> the hwdb shipped with systemd.
> [...]

It was a custom rule.

Before:

evdev:input:b0011v0001p0001eAB83*
 KEYBOARD_KEY_f8=3Dfn
 KEYBOARD_KEY_76=3Df21

I: Bus=3D0011 Vendor=3D0001 Product=3D0001 Version=3Dab83
N: Name=3D"AT Translated Set 2 keyboard"
P: Phys=3Disa0060/serio0/input0
S: Sysfs=3D/devices/platform/i8042/serio0/input/input4


After:

evdev:input:b0011v0001p0001*
 KEYBOARD_KEY_f8=3Dfn
 KEYBOARD_KEY_76=3Df21

I: Bus=3D0011 Vendor=3D0001 Product=3D0001 Version=3Dabba
N: Name=3D"AT Translated Set 2 keyboard"
P: Phys=3Disa0060/serio0/input0
S: Sysfs=3D/devices/platform/i8042/serio0/input/input4


Regards,
Barnab=C3=A1s P=C5=91cze


>=20
>=20
> >> Reported-by: Shang Ye <yesh25@mail2.sysu.edu.cn>
> >> Closes: https://lore.kernel.org/linux-input/886D6167733841AE+202310171=
35318.11142-1-yesh25@mail2.sysu.edu.cn/
> >> Closes: https://github.com/yescallop/atkbd-nogetid
> >> Reported-by: gurevitch <mail@gurevit.ch>
> >> Closes: https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxv=
sink6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrg=
PigzVo=3D@gurevit.ch/
> >> Reported-by: Egor Ignatov <egori@altlinux.org>
> >> Closes: https://lore.kernel.org/all/20210609073333.8425-1-egori@altlin=
ux.org/
> >> Reported-by: Anton Zhilyaev <anton@cpp.in>
> >> Closes: https://lore.kernel.org/linux-input/20210201160336.16008-1-ant=
on@cpp.in/
> >> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2086156
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Note this supersedes my previous atkbd series:
> >> https://lore.kernel.org/linux-input/20231005201544.26983-1-hdegoede@re=
dhat.com/
> >> ---
> >> Changes in v2:
> >> - Add DMI check for laptop chassis types and only skip ATKBD_CMD_GETID
> >>   on laptops with the i8042 in translated mode
> >> ---
> >>  drivers/input/keyboard/atkbd.c | 61 +++++++++++++++++++++++++++++++--=
-
> >>  1 file changed, 57 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/a=
tkbd.c
> >> index c92e544c792d..5667f1e80839 100644
> >> --- a/drivers/input/keyboard/atkbd.c
> >> +++ b/drivers/input/keyboard/atkbd.c
> >> @@ -765,6 +765,59 @@ static void atkbd_deactivate(struct atkbd *atkbd)
> >>  =09=09=09ps2dev->serio->phys);
> >>  }
> >>
> >> +#ifdef CONFIG_X86
> >> +static const struct dmi_system_id atkbd_dmi_laptop_table[] =3D {
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
> >> +=09=09},
> >> +=09},
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
> >> +=09=09},
> >> +=09},
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> >> +=09=09},
> >> +=09},
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
> >> +=09=09},
> >> +=09},
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
> >> +=09=09},
> >> +=09},
> >> +=09{
> >> +=09=09.matches =3D {
> >> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
> >> +=09=09},
> >> +=09},
> >> +=09{ }
> >> +};
> >> +
> >> +/*
> >> + * On many modern laptops ATKBD_CMD_GETID may cause problems, on thes=
e laptops
> >> + * the controller is always in translated mode. In this mode mice/tou=
chpads will
> >> + * not work. So in this case simply assume a keyboard is connected to=
 avoid
> >> + * confusing some laptop keyboards.
> >> + *
> >> + * Skipping ATKBD_CMD_GETID ends up using a fake keyboard id. Using a=
 fake id is
> >> + * ok in translated mode, only atkbd_select_set() checks atkbd->id an=
d in
> >> + * translated mode that is a no-op.
> >> + */
> >> +static bool atkbd_skip_getid(struct atkbd *atkbd)
> >> +{
> >> +=09return atkbd->translated && dmi_check_system(atkbd_dmi_laptop_tabl=
e);
> >> +}
> >> +#else
> >> +static inline bool atkbd_skip_getid(struct atkbd *atkbd) { return fal=
se; }
> >> +#endif
> >> +
> >>  /*
> >>   * atkbd_probe() probes for an AT keyboard on a serio port.
> >>   */
> >> @@ -794,12 +847,12 @@ static int atkbd_probe(struct atkbd *atkbd)
> >>   */
> >>
> >>  =09param[0] =3D param[1] =3D 0xa5;=09/* initialize with invalid value=
s */
> >> -=09if (ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
> >> +=09if (atkbd_skip_getid(atkbd) || ps2_command(ps2dev, param, ATKBD_CM=
D_GETID)) {
> >>
> >>  /*
> >> - * If the get ID command failed, we check if we can at least set the =
LEDs on
> >> - * the keyboard. This should work on every keyboard out there. It als=
o turns
> >> - * the LEDs off, which we want anyway.
> >> + * If the get ID command was skipped or failed, we check if we can at=
 least set
> >> + * the LEDs on the keyboard. This should work on every keyboard out t=
here.
> >> + * It also turns the LEDs off, which we want anyway.
> >>   */
> >>  =09=09param[0] =3D 0;
> >>  =09=09if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
> >> --
> >> 2.41.0
> >>
> >
> 


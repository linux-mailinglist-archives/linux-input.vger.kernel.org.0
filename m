Return-Path: <linux-input+bounces-1257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736182E565
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 01:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305DF1F22F30
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 00:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0643136F;
	Tue, 16 Jan 2024 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="G0yoiifn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055C1369
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 00:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1705364494; x=1705623694;
	bh=CnKPzPBhiSSLiUij8XrslKt2FLwdf1/fVdJZitHo6Nc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=G0yoiifnTxF5fef7oNNI7F1xTI2+BIg4Mu4318EN9vgUQqDs6HHXnA/E7ZRlJnuwg
	 99yn09ioPfB+1ymGrOZVEuSQfBJ6kxnlFPUpN290lfhV3XR0lGw4Y5htcIEnvU82ym
	 bmILa8AKt7uLx6BoJxr19vGdkyTIOcK7e/bc/6UyLnzwDH4+Qtc75eqbfgJiOgHAmU
	 My9X5A53gIjDLJU7quioRv6pgwf6PWLuf+njy+ZCsszDU6sjdgl8fGT1ifhxnLdUZL
	 ncysp2NELpU1KXChcKJhUowEfTHQm+nREW/zLo4YqEnY0ovcamoq0w6XQ8+DRbZPMg
	 GbwEKXBp14lSA==
Date: Tue, 16 Jan 2024 00:21:14 +0000
To: Hans de Goede <hdegoede@redhat.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>, gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>, Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
In-Reply-To: <20231115174625.7462-1-hdegoede@redhat.com>
References: <20231115174625.7462-1-hdegoede@redhat.com>
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


2023. november 15., szerda 18:46 keltez=C3=A9ssel, Hans de Goede =C3=ADrta:

> There have been multiple reports of keyboard issues on recent laptop mode=
ls
> which can be worked around by setting i8042.dumbkbd, with the downside
> being this breaks the capslock LED.
>=20
> It seems that these issues are caused by recent laptops getting confused =
by
> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks fo=
r
> this, just skip ATKBD_CMD_GETID alltogether on laptops in translated mode=
.
>=20
> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
> mice/touchpads and those are never used in translated mode.
>=20
> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
>=20
> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx=
"
>   models the kbd stops working for the first 2 - 5 minutes after boot
>   (waiting for EC watchdog reset?)
>=20
> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
>=20
> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, se=
e:
>   https://github.com/yescallop/atkbd-nogetid
>=20
> This has been tested on:
>=20
> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
>=20
> 2. A Lenovo ThinkPad X1 Yoga gen 8 (always has a translated set 2 keyboar=
d)

Just wanted to briefly mention that this broke my hwdb configuration becaus=
e the
version field of the device (as shown in `/proc/bus/input/devices`) has cha=
nged
and it was included in the hwdb match rule.


Regards,
Barnab=C3=A1s P=C5=91cze


>=20
> Reported-by: Shang Ye <yesh25@mail2.sysu.edu.cn>
> Closes: https://lore.kernel.org/linux-input/886D6167733841AE+202310171353=
18.11142-1-yesh25@mail2.sysu.edu.cn/
> Closes: https://github.com/yescallop/atkbd-nogetid
> Reported-by: gurevitch <mail@gurevit.ch>
> Closes: https://lore.kernel.org/linux-input/2iAJTwqZV6lQs26cTb38RNYqxvsin=
k6SRmrZ5h0cBUSuf9NT0tZTsf9fEAbbto2maavHJEOP8GA1evlKa6xjKOsaskDhtJWxjcnrgPig=
zVo=3D@gurevit.ch/
> Reported-by: Egor Ignatov <egori@altlinux.org>
> Closes: https://lore.kernel.org/all/20210609073333.8425-1-egori@altlinux.=
org/
> Reported-by: Anton Zhilyaev <anton@cpp.in>
> Closes: https://lore.kernel.org/linux-input/20210201160336.16008-1-anton@=
cpp.in/
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2086156
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note this supersedes my previous atkbd series:
> https://lore.kernel.org/linux-input/20231005201544.26983-1-hdegoede@redha=
t.com/
> ---
> Changes in v2:
> - Add DMI check for laptop chassis types and only skip ATKBD_CMD_GETID
>   on laptops with the i8042 in translated mode
> ---
>  drivers/input/keyboard/atkbd.c | 61 +++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkb=
d.c
> index c92e544c792d..5667f1e80839 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -765,6 +765,59 @@ static void atkbd_deactivate(struct atkbd *atkbd)
>  =09=09=09ps2dev->serio->phys);
>  }
>=20
> +#ifdef CONFIG_X86
> +static const struct dmi_system_id atkbd_dmi_laptop_table[] =3D {
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
> +=09=09},
> +=09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
> +=09=09},
> +=09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
> +=09=09},
> +=09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
> +=09=09},
> +=09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible */
> +=09=09},
> +=09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32"), /* Detachable */
> +=09=09},
> +=09},
> +=09{ }
> +};
> +
> +/*
> + * On many modern laptops ATKBD_CMD_GETID may cause problems, on these l=
aptops
> + * the controller is always in translated mode. In this mode mice/touchp=
ads will
> + * not work. So in this case simply assume a keyboard is connected to av=
oid
> + * confusing some laptop keyboards.
> + *
> + * Skipping ATKBD_CMD_GETID ends up using a fake keyboard id. Using a fa=
ke id is
> + * ok in translated mode, only atkbd_select_set() checks atkbd->id and i=
n
> + * translated mode that is a no-op.
> + */
> +static bool atkbd_skip_getid(struct atkbd *atkbd)
> +{
> +=09return atkbd->translated && dmi_check_system(atkbd_dmi_laptop_table);
> +}
> +#else
> +static inline bool atkbd_skip_getid(struct atkbd *atkbd) { return false;=
 }
> +#endif
> +
>  /*
>   * atkbd_probe() probes for an AT keyboard on a serio port.
>   */
> @@ -794,12 +847,12 @@ static int atkbd_probe(struct atkbd *atkbd)
>   */
>=20
>  =09param[0] =3D param[1] =3D 0xa5;=09/* initialize with invalid values *=
/
> -=09if (ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
> +=09if (atkbd_skip_getid(atkbd) || ps2_command(ps2dev, param, ATKBD_CMD_G=
ETID)) {
>=20
>  /*
> - * If the get ID command failed, we check if we can at least set the LED=
s on
> - * the keyboard. This should work on every keyboard out there. It also t=
urns
> - * the LEDs off, which we want anyway.
> + * If the get ID command was skipped or failed, we check if we can at le=
ast set
> + * the LEDs on the keyboard. This should work on every keyboard out ther=
e.
> + * It also turns the LEDs off, which we want anyway.
>   */
>  =09=09param[0] =3D 0;
>  =09=09if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
> --
> 2.41.0
> 


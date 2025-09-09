Return-Path: <linux-input+bounces-14574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6EB508D6
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 00:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2D344E7D43
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 22:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB26726F299;
	Tue,  9 Sep 2025 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="H0KM1Mr5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52731263F44
	for <linux-input@vger.kernel.org>; Tue,  9 Sep 2025 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757456628; cv=none; b=IN8TKDVMUXL++ybC9vvUXQ5HY1gO7R1bXhgyd05f3CqfH+zGe1MvQ1RgfQFvWy0pmzjFarn3GrFz3bMpRQFQ0GIvwoqNafT4yMafrAJgiyK2ZkzSWPIaSHG/7nDLB2j2R5FVerVqBC7Sw0+gl2rLmzQii2KOQ21cBfN2tstgmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757456628; c=relaxed/simple;
	bh=AHI2DhsoWhw5e+hheRckgEVJS7ZKwtGu19y/nsU0NPI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRceuVDJ2+70ms5KNrNTpRkItwDxgGnAD8pSHP+KSvKIDRXllteJlP8hzxbKC8HXAoVrg/ZB4NqFovUwkLL+B1EzQWw+rAwf8/pWZGXH4aAwSVJ5LF7Rz+62XVlv095VoKDBguheT0VZPyMFB61GlZ7rBfAl+QowPyN2W6bMG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=H0KM1Mr5; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757456624; x=1757715824;
	bh=0bVk7lVxrH4dY/IaAvQnWMgUbAA6DzhY6yfzh+EgDPs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H0KM1Mr51cjny2aoFhz+iumpIM6INreUpUQZoCI0hURCnjUUuRuJxcPylMqJdVV5a
	 K7vUUbTIhk77YMbW8KemRueb+Ye/y4+VOQvuxSbFlsf1Lj08prWbD8lS+ubPjEPMiC
	 +sdBpGgfolTvsH8OgjNBNWZfBIn+SHG2T8q324BO8PSC9Zcd0D5sZ3ucfDQwMPsUmX
	 l1Azg7qgQqbW3hUTtCNGjjvZ3yt63dqBY3gS9oJ0LerNQD0oQmGlxH94RZIkGBvsZI
	 e2fPthJKd1lmurDYZ5rikp+JD31z1vTJ3yuDXIfUJe4ZKMmMl4l4qlY69v0M7cmv5r
	 hjnWU7mpoetOw==
Date: Tue, 09 Sep 2025 22:23:40 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com>
In-Reply-To: <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com> <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com> <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com> <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com> <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 65e404b6906c6563c627f71f87e479cd0131aec8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-09-09 02.59, Stuart wrote:
> What does logitech-dj do differently to the generic HID driver around the=
 LEDs?
> The caps lock LED works perfectly fine with the generic driver.
>=20
> If that goes nowhere, surely I could do a packet capture from Linux, with=
 and
> without the logitech-dj driver active?
>=20
> Stuart

Since the first diff you tested was supposed to send the exact same=20
report as the generic hid driver, I incorrectly came to the conclusion=20
that the Logitech kernel driver must be doing something different.

Turns out the report ID was being forced to 0 when it should have been 1.

Can you try applying the following?

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 00a975b70f59..9b3b00d69079 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -78,6 +78,7 @@
 #define REPORT_TYPE_SYSTEM_CONTROL=09=090x04
 #define REPORT_TYPE_MEDIA_CENTER=09=090x08
 #define REPORT_TYPE_LEDS=09=09=090x0E
+#define REPORT_TYPE_LEDS_LIGHTSPEED=09=090x01
=20
 /* RF Report types bitfield */
 #define STD_KEYBOARD=09=09=09=09BIT(1)
@@ -1455,16 +1456,28 @@ static int logi_dj_ll_raw_request(struct hid_device=
 *hid,
 =09=09=09=09count, report_type, reqtype);
 =09}
=20
-=09if (buf[0] !=3D REPORT_TYPE_LEDS)
-=09=09return -EINVAL;
+=09/* This Lightspeed receiver type uses a different LED report ID */
+=09if (djrcv_dev->type =3D=3D recvr_type_gaming_hidpp_ls_1_3) {
+=09=09if (buf[0] !=3D REPORT_TYPE_LEDS_LIGHTSPEED)
+=09=09=09return -EINVAL;
+=09} else {
+=09=09if (buf[0] !=3D REPORT_TYPE_LEDS)
+=09=09=09return -EINVAL;
+=09}
=20
 =09if (djrcv_dev->type !=3D recvr_type_dj && count >=3D 2) {
+=09=09unsigned char reportnum_led =3D 0;
 =09=09if (!djrcv_dev->keyboard) {
 =09=09=09hid_warn(hid, "Received REPORT_TYPE_LEDS request before the keybo=
ard interface was enumerated\n");
 =09=09=09return 0;
 =09=09}
+
+=09=09/* This Lightspeed receiver expects LED reports with the ID defined =
in the HID descriptor */
+=09=09if (djrcv_dev->type =3D=3D recvr_type_gaming_hidpp_ls_1_3)
+=09=09=09reportnum_led =3D reportnum;
+
 =09=09/* usbhid overrides the report ID and ignores the first byte */
-=09=09return hid_hw_raw_request(djrcv_dev->keyboard, 0, buf, count,
+=09=09return hid_hw_raw_request(djrcv_dev->keyboard, reportnum_led, buf, c=
ount,
 =09=09=09=09=09  report_type, reqtype);
 =09}
=20




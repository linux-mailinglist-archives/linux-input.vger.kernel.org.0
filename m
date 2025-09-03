Return-Path: <linux-input+bounces-14468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600FB429F9
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 21:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D8AE16300B
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 19:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242922D5939;
	Wed,  3 Sep 2025 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="p+kSq77h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A782C18A
	for <linux-input@vger.kernel.org>; Wed,  3 Sep 2025 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756928055; cv=none; b=HWEdd/OXCka/nYqdFrbCgDyBbO2aeuUvWjaR3lncTHmfLv25zfPU4JPQnvLBycqDvLoy/xh30rGpkKlZOqfdOubgmFWWTKTKXzp7TDaD1aGvlHePru08P3ozOiFsxab/1DoYFiypbDXgdtxfLbDztR4Rpj/m+Nu9CoVce9tNDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756928055; c=relaxed/simple;
	bh=9XHuezUHvJ0P7PQPtbC0pZAOfqVhwgAHck/dhw7vtjY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7uVt4Uq5r5VNnnj/Tfk6JeHcjjIdPRMu6W3NKf5h8vMNn374TK8n9jK1UmsAeNkjzAbke/UJMTk+ow2eNNXrVxTUJTDklJwnmJ358bw57bVLglE08YC7s5+jjl/rcduQlG6kK/ZbbD6dDKCKv1qCeoq3xokzuqLvI6rZGJclRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=p+kSq77h; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1756928044; x=1757187244;
	bh=nSn+BZo5jf1VepBPGCuX+RAOzH5Ki1ujsXmT5fxEA5I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p+kSq77h8JQcUe7KsTNwy5V0byeRsseTO3Gd88Pz78tyhzp4IKZRb0Gahb+lN/sWI
	 ouoDkMLtQ55w7Io1OQMZe7GaxnK0nB3QHpmYIivO6tebw3ettGBH4tNs9H2JL3zqjQ
	 a2ZjYUcKcoONhpbdiHoRmRgn5DbtZcxpGoapxY/j0N1dGtHVbRD84zVAFlT474iRj2
	 HTwhQMLckU0X5vrH+HGKBOocwhmUboMmrzJzXuq6nZMbTvHQmoWd0N0tVdIkq1m5/W
	 JCqgxoedjRfVZhWuK5nhDnrrryivvX1H6LHGhRCyIh8PmTx2GoKkc/HhMw3A3rhalz
	 4fIo6XYG0ECsg==
Date: Wed, 03 Sep 2025 19:34:01 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com>
In-Reply-To: <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com> <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 045150d0fda9840451a60d05f639ef2110997f77
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>> Thanks for taking the time to test it.
>=20
> No problem, I had a go at this a few years ago and had the same issue
> with my patches.
> I did email the last Logitech contact I could find associated with the
> driver, but he seems to have moved to a different part of the company.
>=20
>> Is your product id the same as the one in the patch or are you modifying
>> it before compiling?
>=20
> No modifications, it's 046d:c547

Awesome, thanks!

>=20
>> Can you please dump the HID descriptors from your receiver
>> (sudo usbhid-dump -m 046d:c547) and share them?
>=20
> Sure (hoping this doesn't get mangled):
>=20
> 001:003:002:DESCRIPTOR         1756919882.495801
>  06 00 FF 09 01 A1 01 85 10 95 06 75 08 15 00 26
>  FF 00 09 01 81 00 09 01 91 00 C0 06 00 FF 09 02
>  A1 01 85 11 95 13 75 08 15 00 26 FF 00 09 02 81
>  00 09 02 91 00 C0
>=20
> 001:003:001:DESCRIPTOR         1756919882.500790
>  05 01 09 06 A1 01 85 01 05 07 19 E0 29 E7 15 00
>  25 01 75 01 95 08 81 02 95 05 05 08 19 01 29 05
>  91 02 95 01 75 03 91 03 95 70 75 01 05 07 19 04
>  29 73 81 02 95 05 19 87 29 8B 81 02 95 03 19 90
>  29 92 81 02 C0 05 0C 09 01 A1 01 85 03 95 02 75
>  10 15 01 26 FF 02 19 01 2A FF 02 81 00 C0 05 01
>  09 80 A1 01 85 04 95 01 75 02 15 01 25 03 09 82
>  09 81 09 83 81 00 75 01 15 00 25 01 09 9B 81 06
>  75 05 81 03 C0
>=20
> 001:003:000:DESCRIPTOR         1756919882.504793
>  05 01 09 02 A1 01 09 01 A1 00 95 10 75 01 15 00
>  25 01 05 09 19 01 29 10 81 02 95 02 75 10 16 01
>  80 26 FF 7F 05 01 09 30 09 31 81 06 95 01 75 08
>  15 81 25 7F 09 38 81 06 95 01 05 0C 0A 38 02 81
>  06 C0 06 00 FF 09 F1 75 08 95 05 15 00 26 FF 00
>  81 00 C0

Alright, the HID report descriptors are identical to mine.

I looked at the descriptors again and I noticed that the report ID for
the LEDs, which was previously 14, is now 1.

Can you apply this on top of the existing changes and test again?

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 00a975b70f59..dd51492258f3 100644
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
@@ -1455,8 +1456,14 @@ static int logi_dj_ll_raw_request(struct hid_device =
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
 =09=09if (!djrcv_dev->keyboard) {





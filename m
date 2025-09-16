Return-Path: <linux-input+bounces-14759-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D0B58ED4
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 09:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E5E2A4394
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 07:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9A42E3B03;
	Tue, 16 Sep 2025 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="afb80hAA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDCD2E6125
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006572; cv=none; b=Wz/GhLmRS1I41Eadmkl6Fx8Nmp0uqQBzeWMumzmFur1y2rkcAFVhQkR/cv2O1WVAtzR4z0rUW+FYKEvZc2MBW1hgYjJl8TqGs09ZHq1dEinef9kbUywAaqMFdPHFabkdZXHLWkicKEUUMWEVjawvshViNzaJj+AuiWip77T4Xck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006572; c=relaxed/simple;
	bh=XQaaPD7oTmMkKQNVVn+Y52KiWP63QE6g5Rn+XULUbS4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ply0KyvOkOsaoyyStAsmQpBrRdpJw2CYNfqkFwK4Pykv9Owti4OYKzBgxTu7HjLfeTmxJ5h6u1S8RiUeAtr/wf0uxu9LXqCd1C62dIOC+Csz3I5N3UV/5epWEPw0gVzL/yKqNJmN7rpbZHp1KTOx+68f6O9E0+IR/x9zzZnnB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=afb80hAA; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758006561; x=1758265761;
	bh=4g9CaIFh+8nLsBuGclZnD7/w7TvUis5E87PwMMJ8k6Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=afb80hAAYM6gWDBjy5hzhC6Y18RadujaUg10LFKKJOa61zfrt6UcVWMSA5rx8ll9y
	 rJtdol/JO3W2wDbQVdGhD2K0C1D90xyALnerQepscO56CjpqsbeRLoy3tJsA8QI42B
	 9905518kZR0heHkeqFYrNiu2hZ5gKtcq0AwILLBiaLz5Rq4NfxnLVY2r/R9eZN7VL2
	 cQPBaSsWYZAwJeXWLLUasjH2HOzrUZ//4tAnK5dszPrASJ5p54aH/wHlU3oFJoGCWP
	 6XkV3WZc9vsniyn6Pcrp7aSGHYR/LeDs2MVS6Tg02hf/PGx9o2JsUNOXq/fQa9WQ5F
	 N1b3ArTg9Ae9Q==
Date: Tue, 16 Sep 2025 07:09:14 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net, benjamin.tissoires@redhat.com
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <7a4c4678-bb75-4aa7-8f4f-706deba7e72b@protonmail.com>
In-Reply-To: <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com> <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com> <CALTg27=uP+jCU7oog41GiZrw7LX_mSfrQtKbDW+xpAHzN7_6cQ@mail.gmail.com> <93bf9cfc-29ca-40e4-baef-47c5bd0e9cee@protonmail.com> <CALTg27mj+XcOmnMcH8vo5Bos+HxoWes-XW1eqfKDjnj5uqCc5w@mail.gmail.com> <cc2e6e2d-1b42-444a-9f8e-153fa898be44@protonmail.com> <CALTg27mH1rzyaNXEq7SowZcVYMiWUgejQCFgdDCHACUm9j+3SQ@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: ef374659ba9a53da50259e0e1cb427b8d2ebce5a
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-09-10 02:24, Stuart wrote:
> Yep, this on top of the v4 patch works as expected.

I'm glad to hear it.

> Thank you for getting this working.

Thank you for taking the time to test all this.

> Tested-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
>=20
> Thanks,
> Stuart

I thought about it a bit more and came up with another solution that I
believe is the correct way of approaching this. Can you also try the
following on top of v4?

Please test this one thoroughly (modifiers, lock keys, ISO backslash/
Intl keys) as I've modified the keyboard report descriptor.

If this works as well, I will submit a v5, and you can send a Tested-by
on that one.

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 00a975b70f59..6d3733dde1e8 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -226,17 +226,7 @@ static const char kbd_lightspeed_1_3_descriptor[] =3D =
{
 =090x75, 0x01,=09=09/*   Report Size (1)            */
 =090x95, 0x08,=09=09/*   Report Count (8)           */
 =090x81, 0x02,=09=09/*   Input (Data,Var)           */
-=090x95, 0x05,=09=09/*   Report Count (5)           */
-=090x05, 0x08,=09=09/*   Usage Page (LEDs)          */
-=090x19, 0x01,=09=09/*   Usage Minimum (Num Lock)   */
-=090x29, 0x05,=09=09/*   Usage Maximum (Kana)       */
-=090x91, 0x02,=09=09/*   Output (Data,Var,Abs)      */
-=090x95, 0x01,=09=09/*   Report Count (1)           */
-=090x75, 0x03,=09=09/*   Report Size (3)            */
-=090x91, 0x03,=09=09/*   Output (Const,Var,Abs)     */
 =090x95, 0x70,=09=09/*   Report Count (112)         */
-=090x75, 0x01,=09=09/*   Report Size (1)            */
-=090x05, 0x07,=09=09/*   Usage Page (Kbrd/Keypad)   */
 =090x19, 0x04,=09=09/*   Usage Minimum (0x04)       */
 =090x29, 0x73,=09=09/*   Usage Maximum (0x73)       */
 =090x81, 0x02,=09=09/*   Input (Data,Var,Abs)       */
@@ -248,6 +238,15 @@ static const char kbd_lightspeed_1_3_descriptor[] =3D =
{
 =090x19, 0x90,=09=09/*   Usage Minimum (0x90)       */
 =090x29, 0x92,=09=09/*   Usage Maximum (0x92)       */
 =090x81, 0x02,=09=09/*   Input (Data,Var,Abs)       */
+=090x95, 0x05,=09=09/*   Report Count (5)           */
+=090x85, 0x0E,=09=09/*   Report ID (14)             */
+=090x05, 0x08,=09=09/*   Usage Page (LEDs)          */
+=090x19, 0x01,=09=09/*   Usage Minimum (Num Lock)   */
+=090x29, 0x05,=09=09/*   Usage Maximum (Kana)       */
+=090x91, 0x02,=09=09/*   Output (Data,Var,Abs)      */
+=090x95, 0x01,=09=09/*   Report Count (1)           */
+=090x75, 0x03,=09=09/*   Report Size (3)            */
+=090x91, 0x03,=09=09/*   Output (Const,Var,Abs)     */
 =090xC0,=09=09=09/* End Collection               */
 };
=20
@@ -1459,12 +1458,19 @@ static int logi_dj_ll_raw_request(struct hid_device=
 *hid,
 =09=09return -EINVAL;
=20
 =09if (djrcv_dev->type !=3D recvr_type_dj && count >=3D 2) {
+=09=09unsigned char led_report_id =3D 0;
+
 =09=09if (!djrcv_dev->keyboard) {
 =09=09=09hid_warn(hid, "Received REPORT_TYPE_LEDS request before the keybo=
ard interface was enumerated\n");
 =09=09=09return 0;
 =09=09}
+
+=09=09/* This Lightspeed receiver expects LED reports with report ID 1 */
+=09=09if (djrcv_dev->type =3D=3D recvr_type_gaming_hidpp_ls_1_3)
+=09=09=09led_report_id =3D 1;
+
 =09=09/* usbhid overrides the report ID and ignores the first byte */
-=09=09return hid_hw_raw_request(djrcv_dev->keyboard, 0, buf, count,
+=09=09return hid_hw_raw_request(djrcv_dev->keyboard, led_report_id, buf, c=
ount,
 =09=09=09=09=09  report_type, reqtype);
 =09}
=20



Return-Path: <linux-input+bounces-14475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB17B43B69
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B15D7C4A1C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E752EA49B;
	Thu,  4 Sep 2025 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SrFPoJ4Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7382EB5CE
	for <linux-input@vger.kernel.org>; Thu,  4 Sep 2025 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988493; cv=none; b=I2zFXtoOMR830P19p5ydWAkqoz2h6o7lSl5HRKbqTNJwpJAUJstsIk8ewndo77ckGfhiHv9vxLm50O4Fie0uJ8UCTsWvp+S9j8Q3solRppH+ik2T3AhGlTAXZ0ysMf5L6tqPyVlpo45UsjzQj+7YsSu37iJiBa3M4mIF7o9Wrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988493; c=relaxed/simple;
	bh=Xu3FzS2E90Tnv30Be1NIRf+j+eQnMN8z1DFfJFRNPiw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gXb+1N1xn5bJwGlWUBePKtxG4oXCSxCBY2fmIiqzk8ahj2OOYzS06cixs6DuBwL18MIZft6lheRs9o+EJuWqRmbv9GX9PkDvA432tg/EYpRLN67UEI2oDm7D4jVyDUHd3/1acQl1LRyiRmpP/8eq/3pBsldqkiMNxogcBN/BBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SrFPoJ4Y; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1756988482; x=1757247682;
	bh=MPLD50vctd29VNqidecQnt41vDFWyzwdZsX5nTjwuJw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SrFPoJ4YD5K9F/IFCeD5sAitjRjuaWGRbaq934CeWXfpX6K3TkhoapuK99nORffZK
	 Sb+mPtdcA9KY40N8byH80pq18JuwI0hMjQr4KGkEbxGaoCShJvmujWnvzFL3OFWKSL
	 /VQnExgUCbGMS0tTISCPoFLf5eo356q2HbRjrWXVdu9STNLy+l5MY8RQv+bF3GpIqi
	 9lAUR/pSS4g1/TxPnNuPIDASa+xHhOygpjo6mcA9iVIenBXQ5QC0h+RtCzuiHupyH9
	 3x0WKUmVXvrcm0cI0MvrsTKaJbhEEVg/NdyOzCkYQN85BB3/sx2Q3+XwE6ZRHMcHBy
	 tOxghPD3UedHg==
Date: Thu, 04 Sep 2025 12:21:17 +0000
To: Stuart <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v4] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <12899c24-a16f-4d64-bc40-a06b4c5c3e6f@protonmail.com>
In-Reply-To: <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
References: <20250902184128.4100275-1-mavchatz@protonmail.com> <CALTg27=fZ+_2b2AXmKk5UcZG_2-zm2XP3+xzbSUrWdahD7ShaA@mail.gmail.com> <20d3b05b-dbe0-4802-b724-fe4ab5e279d6@protonmail.com> <CALTg27=Q6a2yJK6y3MUSzngsbnpXhv6vwtS_Y-t0LaKg1kK7Ag@mail.gmail.com> <f92cda21-12d2-4e4d-ae84-666c6f8dce77@protonmail.com> <CALTg27=vaZK6ksriDDoN71pqr0VEbvxAz7Dp1w1toG+tO71Ldg@mail.gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: d28ca238fdf114f27b065446abcfddac12424bd6
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-09-03 23:40, Stuart wrote:
>> Can you apply this on top of the existing changes and test again?
>=20
> Unfortunately, no change in behaviour

Hm. It appears I may have misunderstood how this works. Please undo the=20
previous diff and apply the following on top instead:

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 00a975b70f59..4ae67f32e78e 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -227,6 +227,7 @@ static const char kbd_lightspeed_1_3_descriptor[] =3D {
 =090x95, 0x08,=09=09/*   Report Count (8)           */
 =090x81, 0x02,=09=09/*   Input (Data,Var)           */
 =090x95, 0x05,=09=09/*   Report Count (5)           */
+=090x85, 0x0E,=09=09/*   Report ID (14)             */
 =090x05, 0x08,=09=09/*   Usage Page (LEDs)          */
 =090x19, 0x01,=09=09/*   Usage Minimum (Num Lock)   */
 =090x29, 0x05,=09=09/*   Usage Maximum (Kana)       */
@@ -236,6 +237,7 @@ static const char kbd_lightspeed_1_3_descriptor[] =3D {
 =090x91, 0x03,=09=09/*   Output (Const,Var,Abs)     */
 =090x95, 0x70,=09=09/*   Report Count (112)         */
 =090x75, 0x01,=09=09/*   Report Size (1)            */
+=090x85, 0x01,=09=09/*   Report ID (1)              */
 =090x05, 0x07,=09=09/*   Usage Page (Kbrd/Keypad)   */
 =090x19, 0x04,=09=09/*   Usage Minimum (0x04)       */
 =090x29, 0x73,=09=09/*   Usage Maximum (0x73)       */

=20
> I forgot to mention in my original testing, I get a warning in my dmesg:
> logitech-hidpp-device 0003:046D:408E.0007:
> hidpp_root_get_protocol_version: received protocol error 0x08

I believe that is normal. If I recall correctly, it just means the=20
receiver had trouble identifying a device. I think it happens when the=20
devices paired to it disconnect/reconnect.

Can you also dump the HID report descriptors when the keyboard is=20
plugged in directly via USB?



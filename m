Return-Path: <linux-input+bounces-16776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64937CF0F57
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 14:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 485AC3003B3F
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0FB2F9D82;
	Sun,  4 Jan 2026 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=welho.tech header.i=@welho.tech header.b="lvw5lMJw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B391280327;
	Sun,  4 Jan 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531668; cv=none; b=R3kQRN/UgWkzZaV3TgB1TqEF9sRNmTrv9+V5YaYxkZnMvxvjsmwgTeyxlOLQ8gQzqdvc4t6kO83bBmmLgElh/CxitDWAIEWYFwCIZ4MyU7CwgCQsIpjYKwlA/zOZ0CX9gIaDfe2krmpdzGhJ1Q03DF6vkP2/HmrPsO0Z3DMCeO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531668; c=relaxed/simple;
	bh=xn2hte4RpJqlo+pzeH284vjjpiR9oGnaNyTa+tpZqa0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H2Yn7TMs4Bbz02zCpT/dWdui61pUYqBpkrNW+Vni89+ARByXth00neBeoD4TDxfJ5nRCJrt3l491xGu0F7l9LagbMJ5qxcPV/h6kc5X3t+k0HwkTXTElq8TIoAXqIubaGKQvMwJ4MU1FxaDRdupW7sWezwDEt/MHItB5mMH83Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=welho.tech; spf=pass smtp.mailfrom=welho.tech; dkim=pass (2048-bit key) header.d=welho.tech header.i=@welho.tech header.b=lvw5lMJw; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=welho.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=welho.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welho.tech;
	s=protonmail; t=1767531656; x=1767790856;
	bh=XUBvOuJu9BxRiCJegZZ5PvjTdB+y+Qg6XO3sC5Vse74=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lvw5lMJwIHVXNijRTZtz6ObmEvOlANwLsuWlhpcvUhr3AxrrJzFXMY3KkzOhW/b+k
	 qipIAkdWYYTlPyvYw5MJAdIlnbWapS0x6b1DhX6ufJqhIsnG/pKNk7aZ27MJRU7Rg+
	 LyVbWgR4W9LVVTOK7xwpLO9HeGvMKucjcxnO1pEnFMY63zz15axSrB6Dvg76rvHlWj
	 M29wEWwP6icFIO2DgVBhlRnplJMtf/YWyn/CMxYv7A9ru0ObXj4e4H8i87vgQNRxyi
	 mL2n8+GR3P59Bdf/hNCMzOwD2wayPFfNUv8FCWnHroyMJ+kH1cmoREi0C0lWr6JYYr
	 SBfsnTtkRFE9g==
Date: Sun, 04 Jan 2026 13:00:51 +0000
To: Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
From: Dennis Marttinen <twelho@welho.tech>
Cc: Dennis Marttinen <twelho@welho.tech>
Subject: [PATCH] drivers/hid: add HID++ support for Logitech MX Anywhere 3S
Message-ID: <20260104125846.61191-1-twelho@welho.tech>
Feedback-ID: 63214926:user:proton
X-Pm-Message-ID: 5db7484c79216d5f354bf3c769ea9bbef2ca5be2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I've acquired a Logitech MX Anywhere 3S mouse, which supports HID++ over
Bluetooth. Adding its PID 0xb037 to the allowlist enables the additional
features, such as high-resolution scrolling. Tested working across multiple
machines, with a mix of Intel and Mediatek Bluetooth chips.

Signed-off-by: Dennis Marttinen <twelho@welho.tech>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index d5011a5d08902..e871f1729d4b3 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4662,6 +4662,8 @@ static const struct hid_device_id hidpp_devices[] =3D=
 {
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb025) },
 =09{ /* MX Master 3S mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
+=09{ /* MX Anywhere 3S mouse over Bluetooth */
+=09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb037) },
 =09{ /* MX Anywhere 3SB mouse over Bluetooth */
 =09  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
 =09{}
--=20
2.52.0




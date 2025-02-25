Return-Path: <linux-input+bounces-10308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE009A432BB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 03:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165053B7CEC
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 02:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E56817C79;
	Tue, 25 Feb 2025 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thomasanderson.cloud header.i=@thomasanderson.cloud header.b="lAhM5iBY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980C4C6E
	for <linux-input@vger.kernel.org>; Tue, 25 Feb 2025 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740448872; cv=none; b=KtU//PGzIayxlcbEXbvjtuj5/3OG7oeFsJWLBzOle5UIthdX5m1kc8s/AQTaE8IrZ8CCLRrSHOR14sSdKDuVsYSuq71BMvmMKTNe19ZkS3b7LPxiKcPSkqxXDsRZcQqngeCctqysPGNQ5SPc1urVNfiIv6VbLMxn7qy//TI6SEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740448872; c=relaxed/simple;
	bh=pGTFDYwAShbVnjhV05E6zXP47bExliaa/MGcMSXDXoI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SYlLSiaCY7HKWPtOOghQ1tW/p3pZZMaxzcEZ6GdLIyYoAPoVpQyalzfGDmdLagK+Y+mW+aL7bSJBSyHoCRzKZ1hjsuo1BlbCZ8W6HYxo2tr7Xlc9Ce0ul6D1QUW6t9Y1Q6rlj4ak3BkMX1FX8J9t8MT+hux/Yk2tt3mtUFpagKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thomasanderson.cloud; spf=pass smtp.mailfrom=thomasanderson.cloud; dkim=pass (2048-bit key) header.d=thomasanderson.cloud header.i=@thomasanderson.cloud header.b=lAhM5iBY; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thomasanderson.cloud
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thomasanderson.cloud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=thomasanderson.cloud; s=protonmail2; t=1740448866; x=1740708066;
	bh=6Yd4ZGWysAOX5aZHXV7fiASNE1dyxffg18REg+sxxpY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=lAhM5iBYalhDcQ86K1zUILxq3DTqVdCPOrUJxx43jqxpSQ+mnjpUFJOkOJ/zX37gD
	 smm21/KUOzMixgScSBr1v8Ztg1HZFiwyjJwdXx0P30OKvRS2FPNSYo3ism7A6wphId
	 lnqkUtj+FTJUMzhUreQr8I9KZB0NPf+Win1cu9ty8+MpGfCW8yJ+RobTq04REDcfif
	 2wDWUyW1b5p+JyN76jQQFtXNZ3FgcT99JjPLudtoLJIWJVtrca48XeQTheRCV5mdVS
	 DIrdZe/BAL2ZcOTtaUxhUMj6DhcWsnVakKwq5cqUew9JwKhyRAfcdb+aB52Lfh2sCU
	 A/tEfXUfKmAgw==
Date: Tue, 25 Feb 2025 02:01:01 +0000
To: linux-input@vger.kernel.org
From: thomas <me@thomasanderson.cloud>
Cc: thomas <me@thomasanderson.cloud>
Subject: [PATCH] HID: logitech-dj: stop G602 mouse dmesg flooding
Message-ID: <20250225020038.1708346-1-me@thomasanderson.cloud>
Feedback-ID: 12013804:user:proton
X-Pm-Message-ID: b18a6ce510da90ae9949f6efe9aa758cfcb1685d
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Logitech G602 mouse seems to send a 128 report on every button
press, which is undefined behavior and results in a dmesg log entry each
time any button on the mouse is clicked (left/right/scroll click or any
other macro/function buttons). This causes dmesg to be flooded with
repeated entries of the following content pretty much constantly:

    Unexpected input report number 128

This commit checks for this exact scenario, and quietly ignores it
instead of logging the error. Actual mouse functionality is not
affected.

Link: https://lore.kernel.org/lkml/cb14d9fb-9928-4c62-a087-b1a54202d65a@red=
hat.com/

Signed-off-by: thomas <me@thomasanderson.cloud>
---
 drivers/hid/hid-logitech-dj.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 34fa71ceec2b..bea03df74fb4 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1160,6 +1160,16 @@ static void logi_dj_recv_forward_input_report(struct=
 hid_device *hdev,
 =09int i;
=20
 =09if (report > REPORT_TYPE_RFREPORT_LAST) {
+=09=09/*
+=09=09 * G602 mouse may send a 128 report on every click, which is undefin=
ed
+=09=09 * behavior and spams the log. Ignore it.
+=09=09 */
+=09=09if (report =3D=3D 128 &&
+=09=09    hdev->vendor =3D=3D USB_VENDOR_ID_LOGITECH &&
+=09=09    hdev->product =3D=3D 0xc537) {
+=09=09=09return;
+=09=09}
+
 =09=09hid_err(hdev, "Unexpected input report number %d\n", report);
 =09=09return;
 =09}
--=20
2.43.0




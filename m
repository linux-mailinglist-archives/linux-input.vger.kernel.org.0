Return-Path: <linux-input+bounces-7994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855AF9C2B7A
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 10:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC0C2826DC
	for <lists+linux-input@lfdr.de>; Sat,  9 Nov 2024 09:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0822335C7;
	Sat,  9 Nov 2024 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KmeGJD6P"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A70149C6F
	for <linux-input@vger.kernel.org>; Sat,  9 Nov 2024 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731145755; cv=none; b=sCHA3jL6JhGbMGykPFVhK2hUdOHyYbie4hkILpePaai+Oe2CNaqIKkdj/UtL7vBbfpWOfoExENX6KSaOp0sJrAyYrGG5UNxRMqMok2kjVbScoO+kMKPEkC6QeExI0VuaHitUeYQrcuYREz4gEptm5UO8gNVPhiwImJx2UkhBLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731145755; c=relaxed/simple;
	bh=cNOSBZ7r7U2d3RmLZ3dpAs8sbBfcRnWZQMXJ8SebZ9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qT4ShXTLIUV7SoTLKlVayX8hCcO5BntAp61bciZIYhuyoEgSMw800nxMw2NdOpqyh/Nf/xhoh4eiXd5E03D9BoUzsy1bAeXKfy/YdTLaFkwoH79lsvhnUiVaGleV0+Nlb3oIwDSG8YpCzEOfm6iHmz/ZLl50QDyHTsZ1RgCqEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KmeGJD6P; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OE20c
	oajz+mJmo8Ly0Uq1K7gff0paGsSM25cfMMsOEk=; b=KmeGJD6PAdtnDEpk2J11Y
	SplrOSvI2/WY7YMx1ZksxyI2zEtaEHVLXvPiG1I7QjJBhCpapRWYfhKrPKboDJ9c
	9CjBz0D0rWbfV9MfD+iv+QrroG/Co6pHWBA1nzssdHS7Qj9FlqVTzq7GFlZzaG8G
	Y/bcPBDvAvxA5jS/UFKMG4=
Received: from localhost.localdomain (unknown [123.150.8.42])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3_1MSMC9nTde8EA--.6951S2;
	Sat, 09 Nov 2024 17:49:07 +0800 (CST)
From: luyuantao01 <luyuantao01@163.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	luyuantao <luyuantao@kylinos.cn>
Subject: [PATCH] Input: i8042 - Fix keyboard failure caused by S4 mouse wakeup
Date: Sat,  9 Nov 2024 17:48:42 +0800
Message-Id: <20241109094842.1436-1-luyuantao01@163.com>
X-Mailer: git-send-email 2.37.2.windows.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_1MSMC9nTde8EA--.6951S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1DtFy7WryDJrWDZFy3XFb_yoW8uFW5p3
	y3KF409r4vgr9rtw4qyF4UZFn8Xw1xZa13CF9ru34UuwnxXFnY9r43tryrZa1DCrZ3Gr45
	Xryjq34Yg3WDZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jihL8UUUUU=
X-CM-SenderInfo: 5ox13tpqwd0iqr6rljoofrz/1tbi7g6ShmcvIrWobQAAsu

From: luyuantao <luyuantao@kylinos.cn>

There is an i8402 keyboard and mouse device on the
ThinkPad P15 laptop.When conducting a wakeup
test on S4, it was found that:

1. Using the keyboard directly can wake up S4.
2. The system failed to wake up using the mouse button first,
and when using the keyboard to wake up again, the system
cannot be woken up and can only be shut down by pressing
the power button.

This issue is that i8042_start() only enables wakeup for the
keyboard.However, because wakeup capability is set for all
devices, the device_may_wakeup() is also true for the mouse,
and the i8042_pm_suspend() enables the wakeup interrupt for the
mouse.The system can respond to mouse wakeup interrupts, but
it cannot handle them and affects keyboard interrupts.

So let the mouse also have wakeup ability to fix it

Signed-off-by: luyuantao <luyuantao@kylinos.cn>
---
 drivers/input/serio/i8042.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 8ec4872b4471..1f9810dfb3d8 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -446,17 +446,16 @@ static int i8042_start(struct serio *serio)
 {
 	struct i8042_port *port = serio->port_data;
 
-	device_set_wakeup_capable(&serio->dev, true);
-
 	/*
-	 * On platforms using suspend-to-idle, allow the keyboard to
-	 * wake up the system from sleep by enabling keyboard wakeups
-	 * by default.  This is consistent with keyboard wakeup
-	 * behavior on many platforms using suspend-to-RAM (ACPI S3)
-	 * by default.
+	 * On platforms using suspend-to-idle
+	 * In fact, people nowadays prefer to wake up systems using
+	 * keyboards or mice.But after the previous code flow
+	 * entered S4, the mouse could not wakeup the system
+	 * and caused the keyboard to fail to wake up.
+	 * So fix it
 	 */
-	if (pm_suspend_default_s2idle() &&
-	    serio == i8042_ports[I8042_KBD_PORT_NO].serio) {
+	if (pm_suspend_default_s2idle()) {
+		device_set_wakeup_capable(&serio->dev, true);
 		device_set_wakeup_enable(&serio->dev, true);
 	}
 
-- 
2.25.1



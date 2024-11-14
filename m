Return-Path: <linux-input+bounces-8069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 689589C806A
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 03:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD201F223F7
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 02:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B933419B3E2;
	Thu, 14 Nov 2024 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nWtnFkza"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F981CCEE0
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550429; cv=none; b=cTvy2+H8uDhyl+DCNA3bSqlV40W7YJz4p+2ntMn2mu47ynruq4s8fl3P53OVg3/zr+k1fdiwKwLY6JHmqxLW3MOdGZqanU8lqGcqREsgim1II1MSrj+2Ovgeq+yxM/tViYnSo+hQf8+GzUVgLSLXjqGxCdXPNZt7+aJY484uX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550429; c=relaxed/simple;
	bh=8Yy4lIm+d0VPfEAPgH/BrG3Hq5K7KmfxPp3ConN5j+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FZBuwU8ksu7/bRqWcUfGcxmcSiMcrxhUe3hAbDzj1YIfrSrcyDzaaU6R97yw6Lt/UJcdFYc++njCoc52SjA71KZwKCcjmQJ/LyQtDZJ7BwYOvBVsBK1V01N4MRJBynvS8AKfRTlw+9QNXXsW9m+Qy2IuMcyI6iRHC2Ma+F73l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nWtnFkza; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=B+6Wu
	O/c5R9eHOFB5NiC5aLfEoLIzGcWjugqAoI4kjA=; b=nWtnFkza/nAGP7sHZjbv3
	gLatFBXCcmkXM/0hZP9qfPabllNh8lM2swjv9B52vMmgYETQtWCItRi/bLGz/qYi
	va85UG1iAMOi89TcZTgqKX2KIxgbdGE8244DdhiEjAqi8c47JMjQMka+sr6ErMrO
	MK9MMLAdUZWXn6YKiCXcIc=
Received: from localhost.localdomain (unknown [123.150.8.42])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBX_GnNXDVnS70bCQ--.212S2;
	Thu, 14 Nov 2024 10:13:35 +0800 (CST)
From: luyuantao01 <luyuantao01@163.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	luyuantao <luyuantao@kylinos.cn>
Subject: [PATCH v2] Input: i8042 - Fix keyboard failure caused by S3 mouse wakeup
Date: Thu, 14 Nov 2024 10:13:10 +0800
Message-Id: <20241114021310.9-1-luyuantao01@163.com>
X-Mailer: git-send-email 2.37.2.windows.2
In-Reply-To: <20241109094842.1436-1-luyuantao01@163.com>
References: <20241109094842.1436-1-luyuantao01@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBX_GnNXDVnS70bCQ--.212S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1xGFWrXFyxCw1UKF1xKrg_yoW5Gry7pa
	y3Ka109r4vqFyqywsrtr48Z3Z8Xws7Xay3CFnruryUCwnrXFnYyr4ftryrZa1DC393Cwsx
	Xryjq3yY93WDuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjManUUUUU=
X-CM-SenderInfo: 5ox13tpqwd0iqr6rljoofrz/1tbiLAuXhmc1WflanwAAsB

From: luyuantao <luyuantao@kylinos.cn>

Hi Dmitry 
I'm sorry for the inconvenience caused to you. After reproducing the 
problem and conducting a thorough analysis, I found that the previous 
patch description was incorrect. Therefore, resubmit the patch

There is an i8402 keyboard and mouse device on the
ThinkPad P15 laptop.When conducting a wakeup
test on S3, it was found that:

1. Using the keyboard directly can wake up S3.
2. The system failed to wake up using the mouse button first,
and when using the keyboard to wake up again, the system
cannot be woken up and can only be shut down by pressing
the power button.

This issue is that i8042_start() only enables wakeup for the
keyboard. During the i8042_pm_suspend() phase, the aux device
will not enable irq wakeup. However, when suspend_device_irqs()
traversing irq without wakeup capability, __disable_irq() did
not truly disable aux interrupts, only setting the IRQS_SUSPEND
flag, resulting in aux interrupts still being generated.

When an interrupt is triggered, irqd_irq_isabled returns the
true execution mask irq. The mask_iopic_irq callback function
of the IR-IO-APIC chip will disable all IRQ pins, resulting
in keyboard interrupts being disabled and no longer responding

Signed-off-by: luyuantao <luyuantao@kylinos.cn>
---
 drivers/input/serio/i8042.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 8ec4872b4471..abcd01807dc8 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -446,17 +446,15 @@ static int i8042_start(struct serio *serio)
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
+	 * keyboards or mice. But after the previous code flow
+	 * entered S3, the mouse could not wakeup the system
+	 * and caused the keyboard to fail to wake up.
 	 */
-	if (pm_suspend_default_s2idle() &&
-	    serio == i8042_ports[I8042_KBD_PORT_NO].serio) {
+	if (pm_suspend_default_s2idle()) {
+		device_set_wakeup_capable(&serio->dev, true);
 		device_set_wakeup_enable(&serio->dev, true);
 	}
 
-- 
2.27.0



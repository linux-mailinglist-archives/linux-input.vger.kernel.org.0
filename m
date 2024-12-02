Return-Path: <linux-input+bounces-8351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC29E0B86
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 039621667B2
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684F11DE4CB;
	Mon,  2 Dec 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JmRYMU+M"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E31DE3B2;
	Mon,  2 Dec 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166101; cv=none; b=cscDzkc4N4fgbAxmpuZYuBPyyyNyLXPMVmnsnkzD/bzZtLmhnXuqwYqaAsOn+IVVbtN5rTmpzzCWNBKkfaNb6YkYSihA8fPEKc7KiFRfwOGVKx2kCKFMj/gZ52dt9ICG6ZXE3rmy3ljiDI2ygggWAIvDcJM0+ileYwkRnclV9u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166101; c=relaxed/simple;
	bh=VmcOl5NKT08x9X7r+Kn+G2CxPTbD2rFNGhIoyfLrTDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXfLwjIs8VcNu4XbTgBMk0zXeMP+g7cStO9+Kb3A5Ne/m8oooEkKAQpTKRThi0Q6Ftril1EcrlL7rWx5FgY03PV/7IyLCLdu2+6Km2lMAxR5glt1X2q/tcQ+j/ctu61GRH8L6LXJ2KBaFmhPKHVVg86T3mTssfwyBG177pZnEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JmRYMU+M; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166097;
	bh=VmcOl5NKT08x9X7r+Kn+G2CxPTbD2rFNGhIoyfLrTDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JmRYMU+MAF1U9TtHexLlHNPut5QhtMeIezJ1uC+EPmBtQrZzVyze2gox5hrSOw4/R
	 Oi5H675Zj+0AjTgSmZmko7ulFc1c3oMC1siB4HIujSNnaX+y42JrT10xO8EnLLpwYE
	 2xKaniyWPqcG3pAGYt523TRBj91B3P8QYpc6ICJ8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:33 +0100
Subject: [PATCH 02/10] HID: core: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-2-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=1707;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=VmcOl5NKT08x9X7r+Kn+G2CxPTbD2rFNGhIoyfLrTDw=;
 b=Abu2lmimgbA97JRJmQIP8DAI16Q4Yj74wzcHP7HUHIxCq/Ru72RUlZ7zbxgWxpxbyunaaFPwo
 kIqHwJKvqidBMa9q3uW4UBL+jmI5qSmosenyw8fg0i6eGC8Xk7mjsCF
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index c7a8066061f621e80ec37f303d8a310d126569b4..10a71d6bd672566a43b2cde294ab42e35df367b6 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2175,7 +2175,7 @@ static bool hid_hiddev(struct hid_device *hdev)
 
 static ssize_t
 report_descriptor_read(struct file *filp, struct kobject *kobj,
-		       struct bin_attribute *attr,
+		       const struct bin_attribute *attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -2201,7 +2201,7 @@ country_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%02x\n", hdev->country & 0xff);
 }
 
-static BIN_ATTR_RO(report_descriptor, HID_MAX_DESCRIPTOR_SIZE);
+static const BIN_ATTR_RO(report_descriptor, HID_MAX_DESCRIPTOR_SIZE);
 
 static const DEVICE_ATTR_RO(country);
 
@@ -2793,13 +2793,13 @@ static struct attribute *hid_dev_attrs[] = {
 	&dev_attr_modalias.attr,
 	NULL,
 };
-static struct bin_attribute *hid_dev_bin_attrs[] = {
+static const struct bin_attribute *hid_dev_bin_attrs[] = {
 	&bin_attr_report_descriptor,
 	NULL
 };
 static const struct attribute_group hid_dev_group = {
 	.attrs = hid_dev_attrs,
-	.bin_attrs = hid_dev_bin_attrs,
+	.bin_attrs_new = hid_dev_bin_attrs,
 };
 __ATTRIBUTE_GROUPS(hid_dev);
 

-- 
2.47.1



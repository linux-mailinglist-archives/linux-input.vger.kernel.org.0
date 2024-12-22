Return-Path: <linux-input+bounces-8718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3619FA7DA
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 21:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AEA416577E
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 20:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B7413C682;
	Sun, 22 Dec 2024 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GjWV0jqZ"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67444748D;
	Sun, 22 Dec 2024 20:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897660; cv=none; b=O2t9q99jrQdx868jhEhi1uJYg0knwulG3Bt8bAvzqTT9o9shaFHhaKOZkSCNwWi4NStmvsdju7p79VTMHw07vdao3RRyIV3zVePy18jgGXHr9fnVwHWurVRX8ANIcCnbvPUp0mACApbGtrl3jAaHwkpkFJLHbUGSEr8ZpW+HteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897660; c=relaxed/simple;
	bh=sYJ/o+8eOUuWaqcyYlxHNo93OYcPln2j/T/4HNX0gMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qn+M4gJfWCKXhV9/TsFobheGGuZRuWs4gf0q3iZmMaTIPwTpNES4IRYG/XXIYIgJKNJ6wFAk0yEEjt7+gJHjSBDTCip1UOzh1WRsM3BocNf3/qF/XY/a7clhi2hsdrsAEbe+sDPa8HOTlcr0VfIdlW1zB6l3MjRUX4bWwFvd00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GjWV0jqZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734897646;
	bh=sYJ/o+8eOUuWaqcyYlxHNo93OYcPln2j/T/4HNX0gMk=;
	h=From:Date:Subject:To:Cc:From;
	b=GjWV0jqZO1hx0+jh4bsODPSHSW9uObmeOnwWttdTXnPWH27e3ibx2rDkF53kzXufh
	 b9rrbeSNApV+sjWlCdi8ra0LA3RSKQAf4NCbgIFDuP4DnlHjHLBL5LqlbqElr5T357
	 nGtcy7Tmz8ry4pF088B9UR9nZnM4IL/zzYTWYM/I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 22 Dec 2024 21:00:43 +0100
Subject: [PATCH] Input: goodix-berlin - constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241222-sysfs-const-bin_attr-input-v1-1-1229dbe5ae71@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOpvaGcC/x3MSwqDQAwA0KtI1g3U+CntVUqRMcY2myiTqSji3
 R1cvs3bwSWqOLyKHaIs6jpZRnkrgH/BvoI6ZAPdqS6JCH3z0ZEn84S9WhdSiqg2/xM+2ooDN0+
 WpoIczFFGXa/8/TmOE3gTvclsAAAA
X-Change-ID: 20241222-sysfs-const-bin_attr-input-763cac59ce53
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734897645; l=2189;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sYJ/o+8eOUuWaqcyYlxHNo93OYcPln2j/T/4HNX0gMk=;
 b=fRxolzT/L5pJBKAv7xLzELo8FT7GhMgqfdN+Np/V1nwOf5M4zkUIsH93/k5rksmmdqp/8biN9
 mlOUjj10fz2Cu6qm6deWIy1OTMJRNtBWj330waUW1+LxK4rp4P4YEqT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index 3fc03cf0ca23fdbe36028a6228030d3ffb8d3a09..9b53d98055e93b122603073d2920f74731848b05 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -673,7 +673,7 @@ static void goodix_berlin_power_off_act(void *data)
 }
 
 static ssize_t registers_read(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *bin_attr,
+			      const struct bin_attribute *bin_attr,
 			      char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -686,7 +686,7 @@ static ssize_t registers_read(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t registers_write(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
+			       const struct bin_attribute *bin_attr,
 			       char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -698,15 +698,15 @@ static ssize_t registers_write(struct file *filp, struct kobject *kobj,
 	return error ? error : count;
 }
 
-static BIN_ATTR_ADMIN_RW(registers, 0);
+static const BIN_ATTR_ADMIN_RW(registers, 0);
 
-static struct bin_attribute *goodix_berlin_bin_attrs[] = {
+static const struct bin_attribute *const goodix_berlin_bin_attrs[] = {
 	&bin_attr_registers,
 	NULL,
 };
 
 static const struct attribute_group goodix_berlin_attr_group = {
-	.bin_attrs = goodix_berlin_bin_attrs,
+	.bin_attrs_new = goodix_berlin_bin_attrs,
 };
 
 const struct attribute_group *goodix_berlin_groups[] = {

---
base-commit: bcde95ce32b666478d6737219caa4f8005a8f201
change-id: 20241222-sysfs-const-bin_attr-input-763cac59ce53

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>



Return-Path: <linux-input+bounces-8348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C87EC9E0C32
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9EC1B476EE
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0506F1DE3A4;
	Mon,  2 Dec 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Zf3FcTuR"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3383D97A;
	Mon,  2 Dec 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166100; cv=none; b=icHzrvQT/Gs4mcnKH9UZHrvS/eQqlEsoZLqTV4m7kewLhNNj/vVtx3VHhTcg1EJzuc+FcuuNAiHROaZ0BdhGAYGUp6wXdp8LD9B+6ghaytEAwPZaPvXFpKOsz8nD43j65VlRzVRffz8JFrmwcyqmj2GjuVd/SviLUvzxyfpjPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166100; c=relaxed/simple;
	bh=GPwynaTt5mbbgaY/QlK9YkDMUXCsAMfe49E6G5bqfrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVAqle40C6dJCzkKjr+WP7stPUZkvorqXvbB5UAC5zsgGdVpN2mZNjX/KU+FgR3WhZ8kFxaexwFYN9Lckigp85rhRYJoOA8u2w2yZou6ea1aHCZhcoDUAi8Z0arNNTbtClvR76PiSpCYvgac9c73YcHAuP6DHnpi6mho76Ir6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Zf3FcTuR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166097;
	bh=GPwynaTt5mbbgaY/QlK9YkDMUXCsAMfe49E6G5bqfrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zf3FcTuRfw72geEJs6KJJiAHq/+LmsfJQBsp3Iz6oADycjqQhIXEhnLanK50kFcbi
	 /Xm3YurkEIRcRqixLB4F91stXsNqZOvWQpFLsLB6lGeOkklU6rSdJEScoR3/FoY3jA
	 cljFDCZReUTa6zKbW/TGnDfsyW+pVsbME22NF56c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:35 +0100
Subject: [PATCH 04/10] HID: roccat: arvo: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-4-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=2456;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GPwynaTt5mbbgaY/QlK9YkDMUXCsAMfe49E6G5bqfrM=;
 b=6zmx1VzfQA0muoop+WihZ/n41BciU1jfHKmHatJlk+1+ixOsfk4hdwnln4IJNPU8Rf9FXZ1gs
 MFB4aaeapO1Anv2RBFdYWgaKutpgxKrwMyUN7psuK9dpPsDQSxfqJSl
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-arvo.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-roccat-arvo.c b/drivers/hid/hid-roccat-arvo.c
index d55aaabab1ed491d2620bb3e037738d705a1b54c..3048297569c529d4ac8be5a26e75e0640e7cd53a 100644
--- a/drivers/hid/hid-roccat-arvo.c
+++ b/drivers/hid/hid-roccat-arvo.c
@@ -224,24 +224,24 @@ static ssize_t arvo_sysfs_read(struct file *fp,
 }
 
 static ssize_t arvo_sysfs_write_button(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	return arvo_sysfs_write(fp, kobj, buf, off, count,
 			sizeof(struct arvo_button), ARVO_COMMAND_BUTTON);
 }
-static BIN_ATTR(button, 0220, NULL, arvo_sysfs_write_button,
-		sizeof(struct arvo_button));
+static const BIN_ATTR(button, 0220, NULL, arvo_sysfs_write_button,
+		      sizeof(struct arvo_button));
 
 static ssize_t arvo_sysfs_read_info(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	return arvo_sysfs_read(fp, kobj, buf, off, count,
 			sizeof(struct arvo_info), ARVO_COMMAND_INFO);
 }
-static BIN_ATTR(info, 0440, arvo_sysfs_read_info, NULL,
-		sizeof(struct arvo_info));
+static const BIN_ATTR(info, 0440, arvo_sysfs_read_info, NULL,
+		      sizeof(struct arvo_info));
 
 static struct attribute *arvo_attrs[] = {
 	&dev_attr_mode_key.attr,
@@ -250,7 +250,7 @@ static struct attribute *arvo_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *arvo_bin_attributes[] = {
+static const struct bin_attribute *const arvo_bin_attributes[] = {
 	&bin_attr_button,
 	&bin_attr_info,
 	NULL,
@@ -258,7 +258,7 @@ static struct bin_attribute *arvo_bin_attributes[] = {
 
 static const struct attribute_group arvo_group = {
 	.attrs = arvo_attrs,
-	.bin_attrs = arvo_bin_attributes,
+	.bin_attrs_new = arvo_bin_attributes,
 };
 
 static const struct attribute_group *arvo_groups[] = {

-- 
2.47.1



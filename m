Return-Path: <linux-input+bounces-8354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A729E0B93
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1CEF166A47
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E3B1DF269;
	Mon,  2 Dec 2024 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Dc5vbZ2V"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4911DE8A3;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166104; cv=none; b=Br35lCqMR3rHAMTJnBAOA4bqxU+09MQycwtuBaBDfncRI67c8kef6FzjsSYKeGckp5t5gAXtiJjqutXmzeepw3NOE2jTo2dxXmAR/VIk+C7a2p20AK778MuuWnRyyANv+4pGZet+52Fd5TK+M/lL+LIIRQQuie3i3mrMaykNqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166104; c=relaxed/simple;
	bh=i28gZ+MaLrLyAd1o1KmiI7vQ0VQgC299+3qpAa4eFbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9Ec47cX8xwJaR1aSUUNAx5v/YSMYqohRrxnqZ1Qu9Nz6atvgKJgjY/DhqmUsQ930fdePDbrFZGvSRs5vfjA8D+bcXhYOG/DLFlfwzGMLk42YShjZqlZult4W4LEBC6tbq7GI4PdKSVKyeXPKypMbJ6W1bBRJqplscUsOSg2BE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Dc5vbZ2V; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=i28gZ+MaLrLyAd1o1KmiI7vQ0VQgC299+3qpAa4eFbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dc5vbZ2VR4rNJLRf5Z1YhmepxJcm6fVSkHfQS5HcPKJqG7Z944Bl3pfR5EWgk8nIH
	 IH1cfcUO/bhJhE1CHJblG3wsaXH/UAbxKSjQGMJrN1SthTZPSQstt6hcznxaRGJIrF
	 mhS8LWrS3+q1fs2sI+wZi3P5k/WclB3olG9Gzj/w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:36 +0100
Subject: [PATCH 05/10] HID: roccat: isku: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-5-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=3361;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i28gZ+MaLrLyAd1o1KmiI7vQ0VQgC299+3qpAa4eFbk=;
 b=kyoVV0cTcsDwf9XyQ3pWN1wFhgPALtDXk1wEV240bKYJZz5CFxPFlGRXaXI6Xn7UJR52tEZy1
 sZ/q0DNKrlvCa+QB7sQ32ValxTcDmPeNA00VgdHAnX6WcAflwLXxzTF
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-isku.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-roccat-isku.c b/drivers/hid/hid-roccat-isku.c
index 0cd6208fb371eddd10f6d47d6a70036f6b7d4796..65a84bfcc2f86432753c148dbb78d77de70bafb9 100644
--- a/drivers/hid/hid-roccat-isku.c
+++ b/drivers/hid/hid-roccat-isku.c
@@ -156,7 +156,7 @@ static ssize_t isku_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define ISKU_SYSFS_W(thingy, THINGY) \
 static ssize_t isku_sysfs_write_ ## thingy(struct file *fp, struct kobject *kobj, \
-		struct bin_attribute *attr, char *buf, \
+		const struct bin_attribute *attr, char *buf, \
 		loff_t off, size_t count) \
 { \
 	return isku_sysfs_write(fp, kobj, buf, off, count, \
@@ -165,7 +165,7 @@ static ssize_t isku_sysfs_write_ ## thingy(struct file *fp, struct kobject *kobj
 
 #define ISKU_SYSFS_R(thingy, THINGY) \
 static ssize_t isku_sysfs_read_ ## thingy(struct file *fp, struct kobject *kobj, \
-		struct bin_attribute *attr, char *buf, \
+		const struct bin_attribute *attr, char *buf, \
 		loff_t off, size_t count) \
 { \
 	return isku_sysfs_read(fp, kobj, buf, off, count, \
@@ -178,27 +178,27 @@ ISKU_SYSFS_W(thingy, THINGY)
 
 #define ISKU_BIN_ATTR_RW(thingy, THINGY) \
 ISKU_SYSFS_RW(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.read = isku_sysfs_read_ ## thingy, \
-	.write = isku_sysfs_write_ ## thingy \
+	.read_new = isku_sysfs_read_ ## thingy, \
+	.write_new = isku_sysfs_write_ ## thingy \
 }
 
 #define ISKU_BIN_ATTR_R(thingy, THINGY) \
 ISKU_SYSFS_R(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.read = isku_sysfs_read_ ## thingy, \
+	.read_new = isku_sysfs_read_ ## thingy, \
 }
 
 #define ISKU_BIN_ATTR_W(thingy, THINGY) \
 ISKU_SYSFS_W(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.write = isku_sysfs_write_ ## thingy \
+	.write_new = isku_sysfs_write_ ## thingy \
 }
 
 ISKU_BIN_ATTR_RW(macro, MACRO);
@@ -217,7 +217,7 @@ ISKU_BIN_ATTR_W(control, CONTROL);
 ISKU_BIN_ATTR_W(reset, RESET);
 ISKU_BIN_ATTR_R(info, INFO);
 
-static struct bin_attribute *isku_bin_attributes[] = {
+static const struct bin_attribute *const isku_bin_attributes[] = {
 	&bin_attr_macro,
 	&bin_attr_keys_function,
 	&bin_attr_keys_easyzone,
@@ -238,7 +238,7 @@ static struct bin_attribute *isku_bin_attributes[] = {
 
 static const struct attribute_group isku_group = {
 	.attrs = isku_attrs,
-	.bin_attrs = isku_bin_attributes,
+	.bin_attrs_new = isku_bin_attributes,
 };
 
 static const struct attribute_group *isku_groups[] = {

-- 
2.47.1



Return-Path: <linux-input+bounces-8356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 812169E0D85
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 22:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30B58B60A6A
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA371DE3B2;
	Mon,  2 Dec 2024 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NH+djLZ7"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40211DE8A9;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166104; cv=none; b=Sr3uTArFYjrcrFkTQhh4wEXU+g4R832hccTI33jNPKnSD/ke9BMqnLrZ1E0Y+jVjBz0ZnDBohq9TGOCFDFMTGtb7J37QWewf3a03WLf+qqUgcIdtoxMMoquGRbOMrLE2G8ehl0bMCNOZeTFbeRVpm+iiyy7aAanUrnAxVWO1gfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166104; c=relaxed/simple;
	bh=W+mWnDObWKFTpIkoPUW6T+2VoFCOMFK9MW1E+ZgNHBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=henYKU/fdp9ZRPi+3GARJ++oPUhUNRXs3dzstKXFM548eR96q6SHPNz+ub5mkkKGNCboyyWDSnKwBbnfHV02lvkxsWsEU6MJrZHS3DJhxo0MHN/8HqXwpUM6/zSW5lo/LqdjgAvmnetnRZELg4YQL1/F3Fxqs9lnQKLqIuxu/s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NH+djLZ7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166097;
	bh=W+mWnDObWKFTpIkoPUW6T+2VoFCOMFK9MW1E+ZgNHBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NH+djLZ7mvklOpnckYB/e2RjcyknI2C1zuVxOelvKm1xXeUjGOQol/VbziOQdGfIU
	 JwuwiYBURlt87V0mB1AtZN1m7aTelLuPNWjputz86MqBhD78UeiuOvLGHh2UHM4sS5
	 W+nzws8j1qMS82xnRf8NvZaEKhBWiUT65ic1Pewg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:34 +0100
Subject: [PATCH 03/10] HID: roccat: common, konepure, ryos, savu: constify
 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-3-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=5960;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=W+mWnDObWKFTpIkoPUW6T+2VoFCOMFK9MW1E+ZgNHBc=;
 b=nVjoQ4E05w3ufBeabbmpI5phvU4vPCuxoi2xRDepgX1LCjByNFxQBxNwFndtQmxfA8eCwXqA8
 fYBHl9UthnIDsPe/f7EVlr92WofjzX6Qp/jTgLsMGDbe6uWKa7DokCq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-common.h   | 22 +++++++++++-----------
 drivers/hid/hid-roccat-konepure.c |  4 ++--
 drivers/hid/hid-roccat-ryos.c     |  4 ++--
 drivers/hid/hid-roccat-savu.c     |  4 ++--
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-roccat-common.h b/drivers/hid/hid-roccat-common.h
index 839ddfd931f076a2c3c2ab3a6d8186004273f2e1..0f9a2db04df96aaa2fe87adc00ec14f8fa30ed82 100644
--- a/drivers/hid/hid-roccat-common.h
+++ b/drivers/hid/hid-roccat-common.h
@@ -46,8 +46,8 @@ ssize_t roccat_common2_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define ROCCAT_COMMON2_SYSFS_W(thingy, COMMAND, SIZE) \
 static ssize_t roccat_common2_sysfs_write_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return roccat_common2_sysfs_write(fp, kobj, buf, off, count, \
 			SIZE, COMMAND); \
@@ -55,8 +55,8 @@ static ssize_t roccat_common2_sysfs_write_ ## thingy(struct file *fp, \
 
 #define ROCCAT_COMMON2_SYSFS_R(thingy, COMMAND, SIZE) \
 static ssize_t roccat_common2_sysfs_read_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return roccat_common2_sysfs_read(fp, kobj, buf, off, count, \
 			SIZE, COMMAND); \
@@ -68,27 +68,27 @@ ROCCAT_COMMON2_SYSFS_R(thingy, COMMAND, SIZE)
 
 #define ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(thingy, COMMAND, SIZE) \
 ROCCAT_COMMON2_SYSFS_RW(thingy, COMMAND, SIZE); \
-static struct bin_attribute bin_attr_ ## thingy = { \
+static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = SIZE, \
-	.read = roccat_common2_sysfs_read_ ## thingy, \
-	.write = roccat_common2_sysfs_write_ ## thingy \
+	.read_new = roccat_common2_sysfs_read_ ## thingy, \
+	.write_new = roccat_common2_sysfs_write_ ## thingy \
 }
 
 #define ROCCAT_COMMON2_BIN_ATTRIBUTE_R(thingy, COMMAND, SIZE) \
 ROCCAT_COMMON2_SYSFS_R(thingy, COMMAND, SIZE); \
-static struct bin_attribute bin_attr_ ## thingy = { \
+static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = SIZE, \
-	.read = roccat_common2_sysfs_read_ ## thingy, \
+	.read_new = roccat_common2_sysfs_read_ ## thingy, \
 }
 
 #define ROCCAT_COMMON2_BIN_ATTRIBUTE_W(thingy, COMMAND, SIZE) \
 ROCCAT_COMMON2_SYSFS_W(thingy, COMMAND, SIZE); \
-static struct bin_attribute bin_attr_ ## thingy = { \
+static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = SIZE, \
-	.write = roccat_common2_sysfs_write_ ## thingy \
+	.write_new = roccat_common2_sysfs_write_ ## thingy \
 }
 
 #endif
diff --git a/drivers/hid/hid-roccat-konepure.c b/drivers/hid/hid-roccat-konepure.c
index beca8aef8bbb2987baabdb588fb0edcad5325473..7fb705789d4eca6c9eeab9b2fc2a1f615bad747e 100644
--- a/drivers/hid/hid-roccat-konepure.c
+++ b/drivers/hid/hid-roccat-konepure.c
@@ -47,7 +47,7 @@ ROCCAT_COMMON2_BIN_ATTRIBUTE_R(tcu_image, 0x0c, 0x0404);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(sensor, 0x0f, 0x06);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_W(talk, 0x10, 0x10);
 
-static struct bin_attribute *konepure_bin_attrs[] = {
+static const struct bin_attribute *const konepure_bin_attrs[] = {
 	&bin_attr_actual_profile,
 	&bin_attr_control,
 	&bin_attr_info,
@@ -62,7 +62,7 @@ static struct bin_attribute *konepure_bin_attrs[] = {
 };
 
 static const struct attribute_group konepure_group = {
-	.bin_attrs = konepure_bin_attrs,
+	.bin_attrs_new = konepure_bin_attrs,
 };
 
 static const struct attribute_group *konepure_groups[] = {
diff --git a/drivers/hid/hid-roccat-ryos.c b/drivers/hid/hid-roccat-ryos.c
index 57714a4525e2ad01b8599db8325b22b57c297158..902dac1e714e16936d8ab7881b183b732cb1c110 100644
--- a/drivers/hid/hid-roccat-ryos.c
+++ b/drivers/hid/hid-roccat-ryos.c
@@ -47,7 +47,7 @@ ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(stored_lights, 0x17, 0x0566);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_W(custom_lights, 0x18, 0x14);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(light_macro, 0x19, 0x07d2);
 
-static struct bin_attribute *ryos_bin_attrs[] = {
+static const struct bin_attribute *const ryos_bin_attrs[] = {
 	&bin_attr_control,
 	&bin_attr_profile,
 	&bin_attr_keys_primary,
@@ -70,7 +70,7 @@ static struct bin_attribute *ryos_bin_attrs[] = {
 };
 
 static const struct attribute_group ryos_group = {
-	.bin_attrs = ryos_bin_attrs,
+	.bin_attrs_new = ryos_bin_attrs,
 };
 
 static const struct attribute_group *ryos_groups[] = {
diff --git a/drivers/hid/hid-roccat-savu.c b/drivers/hid/hid-roccat-savu.c
index 2baa47a0efc527086128b39130dde9535eb541c0..7399b8ffb5c7cae8110c8fb1a93f8b645f54f2eb 100644
--- a/drivers/hid/hid-roccat-savu.c
+++ b/drivers/hid/hid-roccat-savu.c
@@ -30,7 +30,7 @@ ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(macro, 0x8, 0x0823);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(info, 0x9, 0x08);
 ROCCAT_COMMON2_BIN_ATTRIBUTE_RW(sensor, 0xc, 0x04);
 
-static struct bin_attribute *savu_bin_attrs[] = {
+static const struct bin_attribute *const savu_bin_attrs[] = {
 	&bin_attr_control,
 	&bin_attr_profile,
 	&bin_attr_general,
@@ -42,7 +42,7 @@ static struct bin_attribute *savu_bin_attrs[] = {
 };
 
 static const struct attribute_group savu_group = {
-	.bin_attrs = savu_bin_attrs,
+	.bin_attrs_new = savu_bin_attrs,
 };
 
 static const struct attribute_group *savu_groups[] = {

-- 
2.47.1



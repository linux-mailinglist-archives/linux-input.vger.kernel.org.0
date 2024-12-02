Return-Path: <linux-input+bounces-8358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D39E0B96
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1205166888
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFA01DED5A;
	Mon,  2 Dec 2024 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="S6CUvyqS"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C281DE898;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166105; cv=none; b=N3X8wD/Htb7qzahcwjdbrNuc8oFs+MFzVvaz/nfTU+yc41jj1EY8XSgBjU9+eWOk1ByACbyvNkcXFfo/WXfnD0WZW3/rbtfli24Z9cIQlwdC3NGPuGw7gqIx29jgc/xS1/xhegcxvv5RckKrUFV1MlSfNriuVPJD7E4nLueZtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166105; c=relaxed/simple;
	bh=a3Pf5N4sGrorX7XWI9jWy3QCb2u2yZssbNA2NxMNfiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFBwAIup+MtrWDteFfB9sQ4bg/wuTDeXeOOn2pXzs7dqiEfUv7gPnJkN3MIDzGSoJNBtV0u752/2OY7fdVgwQdvwBDLCoLVecSWcojaG+IKHO6d+oodqVDxQT8SRGyU/3Pb2l6Khww1jFFzwESHihgSHQ7jYwHwEnlFR9qs+pMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=S6CUvyqS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=a3Pf5N4sGrorX7XWI9jWy3QCb2u2yZssbNA2NxMNfiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S6CUvyqSuRSwkHpSubMFaGclaL4c9XA+J8nEEFgFNgO9QTaTykiZn/UdJCXWvJjOJ
	 tdelalQv6GkZWDy6WxF/zQOCdwHH+C50pQEL9Lf4Q4NKASC/CiaMCoIIsLC+ptxoT5
	 gHHHKfPcGt9eskFbvr2OM2v9Q8bDHlglnJBz/6q0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:39 +0100
Subject: [PATCH 08/10] HID: roccat: kovaplus: constify 'struct
 bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-8-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=5462;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=a3Pf5N4sGrorX7XWI9jWy3QCb2u2yZssbNA2NxMNfiQ=;
 b=fu8Lvy+WdI56HZr510hBp7Mr0SqFJwoEfJEkGd4FHpnKrHGMZx57KFAZuWEEFz1P7e77oUw9o
 UDWye/kVA+QAD6RkhD2P7+lMN2GrdBRG/mHPQC4U68/DjsASM/3q9cJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-kovaplus.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-roccat-kovaplus.c b/drivers/hid/hid-roccat-kovaplus.c
index 748d4d7cb2fc3b1dcc8de6b186273c4b43f7c814..e31e4a2e62d5a79241a0e2a0fcb9518f4f6c59ff 100644
--- a/drivers/hid/hid-roccat-kovaplus.c
+++ b/drivers/hid/hid-roccat-kovaplus.c
@@ -171,8 +171,8 @@ static ssize_t kovaplus_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define KOVAPLUS_SYSFS_W(thingy, THINGY) \
 static ssize_t kovaplus_sysfs_write_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return kovaplus_sysfs_write(fp, kobj, buf, off, count, \
 			KOVAPLUS_SIZE_ ## THINGY, KOVAPLUS_COMMAND_ ## THINGY); \
@@ -180,8 +180,8 @@ static ssize_t kovaplus_sysfs_write_ ## thingy(struct file *fp, \
 
 #define KOVAPLUS_SYSFS_R(thingy, THINGY) \
 static ssize_t kovaplus_sysfs_read_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return kovaplus_sysfs_read(fp, kobj, buf, off, count, \
 			KOVAPLUS_SIZE_ ## THINGY, KOVAPLUS_COMMAND_ ## THINGY); \
@@ -193,19 +193,19 @@ KOVAPLUS_SYSFS_R(thingy, THINGY)
 
 #define KOVAPLUS_BIN_ATTRIBUTE_RW(thingy, THINGY) \
 KOVAPLUS_SYSFS_RW(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = KOVAPLUS_SIZE_ ## THINGY, \
-	.read = kovaplus_sysfs_read_ ## thingy, \
-	.write = kovaplus_sysfs_write_ ## thingy \
+	.read_new = kovaplus_sysfs_read_ ## thingy, \
+	.write_new = kovaplus_sysfs_write_ ## thingy \
 }
 
 #define KOVAPLUS_BIN_ATTRIBUTE_W(thingy, THINGY) \
 KOVAPLUS_SYSFS_W(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = KOVAPLUS_SIZE_ ## THINGY, \
-	.write = kovaplus_sysfs_write_ ## thingy \
+	.write_new = kovaplus_sysfs_write_ ## thingy \
 }
 KOVAPLUS_BIN_ATTRIBUTE_W(control, CONTROL);
 KOVAPLUS_BIN_ATTRIBUTE_RW(info, INFO);
@@ -213,8 +213,8 @@ KOVAPLUS_BIN_ATTRIBUTE_RW(profile_settings, PROFILE_SETTINGS);
 KOVAPLUS_BIN_ATTRIBUTE_RW(profile_buttons, PROFILE_BUTTONS);
 
 static ssize_t kovaplus_sysfs_read_profilex_settings(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -231,8 +231,8 @@ static ssize_t kovaplus_sysfs_read_profilex_settings(struct file *fp,
 }
 
 static ssize_t kovaplus_sysfs_read_profilex_buttons(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -249,16 +249,16 @@ static ssize_t kovaplus_sysfs_read_profilex_buttons(struct file *fp,
 }
 
 #define PROFILE_ATTR(number)						\
-static struct bin_attribute bin_attr_profile##number##_settings = {	\
+static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = KOVAPLUS_SIZE_PROFILE_SETTINGS,				\
-	.read = kovaplus_sysfs_read_profilex_settings,			\
+	.read_new = kovaplus_sysfs_read_profilex_settings,			\
 	.private = &profile_numbers[number-1],				\
 };									\
-static struct bin_attribute bin_attr_profile##number##_buttons = {	\
+static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = KOVAPLUS_SIZE_PROFILE_BUTTONS,				\
-	.read = kovaplus_sysfs_read_profilex_buttons,			\
+	.read_new = kovaplus_sysfs_read_profilex_buttons,			\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
@@ -379,7 +379,7 @@ static struct attribute *kovaplus_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *kovaplus_bin_attributes[] = {
+static const struct bin_attribute *const kovaplus_bin_attributes[] = {
 	&bin_attr_control,
 	&bin_attr_info,
 	&bin_attr_profile_settings,
@@ -399,7 +399,7 @@ static struct bin_attribute *kovaplus_bin_attributes[] = {
 
 static const struct attribute_group kovaplus_group = {
 	.attrs = kovaplus_attrs,
-	.bin_attrs = kovaplus_bin_attributes,
+	.bin_attrs_new = kovaplus_bin_attributes,
 };
 
 static const struct attribute_group *kovaplus_groups[] = {

-- 
2.47.1



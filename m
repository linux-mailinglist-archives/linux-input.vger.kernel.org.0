Return-Path: <linux-input+bounces-8355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37C9E0B83
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E753282EE6
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7128E1DF26A;
	Mon,  2 Dec 2024 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="X17bpwEj"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A91DE8A6;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166104; cv=none; b=lbpeJisQAldswO8+JFuubBB272lVLw8GojWLEoTU9ovVx6yBVtRLNGjxgF0k+BWDqSJnq/1UfnZw+bcJqXuG0DvUqjmlo8WyAI6SZO1GrM1/2ZHMvipYYMOMPLuEMnROqLoO47xLlUijjO8knFTfPoGD3UnmHW3TTyZNpNdTzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166104; c=relaxed/simple;
	bh=ao2FQsq1iWoOI4oXrdcQV0r2JcT1H6IjGL/bQumcQ6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRZCqfphaYMSHeeU+wzHFWeUERs6rmJfaVKlqdAk6u/rGtNSxC1KZMBd0R6mo4Bi+DtvjXXk92JR+mbCGPh5LZkkeRNPFMZCJK9UyzEFBKgLXHHb0r46zmhhDJT43RCT6Xr7Yl157iRb3q7bMBR581YUaafLa1VlahpIhWFguKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=X17bpwEj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=ao2FQsq1iWoOI4oXrdcQV0r2JcT1H6IjGL/bQumcQ6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X17bpwEjDacxvLIsfsp7u7qrYJAzIeGGXKpEJQQ+qK0sK5P8nCCM7cReLMvjC2n5J
	 bpzJVAlp0PLyeiuWTmtAETnoM8UljJxDAMsYyzAQjeFKV6ovwEdNUc9A/KHLIvKYpQ
	 G9mTQKipLFBC7pvT6HbiJYo9tkzBCUbtm8IxvVrE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:38 +0100
Subject: [PATCH 07/10] HID: roccat: koneplus: constify 'struct
 bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-7-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=5842;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ao2FQsq1iWoOI4oXrdcQV0r2JcT1H6IjGL/bQumcQ6k=;
 b=e+TQWywiXOxMK+tP3z8cW1MDOdww4sEhzU0a04YU9bYe0eJQNB7t4/TKSmnssaOIuZy7mVhTA
 cT/NE1D3ccDDnyON5ofUnZgef4UOxLKadNqSdEBaPhIwm6aZLDJ8oNr
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-koneplus.c | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-roccat-koneplus.c b/drivers/hid/hid-roccat-koneplus.c
index 8ccb3b14a1a9e08fc08c71f7c13324afce1f1008..5d8a5ce88b4cae003cf0e0cbf6dc818ac71e0625 100644
--- a/drivers/hid/hid-roccat-koneplus.c
+++ b/drivers/hid/hid-roccat-koneplus.c
@@ -128,8 +128,8 @@ static ssize_t koneplus_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define KONEPLUS_SYSFS_W(thingy, THINGY) \
 static ssize_t koneplus_sysfs_write_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return koneplus_sysfs_write(fp, kobj, buf, off, count, \
 			KONEPLUS_SIZE_ ## THINGY, KONEPLUS_COMMAND_ ## THINGY); \
@@ -137,8 +137,8 @@ static ssize_t koneplus_sysfs_write_ ## thingy(struct file *fp, \
 
 #define KONEPLUS_SYSFS_R(thingy, THINGY) \
 static ssize_t koneplus_sysfs_read_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return koneplus_sysfs_read(fp, kobj, buf, off, count, \
 			KONEPLUS_SIZE_ ## THINGY, KONEPLUS_COMMAND_ ## THINGY); \
@@ -150,27 +150,27 @@ KONEPLUS_SYSFS_R(thingy, THINGY)
 
 #define KONEPLUS_BIN_ATTRIBUTE_RW(thingy, THINGY) \
 KONEPLUS_SYSFS_RW(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.read = koneplus_sysfs_read_ ## thingy, \
-	.write = koneplus_sysfs_write_ ## thingy \
+	.read_new = koneplus_sysfs_read_ ## thingy, \
+	.write_new = koneplus_sysfs_write_ ## thingy \
 }
 
 #define KONEPLUS_BIN_ATTRIBUTE_R(thingy, THINGY) \
 KONEPLUS_SYSFS_R(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.read = koneplus_sysfs_read_ ## thingy, \
+	.read_new = koneplus_sysfs_read_ ## thingy, \
 }
 
 #define KONEPLUS_BIN_ATTRIBUTE_W(thingy, THINGY) \
 KONEPLUS_SYSFS_W(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.write = koneplus_sysfs_write_ ## thingy \
+	.write_new = koneplus_sysfs_write_ ## thingy \
 }
 KONEPLUS_BIN_ATTRIBUTE_W(control, CONTROL);
 KONEPLUS_BIN_ATTRIBUTE_W(talk, TALK);
@@ -183,8 +183,8 @@ KONEPLUS_BIN_ATTRIBUTE_RW(profile_settings, PROFILE_SETTINGS);
 KONEPLUS_BIN_ATTRIBUTE_RW(profile_buttons, PROFILE_BUTTONS);
 
 static ssize_t koneplus_sysfs_read_profilex_settings(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -201,8 +201,8 @@ static ssize_t koneplus_sysfs_read_profilex_settings(struct file *fp,
 }
 
 static ssize_t koneplus_sysfs_read_profilex_buttons(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -219,16 +219,16 @@ static ssize_t koneplus_sysfs_read_profilex_buttons(struct file *fp,
 }
 
 #define PROFILE_ATTR(number)						\
-static struct bin_attribute bin_attr_profile##number##_settings = {	\
+static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = KONEPLUS_SIZE_PROFILE_SETTINGS,				\
-	.read = koneplus_sysfs_read_profilex_settings,			\
+	.read_new = koneplus_sysfs_read_profilex_settings,		\
 	.private = &profile_numbers[number-1],				\
 };									\
-static struct bin_attribute bin_attr_profile##number##_buttons = {	\
+static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = KONEPLUS_SIZE_PROFILE_BUTTONS,				\
-	.read = koneplus_sysfs_read_profilex_buttons,			\
+	.read_new = koneplus_sysfs_read_profilex_buttons,		\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
@@ -321,7 +321,7 @@ static struct attribute *koneplus_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *koneplus_bin_attributes[] = {
+static const struct bin_attribute *const koneplus_bin_attributes[] = {
 	&bin_attr_control,
 	&bin_attr_talk,
 	&bin_attr_macro,
@@ -346,7 +346,7 @@ static struct bin_attribute *koneplus_bin_attributes[] = {
 
 static const struct attribute_group koneplus_group = {
 	.attrs = koneplus_attrs,
-	.bin_attrs = koneplus_bin_attributes,
+	.bin_attrs_new = koneplus_bin_attributes,
 };
 
 static const struct attribute_group *koneplus_groups[] = {

-- 
2.47.1



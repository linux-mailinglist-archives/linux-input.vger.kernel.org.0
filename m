Return-Path: <linux-input+bounces-8357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B39E0B89
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A9828099B
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C28C1DF72E;
	Mon,  2 Dec 2024 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NFfgHJrX"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40771DE8AD;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166104; cv=none; b=PMQRv6Hf839lbSpFihZmPauDel3jhYzWAdSsXtHSHt1NEH9xbIIn+ij7QPhQahOELQ1XIOHcV1KWqsPOcOP04rlLFnBI7UQg2W/qsUQYFYYTBjnZ1LetqXalxhniZqT5f5VpF36Yd3fz47jNwgX036/Hifu4ZINR1F8EtUnSJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166104; c=relaxed/simple;
	bh=GrX8bTf9cJi04Oy6X8nbhkoX39lESfzTFSk3V/Mc9RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmWLrJReH5VzS9SW9kpEcP2TiqItUN5MaG7xrq+ZUxP3HbEmncmGuA4Qsgl94kN98V1n/AU/vs/JW1OVw9rUo4jmNEYzXlYcoq96ZtVcpDcn3/wMUpIOGci6GiyjHj3zPZojrwjF6vcpocau37CjNGLL2QoTV9t8QiSTqNnaKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NFfgHJrX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=GrX8bTf9cJi04Oy6X8nbhkoX39lESfzTFSk3V/Mc9RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NFfgHJrXrq4PKIYWGoyCf/HvmqVPVSxCrZSjBl3ziFOwqU8vHzoUpoh7QPRWUiD+S
	 zn5ATxAMaCArER/zdzq47R1rEvY+E354ZSz5OxkcpkvsWsa147BURflZmIGclPIZiV
	 Yi/8am2fIPSH/WqFTpLDeqlJ9fgTVghexHKd27Nk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:41 +0100
Subject: [PATCH 10/10] HID: roccat: pyro: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-10-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=6442;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GrX8bTf9cJi04Oy6X8nbhkoX39lESfzTFSk3V/Mc9RM=;
 b=k2BZMbPJN1o4kNzfgID5b+1W5//S6RZh0UBFaS6YvCL5pcXg4E1onTwgG6AWTBzNiAmpECi08
 HjuQcd64FLND1/HM3I9EaBnYJCWDOvRyLua61Knn9t0DecND/OeBvI5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-pyra.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/hid-roccat-pyra.c b/drivers/hid/hid-roccat-pyra.c
index eeb3d38cd80584bd716ad493cff2892a2d5af552..2b53fbfbb8979ad1d1994e462b624b3f72480447 100644
--- a/drivers/hid/hid-roccat-pyra.c
+++ b/drivers/hid/hid-roccat-pyra.c
@@ -129,8 +129,8 @@ static ssize_t pyra_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define PYRA_SYSFS_W(thingy, THINGY) \
 static ssize_t pyra_sysfs_write_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return pyra_sysfs_write(fp, kobj, buf, off, count, \
 			PYRA_SIZE_ ## THINGY, PYRA_COMMAND_ ## THINGY); \
@@ -138,8 +138,8 @@ static ssize_t pyra_sysfs_write_ ## thingy(struct file *fp, \
 
 #define PYRA_SYSFS_R(thingy, THINGY) \
 static ssize_t pyra_sysfs_read_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, char *buf, \
-		loff_t off, size_t count) \
+		struct kobject *kobj, const struct bin_attribute *attr, \
+		char *buf, loff_t off, size_t count) \
 { \
 	return pyra_sysfs_read(fp, kobj, buf, off, count, \
 			PYRA_SIZE_ ## THINGY, PYRA_COMMAND_ ## THINGY); \
@@ -151,27 +151,27 @@ PYRA_SYSFS_R(thingy, THINGY)
 
 #define PYRA_BIN_ATTRIBUTE_RW(thingy, THINGY) \
 PYRA_SYSFS_RW(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = PYRA_SIZE_ ## THINGY, \
-	.read = pyra_sysfs_read_ ## thingy, \
-	.write = pyra_sysfs_write_ ## thingy \
+	.read_new = pyra_sysfs_read_ ## thingy, \
+	.write_new = pyra_sysfs_write_ ## thingy \
 }
 
 #define PYRA_BIN_ATTRIBUTE_R(thingy, THINGY) \
 PYRA_SYSFS_R(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
-	.size = PYRA_SIZE_ ## THINGY, \
-	.read = pyra_sysfs_read_ ## thingy, \
+	.size_new = PYRA_SIZE_ ## THINGY, \
+	.read_new = pyra_sysfs_read_ ## thingy, \
 }
 
 #define PYRA_BIN_ATTRIBUTE_W(thingy, THINGY) \
 PYRA_SYSFS_W(thingy, THINGY); \
-static struct bin_attribute bin_attr_##thingy = { \
+static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = PYRA_SIZE_ ## THINGY, \
-	.write = pyra_sysfs_write_ ## thingy \
+	.write_new = pyra_sysfs_write_ ## thingy \
 }
 
 PYRA_BIN_ATTRIBUTE_W(control, CONTROL);
@@ -180,8 +180,8 @@ PYRA_BIN_ATTRIBUTE_RW(profile_settings, PROFILE_SETTINGS);
 PYRA_BIN_ATTRIBUTE_RW(profile_buttons, PROFILE_BUTTONS);
 
 static ssize_t pyra_sysfs_read_profilex_settings(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -198,8 +198,8 @@ static ssize_t pyra_sysfs_read_profilex_settings(struct file *fp,
 }
 
 static ssize_t pyra_sysfs_read_profilex_buttons(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
@@ -216,16 +216,16 @@ static ssize_t pyra_sysfs_read_profilex_buttons(struct file *fp,
 }
 
 #define PROFILE_ATTR(number)						\
-static struct bin_attribute bin_attr_profile##number##_settings = {	\
+static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = PYRA_SIZE_PROFILE_SETTINGS,				\
-	.read = pyra_sysfs_read_profilex_settings,			\
+	.read_new = pyra_sysfs_read_profilex_settings,			\
 	.private = &profile_numbers[number-1],				\
 };									\
-static struct bin_attribute bin_attr_profile##number##_buttons = {	\
+static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = PYRA_SIZE_PROFILE_BUTTONS,				\
-	.read = pyra_sysfs_read_profilex_buttons,			\
+	.read_new = pyra_sysfs_read_profilex_buttons,			\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
@@ -235,8 +235,8 @@ PROFILE_ATTR(4);
 PROFILE_ATTR(5);
 
 static ssize_t pyra_sysfs_write_settings(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr, char *buf,
-		loff_t off, size_t count)
+		struct kobject *kobj, const struct bin_attribute *attr,
+		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct pyra_device *pyra = hid_get_drvdata(dev_get_drvdata(dev));
@@ -273,7 +273,7 @@ static ssize_t pyra_sysfs_write_settings(struct file *fp,
 }
 
 PYRA_SYSFS_R(settings, SETTINGS);
-static struct bin_attribute bin_attr_settings =
+static const struct bin_attribute bin_attr_settings =
 	__BIN_ATTR(settings, (S_IWUSR | S_IRUGO),
 		   pyra_sysfs_read_settings, pyra_sysfs_write_settings,
 		   PYRA_SIZE_SETTINGS);
@@ -334,7 +334,7 @@ static struct attribute *pyra_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *pyra_bin_attributes[] = {
+static const struct bin_attribute *const pyra_bin_attributes[] = {
 	&bin_attr_control,
 	&bin_attr_info,
 	&bin_attr_profile_settings,
@@ -355,7 +355,7 @@ static struct bin_attribute *pyra_bin_attributes[] = {
 
 static const struct attribute_group pyra_group = {
 	.attrs = pyra_attrs,
-	.bin_attrs = pyra_bin_attributes,
+	.bin_attrs_new = pyra_bin_attributes,
 };
 
 static const struct attribute_group *pyra_groups[] = {

-- 
2.47.1



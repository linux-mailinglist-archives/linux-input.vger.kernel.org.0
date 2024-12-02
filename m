Return-Path: <linux-input+bounces-8352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64A9E0B8B
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C496164CB7
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6F81DE4E0;
	Mon,  2 Dec 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Kg8/7Iv8"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DAC1DE3B9;
	Mon,  2 Dec 2024 19:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166101; cv=none; b=aP9M9r2dirVnDFL5SU1USFiRpLK44p3ugg6Cu22mPPzKWyurmh86yXxGNA6bvBbj+uAsJgK1sBdATOMVrgKShar5zQLxsF6aAoJNNxqLfcotUX8U1PqZRNSS8UeDlZGp0TGsRc75HlEj4TF03BZun/xjaVz0iA8mZfcchH0zGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166101; c=relaxed/simple;
	bh=Ohq8+c1dd3SqMO+qdThy++GCnwzw8Ese+urHJB5rBLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3qezATLI+chGxy+w9Y5A9ZN5rZixwdh5gjKT0tKE2Vm71jJOqv5pwgBAOcIfSaXlIMZnk3FmA9ppenTK0ab/RpHRPD8bLsFealmplPCac1PzoAATBkqfx9rEDp0Ew8NHFhqqoamcpl3vZT79ME0OIbv26rmPTJI9tUe3YRfpaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Kg8/7Iv8; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=Ohq8+c1dd3SqMO+qdThy++GCnwzw8Ese+urHJB5rBLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kg8/7Iv8P2tzeiy6SnLefdE1e+dVu5TCW3axBnmuTPEQt324kPQXAZIVa3EHXbJ7x
	 FG1xtx+YeCama+LqN4s754Ni4oqE5Y6339tetbXmBB/zwiJx6TuR+HtGm2k+PvUsed
	 jc4R15IeDyUqYgJbDDrmBvehCdBgbRb5Q3+3YjI8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:37 +0100
Subject: [PATCH 06/10] HID: roccat: kone: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-6-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=3988;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Ohq8+c1dd3SqMO+qdThy++GCnwzw8Ese+urHJB5rBLc=;
 b=L9Z2WeXj5qTluCiyo2yvQU1TRpE34Xvkf4Jm5oD0HcEVHqqcm8/PI0ZXk3Wy0LfBBru4Iqx3E
 jHhpuZTJdrWBK1dVgLe1qTADHFJ5npV5SH+6xFsfyTHTRK++MUkQUVK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-kone.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 3f8f459edcf3c71a655c1d505f94d7e19946bf09..b3c0242e5a37848893e2ab4303f5e6f04a650208 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -261,7 +261,7 @@ static int kone_get_firmware_version(struct usb_device *usb_dev, int *result)
 }
 
 static ssize_t kone_sysfs_read_settings(struct file *fp, struct kobject *kobj,
-		struct bin_attribute *attr, char *buf,
+		const struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
@@ -285,7 +285,7 @@ static ssize_t kone_sysfs_read_settings(struct file *fp, struct kobject *kobj,
  * case of error the old data is still valid
  */
 static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
-		struct bin_attribute *attr, char *buf,
+		const struct bin_attribute *attr, char *buf,
 		loff_t off, size_t count) {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
@@ -327,11 +327,11 @@ static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
 
 	return sizeof(struct kone_settings);
 }
-static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
-		kone_sysfs_write_settings, sizeof(struct kone_settings));
+static const BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
+		      kone_sysfs_write_settings, sizeof(struct kone_settings));
 
 static ssize_t kone_sysfs_read_profilex(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr,
+		struct kobject *kobj, const struct bin_attribute *attr,
 		char *buf, loff_t off, size_t count) {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
@@ -351,7 +351,7 @@ static ssize_t kone_sysfs_read_profilex(struct file *fp,
 
 /* Writes data only if different to stored data */
 static ssize_t kone_sysfs_write_profilex(struct file *fp,
-		struct kobject *kobj, struct bin_attribute *attr,
+		struct kobject *kobj, const struct bin_attribute *attr,
 		char *buf, loff_t off, size_t count) {
 	struct device *dev = kobj_to_dev(kobj)->parent->parent;
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
@@ -382,11 +382,11 @@ static ssize_t kone_sysfs_write_profilex(struct file *fp,
 	return sizeof(struct kone_profile);
 }
 #define PROFILE_ATTR(number)					\
-static struct bin_attribute bin_attr_profile##number = {	\
+static const struct bin_attribute bin_attr_profile##number = {	\
 	.attr = { .name = "profile" #number, .mode = 0660 },	\
 	.size = sizeof(struct kone_profile),			\
-	.read = kone_sysfs_read_profilex,			\
-	.write = kone_sysfs_write_profilex,			\
+	.read_new = kone_sysfs_read_profilex,			\
+	.write_new = kone_sysfs_write_profilex,			\
 	.private = &profile_numbers[number-1],			\
 }
 PROFILE_ATTR(1);
@@ -634,7 +634,7 @@ static struct attribute *kone_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *kone_bin_attributes[] = {
+static const struct bin_attribute *const kone_bin_attributes[] = {
 	&bin_attr_settings,
 	&bin_attr_profile1,
 	&bin_attr_profile2,
@@ -646,7 +646,7 @@ static struct bin_attribute *kone_bin_attributes[] = {
 
 static const struct attribute_group kone_group = {
 	.attrs = kone_attrs,
-	.bin_attrs = kone_bin_attributes,
+	.bin_attrs_new = kone_bin_attributes,
 };
 
 static const struct attribute_group *kone_groups[] = {

-- 
2.47.1



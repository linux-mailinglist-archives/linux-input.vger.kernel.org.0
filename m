Return-Path: <linux-input+bounces-8350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEA9E0B85
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 110A9166250
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB3C1DE3C4;
	Mon,  2 Dec 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PLfzNvfD"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809E76C61;
	Mon,  2 Dec 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166101; cv=none; b=AhCKCn+ij+/c+eJG6IlJtA/SSON5glUX1DD5ACUs5r+gJCOtmU4+VEw/cxYJiPhKVqbdlaimk80IVCpoGGjTQcNJP1dAO0oBR27MsXkutD62NECCb/QKEMKTZkATi9R8PXi1US+f2byPRRUp7DBlFa/d80XAURLDjJWwkwKM8mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166101; c=relaxed/simple;
	bh=c1qwOEpaXBw713rqqX9Jhn5TXesP1tGcvEejtehGK9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2n3UuvSIunrvbi9qofZRsSlpfZi0R4BCQMVKGiB3P30tnXiUtB/APJ0xBcAAU0CsQs6BSyJukdR/kCsEZ/+pHXJgh91N3nEnvNj688h8hDLy328q+BBLfjFY0R+lxJECInzFgmy3HPe8gSZ1AC2Qu1C5aab6DROCaZ4Vm5mLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PLfzNvfD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166097;
	bh=c1qwOEpaXBw713rqqX9Jhn5TXesP1tGcvEejtehGK9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PLfzNvfDqqi+FZQQthzulwJfxIE8P6FYowbFZtxMO/VhqQad3KQqm0v2b1++6Ughw
	 vW4+U1Kle5pcq8NYqW7LvBEIYZLnHdyqW3oreUbCexg6lFioYvjmJVa/WEYQ7U5qTY
	 uKWOU7jBqEmkIUibVgFW7C/an5RE7y+ydaWitcCY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:32 +0100
Subject: [PATCH 01/10] HID: core: use utility macros to define sysfs
 attributes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-1-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=2210;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=c1qwOEpaXBw713rqqX9Jhn5TXesP1tGcvEejtehGK9c=;
 b=vuWyfhxvlcamknzZAqseRyndHjMXM5pIWhtgPIbf1ZDvXAgjLgF6d20rMTxKKUTX9WNOuQsQL
 JeHpWeKGORqARcxScepKBI2i4AffGGJbNrMsqwI+WZh3fv6PCUEgDyi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Save some lines of code and prepare for the constification of
'struct bin_attribute'.
Also align the definitions within the source file.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-core.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 98bef39642a9e3008e60a60fa887b8328ccd50f5..c7a8066061f621e80ec37f303d8a310d126569b4 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2174,9 +2174,9 @@ static bool hid_hiddev(struct hid_device *hdev)
 
 
 static ssize_t
-read_report_descriptor(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr,
-		char *buf, loff_t off, size_t count)
+report_descriptor_read(struct file *filp, struct kobject *kobj,
+		       struct bin_attribute *attr,
+		       char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct hid_device *hdev = to_hid_device(dev);
@@ -2193,24 +2193,17 @@ read_report_descriptor(struct file *filp, struct kobject *kobj,
 }
 
 static ssize_t
-show_country(struct device *dev, struct device_attribute *attr,
-		char *buf)
+country_show(struct device *dev, struct device_attribute *attr,
+	     char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 
 	return sprintf(buf, "%02x\n", hdev->country & 0xff);
 }
 
-static struct bin_attribute dev_bin_attr_report_desc = {
-	.attr = { .name = "report_descriptor", .mode = 0444 },
-	.read = read_report_descriptor,
-	.size = HID_MAX_DESCRIPTOR_SIZE,
-};
+static BIN_ATTR_RO(report_descriptor, HID_MAX_DESCRIPTOR_SIZE);
 
-static const struct device_attribute dev_attr_country = {
-	.attr = { .name = "country", .mode = 0444 },
-	.show = show_country,
-};
+static const DEVICE_ATTR_RO(country);
 
 int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 {
@@ -2801,7 +2794,7 @@ static struct attribute *hid_dev_attrs[] = {
 	NULL,
 };
 static struct bin_attribute *hid_dev_bin_attrs[] = {
-	&dev_bin_attr_report_desc,
+	&bin_attr_report_descriptor,
 	NULL
 };
 static const struct attribute_group hid_dev_group = {

-- 
2.47.1



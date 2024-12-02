Return-Path: <linux-input+bounces-8353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0E9E0B92
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275261640B5
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3B51DF25D;
	Mon,  2 Dec 2024 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="T7WVgaLB"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCF1DE897;
	Mon,  2 Dec 2024 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166104; cv=none; b=YZPjnDD05LljJ+y7D/OY8Gcz1AYEgnTfBWviWXa+R1yXh5hxvBy1K5X5+3qVmaJ9q1pBLscXVLmgSg8RhSh8ZVeyRwUND6m1J/Rlu8mY83ze4BLZTUuHWfjdwpQAIdsk+XhtvMzQw4dlysjFYXHq2w2LyBlit85WyC5xL7W49LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166104; c=relaxed/simple;
	bh=THdnx7QklmtBe3zqiT18nfe4kx5JMDjC/QV5xfe7anc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMOqzPZpu/x2SqUCWF/CGa39wsAhrCxU6VEaVSBP197lgMr9GHkkdTghr+6Ql1B5hVoI2rXCXkCUbBtws7A5u6vehtRL3bdqMoCMK7S58zlJyd/C5Gmimg41zv2Ip8M3MJH0akDrrbQbhda95KOFMYxR75+A6ebEdI/lDeGkgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=T7WVgaLB; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166098;
	bh=THdnx7QklmtBe3zqiT18nfe4kx5JMDjC/QV5xfe7anc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T7WVgaLBV/feUKyLsz8xCd80o0lqJOHjACVk616l5Rx5LR60dUcmwk94wk4bRxuJI
	 i3ftrudBr2XMm+u0l10F2hMdMgKMpO2SqmbzVClEa/uJxoMvilpab+nqWdP/7QRIHc
	 6HiyUpASLghabNu5fW7jIGT+/ZR+2v9Rf2jNOmQE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:01:40 +0100
Subject: [PATCH 09/10] HID: roccat: lua: constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-9-16369423a48a@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=2045;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=THdnx7QklmtBe3zqiT18nfe4kx5JMDjC/QV5xfe7anc=;
 b=ZFzHYctojMhJbh5ZoxHNWUnS0B1vQayAZMgn6kW/GZgt+V8mpV/pDRWa3QLuwXsemeaNo/sQH
 LLZWMKc4wO/D5GM/gtACyc350LnrXZ1kUj2i8AmQRXFI+PHe12/DwfZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-roccat-lua.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-roccat-lua.c b/drivers/hid/hid-roccat-lua.c
index d5ddf0d68346b2c147f3c888badb77c06d77f46c..023ec64b4b0ea2f8168839ef6fd2c93c02846eab 100644
--- a/drivers/hid/hid-roccat-lua.c
+++ b/drivers/hid/hid-roccat-lua.c
@@ -66,7 +66,7 @@ static ssize_t lua_sysfs_write(struct file *fp, struct kobject *kobj,
 
 #define LUA_SYSFS_W(thingy, THINGY) \
 static ssize_t lua_sysfs_write_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, \
+		struct kobject *kobj, const struct bin_attribute *attr, \
 		char *buf, loff_t off, size_t count) \
 { \
 	return lua_sysfs_write(fp, kobj, buf, off, count, \
@@ -75,7 +75,7 @@ static ssize_t lua_sysfs_write_ ## thingy(struct file *fp, \
 
 #define LUA_SYSFS_R(thingy, THINGY) \
 static ssize_t lua_sysfs_read_ ## thingy(struct file *fp, \
-		struct kobject *kobj, struct bin_attribute *attr, \
+		struct kobject *kobj, const struct bin_attribute *attr, \
 		char *buf, loff_t off, size_t count) \
 { \
 	return lua_sysfs_read(fp, kobj, buf, off, count, \
@@ -85,11 +85,11 @@ static ssize_t lua_sysfs_read_ ## thingy(struct file *fp, \
 #define LUA_BIN_ATTRIBUTE_RW(thingy, THINGY) \
 LUA_SYSFS_W(thingy, THINGY) \
 LUA_SYSFS_R(thingy, THINGY) \
-static struct bin_attribute lua_ ## thingy ## _attr = { \
+static const struct bin_attribute lua_ ## thingy ## _attr = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = LUA_SIZE_ ## THINGY, \
-	.read = lua_sysfs_read_ ## thingy, \
-	.write = lua_sysfs_write_ ## thingy \
+	.read_new = lua_sysfs_read_ ## thingy, \
+	.write_new = lua_sysfs_write_ ## thingy \
 };
 
 LUA_BIN_ATTRIBUTE_RW(control, CONTROL)

-- 
2.47.1



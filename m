Return-Path: <linux-input+bounces-9557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F1A1CAA7
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 16:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0744F3AAE36
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058E01DE88E;
	Sun, 26 Jan 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2AbKkaV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6419D892;
	Sun, 26 Jan 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903684; cv=none; b=J/EkWM4QynuDw/UBRnuyDSMaTy3puR9uf3CBLUdMlJYuNzptN3Ozb0NCsJwyQq29F6Xza2YJwrp3i8q8nGAVeG/HTklN2zDx7Mc5vYzW/VXv/AQjyNlC49hINxW39z3JkQfoLgurOa51BX/rUC79xvYF56rBHwTaoDy9Z3Kn3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903684; c=relaxed/simple;
	bh=MH9EErzQ/ORF1jDEw+hxeb4L95Si43oWN24TKIPfhYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BGvELVUBz1qkwYlfVNeDQeCPh3sbe8uhejgZu6s8LILxOLndOahQgEJe7zpgypCVIOi444AxjLTHmJMhJDZ+pqVEptw9+KyyS6H/XAtlXD1bditJrNvhRzypsxBiHN/8qsv/JafJcFzr6nWm5IxjSnQqYDbBcAQIM9hoX1ZG4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2AbKkaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE4DC4CED3;
	Sun, 26 Jan 2025 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903684;
	bh=MH9EErzQ/ORF1jDEw+hxeb4L95Si43oWN24TKIPfhYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2AbKkaV8oaSce7N5nOvu4nsKkWusRjbZ0hATMrY7WmG9ve/a74iSW0VGK2MltACW
	 uspzVf8/c2phIyQzK4D45y8bDu7/gQokSBWpyqvXkVYjIbq6aroVGKoUfnNMJhNyA/
	 /eunZdYJsOsDexQHyNqH01KYfT1hb1ztOVJWlWSQdWrwU7GjHmFrdt4t8K2/sMfmbH
	 btkylbxT0I6tkvQqGQH+oN3PuaZ/Cl/v38Vb3fV8aw4x+0aDz1aVPA4h3K9NQLTgqZ
	 ac/p2vltgK+u8LWMYZ3f3xxpKh05WtrdqQ3bcdlES/6BxSHYh+xyKuJkCPEwG8SSFg
	 4sAeQpCbUHkXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Youwan Wang <youwan@nfschina.com>,
	Enze Xie <enze@nfschina.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 15/35] HID: multitouch: Add quirk for Hantick 5288 touchpad
Date: Sun, 26 Jan 2025 10:00:09 -0500
Message-Id: <20250126150029.953021-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150029.953021-1-sashal@kernel.org>
References: <20250126150029.953021-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Youwan Wang <youwan@nfschina.com>

[ Upstream commit b5e65ae557da9fd17b08482ee44ee108ba636182 ]

This device sometimes doesn't send touch release signals when moving
from >=2 fingers to <2 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

Signed-off-by: Enze Xie <enze@nfschina.com>
Signed-off-by: Youwan Wang <youwan@nfschina.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 65023bfe30ed2..85c5d4a2d006d 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2314,6 +2314,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,
 			HID_ANY_ID) },
 
+	/* Hantick */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			   I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288) },
+
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 
-- 
2.39.5



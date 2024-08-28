Return-Path: <linux-input+bounces-5925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0C96214F
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7311C21C08
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F5166F1D;
	Wed, 28 Aug 2024 07:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QwuBeYfD"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA97166F0B;
	Wed, 28 Aug 2024 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830497; cv=none; b=cdGe//bJ/PzEuTQx0JgtDsRANhd+PYz6klzFZf63X1CZzM8KnEJfRna4jaFAuLZ/r5jMZ4IdtneXMefxxZ119DI38MQDbYdYC8wGbyKiV8kpCSNTQ9ksHH+7LSjVANToHw7c/fMtQiyXEiGGlxoF1Vdqj2CKV1gSYWQaMNa9nSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830497; c=relaxed/simple;
	bh=MUG+GgrRIkc7eiHdF9hdxnaVPvsfw77S7LOFjwJ8l+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjQwlsLYqjCMzuPdJ8D9+bson0Oc4WdPdVDzFuRcbYeaame5UZ2C5AzcmguuuV3qNDdNOVscOCEUoUQJVHimohnXb5Pe4/R3rb9s3pau87cJmjqg5qDDOmcB/GrrxdYpw8JTnY+4mElOvfEBE5XrZou+Z139rxW2L7m+koGyeqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QwuBeYfD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830494;
	bh=MUG+GgrRIkc7eiHdF9hdxnaVPvsfw77S7LOFjwJ8l+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QwuBeYfDaLX/fsOh0+99MQuAqw7s1okX/N5pMJzSDRRftYU6tM2TLFi5kSdMuasY4
	 5LvSV01QAlTiSdls8h3vKIiFp/WReX3SPHH/Vbs5rhXAtGzBUOHEPjlsaPBYFT6cDl
	 QW7Jnjl+MeiAU5ecubGRxUW/GofT+A5p6lHd+IgU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:30 +0200
Subject: [PATCH 11/14] HID: sony: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-11-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1816;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MUG+GgrRIkc7eiHdF9hdxnaVPvsfw77S7LOFjwJ8l+U=;
 b=LqYUJr+TcxlROohFjV9DxjVrTGAXGJcnN+PkyGw0jTb5zqnEipvuKltiD2jlCU84A/etRTUoR
 qOxB2KMeklWAs0EEOua2AenbTWAOSmLG7bUTm8eTHHN188oL6dh550C
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-sony.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 8e2e914bd236..df29c614e490 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -99,7 +99,7 @@ static const char ghl_ps4_magic_data[] = {
 };
 
 /* PS/3 Motion controller */
-static u8 motion_rdesc[] = {
+static const u8 motion_rdesc[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
 	0x09, 0x04,         /*  Usage (Joystick),                   */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -195,7 +195,7 @@ static u8 motion_rdesc[] = {
 	0xC0                /*  End Collection                      */
 };
 
-static u8 ps3remote_rdesc[] = {
+static const u8 ps3remote_rdesc[] = {
 	0x05, 0x01,          /* GUsagePage Generic Desktop */
 	0x09, 0x05,          /* LUsage 0x05 [Game Pad] */
 	0xA1, 0x01,          /* MCollection Application (mouse, keyboard) */
@@ -599,15 +599,15 @@ static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
-static u8 *motion_fixup(struct hid_device *hdev, u8 *rdesc,
-			     unsigned int *rsize)
+static const u8 *motion_fixup(struct hid_device *hdev, u8 *rdesc,
+			      unsigned int *rsize)
 {
 	*rsize = sizeof(motion_rdesc);
 	return motion_rdesc;
 }
 
-static u8 *ps3remote_fixup(struct hid_device *hdev, u8 *rdesc,
-			     unsigned int *rsize)
+static const u8 *ps3remote_fixup(struct hid_device *hdev, u8 *rdesc,
+				 unsigned int *rsize)
 {
 	*rsize = sizeof(ps3remote_rdesc);
 	return ps3remote_rdesc;

-- 
2.46.0



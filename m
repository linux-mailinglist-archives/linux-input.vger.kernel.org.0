Return-Path: <linux-input+bounces-5916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2E96213A
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D8B1C22B88
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E8D15B54F;
	Wed, 28 Aug 2024 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gyG156zS"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67D915AADE;
	Wed, 28 Aug 2024 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830479; cv=none; b=dGLjHo5ZD2qgn4IjWo2HBfrEbzybThPhVx+cUfrXnzkJ9y0tVeNY7NpEfKsGkgrKyQpdCS7CxaETeuFZTAVLxKGwKUDBVNMaNJLlt9gzBn6LIDCmj5Uc51xuAmpw82bmdZ2X6uZfsWjnGgf5DGQXUb2ZLElTCMqkA5ZEzDZqsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830479; c=relaxed/simple;
	bh=b0SHEar1LjwTGvnWhUaEDqZURBTUdfYfF4a/RRvIPVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOY5dg98DZ2ieDEB9oSuoaEU7GkwOJ1lSdHHD1rjvJCcK7g4gpmaxwtL92HrSDuuq38OqFXQT0sC4mz03Ve/nqZsAszqbFd5mGj22GDLENTG6sOHlJvDB2cmbVfUTB41xiCnkVYtbGpLMVykEjydi02rTzFWvgTRJpLWd5kq9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gyG156zS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830475;
	bh=b0SHEar1LjwTGvnWhUaEDqZURBTUdfYfF4a/RRvIPVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gyG156zSHA4PGk7BcoHQ4Iam4SCgQDnQOj+KC8mUGUZk/shFh4zJliNoIevwEn8AQ
	 xRs8eLE5CsVrHdyhXo8YG6NhCA9g6yZBf+9BRMXqwPKF9F8vT9V0Fy37dqSiiqc7Tr
	 swTwZlwgAyb4wcCu454Yx8mHc3jIV5uVpUqWinTM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:25 +0200
Subject: [PATCH 06/14] HID: xiaomi: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-6-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1338;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=b0SHEar1LjwTGvnWhUaEDqZURBTUdfYfF4a/RRvIPVU=;
 b=1+CZsM0eFLR+zRqBprh75hyhVhbOKluAdjArhN5Rt7lFHKQKnKVEvVEE8G33Gt+Kq576MUSr7
 Cjef+krNr5nAmlJVC287juDCtvaXiMFA+FCvgLzMu4xOyfCbeyOBXhy
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-xiaomi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-xiaomi.c b/drivers/hid/hid-xiaomi.c
index 035733fce2e1..ef6598550a40 100644
--- a/drivers/hid/hid-xiaomi.c
+++ b/drivers/hid/hid-xiaomi.c
@@ -14,7 +14,7 @@
 /* Fixed Mi Silent Mouse report descriptor */
 /* Button's Usage Maximum changed from 3 to 5 to make side buttons work */
 #define MI_SILENT_MOUSE_ORIG_RDESC_LENGTH   87
-static __u8 mi_silent_mouse_rdesc_fixed[] = {
+static const __u8 mi_silent_mouse_rdesc_fixed[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
 	0x09, 0x02,         /*  Usage (Mouse),                      */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -68,8 +68,8 @@ static const __u8 *xiaomi_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	case USB_DEVICE_ID_MI_SILENT_MOUSE:
 		if (*rsize == MI_SILENT_MOUSE_ORIG_RDESC_LENGTH) {
 			hid_info(hdev, "fixing up Mi Silent Mouse report descriptor\n");
-			rdesc = mi_silent_mouse_rdesc_fixed;
 			*rsize = sizeof(mi_silent_mouse_rdesc_fixed);
+			return mi_silent_mouse_rdesc_fixed;
 		}
 		break;
 	}

-- 
2.46.0



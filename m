Return-Path: <linux-input+bounces-5913-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54B962135
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 290AEB24CF6
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7961415B10C;
	Wed, 28 Aug 2024 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MNxh+maX"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FABA15AAC6;
	Wed, 28 Aug 2024 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830461; cv=none; b=l4V0IX9SrmyjgWV7brDjCHTgk1PdcJsBHRSkR7dDaC8Em3BWL2rzbRoGtTMb5xSNFcnGY+NMopItQP1V6YeNvG0wu+KI2mfZ6fo0YT+9aRzk+XpFsmojl4TZxMG139JcIFuG609kkRex7dgBqOGqFwmaZdtiDIPWbeupgO94sqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830461; c=relaxed/simple;
	bh=ZoeDwrTr7TMpwmX0t0rvsYpMVkIbB6PZwEyly8Jstd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pF+H2cS+O8YVIcS8TCsKd8J2i+nWe2rUroYOrt6RQTJhtpItszfODWtI9C8h25bBX3KGGasFye1E9Hafw0pFEXWt7UmODoPFf8eSmd+HhxrjpPGghLRmmAi6PDtLLg6DW++ciwcH/nu7rt+Fenp0XRMTWhLNQeio6Rboy5QYyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MNxh+maX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830457;
	bh=ZoeDwrTr7TMpwmX0t0rvsYpMVkIbB6PZwEyly8Jstd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MNxh+maXAqU+m8DkzxXQOOC0nGzSekiBqMEcN2pRFnFnkHmulJzF3xVCi8dwULCd0
	 bJIF7UdX18yWtIVH6+drMqHk43TUDNJYDfbsfiuZZmr1J8ZYknDYR1ufrrrL6+j6NI
	 ZET3MqCBxwqBHi6kFyet+6ruGeZjoUb/2fT/L90g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:20 +0200
Subject: [PATCH 01/14] HID: bigbenff: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-1-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1184;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZoeDwrTr7TMpwmX0t0rvsYpMVkIbB6PZwEyly8Jstd4=;
 b=eEZPwKVjrNNUZyECxP5NutenaxR5XxWaB0Mpsgrp5GPKQzslKkW6tTvRXNers7+fZy5RmJAsC
 b4mPpgdhbhODOL8hkuFEXmrcshSgoZctTlNh720EF8EcmnVPTrAVKdQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-bigbenff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index a2ff60dd834c..9f05465358d9 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -99,7 +99,7 @@
  * - map previously unused analog trigger data to Z/RZ
  * - simplify feature and output descriptor
  */
-static __u8 pid0902_rdesc_fixed[] = {
+static const __u8 pid0902_rdesc_fixed[] = {
 	0x05, 0x01,        /* Usage Page (Generic Desktop Ctrls) */
 	0x09, 0x05,        /* Usage (Game Pad) */
 	0xA1, 0x01,        /* Collection (Application) */
@@ -468,8 +468,8 @@ static const __u8 *bigben_report_fixup(struct hid_device *hid, __u8 *rdesc,
 	unsigned int *rsize)
 {
 	if (*rsize == PID0902_RDESC_ORIG_SIZE) {
-		rdesc = pid0902_rdesc_fixed;
 		*rsize = sizeof(pid0902_rdesc_fixed);
+		return pid0902_rdesc_fixed;
 	} else
 		hid_warn(hid, "unexpected rdesc, please submit for review\n");
 	return rdesc;

-- 
2.46.0



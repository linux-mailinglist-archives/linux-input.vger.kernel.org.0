Return-Path: <linux-input+bounces-5218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05799942241
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95B60B239B9
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008D418E056;
	Tue, 30 Jul 2024 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Cjk/ur9K"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBF18B46A;
	Tue, 30 Jul 2024 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375373; cv=none; b=Fpm1o9O05KbmJhEPtzvMqYBqlGrC2Rn7dk5YNnhXWmAKyMQzVAYl6yGFSiM8MEUAU6x1/7roy26M7p0ny10oJMBwgNPDv0GscVDZEgWXm4GBcGuqx3BqTAc91LjEckLRX3euBV95xpLyTUqWAIGeq9ejwoYCSjKjoFShiw370tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375373; c=relaxed/simple;
	bh=LHZUnDmwFmh2fmeCMgokisCrnfbDNiATUFJWQDX71ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3yCnCoR6VMyyUXL/+isenuVzs5T/V+rH+t1iv0J7FgMFslkKexHoB1O17FhYiNFfRTo9FrXPaVIxndMLSGWbfHsmPFEPye3ZKEZZpoOB8SKGlk1KIGcr/MtBWe8CK2NG78w/acOm/8bviTSgDGNHVB2M4pF4SMyFkVhuMQGQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Cjk/ur9K; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722375361;
	bh=LHZUnDmwFmh2fmeCMgokisCrnfbDNiATUFJWQDX71ZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cjk/ur9KK6sYkMPTj+0ll6/g30Z/l4RHmEuFOYose44C7XvGGUChPwiLbsptgR3Je
	 CtIliOepImKqNCXtxVexQFPylqDznA09sdUMo+Hhwzn+K8wmomO1D9bSKkmGsLpfRI
	 DF14UJ90gt1GFelAYX6RoI0Dbt54lDSTaQnHN2Hs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jul 2024 23:36:00 +0200
Subject: [PATCH RFC 4/4] HID: cmedia: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-hid-const-fixup-v1-4-f667f9a653ba@weissschuh.net>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
In-Reply-To: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722375361; l=864;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LHZUnDmwFmh2fmeCMgokisCrnfbDNiATUFJWQDX71ZM=;
 b=afXRryW/iPaJsDa968Z+1f22FEEueZPZVceiIxetaiVJMoY0pis3DPqzzzuD8hLjKMW4hAs08
 L/GU02du/FFDDqzQFmFYG3MTOW9zxs/xIRrVdk/mtanxucgsGMB38sV
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The HID core now allows static report descriptors to be read-only,
make use of it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-cmedia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index d235dbedab8c..528d7f361215 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -26,7 +26,7 @@ MODULE_LICENSE("GPL");
 /* Fixed report descriptor of HS-100B audio chip
  * Bit 4 is an abolute Microphone mute usage instead of being unassigned.
  */
-static __u8 hs100b_rdesc_fixed[] = {
+static const __u8 hs100b_rdesc_fixed[] = {
 	0x05, 0x0C,         /*  Usage Page (Consumer),          */
 	0x09, 0x01,         /*  Usage (Consumer Control),       */
 	0xA1, 0x01,         /*  Collection (Application),       */

-- 
2.45.2



Return-Path: <linux-input+bounces-5911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1686962131
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2901F26D29
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1054158DC6;
	Wed, 28 Aug 2024 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Kn+aiHVV"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15691158DA9;
	Wed, 28 Aug 2024 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830458; cv=none; b=YKehfoQF25RFszeH6kKjCXUv4rSi7vq2P5oURuIIRtY0YtOT3a31QC5ZEi/e7cIvf6JiXjy3CJoSOoiT48X2AJ+DqqOGnwWAaA2KQzT2A4FGudE0+gTnhMltN9TOVQmEU0lsciLLSkqr5y3mlmYaw+0/BPSHdOeLAKeAcYLnOWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830458; c=relaxed/simple;
	bh=9L3U5w1ijWQxTaw8Yz6FdZomiVmt1uQwYbWswiX6ZfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erwOHxrkJP16FouLbtzTYFxIKT326PuIW3iCvlbgWpCF35VFdgNjbHtkc8YtghjU/gxCeTpSp1H7S9ZTJujkB8olTNlx6Qi61eo3l4/NLThz/0jw5cJ+NcSnx5kYzL3nTCixHLD4pVOM6cHzxTPIIcEAtnx9aY1sX75jgmZFV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Kn+aiHVV; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830452;
	bh=9L3U5w1ijWQxTaw8Yz6FdZomiVmt1uQwYbWswiX6ZfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kn+aiHVVMKNKRRTKyjk1xEphtaH23Un3DjHAg26y/rXvXHdpVzpq0JvALg2cnAiQ2
	 0AV/dQDleNMMlZ/4pCSA4H50Ocf26h/hahWVZlp3f+F8MxR60jJQOSq3FicHMpIja7
	 B7LtNLOBMjWecnz2O3Y9u3aKEbRzbs3Zr9k0bXnE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:21 +0200
Subject: [PATCH 02/14] HID: dr: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-2-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1165;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9L3U5w1ijWQxTaw8Yz6FdZomiVmt1uQwYbWswiX6ZfE=;
 b=K/h8EsKi9V/grnLRDdpGmn7U4fuvKyfK/Z9eImgRFNvJ90Sf3CZLN97NTYkTkHHHI8W0P/Ez+
 mX2VqknIIBlCOPW4F82k95x5fN3wXWVA0KIqsNGMEjyA7JOI4kXEVRN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-dr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-dr.c b/drivers/hid/hid-dr.c
index b24f9bc743e1..84e1e90a266b 100644
--- a/drivers/hid/hid-dr.c
+++ b/drivers/hid/hid-dr.c
@@ -199,7 +199,7 @@ static inline int drff_init(struct hid_device *hid)
 #define PID0011_RDESC_ORIG_SIZE	101
 
 /* Fixed report descriptor for PID 0x011 joystick */
-static __u8 pid0011_rdesc_fixed[] = {
+static const __u8 pid0011_rdesc_fixed[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),           */
 	0x09, 0x04,         /*  Usage (Joystick),               */
 	0xA1, 0x01,         /*  Collection (Application),       */
@@ -234,8 +234,8 @@ static const __u8 *dr_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	switch (hdev->product) {
 	case 0x0011:
 		if (*rsize == PID0011_RDESC_ORIG_SIZE) {
-			rdesc = pid0011_rdesc_fixed;
 			*rsize = sizeof(pid0011_rdesc_fixed);
+			return pid0011_rdesc_fixed;
 		}
 		break;
 	}

-- 
2.46.0



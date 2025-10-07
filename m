Return-Path: <linux-input+bounces-15273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA63BBFE48
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 03:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5970034C3ED
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 01:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051FE13AD05;
	Tue,  7 Oct 2025 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="P4VZEGeI"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF542B9BA
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799186; cv=none; b=fL8gQSnC/R3BjBrBQ/5hq6l+wI5ORiaHR2aNkrLsHrfAw7ENusNBr2eriwBpVrDh80kqlDUPnU/JKZCfJ+IcPfbHlCNNCaD+4zXWm4G5930iS3fGEUDD4ftZYKoLGFOycxggNIrzXgHX2XKS0b36LKdJhB1BgghjhFcgU+5q0u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799186; c=relaxed/simple;
	bh=TNKhmZgIpVBKBo22RI6+wVTsrrf2S/0SJhj78dW+alY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nK1TIwyLITi/TZkyQqEdZ8mmtP/X5nKnLHJ19vLwJqWrQ3LgzralE0p8NX+HW4z+SbLgHVKvvRgqlst2WXczQMZoo5kJ/5xLIGD3UHkMdMgNUulMeeJePBCiBJTV9kpQ0hSIvXudG35xhH05s+ETOaaR7nZYD472x5s0jDMBohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=P4VZEGeI; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1759799184; bh=TNKhmZgIpVBKBo22RI6+wVTsrrf2S/0SJhj78dW+alY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4VZEGeIxjkSmqLdaKREcMVFAva6L4ztasrT/zs3CHUinJepYKXSTIOHMSf10vbqy
	 MNReuW28vwMWXFxAMpyqLuIQsJ0pN//UDuLcRYE5VhxNv3AjL2Y0A8uRp2xCoXrwqQ
	 YYQKz8HOQiJfaOJywO2RbjR11KNM8nsVHruQX+FBKQEE11pLsvRUU9yKmZ1qekYJyo
	 Vc1ZPhyhGu0ADOIBj+kxHTsKLZjcKN17oDk0LFNxn1i1qLmvYsy08UCWlob5tBYLJM
	 Yq71yK1t0zyDdvTdrXp9S/4n5+CsNGy9sIymh70Oullq1DuJcnW4RD5+1u3kUvVyqT
	 9HMC595mJJivg==
Received: from nebulosa.vulpes.eutheria.net (97-113-254-202.tukw.qwest.net [97.113.254.202])
	by endrift.com (Postfix) with ESMTPSA id 180DFA276;
	Mon,  6 Oct 2025 18:06:18 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/3] HID: nintendo: Rate limit IMU compensation message
Date: Mon,  6 Oct 2025 18:05:33 -0700
Message-ID: <20251007010533.3777922-3-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007010533.3777922-1-vi@endrift.com>
References: <20251007010533.3777922-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some controllers are very bad at updating the IMU, leading to these
messages spamming the syslog. Rate-limiting them helps with this a bit.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-nintendo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index e3e54f1df44fa..c2849a541f65a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1455,10 +1455,10 @@ static void joycon_parse_imu_report(struct joycon_ctlr *ctlr,
 				ctlr->imu_avg_delta_ms;
 		ctlr->imu_timestamp_us += 1000 * ctlr->imu_avg_delta_ms;
 		if (dropped_pkts > JC_IMU_DROPPED_PKT_WARNING) {
-			hid_warn(ctlr->hdev,
+			hid_warn_ratelimited(ctlr->hdev,
 				 "compensating for %u dropped IMU reports\n",
 				 dropped_pkts);
-			hid_warn(ctlr->hdev,
+			hid_warn_ratelimited(ctlr->hdev,
 				 "delta=%u avg_delta=%u\n",
 				 delta, ctlr->imu_avg_delta_ms);
 		}
-- 
2.51.0



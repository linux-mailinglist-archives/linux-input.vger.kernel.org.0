Return-Path: <linux-input+bounces-15274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15EBBFE8B
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 03:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77A4F4E6937
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 01:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD961E25E3;
	Tue,  7 Oct 2025 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="EMePoInO"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B427707
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799522; cv=none; b=cEhcoJEYiOAdQX18SLtgKYUbtKRl/ghez4PPPuvH3A9imV4hKMesP45doyExiUKXv+YS5fYCyTzKvYXDmQ/7BzWJHSgveOKyVJp/PDKw9azmrwsfkWpbX4izuHZteYJBTUZmbAXrJLuTprQ7Uwub6GIAyM1By3IpUsXWWoSapKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799522; c=relaxed/simple;
	bh=D8sVS28mYU/WnpYL7YMnqsKI7pVREMKb6qvMRq5Mxc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0fNJyqfUyc37nM+iHlzBWmCLo48WUvsad6HZ2Evgs5HC1X0IjDP4k7BqQvIOh8b8oUAmoPbQeCfoUdj/24jEr3PjAtLEFBGWH8l2/AZxtPnAg6CljXfBif1VvVvVGxoIvKLQalJSNsPgEq0FencCZs5Da1vAe8/IWQtuUOayro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=EMePoInO; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1759799178; bh=D8sVS28mYU/WnpYL7YMnqsKI7pVREMKb6qvMRq5Mxc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMePoInOUjlnmPupygDc3Xr+vdag3IecKfXf2kkb/AQcS8eZzFJIk0H6yZY+31EEy
	 A+7viJX19O74tEIUF9Pvh6EOz7zaLaxbv4Us6rNYdytHTj2iKM2NUvcCvP1Dpihtmn
	 gCHSAr1q4GY5QZan/eDWX5XHpK+YkRepaevVAv6KgO8UeBZXajbmindjqu4LjVeTIQ
	 e1znBlqb1wYmlk70sGzSgdq2K9CJfCn3K/T9i02ORpaC5IquGWi6G2M6rcgk5f2epQ
	 YSZC7LpyfzhiZ8wWodm1v8CxaabIanlZKMJOUXJZaphfQYTmVsCYv5AVG2lERf4f90
	 zIN6t28C6lVLA==
Received: from nebulosa.vulpes.eutheria.net (97-113-254-202.tukw.qwest.net [97.113.254.202])
	by endrift.com (Postfix) with ESMTPSA id EF697A111;
	Mon,  6 Oct 2025 18:06:14 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/3] HID: nintendo: Wait longer for initial probe
Date: Mon,  6 Oct 2025 18:05:32 -0700
Message-ID: <20251007010533.3777922-2-vi@endrift.com>
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

Some third-party controllers, such as the PB Tails CHOC, won't always
respond quickly on startup. Since this packet is needed for probe, and only
once during probe, let's just wait an extra second, which makes connecting
consistent.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-nintendo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index fb4985988615b..e3e54f1df44fa 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2420,7 +2420,7 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	struct joycon_input_report *report;
 
 	req.subcmd_id = JC_SUBCMD_REQ_DEV_INFO;
-	ret = joycon_send_subcmd(ctlr, &req, 0, HZ);
+	ret = joycon_send_subcmd(ctlr, &req, 0, 2 * HZ);
 	if (ret) {
 		hid_err(ctlr->hdev, "Failed to get joycon info; ret=%d\n", ret);
 		return ret;
-- 
2.51.0



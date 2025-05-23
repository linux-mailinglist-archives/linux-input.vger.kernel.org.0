Return-Path: <linux-input+bounces-12544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D63AC273E
	for <lists+linux-input@lfdr.de>; Fri, 23 May 2025 18:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305BD3B57F5
	for <lists+linux-input@lfdr.de>; Fri, 23 May 2025 16:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776EF28382;
	Fri, 23 May 2025 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2ME0qD0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226E248F4F
	for <linux-input@vger.kernel.org>; Fri, 23 May 2025 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016632; cv=none; b=eCbQVCejbEuTas/IkSmeCWGaIAIFHfv0QF6P1RZholInbm1TfSSVvXYbASSb13NJbSkMSCP3FepbCcNz4xYLBpeoXwheFs9/cpqs3PML/Xj2Z05zzdizVJzHMKBMuQzXwLpvyFoxXGpkGmgVAC0rnykTh4tjJ8T/3Rk52o2mMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016632; c=relaxed/simple;
	bh=/f+SrkJgs57MAk6FH/VBgvAEDFYwL/tJtJ1OJdZ0BtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eE1APifJ/EhIP/qwIHLygwUPC1vwJuGix+pE/DjHHRWRwGYVwuMCq/3/nxp+stRBWdGQHg2PKR+30Y6omiYyi7tkeXh+TV/PxijY+milsLdd0xLTWNzUR2YImDHqyyvuXCWxgsqotFTIvY/tow1e25/d4p1QhmH4r5f0irhWUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2ME0qD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DAC4CEE9;
	Fri, 23 May 2025 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748016631;
	bh=/f+SrkJgs57MAk6FH/VBgvAEDFYwL/tJtJ1OJdZ0BtQ=;
	h=From:To:Cc:Subject:Date:From;
	b=k2ME0qD07qMD61LXaLcpcsLqagz2OaBNO4IroTGTmaQmegZjuyD9zC1HBlFNG+M9Y
	 cqJ4wMoK43X3mw7h/4feCZ1ZocoQGmDvJ3cZhc7Jke4zttvROsU60uLkSAvkuS+LWX
	 uydvi8jOWdhbfUX4LlBuckPwgppBO4bigrVCk83de/jJIVJtE/ba/Ey4wbOPHv1IeQ
	 xM9vO4FjQ3j5in5PMzc6ZY2j6Ie4JaCKQjPF23c3oqjdYn6H1fXT02h+RAnHgonzge
	 B9Qerd+DZhmKCcYirATwqbUYdJ6SNltbcEqOCnN2Y0rQC1/quVpy0yzw9s9E3u7i15
	 p5CqOX1WmpJxQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org
Subject: [PATCH] HID: Lower message 'No inputs registered, leaving' to debug
Date: Fri, 23 May 2025 11:10:07 -0500
Message-ID: <20250523161015.3881816-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Plugging in a "Blue snowball" microphone always shows the
error 'No inputs registered, leaving', but the device functions as
intended.

When a HID device is started using the function hid_hw_start() and
the argument HID_CONNECT_DEFAULT it will try all various hid connect
requests. Not all devices will create an input device and so the
message is needlessly noisy.  Decrease it to debug instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91ebd..ff1784b5c2a47 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -2343,7 +2343,7 @@ int hidinput_connect(struct hid_device *hid, unsigned int force)
 	}
 
 	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "No inputs registered, leaving\n");
+		hid_dbg(hid, "No inputs registered, leaving\n");
 		goto out_unwind;
 	}
 
-- 
2.43.0



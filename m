Return-Path: <linux-input+bounces-17128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C36D31ED2
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 14:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54FEC310EAF1
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 13:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E4D2868B2;
	Fri, 16 Jan 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aNnMA3DU"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAE28135D;
	Fri, 16 Jan 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570331; cv=none; b=ITf6KPZbOeqXpPhGcBY7iW+8oA0CXfxG3oKJOgMGb4o+06jznEf0bEHWoqfznfNeGOUVkPutzC9YFnvllhxtIXOGQRXvPIfSulMkkCoiV0qFYgMCZ4wct8bVp26J0v4xdNGIPdOhEM6KN4pAYIYJ2K8ybSfyRROs8LIKMt73Nw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570331; c=relaxed/simple;
	bh=S3Zxdf/ZgW6lI3NSz6o4ZHzaERf5MORAzzfC2k7oBF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHjJPtQEkZHCAgPXLBxCD/nsw/z43VUka7s2T+rgWL2PN6T3inchUMRzbTIOwpJlh0TNFZAc4kemoMa3qN3AecQJAalFqCsyrEa7fHJNnaqhzkpgHNBdRUtdvCZduPGGiSjcftePL+Ttrxg3L5dr5cvn+39d70sQ2uaUNkRDeNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aNnMA3DU; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 9A1AA5E661;
	Fri, 16 Jan 2026 15:32:02 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 31F095E68C;
	Fri, 16 Jan 2026 15:32:02 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c3:fefd:0:42c:a43d:2848:c282])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A2190202536;
	Fri, 16 Jan 2026 15:32:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768570321;
	bh=alZLovtjCdJqM39H2ifkZ6i5VO7rVbgOW+PNwXnFJ80=; h=From:To:Subject;
	b=aNnMA3DUQ2ZTO0JNpOkntNPKTuODQd8XeYzmektYLgwz4DFv3L5hbbSof6Ims+w59
	 ajThwh57xUes0Gh2U48Y8G2kDkh2lIZ3R5SIJl1GU+82Np7g2s3nmzqBrlihMunPfa
	 Whgh9XVzvYSxR78VB+OtnAuOlj7yJXrqVsb+Q0ZewECXVF+lVLwGEW6/5nqR7u8baJ
	 gGXW/Hr7Z//jD4bPo4HGHs5DMlosl+Smh8q6+KDkYUAD35iRXCeTZY+ks7VfLsP1GN
	 bC7eRQSh0NWdr/ztKvLTHdyECallXUE+xZL21zZ++JM/GWxWZl7Fr1xOUzNK3jEd2E
	 gcDanjBP0FT7Q==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c3:fefd:0:42c:a43d:2848:c282) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v11 03/11] HID: asus: use same report_id in response
Date: Fri, 16 Jan 2026 14:31:42 +0100
Message-ID: <20260116133150.5606-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116133150.5606-1-lkml@antheas.dev>
References: <20260116133150.5606-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176857032123.3550311.16139940450092211207@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_get_functions prods the device using feature
report report_id, but then is hardcoded to check the response through
FEATURE_KBD_REPORT_ID. This only works if report_id is that value
(currently true). So, use report_id in the response as well to
maintain functionality if that value changes in the future.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index dc7af12cf31a..6ec7322284b1 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -424,7 +424,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	if (!readbuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
 				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret < 0) {
-- 
2.52.0




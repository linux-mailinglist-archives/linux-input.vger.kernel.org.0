Return-Path: <linux-input+bounces-12579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C698AC3FB0
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0F83BA7A9
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A062B211283;
	Mon, 26 May 2025 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H+EvU3U+"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC520D4FD;
	Mon, 26 May 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263923; cv=none; b=G9c+2nfgSOHlWPbH/xP08K+WuXr1rSu9Ct6gwVp3r1fFNT0fOaYI13noRhtDnP/kxoBOHQ72V8T++b6gTttk47STXX7aqkMocN+nifoTMwwy37jcGGsEPCuBDognI3KtPfaKZgtKEN8CLs13yW0HVPVqOtDWZXLVlW/QMQCowls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263923; c=relaxed/simple;
	bh=z8QFcCN5mux3WBhnq+UT2pNGkO7Kpn/fB2DGxRh0IfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dR3/jG7sK8qd8VBdIMekhIilQ/QSS9sXM8PoiBlBnF/cdz8kseCsnPRHhfyRdKg85ubktY1S3dq3IxdnQl0S1bHFh2SNKNxQg83/xaZQ5pDp8cfPs4XYDBM11+VMcPd2pf3bLm8cFu3P6Hiy3mndM6wP8K7U6dBusufJsOMRdKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H+EvU3U+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263919;
	bh=z8QFcCN5mux3WBhnq+UT2pNGkO7Kpn/fB2DGxRh0IfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H+EvU3U+Aszw4FD5l1tqHIyn9738pGY34O222tPQ18xIo7aMWRnECd2ndD1lL8ck0
	 aXBg7CmB/x1ED/maKYkdyYejxpFK7FQ+eLhFIj68nMd0IaUnfMN/IBvFZosqNLqzsP
	 1ie5z0z34ctGi/Dpf8R7LAePcbWl8rL4m+BHCrl0tTIK9I4MXOG66ga/Mi6pT6Ovnd
	 JKbPIt9nBxDKmfGblQaQpm97AkRcmEej49BdpjJfTe87hhpGf+phbAo9U7zddbwa8l
	 p4bjUvXb4kcYXJWHZU86f4qUvlr0bRXa6dEQv5fZkwLNb7JwokpSL15CipJ9gMvnNm
	 JWrTZAl7eQ5kA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C82C017E36BF;
	Mon, 26 May 2025 14:51:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:31 +0300
Subject: [PATCH 08/11] HID: playstation: Prefer kzalloc(sizeof(*buf)...)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-8-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Use the shorter variant as suggested by checkpatch.pl:

  CHECK: Prefer kzalloc(sizeof(*buf)...) over kzalloc(sizeof(struct dualsense_output_report_bt)...)

This also improves further maintainability.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0671ca39dcf3d9c5cbddad7e46b2da13417a952e..937b14679c8b17c5d3d245eae1cc4e0e56dadb71 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1532,9 +1532,9 @@ static void dualsense_remove(struct ps_device *ps_dev)
 static int dualsense_reset_leds(struct dualsense *ds)
 {
 	struct dualsense_output_report report;
-	u8 *buf;
+	struct dualsense_output_report_bt *buf;
 
-	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 

-- 
2.49.0



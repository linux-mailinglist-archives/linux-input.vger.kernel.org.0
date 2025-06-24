Return-Path: <linux-input+bounces-13024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B7AE71DC
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51499167B81
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D53D25C83F;
	Tue, 24 Jun 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="URnw4T3f"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698525C82C;
	Tue, 24 Jun 2025 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802277; cv=none; b=K1ut0Em5nPO/gz+RiC5coY1i4f09pNPGsKMVNnX83swx9vf7/+IV7A+2zuc/C+m4UVukcBYRtR3anznuko2VvhtF73mEAmzQ0gA5bkrLZ3hrtqZeBpTBC40ji+ctWtaKbaygHc5lfLSHR9wPmPK/pN7fC1JgBhCBZp8gToWuSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802277; c=relaxed/simple;
	bh=pez3QNbFfN64xvikoxiAw3x1sSzNBW4mKfF7SKp97FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHZ4lRMeJzb+WNZOHnYi8aVuFPWuRhowOc1arl1qA1gNeHP4XZSPh9nqHBfeGj6j24T7SwuEJxvBZMtEGabCubYqBh1/FdNKxi1jGWQp9eUNyBB1l77R+i4zBCDNoNmq7V7CHf4aNfTSbku0Dv7XHhzWVcS1hDiVj1rG4tebFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=URnw4T3f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802272;
	bh=pez3QNbFfN64xvikoxiAw3x1sSzNBW4mKfF7SKp97FE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=URnw4T3f0HhgSq5I5WO+n6/VgQVqoYKdjFPvuT860ergxXg968zVdhPoI2umNp/D9
	 dilfXnuTFQVtKGp5iQMIAMDLVX7skVhTq+pgTjAbF68xSytNqrd9B5RBRHV+Nlt9qJ
	 e1bF2Xnl9H+6L9KZsM8CUNX+wM0v6ioFpD9J22MWKXwihTMghz9VC50PzIado2uDZl
	 pYDBNXNDSLWkQH6l5MYUMaoTK8p8oxgl2IdtKhVPM/ryLJtF70U0+Gt4qtw1U/2LNX
	 6aY3pU7Pv5EL+Hvsa4pgxTOh2zq3qAKRjDVAFdPYfXkJaoELAqlrXJ8B+qwGiJtsMB
	 uoB7tZvbqXqMg==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9F3F417E07F2;
	Tue, 24 Jun 2025 23:57:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:52 +0300
Subject: [PATCH v2 08/11] HID: playstation: Prefer kzalloc(sizeof(*buf)...)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-8-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
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
index 37fc1a74517c1f14a7bae9a1fa90f7d64115a605..6e3132418f2ef88f49d7ea55eb1f52ddf53680c1 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1531,9 +1531,9 @@ static void dualsense_remove(struct ps_device *ps_dev)
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



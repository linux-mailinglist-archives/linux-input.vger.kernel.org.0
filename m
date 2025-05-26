Return-Path: <linux-input+bounces-12577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47CAC3F97
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619EA162F38
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F0220E01A;
	Mon, 26 May 2025 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jPVIUnIx"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875520C476;
	Mon, 26 May 2025 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263921; cv=none; b=inPQtAbGoogtJFQru+VUB/GUlPgYv+DDtlvdaM3tHLn8iDByocrDbNgY+y47tF4pVP21ZjyhiuAfOIkSfmiUNFXXmhe8lzwi90c/CrknG6R5XIJmjVxWrbpjh33hYwaI0ma1niAdQLzcyNa6KhrHwbkRcry6pcntjRr494MTW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263921; c=relaxed/simple;
	bh=qMA+goKv1ThlmxYS6fTzAWgkoE4Z8o7KPN60YWkYbyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVCR+PxUDsQNUqAs/Vp/8OXS/XH4LqpI6C/u77jsW5YeXMFvR0X394f2KQTkaCybxu4DHE/6CULad1J2an9S8tcOuTmmUzFBVgBs4vygqXOC86JEUD/1w6Q2OUkwwh58Hc/F5f7KuS++2pJ9CMzeeN4vgFygo+YJ+5A5gMDKBas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jPVIUnIx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263918;
	bh=qMA+goKv1ThlmxYS6fTzAWgkoE4Z8o7KPN60YWkYbyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jPVIUnIxP/A932FiSL07NvVuSV8ozf6cs47AT7e68t2EoxOrb2frv6yOmkSbSVB8I
	 3icjquZ4LVcf5dzuEsbL1qWOxGuHNlrS3e08wsrI2ZD3xWQViXajw6NPRXbdFKq5nh
	 a6k4hvEOLAX0tK/cVzovRx64khblCLKqdshDNKH1xN21+xwXdVyPOtQHqTf+lxKAtv
	 AJ1NdS4o0eUgnMxLrMOdfMIUwYGSIu+X7pPsW2xE5GmD/fHzcwkxISY9j/ulL3ngDF
	 zGbicsbVEKs8kdndrl3VXfkOIfNhbQOBq1b5H/rGTTqLcKQIahBmIqPlAlggAUWDZ5
	 4eWkpO7hFQRPg==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E1C9D17E36BD;
	Mon, 26 May 2025 14:51:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:30 +0300
Subject: [PATCH 07/11] HID: playstation: Document spinlock_t usage
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-7-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Document the usage of 'lock' member in struct ps_device and silent
checkpatch.pl complaint:

  CHECK: spinlock_t definition without comment

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d8ef26ce41b24bc78a897708680136da52c01fa3..0671ca39dcf3d9c5cbddad7e46b2da13417a952e 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -38,7 +38,7 @@ enum PS_TYPE {
 struct ps_device {
 	struct list_head list;
 	struct hid_device *hdev;
-	spinlock_t lock;
+	spinlock_t lock; /* Sync between event handler and workqueue */
 
 	u32 player_id;
 

-- 
2.49.0



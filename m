Return-Path: <linux-input+bounces-13023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEBBAE71DA
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235E617BDF7
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E3425B69E;
	Tue, 24 Jun 2025 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wk1qLSju"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690825B67C;
	Tue, 24 Jun 2025 21:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802276; cv=none; b=mL1LYfBcuu/ieRmJ9b9MiCQguSEitCipoWlzG3KcW7voGQ/8JAltbFmbyYhdtfkwz0DVUraYwwktGjCrfPT6FGgRZdMwMTt14kvovAeu9X/v5mUM2KfcPjpom6QIiSsXaW8qTsGJUSoitfygNoN1/ELHjXuVBgaKjQuUTsS5Jmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802276; c=relaxed/simple;
	bh=ulzsuSu/F3iZTxVaIna3pmvlVM5tNO7dsuD0W/1A/wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OmeLk185coc/e4XIUH84XC2HwPrEaqBI+3Kdyiq5Mx31P6C6qYSDBc5hAg9z9AyrsSWCpJ8fkLWgtQ9/BMv0Q1SRK0FhoRnSx+sqCArU4UqJxj8sqvAuCRF+BIstBnGAabAN0fW94ilXmhTsA0kPQ8GkfUolP8I1EFZdZ1DhCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Wk1qLSju; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802272;
	bh=ulzsuSu/F3iZTxVaIna3pmvlVM5tNO7dsuD0W/1A/wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wk1qLSjubQz3sYc8CwYXoNpCm0H6RFSfBkmYfzoZ1ixmKTdidSfS6AsYfc1T1FC/a
	 gxx3RqRRAX0MCZ3lD7wCEOMfTcew19leFBziYxbE0Xf8cjSnqO3r2+QAZfGAWcFIM2
	 9d1tOqayjcZu904wXAlSbJC4+FlE5wGbbBfO4QRkdUAo2dr4FXPDi8Fho9ssPOPTys
	 2KDUdlu0LT9efhYO91JixcXIRtAHuK+9hSRECaZOsw0XVtebb/kGnn9uJncIZaXR2J
	 l17DXpY3MFhYpigMCB8z2YUoOovTrytZ78jucoBaVsuI1dxJwa06h86umqNzakdyoM
	 e30ZhjsklNJXA==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BCF7E17E05BD;
	Tue, 24 Jun 2025 23:57:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:51 +0300
Subject: [PATCH v2 07/11] HID: playstation: Document spinlock_t usage
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-7-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
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
index 811b0b90c0e277fe6a511a9a766790125d9602c5..37fc1a74517c1f14a7bae9a1fa90f7d64115a605 100644
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



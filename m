Return-Path: <linux-input+bounces-16237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC3C734CB
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CCEC355B23
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB35531AF18;
	Thu, 20 Nov 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BCQZEkhT"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDA2EFD8A;
	Thu, 20 Nov 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632000; cv=none; b=lbjDyHhUXBfLMkSRyoKIQiWLSf76NZA4dDn3HdMNv8D0E+LhgmhjjJdK3ZlTH5/kLXfHcpPaaenkBnz07kB6ZAGfFUDz+rRh41cq0jN4iakw/tWl4jiLoMoqBulaep9D+4BORQ+wcL66DydRdjRvsHq6kwz2CUrWmwLuH59s5V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632000; c=relaxed/simple;
	bh=5r7hDakSQCJENF1GyKBSr0/Mz8svpuqVDk08dKedAgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvPJ4l4XMPyAoVzBNZhWRNo24GNAL8Nshky2jYnwWv+MLwnQhldpUpB3BE7nBrbEOJcAaoo2XiSb2MNjYD9TfblTUedHSoSQ57JBSxT9wAJeBsrLuimo+i+/bMQ+XbtVDkq61X/HzFzMEeliNwM7aor07KHf0kpq6eB6Wtqmgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BCQZEkhT; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 6968C3F460;
	Thu, 20 Nov 2025 11:46:31 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id E9D1D3F467;
	Thu, 20 Nov 2025 11:46:30 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 96DE21FE32D;
	Thu, 20 Nov 2025 11:46:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631990;
	bh=QavA98H7eQdNhmPGYR4OwTP8sJAhXlqcgC3jWDfuuLY=; h=From:To:Subject;
	b=BCQZEkhTlNcRDwE85t4+bPulj4PofdJ8X3FkAD0tgKYBGXPfuMppk7aKH+VyD73bP
	 RLPWXhHb8V0IYeZJllkr7eqXuUYig9ri1sPPthuSeBQHAYfDgAWxXKaLHDSJHS1i6+
	 9A74AiA2+FL8zz/x1yVH0T+pfYJoVRyarVg/lcfkwyExJPZ7QA7kLOWVPZP7bU4aZj
	 zR438OrTJsO7m/RbXqcz7EYlgBwdTb1DP5rFR+hx6SHjWPYITxlY6gKnvd27CCBOlZ
	 2/2zPTyYOaQio63W6NNtO7jvgsHmkASimv+9Jf65YRFXyGcCebNvFV8GYeeXnwbp9G
	 UN01PuTSowfTg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 03/11] HID: asus: use same report_id in response
Date: Thu, 20 Nov 2025 10:46:09 +0100
Message-ID: <20251120094617.11672-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199044.1474992.611343128970856896@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_get_functions prods the device using feature
report report_id, but then is hardcoded to check the response through
FEATURE_KBD_REPORT_ID. This only works if report_id is that value
(currently true). So, use report_id in the response as well to
maintain functionality if that value changes in the future.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index db2cc9922447..6de402d215d0 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -423,7 +423,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	if (!readbuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
 				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret < 0) {
-- 
2.52.0




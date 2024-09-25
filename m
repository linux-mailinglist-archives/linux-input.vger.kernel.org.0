Return-Path: <linux-input+bounces-6694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA49852E5
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 08:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA0B28442E
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5072D14F9FA;
	Wed, 25 Sep 2024 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SfBK8XFZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503D647
	for <linux-input@vger.kernel.org>; Wed, 25 Sep 2024 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727245750; cv=none; b=rIon0aFlElgijSEMsSwKUyBYsmE4BlovsmyuvP1umL6MqTdQ83CMCvdex2pALzpD+HbXc3/spsBD2QdJRr5mHOhzkUYZfxIsfQxFyb6BXOIGcDxUiZSUg07NwkdBFJhlGDGmSV/IBKw7BTZ4pxeQBzk7mwISqgRnyEn3OJCMMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727245750; c=relaxed/simple;
	bh=eDR197VobWf6yFEX9ecTPpxMoBJ0o+e5LKT3piyrNvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHK5Ksi4gZwLakXgwZvEKqsNeYl6RikO/DtJvHjhsVgm9VMfaGezJ3VjhcySgItuKlVGX60XG3PHjApKaUI1K9MQD0ImOhFmZFU3zx5tCGpJDPWRnNxFGZ/3W2XSjB++zX11ty+NhEGBF2fesXrg7mP14GWL1ofUoA7Ec228s54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SfBK8XFZ; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1727245714;
	bh=xNMytTSff+WK4ABbsypYlqUxhtR801wMLItKXwAebwc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SfBK8XFZ4LuzvJFrPdc+YZpzrpxKOqXIzprnk7hzb43Eo9u7N0ZoL0D03AvU4OUaS
	 k8e9ZWOAZQkCvtD+y91Sv5ptYzErW2tY1g7UmJTQL32Gnn03ZtKF8sa44DlC52Efeo
	 ogD1SsVCM0ncCvSChcQjVNtjCoz0dbtcfJqEyFog=
X-QQ-mid: bizesmtp89t1727245710t7gdauh5
X-QQ-Originating-IP: QNzL495HAYnRHmKmbMjB7SLvxXjrDgb7GY1bQ5n4LCE=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Sep 2024 14:28:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15060643244381459545
From: He Lugang <helugang@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	He Lugang <helugang@uniontech.com>
Subject: [RESEND PATCH] HID:replace BUG_ON() with WARN_ON()
Date: Wed, 25 Sep 2024 14:28:24 +0800
Message-ID: <60AAFF285046F56C+20240925062824.731446-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0

There is no need to kill the system entirely in HID with BUG_ON,
use WARN_ON to handle fault more gracefully which allow the system
to keep running.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 drivers/hid/hid-cp2112.c | 3 ++-
 drivers/hid/hid-lg4ff.c  | 3 ++-
 drivers/hid/hid-sony.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index dae2b84a1490..f4c8d981aa0a 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -852,7 +852,8 @@ static int cp2112_set_usb_config(struct hid_device *hdev,
 {
 	int ret;
 
-	BUG_ON(cfg->report != CP2112_USB_CONFIG);
+	if (WARN_ON(cfg->report != CP2112_USB_CONFIG))
+		return -EINVAL;
 
 	ret = cp2112_hid_output(hdev, (u8 *)cfg, sizeof(*cfg),
 				HID_FEATURE_REPORT);
diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index e3fcf1353fb3..c0a138f21ca4 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -1350,7 +1350,8 @@ int lg4ff_init(struct hid_device *hid)
 
 	/* Initialize device properties */
 	if (mmode_ret == LG4FF_MMODE_IS_MULTIMODE) {
-		BUG_ON(mmode_idx == -1);
+		if (WARN_ON(mmode_idx == -1))
+			return -EINVAL;
 		mmode_wheel = &lg4ff_multimode_wheels[mmode_idx];
 	}
 	lg4ff_init_wheel_data(&entry->wdata, &lg4ff_devices[i], mmode_wheel, real_product_id);
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index df29c614e490..c5db29456507 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1379,7 +1379,8 @@ static int sony_leds_init(struct sony_sc *sc)
 	u8 max_brightness[MAX_LEDS] = { [0 ... (MAX_LEDS - 1)] = 1 };
 	u8 use_hw_blink[MAX_LEDS] = { 0 };
 
-	BUG_ON(!(sc->quirks & SONY_LED_SUPPORT));
+	if (WARN_ON(!(sc->quirks & SONY_LED_SUPPORT)))
+		return -EINVAL;
 
 	if (sc->quirks & BUZZ_CONTROLLER) {
 		sc->led_count = 4;
-- 
2.45.2



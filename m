Return-Path: <linux-input+bounces-6293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BED9702EF
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 17:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D24DB21A8D
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2024 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F985364BE;
	Sat,  7 Sep 2024 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ecOlYvUg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2713C836
	for <linux-input@vger.kernel.org>; Sat,  7 Sep 2024 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725723093; cv=none; b=oaRH/wJg0dORPz/7g3jYKkE1ha6XafsiGxaaVNhVxN2at4eLQeCjTaJol6d5/G/oVtsUckHCNuaynu+2LppQyt5S/EoL/A64PtJFj9+ge8XrttJhT8WQpGNYbRi3T6ou/BzwUmRo1YVr38YiTeM5r3iflUIBAniu5JOu34zexOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725723093; c=relaxed/simple;
	bh=NEWvGIeL91jpBpunK2S29T+0yqo5H/Keu6U4rvEht0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjJpkmUsW92gCCkJBRTpSsQ9QSU2YrUmn9oOmsX+sTTuI9TxCqH8l6khXTQHTyvs/Di8tfKy2Iy8W17pLmjTyGPdza7nudVkkG+tBScYGm6j09rqZCrJNFJdRBwQy2mCai399cmdfca5qoYnAw7MFRXTNz8S1DpbbMjvI9PbRzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ecOlYvUg; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725723069;
	bh=LxPiNUB9BhE3lduZ6Kk6M4bSZo6yg3DHGi0OrDKW3+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ecOlYvUgOgRQCe+wgiMSOPaoy0QS1Hjy4UK4OyfEBUpmvvJIjY3Hh13m56W0j6jFF
	 LNmIDMu+PSWMvxtfS0iJnwuNM+uDGJKA19rCp+8Mg/4Mr5vfZFnOuyJ5QHj9xpTyM/
	 tvMfkq3dt6yCTOT7ghQmQCsoAqOJv/M7wa6mOamM=
X-QQ-mid: bizesmtpsz14t1725723065tb1cco
X-QQ-Originating-IP: mf7GxU8B81MDKJ6OuSPbN3BCaC1VGy74z/w2qyx5suA=
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Sep 2024 23:31:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11342779804925214705
From: He Lugang <helugang@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	He Lugang <helugang@uniontech.com>
Subject: [PATCH] HID:replace BUG_ON() with WARN_ON()
Date: Sat,  7 Sep 2024 23:30:58 +0800
Message-ID: <08FEC98F56735FE3+20240907153058.22980-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0

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
index 20a0d1315d90..03e11f15257f 100644
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



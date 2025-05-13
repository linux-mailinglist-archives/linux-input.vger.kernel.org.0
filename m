Return-Path: <linux-input+bounces-12309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B298DAB4D42
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 09:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1CA19E309E
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 07:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C659D1F0E32;
	Tue, 13 May 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQdZhfOe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19949195
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122437; cv=none; b=FM5f+95yUgK3H/Uz7+oiuVoRiCuMnGPlAmlnWOiXACsCBHGl8w3YhxqPT3yKpcd0/q4L6ihu/1Bv2t08RdhMemOtz9zElwHe0IYXaaCuP8KCPydgQkLfBTwAXF07YVQSEfB+N7/N5dPiAnQa6pxhlLK1v25q+82QRtTQZcrmnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122437; c=relaxed/simple;
	bh=gql6qI6W9/nKmX32R6X5F7/nlqiPtvm/lUXkfDCkmww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3hmapWRC5n2cpEKzt8k9aRRXazEfc+2FzV6yLT3W1349ry/zDHgV7Lw3trlx0EUOIqcI2ONIvdCZhTtnAEPk0eAYiD27MASXZvR0BxKx+m0VZdaUCFgNzLhmqQQUVDoZrwLu1oaIfri0GJD1UamdJkUevS3uNFZ0s0dDSzvNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQdZhfOe; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769aef457bso67180451cf.2
        for <linux-input@vger.kernel.org>; Tue, 13 May 2025 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747122433; x=1747727233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzdX9jV1XdBivevm++063IkIOHuIVGsHmSEUj/OC02g=;
        b=DQdZhfOer1c+zuJ+Bd7kJDr6LVGrGK84MK6zQ2CDpIk2G/GURQIIpbh3xP4f4F8OnX
         yoBEWUl84zHMzfcWcMOkkvqXwd9NmEA46VYJ4mbRRQCEbJcpNoGqUUgPWc+XXGJYybjC
         Q0MlkQ1FpBwlNP87TSFppU8VHNd12IwdyyTSvgwiWvN7ADLVKdDdOFrgocuToNGmnadg
         o0+IcVtZWiPGxVLhJIVsM6EwxVqlsAG9yXkH1AkTE8CnwNN5RVCVJmzFt+Wxy4CpcZ6u
         s38+L2nKajKsK0YmHhJ3o7E41y9xLwJBibUr2CP4PiYN5QX2zkU5SymLdyHuyjiKLKCH
         DLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122433; x=1747727233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzdX9jV1XdBivevm++063IkIOHuIVGsHmSEUj/OC02g=;
        b=YKkmVn4T1/AOgX3WbarBtiMiT84ij6LcX/fFQV7yQE/NuaC09eosGjd6PCyFEdIfzw
         2B6gXMrNfkRP+MFzFWLdM50gh/4EjpTERK09RNzh8fgWDxYGzRR8Yg9JUoeElv8WLmm3
         m1dxbNeL6/Hw4iawdurBo1lfQC4dHRSvUWJ7PopbAqFfJe1RF2xvPyBpWuk+gOpGC4M1
         AY2fuJmjCl9O18KQ+gUAwA5rf9XNhn8JzaQSWG2SayCzIFXjyGja5qEyvZ65NepNeXfV
         dN9N3W2OkcXrYzE0xsQPpNpug1kJleuTdAdf1oP3IciYLuVDPtklruw47p2YEVVLxYmH
         imAQ==
X-Gm-Message-State: AOJu0YwDisqPZ9xmvCEi40W6QvKerKkjSgJT1H18IWPXVTx0p462Pzx7
	ia/t97cvEFv3hH8xR1J77yPQlSU8XvpgSJKFDN2Unk1w3cD2kf2zos3pFdEt
X-Gm-Gg: ASbGncueeCXMINDJXzx+2Bd+kF1EO0gcdL03mWokvcvxMs4QGsaXNfeEtekiGDuoIP7
	RItI5Jsot9qLCPqnFO9vp0MIBobsjmH4xL6YIJRnaGLC8faSIcJ5QbN1jtjGgKeepU7jo8sVC+K
	tjlTDbllUy4PxkHPncFpRWi72bM1TSL9SyfxI48F1h4z0sfaPr3GeZcmWynL4aekRSe6yxhuMJt
	U586rM90KAYG3Rfg5JaHzC9URduM/xS5aiq9nUPQnxLAKohh/ZsMFVriK/cjAqFdSmho27SYyiK
	kyeR+pXJ6Ypr5H2nF7hqGLqK81gIc1PCcfmsNss2RHcL/dackAC6kx7VkWTWQ0jGHBQCl3NFJWn
	Gv98Afi8tcZ+NFyW2wBRB7al0I3ZDmZRqyizavaBbi5YO614YIH4=
X-Google-Smtp-Source: AGHT+IF7gdiENmVGhZ7odOzUww5xYCRNeEoIj97nZLxUgLIkuyE5cdU2svHsV86PmzMpBCtXiTHulA==
X-Received: by 2002:ac8:5787:0:b0:476:7806:be7e with SMTP id d75a77b69052e-49452714658mr259372261cf.11.1747122433570;
        Tue, 13 May 2025 00:47:13 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-120-99.nycmny.fios.verizon.net. [98.116.120.99])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945246c7ffsm62892501cf.5.2025.05.13.00.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 00:47:12 -0700 (PDT)
From: "Daniel J. Ogorchock" <djogorchock@gmail.com>
To: linux-input@vger.kernel.org
Cc: thunderbird2k@gmail.com,
	blaws05@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Roderick.Colenbrander@sony.com,
	svv@google.com,
	s.jegen@gmail.com,
	carmueller@gmail.com,
	pgriffais@valvesoftware.com,
	hadess@hadess.net,
	pobrn@protonmail.com,
	lee.jones@linaro.org,
	junwan.cho@samsung.com,
	tinozzo123@gmail.com,
	sandeep.cs@samsung.com,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH] HID: nintendo: avoid bluetooth suspend/resume stalls
Date: Tue, 13 May 2025 03:47:00 -0400
Message-ID: <20250513074705.13637-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure we don't stall or panic the kernel when using bluetooth-connected
controllers. This was reported as an issue on android devices using
kernel 6.6 due to the resume hook which had been added for usb joycons.

First, set a new state value to JOYCON_CTLR_STATE_SUSPENDED in a
newly-added nintendo_hid_suspend. This makes sure we will not stall out
the kernel waiting for input reports during led classdev suspend. The
stalls could happen if connectivity is unreliable or lost to the
controller prior to suspend.

Second, since we lose connectivity during suspend, do not try
joycon_init() for bluetooth controllers in the nintendo_hid_resume path.

Tested via multiple suspend/resume flows when using the controller both
in USB and bluetooth modes.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 839d5bcd72b1..fb4985988615 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -308,6 +308,7 @@ enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
 	JOYCON_CTLR_STATE_REMOVED,
+	JOYCON_CTLR_STATE_SUSPENDED,
 };
 
 /* Controller type received as part of device info */
@@ -2750,14 +2751,46 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 
 static int nintendo_hid_resume(struct hid_device *hdev)
 {
-	int ret = joycon_init(hdev);
+	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	int ret;
+
+	hid_dbg(hdev, "resume\n");
+	if (!joycon_using_usb(ctlr)) {
+		hid_dbg(hdev, "no-op resume for bt ctlr\n");
+		ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
+		return 0;
+	}
 
+	ret = joycon_init(hdev);
 	if (ret)
-		hid_err(hdev, "Failed to restore controller after resume");
+		hid_err(hdev,
+			"Failed to restore controller after resume: %d\n",
+			ret);
+	else
+		ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
 
 	return ret;
 }
 
+static int nintendo_hid_suspend(struct hid_device *hdev, pm_message_t message)
+{
+	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+
+	hid_dbg(hdev, "suspend: %d\n", message.event);
+	/*
+	 * Avoid any blocking loops in suspend/resume transitions.
+	 *
+	 * joycon_enforce_subcmd_rate() can result in repeated retries if for
+	 * whatever reason the controller stops providing input reports.
+	 *
+	 * This has been observed with bluetooth controllers which lose
+	 * connectivity prior to suspend (but not long enough to result in
+	 * complete disconnection).
+	 */
+	ctlr->ctlr_state = JOYCON_CTLR_STATE_SUSPENDED;
+	return 0;
+}
+
 #endif
 
 static const struct hid_device_id nintendo_hid_devices[] = {
@@ -2796,6 +2829,7 @@ static struct hid_driver nintendo_hid_driver = {
 
 #ifdef CONFIG_PM
 	.resume		= nintendo_hid_resume,
+	.suspend	= nintendo_hid_suspend,
 #endif
 };
 static int __init nintendo_init(void)
-- 
2.49.0



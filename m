Return-Path: <linux-input+bounces-508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED63806087
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 22:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9881F211C7
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 21:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E96E58C;
	Tue,  5 Dec 2023 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Tl4Dlk1W"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311A8A5
	for <linux-input@vger.kernel.org>; Tue,  5 Dec 2023 13:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MzESY+uw6TR4Q8H/dqOGcqohVUvZ95RD8T+mWZCXh6I=; b=Tl4Dlk1W6g4R93fpHGy04vT77u
	CZVah9NqikM6ruSqEbqtPWOw1SKNBwTxcYBcYoBjBZDX2w4tIdMS4DfGXnWs7AgBMyAM3DEMjt4XL
	/f299ZBshfDkYirzv390Cusa5O0RsigSE/IQk+ZPGLKquCrCYbrT/rfJFUNLSdKQ+B8nKPJ/I1Bcd
	WoylLBhnI9HKmb6CpnootbVjnsTvjzWYf1M1UJKnmS1pLGk44OwsPeXkeKTP6gqTqrhB3eyTio8Qm
	sBflBJZ1NVTB+y9+smBAcvRFF9UjuN0N2NU3Lrr+A8W/IzojbZfW68EIBGw5kXuJr3NvPSkouKwp6
	qEDcubtQ==;
Received: from [179.232.147.2] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rAcmV-00Ak2A-Ha; Tue, 05 Dec 2023 22:16:40 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: djogorchock@gmail.com,
	linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	kernel@gpiccoli.net,
	kernel-dev@igalia.com,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH] HID: nintendo: Prevent divide-by-zero on code
Date: Tue,  5 Dec 2023 18:15:51 -0300
Message-ID: <20231205211628.993129-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported [0] that adding a generic joycon to the system caused
a kernel crash on Steam Deck, with the below panic spew:

divide error: 0000 [#1] PREEMPT SMP NOPTI
[...]
Hardware name: Valve Jupiter/Jupiter, BIOS F7A0119 10/24/2023
RIP: 0010:nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
[...]
Call Trace:
 [...]
 ? exc_divide_error+0x38/0x50
 ? nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
 ? asm_exc_divide_error+0x1a/0x20
 ? nintendo_hid_event+0x307/0xcc1 [hid_nintendo]
 hid_input_report+0x143/0x160
 hidp_session_run+0x1ce/0x700 [hidp]

Since it's a divide-by-0 error, by tracking the code for potential
denominator issues, we've spotted 2 places in which this could happen;
so let's guard against the possibility and log in the kernel if the
condition happens. This is specially useful since some data that
fills some denominators are read from the joycon HW in some cases,
increasing the potential for flaws.

[0] https://github.com/ValveSoftware/SteamOS/issues/1070

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/hid/hid-nintendo.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 138f154fecef..23f3f96c8c85 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -927,14 +927,27 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
  */
 static void joycon_calc_imu_cal_divisors(struct joycon_ctlr *ctlr)
 {
-	int i;
+	int i, divz = 0;
 
 	for (i = 0; i < 3; i++) {
 		ctlr->imu_cal_accel_divisor[i] = ctlr->accel_cal.scale[i] -
 						ctlr->accel_cal.offset[i];
 		ctlr->imu_cal_gyro_divisor[i] = ctlr->gyro_cal.scale[i] -
 						ctlr->gyro_cal.offset[i];
+
+		if (ctlr->imu_cal_accel_divisor[i] == 0) {
+			ctlr->imu_cal_accel_divisor[i] = 1;
+			divz++;
+		}
+
+		if (ctlr->imu_cal_gyro_divisor[i] == 0) {
+			ctlr->imu_cal_gyro_divisor[i] = 1;
+			divz++;
+		}
 	}
+
+	if (divz)
+		hid_warn(ctlr->hdev, "inaccurate IMU divisors (%d)\n", divz);
 }
 
 static const s16 DFLT_ACCEL_OFFSET /*= 0*/;
@@ -1163,16 +1176,16 @@ static void joycon_parse_imu_report(struct joycon_ctlr *ctlr,
 		    JC_IMU_SAMPLES_PER_DELTA_AVG) {
 			ctlr->imu_avg_delta_ms = ctlr->imu_delta_samples_sum /
 						 ctlr->imu_delta_samples_count;
-			/* don't ever want divide by zero shenanigans */
-			if (ctlr->imu_avg_delta_ms == 0) {
-				ctlr->imu_avg_delta_ms = 1;
-				hid_warn(ctlr->hdev,
-					 "calculated avg imu delta of 0\n");
-			}
 			ctlr->imu_delta_samples_count = 0;
 			ctlr->imu_delta_samples_sum = 0;
 		}
 
+		/* don't ever want divide by zero shenanigans */
+		if (ctlr->imu_avg_delta_ms == 0) {
+			ctlr->imu_avg_delta_ms = 1;
+			hid_warn(ctlr->hdev, "calculated avg imu delta of 0\n");
+		}
+
 		/* useful for debugging IMU sample rate */
 		hid_dbg(ctlr->hdev,
 			"imu_report: ms=%u last_ms=%u delta=%u avg_delta=%u\n",
-- 
2.42.0



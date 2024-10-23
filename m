Return-Path: <linux-input+bounces-7634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C69AC191
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 10:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20595B230FF
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 08:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2452015ADA1;
	Wed, 23 Oct 2024 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffWO/D+Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682F487BE;
	Wed, 23 Oct 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672046; cv=none; b=PMRtAdc5uQdtnRnFWMZoqtAWYtdsLCVYdypfIXC2EOHuQGO/rL/n/QDu3cFN2zLmc/T0i1olKBmou+26gK+84M+hTfQa2q8HZ8Nu8d0g1Ol+nKzU8lT3ZQ0WOgxcZSMBTJ5SEm3bOe+EOObKx/6QNHs/ABC6ABanLWz0jbCFg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672046; c=relaxed/simple;
	bh=iF8BvHGOmK/GtG0JmpxdEl6XsEVz5deY1YEwYQAigpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hB8FxsJw4YRnAH7uIff60NF0qeAmkC1kEMlzBZFb4epb70FmWthvub0G8CQOtJ3Z6dbrD9jJTWMEeqRc8HpJlfuzu0ugjEmQuQffSeB/OTLZWPhj5HqBYwsB1Gzq4e/p6xUzNsQ9xwRWuGCq08XjL2TlECRnaU/BWAINm+HONok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffWO/D+Q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so2830367a12.1;
        Wed, 23 Oct 2024 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729672042; x=1730276842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYyMOmA52LEv1T2cV+rhiVwnY88B+0PjgFOPjFMPd7o=;
        b=ffWO/D+QwD1iLZ0H56Hc8Z2zEuIyuRVKffod9OIn/T1RPx8Ct62BLXaGNRtaigkXpb
         Y/idhDMynzIPSvhdnaBNubMGMhQCLgObLuHZanHu1uUW9DcnAL+Ram7WoM/9fZccYcsh
         O6vge42Osarda+wmcvfqK3s/mmqFTC2PhjPPUpvi9djsFAJIjgGeFcpyD4tZMALCdujf
         zdkhTDSU4zOQi+oVU7kH0sd7xdB+4XJ85EPfkBRiAE4f0OT1HX2m9vdUjJlP9Mg8pTRS
         xE+kPGVm2iPMF2dHaG4bo6YCHHdMOT5rjAGXJ96vj5k4991JvIcppsyrmeWOy4ldj2r8
         McFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672042; x=1730276842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYyMOmA52LEv1T2cV+rhiVwnY88B+0PjgFOPjFMPd7o=;
        b=pYXwxqa1d9ByVcTh00AdJlPz0psUkE3qpB0u3zi4UE1Lc9D1qNaLvpVG8xR8nn1u1m
         tZ2Q5082DfnlS5wVDuXYY/zdZDS0Wth05LBIRqStWOkK+K68EzF8QGSrjuYEpTLylbtY
         lRWypNdWm1iuBz/a4I2cvoEVScfGZXuqIG3DQ0SrFq/Js6SRig4TadU2O2yYimLkCZ1M
         tfO2BdGfLa0oNRageppYTrd1bywrym6Dn+g3v9fd6vFEPKlpaeBvl/1u6h/aJa6eTnA9
         2QMqpsEbYmYrJQ/rk6Vje0giN5TAxz/LDW+x44L0Sivq/K85P3hVSjn9NfxdaVqEE60I
         HzWg==
X-Forwarded-Encrypted: i=1; AJvYcCXC7FHzyR52KQwIRhBbgm133AEHnmql0CcUaZwiCkO0QsptYJ20TiF3tPlHURM1zmsTRl+Hdo8MPwoPhtJq@vger.kernel.org, AJvYcCXvc+8D0qizjos+6AdGAxo7Tx8ROdpCaPrSKSrurC2FlGHKCg9NV/cutbzuLUzEA0iplXb7mOIx4yYAOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVcIwBKPS/kMsy5HfBYjviV9pjTeVI0E9KetruUejbT7q0bHq
	2kIATpGOV09O+Md0+elHOU2H0R2V5Ta5MLYLUOMAFGsHiqA/8IMm
X-Google-Smtp-Source: AGHT+IEKQSJ49Uku+y5p6QgfLDgFyk3vriJ0TDr9bFKLGvLU9Tj07i5Yq7Tx1gMmc2KHREWVt7/15A==
X-Received: by 2002:a17:906:da87:b0:a9a:eca:f7c4 with SMTP id a640c23a62f3a-a9abf967d5cmr141268466b.54.1729672042202;
        Wed, 23 Oct 2024 01:27:22 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91571f2bsm437926666b.163.2024.10.23.01.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:27:21 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	hbarnor@chromium.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH] HID: hid-goodix: Improve handling of HID feature reports
Date: Wed, 23 Oct 2024 16:27:03 +0800
Message-ID: <20241023082703.23525-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1) Align with the i2c-hid driver by returning 0 instead of -EINVAL when
an empty response is received, ensuring that userspace programs utilizing
the hidraw node receive consistent return values.

2) Implement the hid get/set feature report function using a separate
address, rather than sharing an address with coordinate reporting, to
prevent feature events from being overwritten by coordinate events.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/hid/hid-goodix-spi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 0f87bf9c6..6ae2300a6 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -19,6 +19,7 @@
 #define GOODIX_HID_DESC_ADDR		0x1058C
 #define GOODIX_HID_REPORT_DESC_ADDR	0x105AA
 #define GOODIX_HID_SIGN_ADDR		0x10D32
+#define GOODIX_HID_CMD_ADDR		0x10364
 
 #define GOODIX_HID_GET_REPORT_CMD	0x02
 #define GOODIX_HID_SET_REPORT_CMD	0x03
@@ -348,7 +349,7 @@ static int goodix_hid_check_ack_status(struct goodix_ts_data *ts, u32 *resp_len)
 		 * - byte 0:    Ack flag, value of 1 for data ready
 		 * - bytes 1-2: Response data length
 		 */
-		error = goodix_spi_read(ts, ts->hid_report_addr,
+		error = goodix_spi_read(ts, GOODIX_HID_CMD_ADDR,
 					&hdr, sizeof(hdr));
 		if (!error && (hdr.flag & GOODIX_HID_ACK_READY_FLAG)) {
 			len = le16_to_cpu(hdr.size);
@@ -356,7 +357,7 @@ static int goodix_hid_check_ack_status(struct goodix_ts_data *ts, u32 *resp_len)
 				dev_err(ts->dev, "hrd.size too short: %d", len);
 				return -EINVAL;
 			}
-			*resp_len = len;
+			*resp_len = len - GOODIX_HID_PKG_LEN_SIZE;
 			return 0;
 		}
 
@@ -431,7 +432,7 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 	tx_len += args_len;
 
 	/* Step1: write report request info */
-	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, tmp_buf, tx_len);
 	if (error) {
 		dev_err(ts->dev, "failed send read feature cmd, %d", error);
 		return error;
@@ -446,9 +447,12 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 	if (error)
 		return error;
 
-	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
+	/* Empty reprot response */
+	if (!response_data_len)
+		return 0;
+	len = min(len, response_data_len);
 	/* Step3: read response data(skip 2bytes of hid pkg length) */
-	error = goodix_spi_read(ts, ts->hid_report_addr +
+	error = goodix_spi_read(ts, GOODIX_HID_CMD_ADDR +
 				GOODIX_HID_ACK_HEADER_SIZE +
 				GOODIX_HID_PKG_LEN_SIZE, buf, len);
 	if (error) {
@@ -518,7 +522,7 @@ static int goodix_hid_set_raw_report(struct hid_device *hid,
 	memcpy(tmp_buf + tx_len, buf, len);
 	tx_len += len;
 
-	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, tmp_buf, tx_len);
 	if (error) {
 		dev_err(ts->dev, "failed send report: %*ph", tx_len, tmp_buf);
 		return error;
@@ -749,7 +753,7 @@ static int goodix_spi_set_power(struct goodix_ts_data *ts, int power_state)
 	power_control_cmd[5] = power_state;
 
 	guard(mutex)(&ts->hid_request_lock);
-	error = goodix_spi_write(ts, ts->hid_report_addr, power_control_cmd,
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, power_control_cmd,
 				 sizeof(power_control_cmd));
 	if (error) {
 		dev_err(ts->dev, "failed set power mode: %s",
-- 
2.43.0



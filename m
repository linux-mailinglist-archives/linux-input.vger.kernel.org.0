Return-Path: <linux-input+bounces-7805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D19B7A8F
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 13:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD9E72836C1
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 12:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C557919ADA2;
	Thu, 31 Oct 2024 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdOq5jEd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B719D899;
	Thu, 31 Oct 2024 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377900; cv=none; b=cw+Ro+bYPkJ8s3kRbO13CTWbviKDtzYGFJMWzdJyrauCcbXALKFojC8Mf7neDC5CqFhxzc5P03A3WEc+63uIzX/CKA1c8E/OamJ3GRBhkeaJ8DiBgIZcVSPwtYZaBOAUeVMuLdm6klHvjVE+X7wSAbGF8n5CNZFMwa2+ihpqFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377900; c=relaxed/simple;
	bh=H7GIctt0io2N4XE4yFaBYUE6NcdV5pi8sBEJ0BLVIcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmdnmCUtw+uqBiomIGA1h1VfNzrq60hIV1m6/hNWOrn3EjuB2ggUe53mLU8j/tIPd6nbktrcmzsoSbfuRwzB3gQwv/fr8Ch40Y7P5yvFs68mmjDPC8LnAwhvuBoHybSvP61ltElG6nZ1JKZNftl0KLY5ZWQJ6wpVb+PrRrXzqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdOq5jEd; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso1114687a12.2;
        Thu, 31 Oct 2024 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377897; x=1730982697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=030u3nkgqedDZazDWxOyhP0BS2swBwPxC1Ur78jbHOY=;
        b=OdOq5jEd+TuIiwmd6zIWdPgo/frKKPEuO+3m7Bqb4iYu7mKI5XaZbPBXrK8S4Dz0l2
         VueQYv4YhpkrPt8OfL934GudBrgZaS8Z7tzdlHsqJJ+rHB6fXQNEsYritLC82eieyhHg
         8wRaHkvIngwZ4vz222HNE7n3dSq7v42GnOSNpJBE/e8FN369EcqZj+YhzkqLsaS99fwF
         xosUJQLMX7NeoiRSns2u/WmyDhJtT8t0cWgXjz9/53PXvVE1ug7AB5DmdR31LzfsVY42
         SWXdfBalLTeFsgdASh3sxITQzp65REQaEvTzqUeYCuKbQacLJH79eXEYi8qVD7/elGbi
         aNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377897; x=1730982697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=030u3nkgqedDZazDWxOyhP0BS2swBwPxC1Ur78jbHOY=;
        b=gT1ZQEw3+XS0EzSJZEdRWHzTCM1SgtewH0lk8k5GJCadO67MIv6RygZUy+drj1GNX9
         tFIpJVJKNtO96cVu5eoxQEecfz90nScglBN4lSGqBODHQNC00bKoNyx7bbwePJS32PhK
         XQVsCmZ30cn43ie0anK5XFObcmIfbaAjikRX48WNirChZPGwa1eVfvWxMRaSPqqCabOw
         lE4z2MsN0qoWmK//tMbh76EsvKQf3yuhRMJOCIfjD2VwEnotLICOLmXMe3WoJ882TDNV
         JBqRZ2OYcGs0Alw6dTfi0Evhkw5yBBbdPAT33jXSu+qqHdM9nmUyLGWPIIN+SYDmJS5D
         9FRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF4sQsMOQW3n2GkCCrG5M1EVLdDUBn8UuNVBgr9JU9EZiYb+gv4Pw6HCoSVsYHCzX4NzE1wqf2wGcHsA==@vger.kernel.org, AJvYcCWwGzSyn/PsspoyzdwJd7oZCWtp6R3GoBpZEq/J7X+rVbAZQCFahxzN6ktLoLNL75vQoMhit+XmlPd5kGGH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx902ZzH9U6EYb5qmxy1n3TWAq4/zzaQCjdvqR+baLf2EWAipeG
	MGVeUN8SmvKsTa5AJ1Gopi4P28cdoEhabIygjB090Lsi40QfOYy5
X-Google-Smtp-Source: AGHT+IH0UeUBvxeS44aCna1iU7XCoZV3dRZdsr4JnU03vEsWIFnzNHvhx5PruG7Y55OLauRG9pTdBQ==
X-Received: by 2002:a05:6402:5247:b0:5c9:59e6:e908 with SMTP id 4fb4d7f45d1cf-5cea966bd10mr2164366a12.6.1730377896533;
        Thu, 31 Oct 2024 05:31:36 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm526749a12.32.2024.10.31.05.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:31:36 -0700 (PDT)
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
Subject: [PATCH v2 2/2] HID: hid-goodix: Fix HID get/set feature operation overwritten problem
Date: Thu, 31 Oct 2024 20:31:13 +0800
Message-ID: <20241031123113.18843-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241031123113.18843-1-charles.goodix@gmail.com>
References: <20241031123113.18843-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the hid get/set feature report function using a separate
address, rather than sharing an address with coordinate reporting, to
prevent feature events from being overwritten by coordinate events.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/hid/hid-goodix-spi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 077a91ee1..6ae2300a6 100644
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
@@ -431,7 +432,7 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 	tx_len += args_len;
 
 	/* Step1: write report request info */
-	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, tmp_buf, tx_len);
 	if (error) {
 		dev_err(ts->dev, "failed send read feature cmd, %d", error);
 		return error;
@@ -451,7 +452,7 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 		return 0;
 	len = min(len, response_data_len);
 	/* Step3: read response data(skip 2bytes of hid pkg length) */
-	error = goodix_spi_read(ts, ts->hid_report_addr +
+	error = goodix_spi_read(ts, GOODIX_HID_CMD_ADDR +
 				GOODIX_HID_ACK_HEADER_SIZE +
 				GOODIX_HID_PKG_LEN_SIZE, buf, len);
 	if (error) {
@@ -521,7 +522,7 @@ static int goodix_hid_set_raw_report(struct hid_device *hid,
 	memcpy(tmp_buf + tx_len, buf, len);
 	tx_len += len;
 
-	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, tmp_buf, tx_len);
 	if (error) {
 		dev_err(ts->dev, "failed send report: %*ph", tx_len, tmp_buf);
 		return error;
@@ -752,7 +753,7 @@ static int goodix_spi_set_power(struct goodix_ts_data *ts, int power_state)
 	power_control_cmd[5] = power_state;
 
 	guard(mutex)(&ts->hid_request_lock);
-	error = goodix_spi_write(ts, ts->hid_report_addr, power_control_cmd,
+	error = goodix_spi_write(ts, GOODIX_HID_CMD_ADDR, power_control_cmd,
 				 sizeof(power_control_cmd));
 	if (error) {
 		dev_err(ts->dev, "failed set power mode: %s",
-- 
2.43.0



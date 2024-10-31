Return-Path: <linux-input+bounces-7804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E19B7A8B
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 13:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5961F21D54
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 12:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05560176242;
	Thu, 31 Oct 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2XBUMeb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23C5A94F;
	Thu, 31 Oct 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377894; cv=none; b=PfZw1kmLSEMjb0scmzX+iIfQOATM6Ni3rQLCmNEqHlAjvTU8YLmoL1Pmv8M13ABZY1hPDyGiNc4fszJTAvvAZoJgyaL5jdHxc0UJM+PTtrVNKPrAaghXUi/D1Thqv0iZ3TNWlDipEOMbgwrDPRuUwE4SnlAYiQLcmAjPguk7kHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377894; c=relaxed/simple;
	bh=BZJ0RVtEMiHD3D0I0figvDtyWGphvQVr6X2533QJCzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqx56JiI70jxO1faK3uhGQ1/s2w+iKkiv7U+9F9FvmSCwiIfLz3iz8YDGHy6jTxFamKr84/QPGrtOHJ/HwABHwaaRvFJmG/KUtD1U31W8zxpU6hlJfGMG2rTHZuc5nF5IvfAPMqBgRH7SRes9IrDQ0FxoUAQHnECzt9Xna4PX+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2XBUMeb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so1126924a12.1;
        Thu, 31 Oct 2024 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377891; x=1730982691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK3Tp+WJUMgT1yRHpvd1XzSykhIw6PWcpTXBEG2GUHo=;
        b=F2XBUMebUOrSmNo2UcyOArISzXRusYcTbFIx7GMpeIdYY8+pkIcq1sM+ZZTKYXw9ys
         Z46K33tOsm1cXd27s0vsLB6sRROvLeHXjZefypnINsAyuSboWJd2leABWPkoGnhbE8vM
         HpIIrXNZCji/F/dJsLarNAcYUlS8kAodI9NR4bPVOismIdCzgyADWfGja8vSaupri+Rj
         grZyFyXZ9MT26InR4fJOK5w6tUBI+uwQdDdrnaCijp1IdzYGfrvBS8Ti0tM2LSV6Ob7g
         iHE0g942Rr+05z0O6upjZpuTwswl+BSSA4jAtQVaa7cvgDKmWMY8ddFCPNKAi+igMznc
         NZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377891; x=1730982691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK3Tp+WJUMgT1yRHpvd1XzSykhIw6PWcpTXBEG2GUHo=;
        b=t9fJFPw+F8LC3vRby68eWJ5E9jkSqVUcRw+nTORuvXQsR4dMpGZsxlB9wKBIvzJ0SC
         V0prrwzuBlkw33acpNY5PxdktAKslZOT7HU39gVRxjvEBS/LIZvQ6hUR+P0LSflh655d
         gwPFDTvQwFDonJ3SVQj2hlIv0jAt7Ti20h4J4UVx8H6f/Ck524hIALLe1NOPF4sf/xOy
         dSVGS2EjibAqVGVsQrhIVP6qNvhs35ckKbf9H5O6FSGIkCMI8MgZpxYcGdlxs7hILMQK
         GncCqKIwqGCaisPDycpDP9Qk/ajcHnns+/Rvii+DcwR3qEqHlrn6Y+ReHFlL2lZCqo4Z
         dKXw==
X-Forwarded-Encrypted: i=1; AJvYcCX/WGul5Nr74lSUKEMbuStzDioo21YqsVj4IbtTFFmmaKtgGTc0ktVKPe6mimqjNdKXdMI/iTARrxS9LD/z@vger.kernel.org, AJvYcCXYuPsUNMZPegMgXgRADSNS+xSbPnE/1sNJM+h9sg20BJiyNyW1Dy3IviHSlLArvgVLYe+9CJjfYny39Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3D57kmSM+oKVOZmeaHL5ba3w6zQDWdVU1Q4n3f72nvTTRzGA
	mjgTEorwoOgtnccOQHPVRUQ6dwqHUEr0qF/zp6/ynSFo7hr0T0xh
X-Google-Smtp-Source: AGHT+IFV/LP8zhT6TgEtmC6U/n8wD0DLAN7TckNQUa6rPE9QJ/wUJciPnvUSFhe+u/pL65CvLt+87w==
X-Received: by 2002:a05:6402:3589:b0:5c9:4b8c:b910 with SMTP id 4fb4d7f45d1cf-5cbbf87959bmr14880296a12.2.1730377890968;
        Thu, 31 Oct 2024 05:31:30 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm526749a12.32.2024.10.31.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:31:30 -0700 (PDT)
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
Subject: [PATCH v2 1/2] HID: hid-goodix: Return 0 when receiving an empty HID feature package
Date: Thu, 31 Oct 2024 20:31:12 +0800
Message-ID: <20241031123113.18843-2-charles.goodix@gmail.com>
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

Align with the i2c-hid driver by returning 0 instead of -EINVAL when
an empty response is received, ensuring that userspace programs utilizing
the hidraw node receive consistent return values.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/hid/hid-goodix-spi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 0f87bf9c6..077a91ee1 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -356,7 +356,7 @@ static int goodix_hid_check_ack_status(struct goodix_ts_data *ts, u32 *resp_len)
 				dev_err(ts->dev, "hrd.size too short: %d", len);
 				return -EINVAL;
 			}
-			*resp_len = len;
+			*resp_len = len - GOODIX_HID_PKG_LEN_SIZE;
 			return 0;
 		}
 
@@ -446,7 +446,10 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 	if (error)
 		return error;
 
-	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
+	/* Empty reprot response */
+	if (!response_data_len)
+		return 0;
+	len = min(len, response_data_len);
 	/* Step3: read response data(skip 2bytes of hid pkg length) */
 	error = goodix_spi_read(ts, ts->hid_report_addr +
 				GOODIX_HID_ACK_HEADER_SIZE +
-- 
2.43.0



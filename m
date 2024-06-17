Return-Path: <linux-input+bounces-4397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A374390B9B9
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 20:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0AA284D93
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 18:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB83197A76;
	Mon, 17 Jun 2024 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFGSTdLT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C00196C96;
	Mon, 17 Jun 2024 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718649061; cv=none; b=M1E3PqMe/LtndxLrVwohYVOMilKKxPya6EO9DBYi5l/6ZX6wuRDnh7Sv7DV23PZJyC6mEDaTUs2iZ/QAvazjPT9OcYlEpnw+VGx8i6vsjPS846gBOBtlRvQPq6hzfnO9N02IY/jDQA34ePZCjPWCM0DJp0g871j2IeWPg60C7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718649061; c=relaxed/simple;
	bh=vidJFk6H/S82+Wi7PaCYYa05Xa8LB7oh//PbK+7UNWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYEL2p4Vo03ActsjoT7JzO9rJzzZRI8esa4YbIzH6cDtg5g2j6Uv4MNCGVwf7c+yuQ/Aw5JhBHPKF2qDKPdLLYIFHIRpjJesnIcjZ/qcqT3I0sOvhZl7uH+1umNtomNmkrnqhcyjycmmLi5GhKGZVmIOEL6MA1qcdfpFVEa8UVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFGSTdLT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6efae34c83so579707266b.0;
        Mon, 17 Jun 2024 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718649058; x=1719253858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r43fwplRQSNhvu+3okxltxxzzi48q8i0FPadBQFXZa8=;
        b=WFGSTdLTNRnTOvD25FrSyGYzCZA0Rm9oF7ufeDbcyL1OZirY/1KVp8D3iQ8q7WKDOV
         dZTeC2FElK4dPZI9npniDWL76eWiI9S2ab2Rh41Bh4Q9V73jVr+51ztWl4JOSeZMEH46
         cBx90nNJvDluBdLO1ahJJo6DceAcFhVwbth59d2CmUHmr8vy7sPtyylzZ7bQ2c3dxdkE
         +aNmr8Sl8J1ZgrKHgia1xahi7LcAyHDHq5FE+yOz4vysLz5tFvgXnZDkvZd7vnBu0lsc
         mTtceAx2dAjoKoowtDhBQhJfG6FFDEfoQtjPltJho6k5rt7ANq6p3XhVROeFGqv3cZUC
         7dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718649058; x=1719253858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r43fwplRQSNhvu+3okxltxxzzi48q8i0FPadBQFXZa8=;
        b=o4PYb0IXfi5zXSPZdF/ZR1Y76jNVFzgKsEtDHEwSmPM/ve3/6vYqgKdGelSbCgqplf
         WeqDZvtOGd5ueBO/P+8L2z3NgiMq1ky+8syznei2aw5xujI+Hocts7EelIXgzYFiLS/+
         IGX6Vstgluh/S4Oef87Kg3AL57Nvy2sCIjtL03pGrQif1a+BHY4EpL4RLV9A1yGrF/dp
         kw5Ytr3IEWS6bAjlqFVYo4Kh1Eqv/qZ2uhzUX5Na/H/nLeFOsiGziZZvQja6Ea3jI7rH
         kXMhv1nad54X2GVD7zfosirAcrAuMB9tKSjhs6Q9vnRjOBigbUud8nBE8aKuVAcnlcXk
         xyYw==
X-Forwarded-Encrypted: i=1; AJvYcCUPigEsi0cF5fjHAmJUl6C/s7Vfi0y6Lp1pRCxt6rUkBjxGqKoRO/mY7/OciY8nxEK1qjLSlf9OsPg1zz5hh9aj7Vir6qU3/14c+lRDjIukzInSSxNPKRk6kVkjs4Ms7Ybbo3IwRdzGui8=
X-Gm-Message-State: AOJu0Yz7zLvhLUGtkbefMsiW3Y/rfD9jT3Hpu5fjXgTirKz1pRuW30tM
	ZzTCxW+W9pRVlCsxfkDdQ5edsGM6Et+KcyBZYBVKR5xVsowQ4hcf
X-Google-Smtp-Source: AGHT+IGt9YAUF0O6oDxU407S63hoXMspEwp397GgLRaM9xdZq+idV0cIMLA1zmW9sL9vwhvHDww9ww==
X-Received: by 2002:a17:906:c354:b0:a6e:8aa4:1fc1 with SMTP id a640c23a62f3a-a6f60d2ca06mr589192766b.28.1718649058101;
        Mon, 17 Jun 2024 11:30:58 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e100-e800-c687-22dd-17e6-d8eb.cable.dynamic.v6.surfer.at. [2a02:8388:e100:e800:c687:22dd:17e6:d8eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f8f6eb3sm483252666b.143.2024.06.17.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 11:30:57 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	m.felsch@pengutronix.de
Cc: andrey.lalaev@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Lalaev <andrei.lalaev@anton-paar.com>
Subject: [PATCH] Input: qt1050 - handle CHIP_ID reading error
Date: Mon, 17 Jun 2024 20:30:18 +0200
Message-ID: <20240617183018.916234-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Lalaev <andrei.lalaev@anton-paar.com>

If the device is missing, we get the following error:

  qt1050 3-0041: ID -1340767592 not supported

Let's handle this situation and print more informative error
when reading of CHIP_ID fails:

  qt1050 3-0041: Failed to read chip ID: -6

Fixes: cbebf5addec1 ("Input: qt1050 - add Microchip AT42QT1050 support")
Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>
---
 drivers/input/keyboard/qt1050.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index b51dfcd76038..056e9bc26026 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -226,7 +226,12 @@ static bool qt1050_identify(struct qt1050_priv *ts)
 	int err;
 
 	/* Read Chip ID */
-	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
+	err = regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
+	if (err) {
+		dev_err(&ts->client->dev, "Failed to read chip ID: %d\n", err);
+		return false;
+	}
+
 	if (val != QT1050_CHIP_ID_VER) {
 		dev_err(&ts->client->dev, "ID %d not supported\n", val);
 		return false;
-- 
2.35.2



Return-Path: <linux-input+bounces-6929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89E98B874
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 251F0B20E15
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 09:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A165519D8BC;
	Tue,  1 Oct 2024 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cf8919jl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198B2B9B0
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727775502; cv=none; b=sgviD3aXNnRESI1JfpbV6oy48PRW2BhZXEsblptu81Ry+aaTgSOqHjRM9sRofBegrr/5gtvSuQPtoXXXGQ+ipTD5LoO1CT9KasyZNPHiXUpx1rT4S7CGlPfp8tsBuqT3TUwT6ai3fhjdKTE3CwxsT3zixxINqsutPXlY8c8NxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727775502; c=relaxed/simple;
	bh=Cpx3AeJyQwnuEuBnEmjNQ88jDDc8nnxpY5yUvChiiDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S30y+FlM2SZ23RA/oYIkmzHWadscqHSFiSmHo1peX3IzhCNkYhQw5HEVcUhDPOU7ziwHnDL4/l91o+yafcGE/ZnctGk0ZlGzyV6HgLvFaU5zQs6/RQ5NoPoB/0tlTfopJaygcDji3pHIab6yx/yyXPVDKjb0qjK8pSpxP+qCaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cf8919jl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b7a4336easo15275785ad.3
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727775500; x=1728380300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ziXpabWoT+cHo2FMgHSApxGngpcxDuLrv8V1LP1luA=;
        b=cf8919jljsZ6kktQPow+qFAI77L7FWrzZX1tEmqzXNi6aAXKcozEDtVrVH5plCmTtL
         3RoWmywb7leUA3nJthmVrqbIKGA1LgVXq1d+X9IP9bAJaLNK82tc3SfRQa0gof7vx5PZ
         VV+i8pvBsq5ix5TsOptIa7AHlIq4Kr7pTmxtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775500; x=1728380300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ziXpabWoT+cHo2FMgHSApxGngpcxDuLrv8V1LP1luA=;
        b=TorGxoNYN1zIyO2eK1OpvDaT8iWeKMYU2HUBRgmrt+BGahQAXS60lAWzm8NnHbQRtI
         gI+haywESnD4dkhM8Av5CZvjJeRDELu7CRrmq54UzMETGOLrHlhpPzbn+ezhwl0NuXKS
         8PEEdjZt77opnnP/6cMgmZPjcLOPBJdror+4PWUr3aM6LNWDmOJQDnJNt5QAPzgnHTo2
         9juIy19LiOxmO+0HsCVEbTiPpRquSCt0TEwhCEPUkc2c3jA0JyMRYYrpAQIU04s/Cfpg
         LRK7+MnrR4Eqnq1kr8iX/U1drOqwLA7US+cIuHyP9iVdoswG19by7KcD0XfQsOUx8dyl
         0gQA==
X-Forwarded-Encrypted: i=1; AJvYcCVAz7mA7pHpc6bBdBtDQ8lC47VmyqnuCawbI8IYfPGGNv8fwPechTAov1T/9+5HxKcfXLjdZ0ncahcLeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3fMA5QseAQfdLW66TNQfBn5+VsYRxvQoU+abPQuh9+Egv0cvj
	/cjihmovOWgzIaizExfTZDgQ3EhxNQ9RbBtNqfxlcGK4rVzQu2Ytt8R7Pkw25Q==
X-Google-Smtp-Source: AGHT+IF24jB+QWOJMW7Lc40JtllgUfd6H5l1orvGNaAB/Xbwklif8b/5HjnAkM9TxmV3LP6xto3+TQ==
X-Received: by 2002:a17:902:c403:b0:20b:4d4c:43e with SMTP id d9443c01a7336-20b4d4c057emr188965825ad.15.1727775500570;
        Tue, 01 Oct 2024 02:38:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6e0e:9591:90bc:e522])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5ecc1sm66591385ad.268.2024.10.01.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:38:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  1 Oct 2024 17:38:14 +0800
Message-ID: <20241001093815.2481899-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Add proper delays after regulator_enable() calls.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This will unfortunately slightly slow down the driver probe and resume.
An optimization would be to check if the regulator is enabled already,
and shorten or skip the delay if it is. This would require a new API
though.
---
 drivers/input/mouse/elan_i2c_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index ce96513b34f6..89556f61004e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -46,6 +46,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY	110
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1237,6 +1239,8 @@ static int elan_probe(struct i2c_client *client)
 		return error;
 	}
 
+	msleep(ETP_POWER_ON_DELAY);
+
 	/* Make sure there is something at this address */
 	error = i2c_smbus_read_byte(client);
 	if (error < 0) {
@@ -1374,6 +1378,8 @@ static int elan_resume(struct device *dev)
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
+
+		msleep(ETP_POWER_ON_DELAY);
 	}
 
 	error = elan_set_power(data, true);
-- 
2.46.1.824.gd892dcdcdd-goog



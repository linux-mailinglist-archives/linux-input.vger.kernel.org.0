Return-Path: <linux-input+bounces-6021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C59663A7
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79D9284696
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D081B1D7A;
	Fri, 30 Aug 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmMF0kl2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3651B2EC0
	for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026679; cv=none; b=UZe3ZgD2FXomEm0RnlmPwEkpMLFoNjyPuShGOKJjn9vLtfc4DD4z9elx0UcHlHNWrC4Zqun4ZTMOA1iDrx+3rWI0j4Zx29ytJNhyj9SDj4Pfk1rjwegKB2+qfSUMIoMMBJEMm2NdT+a9aX+fIhmf7BgT/4QzedBTJd2PWr9zNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026679; c=relaxed/simple;
	bh=LjFHjn+Y7YtRnQVaacjI7LDbGXTKAI3Ki3bx4k66SbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3QuW4n9tEgdxE3ejnUoL7XsczMOh+3OAGu5a98jSFgyVyjovLikUXW/C1sVjRWpWo4zQSIAuIzig1kNsOX2vMG4r77XZRqv4FyVL4hWSv/5q/amx1a8IKvU4inEWPtSnVk8AvxkmgSKkxBi3b3kcUJaBx4A1hnxE58xF83R+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmMF0kl2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so21269231fa.0
        for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725026675; x=1725631475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bldFDzJUn/k2Bt8f74T3d+f2wRvuEAT5t+HNQ8xZJH8=;
        b=qmMF0kl2f5kgPfx4zlizp9UFRgxOjyBeD+9XojGZDsA2EsVQ1AAN6b0f5xpva0Q2FH
         AUqGhIkt1y5MwhNpsgPpn+LR75zGGFS8b8k5tnQW8LSG7QBhhwHztOJ1B9Et/VIiEqg9
         0iBAvSyZqi5MGTt/mj1eva7CrlgF7tma5UfQQIbSaJvpgPXKL5xFxfijr6/QvzryBbiP
         AdbbL05rX5PQSDi0RZsbhBEs/Cd2jiaWR6Ywt8n4lD/xLQoQvJ7KCPksTrqNlFFbZ35+
         T1ZBPVApuXl0QRs6KeNsmAgSi1ygihBP3OoL9hymvt7T5EGv737viji8rklnF/EmDRPz
         mTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026675; x=1725631475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bldFDzJUn/k2Bt8f74T3d+f2wRvuEAT5t+HNQ8xZJH8=;
        b=E3BIjAL5USWHtUXPhHp0yhOPVg6nJyj1DHMaQ3KSik2CHmJqaKvljvHU3yLeHA512e
         foLhZRamTmXSmC99m228XcA9jxSBmOmlYQHz5zCltM2sBgkucmxxWcnDUC663FmE5MvM
         5pShryD2mWR8GOzTwua9RM6kOnT5Ji3FtO0XEqJGbIsKI8fEoWPSg2zuaBurnr6ffGqV
         4JdxdZ3zO8FfUwGQxt/4lbgHenEFSVVa6hDCiwG+YZtarKFPGHBfntH/p8GMQzdey7CW
         N6xMn7MmoBvShHTmHu7/SXy3RuKKa0C08F+bZ7NWEsoGKGPMTfvZLgj5Ny4yh9lSevhk
         UZjQ==
X-Gm-Message-State: AOJu0YyJu3Bs5mTLnlFPR3gNmFXIb7YzJIHrUceN5qCjGvuSBY/gQYyX
	G4RsLJmeatf3vfCcy3/pIAPYggo8j27NIHhQ65wPMMtZ8gFcgvQVyr8ldshwMu4=
X-Google-Smtp-Source: AGHT+IHv5mXRP97AwaUJFidIZZ86IhE1DwuNQ1qw4H4asZOp7h2/u9+in9unkHyTtSVIKvgypJwSiA==
X-Received: by 2002:a05:6512:694:b0:52c:a016:5405 with SMTP id 2adb3069b0e04-53546aef3e9mr1912932e87.8.1725026674334;
        Fri, 30 Aug 2024 07:04:34 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084118dsm616826e87.217.2024.08.30.07.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:04:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 16:04:27 +0200
Subject: [PATCH v2 1/2] Input: zinitix - Read and cache device version
 numbers
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-zinitix-tk-versions-v2-1-90eae6817eda@linaro.org>
References: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
In-Reply-To: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Nikita Travkin <nikita@trvn.ru>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The chip hardware revision, firmware version and regdata
revision is needed to discern because for example touchkeys
are handled by different registers on different versions of
the chip. Example output from BT404:

Zinitix-TS 3-0020: chip revision 4040 firmware version 0088
  regdata version 0004

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Move read status into the per-device struct.
---
 drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 1df93c96f6bf..e47e0bff80db 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -150,6 +150,10 @@ struct bt541_ts_data {
 	u32 zinitix_mode;
 	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
 	int num_keycodes;
+	bool read_versioninfo;
+	u16 chip_revision;
+	u16 firmware_version;
+	u16 regdata_version;
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -194,6 +198,18 @@ static int zinitix_write_cmd(struct i2c_client *client, u16 reg)
 	return 0;
 }
 
+static u16 zinitix_get_u16_reg(struct bt541_ts_data *bt541, u16 vreg)
+{
+	struct i2c_client *client = bt541->client;
+	int error;
+	__le16 val;
+
+	error = zinitix_read_data(client, vreg, (void *)&val, 2);
+	if (error)
+		return U8_MAX;
+        return le16_to_cpu(val);
+}
+
 static int zinitix_init_touch(struct bt541_ts_data *bt541)
 {
 	struct i2c_client *client = bt541->client;
@@ -207,6 +223,24 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 		return error;
 	}
 
+	/*
+	 * Read and cache the chip revision and firmware version the first time
+	 * we get here.
+	 */
+	if (!bt541->read_versioninfo) {
+		bt541->chip_revision = zinitix_get_u16_reg(bt541,
+					ZINITIX_CHIP_REVISION);
+		bt541->firmware_version = zinitix_get_u16_reg(bt541,
+					ZINITIX_FIRMWARE_VERSION);
+		bt541->regdata_version = zinitix_get_u16_reg(bt541,
+					ZINITIX_DATA_VERSION_REG);
+		dev_dbg(&client->dev,
+			"chip revision %04x firmware version %04x regdata version %04x\n",
+			bt541->chip_revision, bt541->firmware_version,
+			bt541->regdata_version);
+		bt541->read_versioninfo = true;
+	}
+
 	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
 	if (error) {
 		dev_err(&client->dev,

-- 
2.46.0



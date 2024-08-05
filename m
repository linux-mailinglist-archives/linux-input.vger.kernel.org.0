Return-Path: <linux-input+bounces-5363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D004D948552
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512471F23612
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 22:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE8716EC02;
	Mon,  5 Aug 2024 22:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzhBwf7U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F316EB7C
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895919; cv=none; b=rAzgu2tJUDHWHShnRkLyioKt8qj7CTOhQ6af56uVp+jtZIsCL1A6FXs/Ij+q9ki5o5N3DaU1ogjlcR2CTPuWVZE4+VmFbThdXjOlM7ut97iULDhbm5hi1TmnDY3wYjLimxiHDN6uhnXSUGFQ7KssZRmBQNJd5EI9I3W+uAV1R8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895919; c=relaxed/simple;
	bh=+moyCITneDeBBtejA0IscIkctKmlf0pwsmC9ToGIALc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqVkJwpx0diQaKhre56zDTjhukJoRQTLcjRqQFQu8z3jP+nTZniq3kYgyaWxcDiwelajfX5EJsn8E/RDCH5RoV8Sq0C0DyMH9LyadDzxKq/IuWXrcid0fnfqleDHrk+3Pc1pyjq0qMGnq7zJbogwNuYj6nmdUxKTH5mtaLiv4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzhBwf7U; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-530d0882370so1608170e87.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722895916; x=1723500716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcB208Cgr26JB3La7Cwk4CQVZMtEwvJnmFJUp+mTTuA=;
        b=CzhBwf7UNGMy5M8gaU3WnsH22XK3cNqmhm50IiX9sUVhIrSBVcK1rPTIK48F6qqIdn
         gUC7dSZfWZLlW5NMqh9Cv5miHqwXvYaqz0zHgN2CN8HFWvjjIGohzO/g/HVeH4nM0lr2
         g4+U/uM6ap/QKixnjbckJsH3UQhvg8NQBO2G9aQUyoJX/V4SovtynxJSWmnUhoX5Cfs4
         7H7F5oRjP6EpA+aTtFImlYNgz1lcCAHVQ+U5pnYKWYZzeUxqWYe7c08+aLbd4pRsCty6
         1DvI2UtYb729loQpJLu4uXZL5SJyYDrA/6i9PyXkZJYzcINSNUfPEiSLD2X12j6CAqFE
         lQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895916; x=1723500716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcB208Cgr26JB3La7Cwk4CQVZMtEwvJnmFJUp+mTTuA=;
        b=rl5gsogVUvRJbMFLhBzFIgv+CHM4VlpJTaTj+UlW7+Two+W4GKdO9u6YSJwfNvY8q6
         6rJvBIHUU96ByIq/SXOFtHDgBjwbQs8zCVghSJ0l0t+hH7qNTwlz/PpIZxyEH82Skcm1
         oxmUs9BVIjlhql/ChfNgpXSQxvCX2BluiHVmxiHPnxaaz8ngr9sYF/xOzQEJR/201XoV
         Q8oc3jL30gR+oLMujFFFHpB6+m9hRqSwVPj24u99NF842WBw8L2wbqTJjD24AGt6lIjB
         FntWOH39pJ3RXh9vzTQ2ZnIVEwhbgsKsaVQPw1RSFodQc0GR3j6icU4hUYtq0d4JW9gZ
         TboQ==
X-Gm-Message-State: AOJu0Yw4ad3dg0TuZZvo9rPFqP1ScXTOrZOkwOXNnWbXC6vmBBMo8Qkz
	6V/Px2fxAjZYSXPqlQBq6BdW8qw+doit1OYgG9sKCfkXLBiKz15zpZS4Y/PWSkzRRUda41MmnEQ
	p
X-Google-Smtp-Source: AGHT+IEp8tO5yBrmrpwP57tYQ+Qzczze1YsFTeBJ2Yr39ZMrKPHjFj6JKZCrWeLNYBOBFGczPmMfbg==
X-Received: by 2002:a05:6512:ba9:b0:52e:9481:eaa1 with SMTP id 2adb3069b0e04-530bb37425dmr9097016e87.23.1722895915978;
        Mon, 05 Aug 2024 15:11:55 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba3cb61sm1268590e87.245.2024.08.05.15.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 15:11:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 06 Aug 2024 00:11:38 +0200
Subject: [PATCH 1/2] Input: zinitix - Read and cache device version numbers
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-zinitix-tk-versions-v1-1-63ef79c7f2a1@linaro.org>
References: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
In-Reply-To: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
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
 drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 1df93c96f6bf..17a98fd79297 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -150,6 +150,9 @@ struct bt541_ts_data {
 	u32 zinitix_mode;
 	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
 	int num_keycodes;
+	u16 chip_revision;
+	u16 firmware_version;
+	u16 regdata_version;
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -194,12 +197,25 @@ static int zinitix_write_cmd(struct i2c_client *client, u16 reg)
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
 	int i;
 	int error;
 	u16 int_flags;
+	static bool read_static = false;
 
 	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
@@ -207,6 +223,24 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 		return error;
 	}
 
+	/*
+	 * Read and cache the chip revision and firmware version the first time
+	 * we get here.
+	 */
+	if (!read_static) {
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
+		read_static = true;
+	}
+
 	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
 	if (error) {
 		dev_err(&client->dev,

-- 
2.45.2



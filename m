Return-Path: <linux-input+bounces-6697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90A9856DD
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C271F25323
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89556189BA8;
	Wed, 25 Sep 2024 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyRjc3Vi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D4186E57;
	Wed, 25 Sep 2024 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258609; cv=none; b=SDnONZlV0KXvT0Vd9JWwUCsMLKvSKbEY0qEf4WDEMeMO2hOOixxYWOXi6MD5F4ju50aMp9LkrDBuQYIIZYqqryaEygfAHqOSvNXbUqwbex/77/cebsWtVgazjjuTkl//CGL9yCqSC32v+YtMJo2YNZaNIjeuSZiW2ykT2mzkj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258609; c=relaxed/simple;
	bh=KS+wcQ5/2bQLSmXDSLBEXi59cp/2TPdoiegryyueNcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDHZZd3AiCe48/38EpLCwLKDGz41euKke77dwzb72/JmJa7TTb7yGkMwnl5+nl1Exp/6X4r2b9YC0xYJ30WwqCxr4U3niBoa3/CeS1sOUKHz/oI2UbWNoOocZjM+NzPEo+PA/DuM+p+HLL3C56bif7FlcflZwyKVOY+1wvFYjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyRjc3Vi; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71b0d1c74bbso368006b3a.0;
        Wed, 25 Sep 2024 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727258607; x=1727863407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/z6OoeWeOO+JZ6GztQP6f37z0vBheTgUHQgTElxq/g=;
        b=PyRjc3VitluzJj6fpaSQQtyX60yIY+Dpja2WTmvI/BvX7qBBvxdXBf1mYN92Jmi1zl
         mk3bCV/rvAREgbkOUG/+XzGmJ8+ahLHH8fduW6wSZ7JnHNxnn0GiUili8rVrt9bEU/jI
         sGaWfgkmQJr+gFzQNPJ2dwQFKEclKgI8nWyfuIKmkDOHYC987tBh032cSk17lEaUrwFH
         Ybv6VZ6VfKb2eWNJKTmYd0hTFjgqgKuCj+dgwuwbiYzEbPo3Wd47oIkMunZRl/GLX48Y
         uJyNusc4oyygKE9bnES1XINdhEP64VKqxxnbGjzD0IvMeHJ1d+y/Fc+YxHF9lDD0Y4ze
         1t1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258607; x=1727863407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/z6OoeWeOO+JZ6GztQP6f37z0vBheTgUHQgTElxq/g=;
        b=gJfhHn72n8tIUX3mLo7vPDmHBKu0ALN9lNTgrVwfe4+aFBjALSnl2+LjsKVGGjKktr
         +yI6ZTNoj317jv+mTQpuav4Lxhf4Diwo9f4EwPyjlNizGCR5KspiXy7rPHcxJfaUGn9V
         c0V561ne6MbA2lv54a+pT5FsCB41LCWtmgnoqekio7cLKNdEyeKEdWTvoOV076u8CdIw
         ivJ3MdzHdUVVU8HBkitT9g/YI3EpefJYMU7X65toALwGr7jbRD1ttW1RX/yJDaVvYXep
         R04YksEGkN516XhAhBmuczW+qF1gOki8u1jATPCHw/VFp9B0QcJYYwPbCzlcWTml6Yt/
         Ut0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3QUWjA1fkMPZnDlSr995Y/HEUNmL3xu5e/As76V7YZ2O1xbRt/y65GqMPGg/M4doJ2TukjisgSYQKcvg2@vger.kernel.org, AJvYcCWsLQTNJIUehOlk7tF9Cq6n5MDOMmCfSbYhawXYXhT/z8ZRBY4TW8YjHPXsexe7/uu+IZIXW0Kplhiymw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG61NgajGQ/MEyu/KbfbG/6IdX7XeOEUk4dd0ounDfsV63GRzH
	3N71N9Ns1pStOzD8yzOO6uJWnZNBVSlelzxyz4CgYkgiTUVuGS8=
X-Google-Smtp-Source: AGHT+IGs5o7Mf1ub+jT02yLfEoCW4MJzJbjfluElSdE9oeBI4YgvQep48FtbEP48tx+fL73ne6CeQA==
X-Received: by 2002:a05:6a00:170d:b0:718:dd89:a1db with SMTP id d2e1a72fcca58-71b0ac7ff5fmr2995908b3a.28.1727258607204;
        Wed, 25 Sep 2024 03:03:27 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9390adsm2462546b3a.134.2024.09.25.03.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:03:26 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 2/2] HID: i2c-hid: introduce qtec vendor, enable re-power-on quirk
Date: Wed, 25 Sep 2024 12:02:00 +0200
Message-ID: <20240925100303.9112-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925100303.9112-1-alex.vinarskis@gmail.com>
References: <20240925100303.9112-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This solves keyboard not working until suspend&resume issue  on Dell XPS
9345 13" (codenamed 'tributo').

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/hid/hid-ids.h              | 2 ++
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7ce1b..a99b5a138128 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1091,6 +1091,8 @@
 #define USB_VENDOR_ID_PRODIGE		0x05af
 #define USB_DEVICE_ID_PRODIGE_CORDLESS	0x3062
 
+#define I2C_VENDOR_ID_QTEC              0x6243
+
 #define USB_VENDOR_ID_QUANTA		0x0408
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH		0x3000
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3001		0x3001
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 087ca2474176..1e4f478cf878 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -134,6 +134,11 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
 	{ I2C_VENDOR_ID_CIRQUE, I2C_PRODUCT_ID_CIRQUE_1063,
 		I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND },
+	/*
+	 * Without additional power on command, at least some QTEC devices send garbage
+	 */
+	{ I2C_VENDOR_ID_QTEC, HID_ANY_ID,
+		I2C_HID_QUIRK_RE_POWER_ON },
 	/*
 	 * Sending the wakeup after reset actually break ELAN touchscreen controller
 	 */
-- 
2.43.0



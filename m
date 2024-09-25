Return-Path: <linux-input+bounces-6696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8EE9856DB
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C1AFB240B3
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C33D188A18;
	Wed, 25 Sep 2024 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw0uc+4O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FB15B0F1;
	Wed, 25 Sep 2024 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258607; cv=none; b=HeTrL2b6lf8bJ3PwWwtmvwHjZPHEKyy8eSWig7v56KJNioXZ0vpH8kE6WGmq55csP0HZ2Y5L9WlDBnFCmcb6vE09CLhhIoUAsqVO+QEcuEdBuP8ASI0dIZVv/9IBmf9NTraK2kVuP1it35OUfYyxulRhfPUlTRxxE3P7xjG6xF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258607; c=relaxed/simple;
	bh=TIoHxtOHL0Hpx3TsVZ9FSDaKbPtvgAbs+05JWEpOHRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfDi58mXtaBG4IPho4jVjX+0BtgqJcha8QwegMH6UpH36GsYUTpXRdebUF/Fxc2bpc6eevi/8gHedmTBa4iWekLpzkrVaycbH8MRtEl7LMxtZMol1dD92hX51PZuVNRaefc9xd3/0z3JMGjDFjYWY/+lKQkBcL6mRJQhMWKCBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw0uc+4O; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6bce380eb96so4174539a12.0;
        Wed, 25 Sep 2024 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727258605; x=1727863405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzkqfvDq9wZM6bWFdkFgvO185d6gzvw/May7YxkYzdE=;
        b=Dw0uc+4OvhBThvbF0OIqXuYNmID0O9NhGqSChaVWGfUeURI7IMN8JVpTXliEWrLp7H
         DvuMAeFe5Tb56r1eoFKR+YWH1bDMqVbY+NncxX2mBztd9zl2Uqj0lcaDFKH9HRlw6ovk
         TEhxPjidEyC7UhypKWI0DLnvTlOGe6J+tHxWGDjq1JleD5H2leFHyiBnyvzh2ePcU7v+
         BRDdfKVo82pvh86KEb1wZ4YOHjS3aM2uH0i6LOrEII21i5JTVONj6TvcR2KQorRIE+19
         C2mFjISE/LYisbNnXbqiu5FCOQaZxay2O3gR60t21uWLb3Ne3FFaue9OdMMrZwOwMKVm
         3tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258605; x=1727863405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzkqfvDq9wZM6bWFdkFgvO185d6gzvw/May7YxkYzdE=;
        b=ogmpu4VaMjx8zEysZlS9sQLAjM7yO6noEKmUyDMFVxXzyeVDqVDv1qo5J/s/m1OEJu
         dyUhJJdqSknTQygcckr/TC7KU3CKzyQE5cg8v71VTO+/VJrcV/KBQU06y+ks9+F96rPw
         4HTHsh86I0KpcZsifrO1X6/ngdtxCCapMyfzzjnIL2xzhL3CsAJgYImSSmPfbQCjp7c3
         OBKJ+clQSxMGG9/roglJrlsY8htQOaUaetkWYlLplgnm/R313Z/eNQhS8xd1NUVPnMX+
         fVX3JMQA3Bh68K/Ji9Wo8hNrRQnPC6B+njRgex9pdH0bqCl1kGGZonVqyhdxyZBhij7K
         3GAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+dDtM4FEUD9RkSKLz0Mz/cpx7RHaGHN/IEhCjA2YGYtJ10VOdh4Q4H48pr//igkWIakqJo36FtVaklg==@vger.kernel.org, AJvYcCXYS7hIIb6DmwW++V4GKNW5/CfmbYtq3ZqtdPYUz4oVyiNeVJzycUJYLBCpHMvKr34HtsiQNVmYQDhaX3zf@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPx4JRu7WWM1e5f3bvBSIc5gLLLWkpDWZZ/anF1ZAAUtCTsm1
	oOs7XGZ0eZIZd8Qo9wzkNqtgeeRIRu2g+4jE8qDsaSe/WfY4vnoi67S6HEJCFAiP
X-Google-Smtp-Source: AGHT+IGuOTgSzXf5z0tEtNY6qDtK6BY7d+Eor9+3tV59Xb3KlAfeH0Jign/82BfRO9v2pEbpSlJPRg==
X-Received: by 2002:a05:6a21:1690:b0:1cf:339e:a8d1 with SMTP id adf61e73a8af0-1d4c6f3445amr1244061637.10.1727258604647;
        Wed, 25 Sep 2024 03:03:24 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9390adsm2462546b3a.134.2024.09.25.03.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:03:24 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/2] HID: i2c-hid: introduce re-power-on quirk
Date: Wed, 25 Sep 2024 12:01:59 +0200
Message-ID: <20240925100303.9112-2-alex.vinarskis@gmail.com>
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

It appears some keyboards from vendor 'QTEC' will not work properly until
suspend & resume.

Empirically narrowed down to solution of re-sending power on command
_after_ initialization was completed before the end of initial probing.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 632eaf9e11a6..087ca2474176 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -50,6 +50,7 @@
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(3)
 #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
 #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND	BIT(5)
+#define I2C_HID_QUIRK_RE_POWER_ON		BIT(6)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
@@ -1048,7 +1049,11 @@ static int i2c_hid_core_register_hid(struct i2c_hid *ihid)
 		return ret;
 	}
 
-	return 0;
+	/* At least some QTEC devices need this after initialization */
+	if (ihid->quirks & I2C_HID_QUIRK_RE_POWER_ON)
+		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
+
+	return ret;
 }
 
 static int i2c_hid_core_probe_panel_follower(struct i2c_hid *ihid)
-- 
2.43.0



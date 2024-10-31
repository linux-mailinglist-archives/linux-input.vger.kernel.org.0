Return-Path: <linux-input+bounces-7798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A279B756B
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F621B22BB9
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BA514BF92;
	Thu, 31 Oct 2024 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfqaJOqv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D80B1494C2;
	Thu, 31 Oct 2024 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360073; cv=none; b=TFFbcuxIYTD2aW1HAKtDmCpz7R9zDDG/HzzHla/H49SL8QcaELLPq9go8JEo759B9A2DTvYZjW1Afl2oR6fSzE1BP2HqTdA5qsJPm1guZhgLzKH2biAsvc2NmbN4kbTjBedQzp8Ruv2xRINnueBnnsSpnWljjTck0X4TJsgoVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360073; c=relaxed/simple;
	bh=e6Pog+PUJbgFvmtTAGykTj42o4bKFsOKM7Q8vc2hwBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrTTLAX2LuteY5WAy4L4gwymTt8h+bFR2xL4M4WkKn4TDkCyMuHS3oqpdrw34uZd7gdBvDq22QZ/vqIezzLvUTqVmFzPYd4yA5UJlgoZAoAmVkRWD8poQsGfpcPZOdq6Z5Nhw1hUagfiYtdZHMtSbDnoCsuYmjBrq0NkONcAbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfqaJOqv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so5396265e9.1;
        Thu, 31 Oct 2024 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730360070; x=1730964870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+UmhsMuI1nWwTKnlzdKf3OeCG7YqHV/PjXBwOIOpZE=;
        b=SfqaJOqvEA8G7PoSSgrKovIVwrtuXYu1ELVYqz8E78b11hm42Q678UIbnMi4XGT9w1
         vITFBeE5/NZM9YS9ioHc9JMtIX0zBj2koFwLPKE0kcS6Su59J/+TBrVbKfAPXugQ1rO/
         QbSQDLge+ree9k5rgbLZk1d9zLxvXXjqFI/9zAYlEvAtcFmgnCXsjf1D5QEgdr6C/q3K
         +ZOOuQI/V3nnB2TOS5fmXA3vU7WdlRwaod03e6pRKz5o2lmbQDj4pfuEUVTT3/+3LxRP
         RpU/gkRgSCwl4ht8kE+hNH/tBE5x9xP2FlBX1GKXUck+N/QbVbQveUOiBrBX6giBFQbN
         scJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730360070; x=1730964870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+UmhsMuI1nWwTKnlzdKf3OeCG7YqHV/PjXBwOIOpZE=;
        b=XT43vwQQaNPxruq+aoiYaj4AcRJmHtBgcLZ+/y81V6NDVuIaPGGsg+PLjN5YfcZqgA
         PDN/xkMafi4NYwFDJPmkdjRtzUpLl0lRraFDnI1VFztpONll7CcEkVDjv7or5/d40iUk
         1SIcUL2tDmyJTB8YJT+g3zLNO9TU4XZV4ULhhq4ZJeSJP1eB6+xvsENqYXfV0h9tGjar
         lK3jDpJ5uG6GIi+1D2Yb62UHsa2PUzKzFewiN3hmrntg0tTZssThy4dLegUqBIspC6qL
         F4FH2to0evvZrl1JTNTl10uCVT/Hod/aSCIK046NqV0sm21qs7+x2ylaHVXMhVely8wT
         2OPg==
X-Forwarded-Encrypted: i=1; AJvYcCW1eUajNrlouRnBoDq6FO1IFPLio2cGYIuQDK3W8KuR6mUursHcBippgT7r4HDFWrVJBmTqXrvv9OPvaw==@vger.kernel.org, AJvYcCXLF9nv0o4ZwO+QFHAMJtapCoAwW9BRN14054O/dgUfdEUUpq5eLnkxvM4N76FCiRAKhfTr1GLvWe/E0rIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DXHnBBtchCYylm9ZhA2WVK8FS0a+c4WY0gdrnp0YoTaFroxg
	AzbvCJetHtpMc52rQe91/q6EvU0fqepAABv2qyz3JfKjqZI+IVu+sa5oyao=
X-Google-Smtp-Source: AGHT+IEecKwth/zA+OIaGi4hGQ7SeAU2jzy5w0lTEZ8p3Bgq0+ItKkmCY2neAuKR+fuEpN1d2ktzsw==
X-Received: by 2002:a05:600c:4f85:b0:430:5887:c238 with SMTP id 5b1f17b1804b1-4327b6fd60dmr19075015e9.11.1730360069505;
        Thu, 31 Oct 2024 00:34:29 -0700 (PDT)
Received: from localhost.. (mob-194-230-148-189.cgn.sunrise.net. [194.230.148.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a781sm1248951f8f.96.2024.10.31.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:34:29 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Bryan.Kemp@dell.com,
	laurentiu.tudor1@dell.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/2] HID: i2c-hid: introduce re-power-on quirk
Date: Thu, 31 Oct 2024 08:31:41 +0100
Message-ID: <20241031073419.9189-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031073419.9189-1-alex.vinarskis@gmail.com>
References: <20241031073419.9189-1-alex.vinarskis@gmail.com>
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
index 43664a24176f..ad386ae878ef 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -51,6 +51,7 @@
 #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
 #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND	BIT(5)
 #define I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME BIT(6)
+#define I2C_HID_QUIRK_RE_POWER_ON		BIT(7)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
@@ -1069,7 +1070,11 @@ static int i2c_hid_core_register_hid(struct i2c_hid *ihid)
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
2.45.2



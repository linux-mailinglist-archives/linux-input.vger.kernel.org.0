Return-Path: <linux-input+bounces-7799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E349B756D
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C232828FB
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9480614F9F8;
	Thu, 31 Oct 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpSfXsTC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526314AD1A;
	Thu, 31 Oct 2024 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360075; cv=none; b=r20qzNkLIZn6Qpj+LlZTTFLYhhF4+9Hrie136HYtb2SLqrFcfJc57ElmrZhk/jiM2XxufcwscSzpnyZG7cG4PhSLzjTmkICqyScpSYtcpVKae4xVsktZ6ZjqOyM1U+ABD8rL7RDB4WkQf4wU5e59itf5H7qYSVJWuYpvjvnFk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360075; c=relaxed/simple;
	bh=fHyL0O4T5JbEOMzjGGSZF5351215zmI6JGSKKxIAqk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsSg8g7rBTX0w9i7Py8zCcnrpHVdmWMxhKMdccx921SS2DjjLZiOhd4h0YwsWUcxJ6OWxpaxySVsCBc1J2bpIp8Vfy0gOH9mrFEs+hMNajsECXGGvQp5MDIBvYCPR2qfDmj2rizINeptjHeSyCkJovt80I3JBqCiETq6YuSMeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpSfXsTC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431481433bdso5310215e9.3;
        Thu, 31 Oct 2024 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730360072; x=1730964872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVkvrLFdCTfWMavnxrW9/fdQDSbj240jTDkaE5rsp5w=;
        b=OpSfXsTCvdSUX5JE+s5rS3YUvoo3wm4T0XYSMwDfTpu6TZVYwYOAoH3edseJ1oj/wI
         G6WDlHU+KuOV9n2PU5HF5hdiAOzuqUVh7iP2/1TEFn+08aIFqQBlExCYDm9wIzll6rCv
         bl1GqPZlqPdWEHqJC9TEEP+2SQ8rp31f7irm0SlEqkgCeNxp22xs0fpaGfEeFEmpao8U
         vwAzao8lpzJS40iAaYFK5ZrYXs1XUX0gi/WQGXrzAfMs/1Cog5uGcBKO/G3y5Dh7y9sz
         K1BESQfqxN+3mBNuiX9va2m0G6FN4r3DCHYypATEaQKktcdeJmqLFQ9+PsLaxcFSpAiw
         ih6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730360072; x=1730964872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVkvrLFdCTfWMavnxrW9/fdQDSbj240jTDkaE5rsp5w=;
        b=GytZHux8+9xw6hnE7LPWKbfJVDLIHJU2VRDopI2cva7cV8ZfP44qJF+Gqn84EaytDt
         7Dlnv1GDZdnw4u0mquVezYWisztEL0iRZsOHWjzGVFU8+arBL9/J6xMdUoyz6QPtHsdL
         KiFCstXpJ8lSA8A5oY3ne7lASbpoX6P3SQpz8LE5KKDqCEXiT+dVDryTC0UFR2GslSh6
         VnC69mLJOSpXaBMrThhitglAbQe8mhQMFk2Q2UrRjUJ5c56yc3vwUCX/Tv+c9oEZONID
         5Bs6g3rVnzH0DNXAWB+qUgmDWcznLF84HEmPYf/4yPxaQi7YyvrKHVUHQ9+MY/LivtFV
         V9jw==
X-Forwarded-Encrypted: i=1; AJvYcCWi1QLS8SBR7HXmYKbRN5HT4w6MTjs6bOZyaf8zCbRlvnD8op/MKIAkebZD6tOnXn+ez6fl9UaQ2Tj/jBtU@vger.kernel.org, AJvYcCXsBFNqiCpJLCEnPYTs0fuOodEvVTBQjKBAvlbBBaDnThVR+nXMMFYdogCrcMQ+U3OVMcZKmUgL4OhnXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXM0a63RXlVaNwumF5c1Tr3oSX5v2E3kpne10flLK26/b1r9z
	J237w3WxeYgsyeWj3EVeA1dCn4XdOKsnsahxCIwp1zIdjgai+wYqtFnM/4g=
X-Google-Smtp-Source: AGHT+IGYUe3+hPL228rZ8KYhwjulTyVfF6wzY+21e7eFzFBqF/ZMAuUvYJI/JMQYYHkvZPMAGgH0uQ==
X-Received: by 2002:a05:6000:42c2:b0:37d:f4b:b6ab with SMTP id ffacd0b85a97d-381bea29202mr1577840f8f.59.1730360071404;
        Thu, 31 Oct 2024 00:34:31 -0700 (PDT)
Received: from localhost.. (mob-194-230-148-189.cgn.sunrise.net. [194.230.148.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a781sm1248951f8f.96.2024.10.31.00.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:34:31 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Bryan.Kemp@dell.com,
	laurentiu.tudor1@dell.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 2/2] HID: i2c-hid: introduce qtec vendor, enable re-power-on quirk
Date: Thu, 31 Oct 2024 08:31:42 +0100
Message-ID: <20241031073419.9189-3-alex.vinarskis@gmail.com>
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

This solves keyboard not working until suspend&resume issue  on Dell XPS
9345 13" (codenamed 'tributo').

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/hid/hid-ids.h              | 2 ++
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 30728997f4c0..cc9b9bdca117 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1088,6 +1088,8 @@
 #define USB_VENDOR_ID_PRODIGE		0x05af
 #define USB_DEVICE_ID_PRODIGE_CORDLESS	0x3062
 
+#define I2C_VENDOR_ID_QTEC              0x6243
+
 #define USB_VENDOR_ID_QUANTA		0x0408
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH		0x3000
 #define USB_DEVICE_ID_QUANTA_OPTICAL_TOUCH_3001		0x3001
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index ad386ae878ef..29c75e390a7d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -136,6 +136,11 @@ static const struct i2c_hid_quirks {
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
2.45.2



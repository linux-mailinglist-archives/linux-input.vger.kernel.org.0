Return-Path: <linux-input+bounces-11939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB6A98462
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 10:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D4917B466
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 08:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C6821FF5A;
	Wed, 23 Apr 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qZZzQQbv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638691EFFB2
	for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398552; cv=none; b=BT3Mm61Sb79ZN4XcBE3WqZNWRT6KeyN+sqrZyG+IynqsEQcZ1BcfdxqccuyIPmHPoHSEHULvQHVcsLk5H5mRPKY+AIM/+WsRyuhalONlqhKDTVZzhQaTo/sSlUQzTqzN3IECtnNl8JxUaIgMSTqTEW3tsbwc1ARkD9fCTo3Ap/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398552; c=relaxed/simple;
	bh=oSqHYPefJTh0bLFCxZFI8OnstoUZFH7q/TAZpQkyL5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlFCZ99E+zGXYLRbi4wU/3K6Y5RiAAi9qY2Fe6/5ic4aMU+0vanwk3vMFbIov8uy5ZxLvmQAdH7tJec6vOJEspN/l9m+h/+yGUD99D0SqMMOevKu3owbuIyJb7xDXHrvc9qxRj/9lcSB8eE+vhJCqJZ/fOThqisln/cRJ7NS04E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qZZzQQbv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so69602335e9.2
        for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398549; x=1746003349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLH1JzvSTREU0y50Cn9mOsy4ychR1nU69CWKH2jYQrU=;
        b=qZZzQQbvH9DE2piWzb/ms1wcmd6v13mbyQbUhqxkj9wuvGNBI48Dw9XhbVTCNCfyor
         ug2kSvPxN847qVGnGyaXscavNuy8fBT5/EZUrh8KNaDJb8hkevfQTnHgwTDYe2i97bzJ
         scj1j3A9BvQShn5JoD8oYe1LADpZurK1aOia4Z7KjCPbyy1T3X9w0aB+L6cjLYYc00vU
         b7WoUOlYfissbXb+3l+PwjvBAitTmEFDzF1bwxz480gSLy1myhYzkmd4FwUwVloPWBEg
         kw3Q09cDANy1ZTP4Xd9uFOfxc0GDDlmm8B1UVn6FuYRLjEPhjPuXmUV05kPGEX8KG284
         8b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398549; x=1746003349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLH1JzvSTREU0y50Cn9mOsy4ychR1nU69CWKH2jYQrU=;
        b=GUZHUS8HRdVYbWiiy15b+L7UWhhAhVANLA7T+Wgf5g7zduKBp8D8MK/JvcnA6UHGor
         fqLedxCQde7KNDvMrDQZ/PYNfCdPL2Rd8hFNeCShmI/fgCzEulAq72SVmYmWcH5li4cd
         AMAhGhLY/1DZz+S7/K2BorAyZbNyZFkqWYcGE9zv56wWW9Gz0VskzGSuoIjoA8bYEmnv
         jFYPv0bQQvV+Z4DFrkDT4H2ZlMMFZy8hmmWTF+ysq8O73AvMYPOg+EjqhbJVWxmwaD22
         V0M60pA9Syz6uYEz2Plm83wBK3EJ5GqdUb0WpUElWJJhr3UBdg0BRQVmh+uyVQiHm/0n
         VqYA==
X-Gm-Message-State: AOJu0Yz3ogTSB0nklr7iuRnqCGnFKYpeE5qrSlaxoPDujb7iSGhXlJBm
	gVpadhjvG9p66to64YUZjVyU7/mg4Vkx3qS65bUK0U9tES7IIHIUAcWStBZKBReNJKw7UHjOVfG
	un9Y=
X-Gm-Gg: ASbGnctruOuAbT13br+nmmf5f36ykcII0g4ofTHUaAKG3tnOK2WZfwh4GN68lbc+eIw
	1RL7crGvHdFyHjJNj034UpFw4PtgPA2A4AIki5XxhNLP7GfzVEHYIoqOvadmfO5u0YA7lSCWkSz
	TAXQDiibWYIJucJcUMo+6oDgpnEyANDSTjfKILmM3Aisf/mPKPDhGjNB6reM6dItL6+3Az+6Hu9
	r3YP7o2hGL+S6xEC30WKHcuBXsEsA9z3AcoEgcwb/gFMr6BcnIgVNaZIdtngLF1/MaJKRiRl0Sq
	Ss3i02wlV7eXewmqvHKLbe6cI+pZrfDwXg==
X-Google-Smtp-Source: AGHT+IH8W/feylzZF2EABZ3eDPTmlhzOnWG2w8VOJAxIzHJN0weLObZAJJfvcrFUvwlJ8eUSbPfqkg==
X-Received: by 2002:a05:600c:4e16:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4406ab67e6fmr156643165e9.5.1745398548675;
        Wed, 23 Apr 2025 01:55:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:39 +0200
Subject: [PATCH 1/6] hid: cp2112: destroy mutex on driver detach
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-1-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Klkz4iiObkBAesFhi0HB9u9IdBbnHegphVVUCmw+Oqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsRD2kA3kI6m5k7SF2QDveYPM6LDKcaZSt/k
 Z0NCj7PN3yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEQAKCRARpy6gFHHX
 csdBD/9dlawSVU79eVpqYmkVBPVCu7CJdNudzdR7AhtPo7+7ib8nN/WUj+5btoGFgD1zXgAjykc
 LnSBlPzImUk/2kr81kNbcRTGqQzD9ixUfAfOR6zCLWuyAout9cxOaJy7J62bysIrOGK81SCvcLw
 VLay9I4A4muuJOn1n46WIFXPBhD9n/31FpPQVlKwFVV+NjytYA6toDLfhG69iKQax0cviPfuvXJ
 DzzeOdQpZyiU1TEumfCqdq5F8O8nVOPv3y9Ggfjkvvv73F4rQb6Ib+NbJnXoLBUlM1/tkC21nu1
 FHMvHkirhRcaJBHKJ0o+afxYfpaqDQzZ1mCTjso7qyREzh9V+TFlcuDN/8NPqtgnsDPUlFJfXn1
 vFyF4uYvVDfTlCDryXGjgqzE/iuoIS7WTHXBaAnJEuMk4v3WT2FoSERFt2aePQtgTe1gtcwnKFA
 NrwjqKJIJvNjnPWTvxtcRLxDy8wfcqs5F6fHHEKeyRdcSdNxuhWaFZ2mJkpIYAdEtuLwwHH+RI8
 axl5OJ5hBfwJraP58lPtJVxG5rpMXMiHBbhARaVqpR+Qo62ozgjSDI+Ne1vEAlfJFZ/Wb26zlcv
 oRic6rvN5xIdGVW54vE5xHOeovhxTe2CkWIE8t1/ETnLh9b4Qvgfh4loopwmBdVssiKMzga5XRh
 aq1RaoH1l023BKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the devres variant of mutex_init() in order to free resources
allocated with mutex debugging enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index f4c8d981aa0a..a001b9acd2d4 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -22,6 +22,7 @@
 #include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/nls.h>
 #include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
@@ -1205,7 +1206,11 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (!dev->in_out_buffer)
 		return -ENOMEM;
 
-	mutex_init(&dev->lock);
+	ret = devm_mutex_init(&hdev->dev, &dev->lock);
+	if (ret) {
+		hid_err(hdev, "mutex init failed\n");
+		return ret;
+	}
 
 	ret = hid_parse(hdev);
 	if (ret) {

-- 
2.45.2



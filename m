Return-Path: <linux-input+bounces-9427-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1153A185E7
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A9B188B9B6
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C505D1F76BB;
	Tue, 21 Jan 2025 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC7/wyUV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F71F707F;
	Tue, 21 Jan 2025 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737489634; cv=none; b=s+eGPuMBQkgH1RVftJsrFmjJslLwSQuGXhSsK92MMhcX6WuQKzAnFV/RWboHdOLIIjfrynsT4j4/DH7mGkpYPKNS8aNPuKxoPwfjxyj353Oi4bFfvd8Fl2FosMMg0vNPYM2cjemVOgLDXALdhrkWFQa0JQb57+jOjYYli1fsZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737489634; c=relaxed/simple;
	bh=4kizRe2rgXySp8A1jCGinFKGSl5lHwSo1HF/xS0Okwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPsbM8HVSVPHm7KGwC2tkwk0D3tNHHst3ARmwVlkMB4X9zXzm0F+KzfIU5PA3zJuudagpiL0VsdFzV0URhCNziNh5DKyctzDLLlOExK2Hq9VKM9mpu2/8LDFPhLdpplf6J77TwH4OqluA1kiha8RCmoAQsb5Y2blYaDrZITqZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC7/wyUV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso43930345e9.2;
        Tue, 21 Jan 2025 12:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737489630; x=1738094430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BQt4u1Y3GeikF9g8y57XTCh9Gzrta3TPR2hq1BQ24g=;
        b=BC7/wyUVBpERzesWOU4JBv1Zr4f3h0hMkuVH/u8PbGW0gyMeIhZEHN7deAxmuiq6eK
         4QP/klsXr/STeaPrRH0KTYMchJ3joAIFfrufRJWieEno32AcwBNkKpJUSfb3zXN2dv44
         etlKJmFrsfB24ncmhXN7vAHrZtWTdKphcCb6os4ShnFSHg6fnrFn7zs/KPxgo7h/841U
         OO40jcTaq3jZNZSDQ9lS5IHcXxiipfHDxWRGR5qxU7bpniiYqHXGUOlPyhlQQuUqTSjk
         +qZrpcHGUvTQF3XH4oFddOs6HmKD8Vcc7HPBd9YwphxZHqd5iZ01X34Sq223I4VCafP4
         IqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737489630; x=1738094430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BQt4u1Y3GeikF9g8y57XTCh9Gzrta3TPR2hq1BQ24g=;
        b=UOuxoQWpvR3r2caPGUMO2bA2FtdlGhxshu78wTA9ADX4+uty27bdUzugPmNQFxWizs
         UWxnX+r8lX1EFukPI0QHxMmbK/iPaSeSY1BWsnCuN7jCxBG6wgwC7SQJuMbkwKGZLfQh
         CY5PC4AJ/tdqNCfh1/w9yv5BBTogoyh3Y/OSs1Bu087VkBFs8nm4TutQGf79C7FmN9Bk
         Mdd/aE61EIJsUoQvjVwgUrVWGm/4aaYy+YJep9w3EjgcYW/tJ57Unr5sJvOAeyy1+y5e
         bG9BINqZJrKrL5lVopaGEyyeCur+C8Et1/pqj5u+QdFx+RxbatOcP+toTDqnEWwDvDmx
         ypYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB+mQli3FxLZ6XHsMdFM8Qswq/64zui8IfGKxJypOUvf5ozIAHr2iPHBivSn+3tSiTha3Onns=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa+0zbfVbAT80eDOrigEMxo69apt1VM+SLnWDDpaJ9mPj7b7Cw
	TbUzD1KiqfOAzqDsmaFoZ82mvXrQOMhekmCyGQHq4lJ8JmD6Gpb33XvdB3gG
X-Gm-Gg: ASbGncseymvbE+AXIbrPhiweYlvYS7yChC0T0ERv04JT0ipJrmgq4kWHqdNomTJce7V
	YfOIACZHFcroRKIlfusFo5R+p7/eiUlstNYh7DTXe4R0GdP4LqnJOmBbxoN/dhaBIG99WMEMqkp
	JrccP6rBNSLrOFJrrlyNF5WFTuVZtezyh9k+TMgQuqRlR/mMOFpA3erdRcE/044HewfERmTULYn
	mkJgzmpVIc8avAdxQDZh1SF5wj7FFpFN5dUTvh0n4099kGQbdFbNepawPUTjmAkyVbOseYQ4QOF
	oo+DDBY6SiZ5rMR28A==
X-Google-Smtp-Source: AGHT+IHPiKuUNeHZz5XZ8lEdQrC0/wbhc1G+3Fo1l8UhrAQPh2eWw8N4VZmW7twvCncAJLXPU3yAnw==
X-Received: by 2002:adf:f811:0:b0:385:e3c5:61ae with SMTP id ffacd0b85a97d-38bf56785f2mr14944300f8f.31.1737489629444;
        Tue, 21 Jan 2025 12:00:29 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221761sm14118153f8f.22.2025.01.21.12.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 12:00:28 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	stuart.a.hayhurst@gmail.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	kangyan91@outlook.com,
	yue sun <samsun1006219@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] HID: corsair-void: Add missing delayed work cancel for headset status
Date: Tue, 21 Jan 2025 20:00:07 +0000
Message-ID: <20250121200017.33966-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
References: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cancel_delayed_work_sync() call was missed, causing a use-after-free
in corsair_void_remove().

Reported-by: yan kang <kangyan91@outlook.com>
Reported-by: yue sun <samsun1006219@gmail.com>
Closes: https://lore.kernel.org/all/SY8P300MB042106286A2536707D2FB736A1E42@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM/
Closes: https://lore.kernel.org/all/SY8P300MB0421872E0AE934C9616FA61EA1E42@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM/

Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 drivers/hid/hid-corsair-void.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 6ece56b850fc..bd8f3d849b58 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -726,6 +726,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
-- 
2.47.1



Return-Path: <linux-input+bounces-6935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FEE98BAA8
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9FA1F21F35
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C451BF329;
	Tue,  1 Oct 2024 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcQLrre7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059E19D88A;
	Tue,  1 Oct 2024 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727780963; cv=none; b=aQAiphPIXKRgMp8SPy4lcFFt2SXrnlQYcq49bmQ5x6787VPe910poG5nspQ5U49u85ZjmZUPhuS37oo2heIP2EmulnGxdVvIg3V6r2guTKyMEM+TEhIf0A5FuDowp32x1aOX1EIKRtfMgj7U0Ly3hqUKeR2jKLaEKWgobQ0Trhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727780963; c=relaxed/simple;
	bh=YWLTxky4/h9lM2mpAYr+jI3soLUkuHq/QDdRl4ockAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NOBAxDETwWEj2BXaGxDzz9ViWAwKBoeBK5OnSrC9A3fgwHtwJnJpl89ZwVK9Vjck8gYAMswQI7VNIUHttEn0yxLUQ+7LqeH/GB2VCQfG7gkhYAlWp4kXAb5A176k6syyrs/S5WBeUSSEmO0V28aj3GxW7qC1AIy082vxBSiDPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcQLrre7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso49062475e9.2;
        Tue, 01 Oct 2024 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727780960; x=1728385760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+x9SKPJX3DcVrvdJjWBMK19Yt1mGBPErHzHg5HPpKGA=;
        b=OcQLrre7A6s7Q44pCm4bmLnjDrQOy/GJCdovjmSs/i1Uk0a2WLJxubC7DG6jX1q3xo
         uieMl0OP1Pd++dJmYizyJfDYCfAbqrclHVoootG8m0ggyPq2mOjhxqw6JVpevU/bSxAy
         sV32yr9MwnrwY/iK77ZXP+BTV1FeqV5A1lIVkgnhA5O5PAc/dpnIgXqpBxREt6tbTOXx
         wr9X3Mzd8aYDD739111pWBAyxHqCN/tyMUzF/5H0J0iAuHx12XeH1glWOK7M177OZpcq
         7Pca02N3qiAKBfDTG7eW0oosWuMQ2ox3Tn1RTVUeqLm7KbIMpqM365St83dMsVZWO2Q4
         Y+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727780960; x=1728385760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x9SKPJX3DcVrvdJjWBMK19Yt1mGBPErHzHg5HPpKGA=;
        b=X8FjGghOnfz4nDEAaZYMg1gOCKWYg6oRgHhLs+9z12n9m/iYnI8cMGMMvm5kAaZnMZ
         lcSmG8ACm3S44o3QsbcdHTJTseo6ZmEBbK7EVMtW8xB84XAj9LGqXRbQ596cwXWEq718
         zjhcef7JTbBLBeMkNp3MeJYQnxYAQdfIBe2D5oSAbqIEd89xUXi6Fs4Y3WQ3Rh+LHdTi
         Cai87Si9FQPwrlTaGa+oVSeFggZc3R+szG+rSAXLMnf/nY0gczdqRGMLVAkdnpF9TDI5
         z005iaymHQcXURfcwMImGZFhUaAOyqwUqVy+8DsYSlceskr4+joeEbvA3y2+OjOhok2F
         gZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWtRaHVsmIBvYwYevmc1L06rChuTJb9w3RWG9vTfmLSq+zqOsfcZd55+JyPMnC7vv5tD9yWE1KU6zdSJP1X@vger.kernel.org, AJvYcCXeXoulhRw7mKC/kSDWnPsIFhQ1eZscCF1s0lpw+NlWeB0kmsn6o9jZsrfFssWGol64iZKpqxw86b1dMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEY4iNpHCErVuH/yoj+ZvEVNs4f8efGw7z/UJ3n3KXJvieKeT
	huNXYtTlvnt7R7NEh79d8WpFa2TEfZNtZAruYdvPuEgOJMWbB++H
X-Google-Smtp-Source: AGHT+IGadcMbPDxxanomtnDQ/+3DjZeiNeqp/R+o2NRzYJcuKQlFUW0YPV7sLNcxX0JzR8KY/7NGhQ==
X-Received: by 2002:a5d:688a:0:b0:37c:c5b6:ec11 with SMTP id ffacd0b85a97d-37cd5ad0e89mr9666813f8f.39.1727780960126;
        Tue, 01 Oct 2024 04:09:20 -0700 (PDT)
Received: from alessandro-pc.station (net-2-44-101-4.cust.vodafonedsl.it. [2.44.101.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e48fsm11414394f8f.39.2024.10.01.04.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:09:19 -0700 (PDT)
From: Alessandro Zanni <alessandro.zanni87@gmail.com>
To: dmitry.torokhov@gmail.com,
	erick.archer@outlook.com,
	zhoubinbin@loongson.cn,
	jay_lee@pixart.com,
	jon_xie@pixart.com
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: [PATCH] input: psmouse: Add unlock mutex before to exit psmouse_attr_set_protocol
Date: Tue,  1 Oct 2024 13:08:38 +0200
Message-ID: <20241001110839.44762-1-alessandro.zanni87@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In error handling code for "no such device" or memory already used,
release the mutex before to return.

Found with Coccinelle static analisys tool,
script: https://coccinelle.gitlabpages.inria.fr/website/rules/mut.cocci

Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
---
 drivers/input/mouse/psmouse-base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 5a4defe9cf32..cb3a125d8d7c 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1930,11 +1930,13 @@ static ssize_t psmouse_attr_set_protocol(struct psmouse *psmouse, void *data, co
 
 		if (serio->drv != &psmouse_drv) {
 			input_free_device(new_dev);
+			mutex_unlock(&psmouse_mutex);
 			return -ENODEV;
 		}
 
 		if (psmouse->protocol == proto) {
 			input_free_device(new_dev);
+			mutex_unlock(&psmouse_mutex);
 			return count; /* switched by other thread */
 		}
 	}
-- 
2.43.0



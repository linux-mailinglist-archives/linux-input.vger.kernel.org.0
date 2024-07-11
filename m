Return-Path: <linux-input+bounces-4978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B392EDB7
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2B5283253
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACBE16DC13;
	Thu, 11 Jul 2024 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBwyQwjb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCB15ECCA;
	Thu, 11 Jul 2024 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718852; cv=none; b=dTwZci87Tcq8a7lF67ukCsthQlyn+z4G0G6YQNcEgk3KwfOJJUmPqX06e7bMp3yahdyh+98myduXtzXhF9bO7BSlEYJhvezkPmtj+g/ZmA6w0/qXO4Am3ZnTQm+OU65ed1bW1bTjQlsoH4B2N5s0Oa7Zcf2JIRsILhwsma35DTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718852; c=relaxed/simple;
	bh=WpUZ4910FAKCZbHx5BKBePk11aG3Y1+CuAT+yvV1tTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcvdBhXP91wOgw8xqJvd8lV2sJYXHADScprGcvWXCVKEoN4Ku8g6QpKWYB5/9HFiwaJhKjOiOG/5YoNaVwibcCqBAWLrI/X2Nt65nB6Bt4ULj74gqD++oRBYy1qfhIOZAugpbcSY6U6VWigM9iVuutpAlQabBjes4ABKpdBiP8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBwyQwjb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb4a332622so6981855ad.2;
        Thu, 11 Jul 2024 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718850; x=1721323650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDdRinobJraWOj70a5x24jnbjy/LGvPgJQQBc3lXSlk=;
        b=LBwyQwjbz59BsmgIw/WKfHH+Fa9MYnll7oJDO4N58cFqk6eJVW0espuxouUy1lYvC2
         j3YId1wWRNNaRubdCLpksDgFxCTRSjnm1J57fPQ8/hwIp9LJ0hRIPvm25H0Lf6YI+YPp
         YqVRHZwnWb3zP+z2q1Qg5krMZOD/crXfVAx4zCcKrE+j62lT2TD9RySl1A63IEH3NFF3
         sbam+CFnPjuieVo0PYzMfgBxbutMz9xDOhD09OHUeS+bzmQaG/5REFasYyJLx8tINN+h
         kZHiw9PqFczayl8qFrRqDTV+sIB/pMrwsfyanpwvNI68ig/Wjd+za7mkbnDjJ+XjqgOq
         c8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718850; x=1721323650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDdRinobJraWOj70a5x24jnbjy/LGvPgJQQBc3lXSlk=;
        b=UECSrZMjQzOlzCTdq2nWoTmpB8ac+KJ5jJoRI2Vy08KQKcsiDkHSz/MqkI5BpX2XzL
         VYOjhjltksENxiDcFyqQs9JJu19DfFsnnvJUzkhQBkoh9nHtjFhRDpAMJh0HCXp5Yy2U
         FXVIB1VI2QdoJsqcDrk4l1uAhB88UlFC3XoErxuuom7bC/rHSx/at8ylS2bXME/2H7Qi
         PmYWUpFdzKQHv/OMhX8SFhQeHbKSfxbBlablx6sSRuFox/5Ffey494LfLl2G8dkAqxKr
         8Fv2i3iICYAJa40Wc7SJ/F0TeWWyHWQifipWX6FNzKyWb1gJPm5sJoAt6sxaEQDB9/a0
         JCxw==
X-Gm-Message-State: AOJu0YyG80BWdjxGG13ImOWp6wcmjD+9TvrDDmUtEEhEeBQzov38Akur
	PTJMC7IFvbJ1zX8YEwuBZa7GpfHkv9IsMjoojABEfI4bLxM/H6qBGFad/Q==
X-Google-Smtp-Source: AGHT+IFZWm8ly54xvFNUuXX4lAEG19DGbsHPbEj9X/NenbaT9aM8VulqguSxGafjOmyfqKhv/hHapA==
X-Received: by 2002:a17:902:e745:b0:1fb:19d1:707 with SMTP id d9443c01a7336-1fbb6d2519amr80738875ad.11.1720718850147;
        Thu, 11 Jul 2024 10:27:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] Input: tsc2004/5 - do not hard code interrupt trigger
Date: Thu, 11 Jul 2024 10:27:13 -0700
Message-ID: <20240711172719.1248373-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of hard-coding interrupt trigger rely on ACPI/DT/board code
to set it up appropriately.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc200x-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 39789a27f65b..cd539a2a1dd5 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -542,10 +542,8 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 	/* Ensure the touchscreen is off */
 	tsc200x_stop_scan(ts);
 
-	error = devm_request_threaded_irq(dev, irq, NULL,
-					  tsc200x_irq_thread,
-					  IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					  "tsc200x", ts);
+	error = devm_request_threaded_irq(dev, irq, NULL, tsc200x_irq_thread,
+					  IRQF_ONESHOT, "tsc200x", ts);
 	if (error) {
 		dev_err(dev, "Failed to request irq, err: %d\n", error);
 		return error;
-- 
2.45.2.993.g49e7a77208-goog



Return-Path: <linux-input+bounces-11442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6DA7748A
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 08:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681C616AE16
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 06:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4E31D63F7;
	Tue,  1 Apr 2025 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf+KqDdv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8032AF14;
	Tue,  1 Apr 2025 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489127; cv=none; b=e0YORsyCRKfKqFJTA3Qp90ymZGc5V+3ldc5uqvGdmnb5GPhxJGg4kQlEwOomS5S6ZXxmsqc1QezGeOCvXm/tpjnr6URX51/ifyUGtuwQOoLOFfX2BAvGwwvTbvTg+dPPiwKOB0CXXYCP/szfujB/oqi0hlNli9N8URsYa+UgIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489127; c=relaxed/simple;
	bh=BDxF424ruMiZKsGkmqb60vQyLRBj+6kdl6qq3sR8Hgg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pf8jJhL+SsJKi/kIVpoX/5IGo4kwHmNPi0DUYIOMtnGsnqlenBRpYMi3PSMbmI+04Bnxfq3h/+SSrCHKipCGXyFKQrTDVyRZTg1MsQUt45HZR0cX5oB5NyRkRvGeOADsym3sjqX2Qb7X52uqd4oEprWuYiNNRqwWpVvL0/dNRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf+KqDdv; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2295d78b45cso9301955ad.0;
        Mon, 31 Mar 2025 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743489125; x=1744093925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGw7xyNBu03x37lDi5ltAIq1oMX8Xxz184y1gqG3/+Y=;
        b=Yf+KqDdvtGhtPzCirnM55MIAmI87SdsdIxlzi7KW2G2zfuAV1GDijdNkP6g3soew8S
         QMAraQxclgHXObHdIlHVe4nCHoB7r2L7t0zESK8Mck0VQe2R9UfJTPIwprZ7SBeEq6RN
         5QH7SfThzwWJdtyBsV3bn8tB+n6pvEjJuHsTxeAWbnGHpFOk6g2rCIZlosdmIvQ5sLgg
         KJGeol8SNpKOKNSOign52hCaXoxrpzV6bb7PRShJ+C11aVlDwA5o9X9Q0rUqmUQjslAK
         7856xYOfcxMlEJDZY17DlHP/Sp1OB3poTzDIziOX8cyGupilaaVXsTS+l0q80kCTnhe2
         NPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489125; x=1744093925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGw7xyNBu03x37lDi5ltAIq1oMX8Xxz184y1gqG3/+Y=;
        b=Iog9ANoCBphbVo8frTP4OhY1oWInarymuHouS+SVjPrXLVn7WuX3ASahxaAya2d/Jf
         bmyTfaqLj22GHpsx5g2f/RxM1pVd1KjrODgvWXqZt5RAabmsVH3ngJZWqXg1xUrkouPQ
         /1yGQEMy9PG85k7eCG6hzaK91hF3QO8o0irLYrRJhg4ZO0hf1uWOGyX1t7R2pvGWed93
         vzS3t6f2exruqmTPC4LpDaGxYHdMSJ9lq6Nqh1c15kgHm4cyb4z5wgURhImNVzj8xioc
         UYAj9gOKF1Y+JTwQyNZkLrlsNYJzkIB0lO1NhX/nIs0OwGdaufkabAgEpAqth9xKWroJ
         HUBg==
X-Forwarded-Encrypted: i=1; AJvYcCXva2+EPPjP1WT2QgpXF7cqadlmrY/Psa0gOOZtyCBChIJ6y+slNJ7titxZM+31I4TfCe1bh1ialtY1R/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQWPYilpjKLHQnU43Ybv4oZaeMTZmNGX2Wa4QT7BymbTeh/Ym
	BK1/tsyvC5beG4o7w6VYNnQ6SrDdAgyXEDg3JsRaiskPptoaX7Q8pTi6HD8WUapllg==
X-Gm-Gg: ASbGncs0ZQmJxrQGuMc5wCOuHP4/NXGnobgEIiE6lnfNuvlnG8BJJwuK8JxY+Md7wRq
	4fRPflOHsJaDQVwkgRwBLv2nAnAr8KSF0n0eamBa+RedcikY75VqZ/BkX43p/3dOuSdRYsiLuue
	kr2YKsRrPovtN7u5TkowBNYCUb/qGh5eOoDAbovSxhpBUhy31wTzFEJGjh04oBZRkmvgY1jpkSc
	Xlqm4MS9lxPs5MYNWJ+xm7EGutavKGoeLviEMo7Tbw5rL+VAfzq8S4UpPlZNahHIu3XQBsqjmLl
	VlbjelhQuWWlt0qoD8zrJeOhjsBBrI6g0iNzLc2RXCJcRgVGIbr0C5NqyAdS5Cspss+bJGU=
X-Google-Smtp-Source: AGHT+IGJZEoqdwoeD23IjdthzmCGqvPXU4bgqGnajntJb6l7Akmfn++TOcm98QTRwEuaNF9iCAzftA==
X-Received: by 2002:a17:903:40cb:b0:220:be86:a421 with SMTP id d9443c01a7336-2292f9e521bmr216475685ad.38.1743489125268;
        Mon, 31 Mar 2025 23:32:05 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cec2fsm80478415ad.117.2025.03.31.23.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 23:32:04 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] HID: uclogic: Add NULL check in uclogic_input_configured
Date: Tue,  1 Apr 2025 14:31:57 +0800
Message-Id: <20250401063157.19655-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
uclogic_input_configured() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: dd613a4e45f8 ("HID: uclogic: Correct devm device reference for hidinput input_dev name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: 
Simplify the handing of the condition "suffix" with if/else suggested by
Markus. 
The current implementation (directly returning -ENOMEM) is reasonable because:
1. pen_input is just a cached pointer - no resources are allocated
2. evbit modification is a software-only configuration (hardware-independent)
3. No critical state needs rollback on memory allocation failure

 drivers/hid/hid-uclogic-core.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8008933c052..83625ec6a55a 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -118,35 +118,29 @@ static int uclogic_input_configured(struct hid_device *hdev,
 		}
 	}
 
-	if (!suffix) {
+	if (!suffix && hi->report->maxfield > 0) {
 		field = hi->report->field[0];
 
-		switch (field->application) {
-		case HID_GD_KEYBOARD:
+		if (field->application == HID_GD_KEYBOARD)
 			suffix = "Keyboard";
-			break;
-		case HID_GD_MOUSE:
+		else if (field->application == HID_GD_MOUSE)
 			suffix = "Mouse";
-			break;
-		case HID_GD_KEYPAD:
+		else if (field->application == HID_GD_KEYPAD)
 			suffix = "Pad";
-			break;
-		case HID_DG_PEN:
-		case HID_DG_DIGITIZER:
+		else if (field->application == HID_DG_PEN || field->application == HID_DG_DIGITIZER)
 			suffix = "Pen";
-			break;
-		case HID_CP_CONSUMER_CONTROL:
+		else if (field->application == HID_CP_CONSUMER_CONTROL)
 			suffix = "Consumer Control";
-			break;
-		case HID_GD_SYSTEM_CONTROL:
+		else if (field->application == HID_GD_SYSTEM_CONTROL)
 			suffix = "System Control";
-			break;
-		}
 	}
 
-	if (suffix)
+	if (suffix) {
 		hi->input->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						 "%s %s", hdev->name, suffix);
+		if (!hi->input->name)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.34.1



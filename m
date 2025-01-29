Return-Path: <linux-input+bounces-9619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C9A225C7
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EC781887195
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB111E9B00;
	Wed, 29 Jan 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqV+Byex"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CD1E7C2B;
	Wed, 29 Jan 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186203; cv=none; b=XGxHtqGYAVJlgttVzx1dv0El6e8jh6gGzMMcZCzNpObmKZ5F7e1EIBAEqz4nDPa3hl//By9LhDfxo1MtXIO6TtgdO2+rzO8QETjwZ6mzbOmguI83Dakn7xXeL51+B+hOY1lrhnbFChAQNdGpvFlA6YBoBnBuXiO2BbwtiUKdP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186203; c=relaxed/simple;
	bh=GgTvt0ZZFiWPJ+SrWBbsAPbjXKJXIS5uvyEeV/lNuVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULJSZ974EULFaLrFkV/j0mjVF7JiEaxlBK2sOiNtKvE0ED9KxuVH2jD53inOiQVXVPf9+mPe0wDdoFIyzAXlR8putypkZ+/B7y35nFism8aiPCAP893vsmZbrOffn1+wRK/aPPIRUx7IK7G5T3iSUaYXS3SEMrl1mr/HIEjJXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqV+Byex; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3c3e38d0so15160e87.3;
        Wed, 29 Jan 2025 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186200; x=1738791000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NLwULoE/xqSyQwC2UHRGTkQougCNUUqGiWkxil31jc=;
        b=cqV+Byexjn+ixpqtpLoKmKp5b5KG2uL62jMfy4SkC2WMAsLKYPDaqn7cPaEpegr9Ip
         b1YPcYv+8OMd8EbSGhHrHLHsYP1JKynI3eNiyWR5zekoQeXB2ktRASA3oD7veFT/VNHO
         GzpGcf2C0sVY9iaxvgmnZrdHsfVCNidN2qzHeMDytFcLXv375jwDhsfoOytJZvw+FduI
         jkLKbzL8jhIUiRZTHRMxFRmdLjHMRpX3exmwRmYA3fBFlMpzK1lC44EUBhIWleJCtw5z
         9rlVMaVbM4KdP7Y5h2SE8HnDsVyKh7yL8O+oI4VB+5Y1ZkY3kL29/c7pQb2gZKRQNsTG
         yCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186200; x=1738791000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NLwULoE/xqSyQwC2UHRGTkQougCNUUqGiWkxil31jc=;
        b=hB1KCai/5H2kcDgE+u8/hqYPeKzN43RZ5Glh0RKJGMHsgNqvez6sAFcgCJIYTsgYLh
         WMFkqwW3MHlcfqH4p7OTME0lpV7yE4pN8HlEqMaD1jgKnHTrT0b9T4pGj/9reUSEIeqE
         DrIQj/bWBGfIC2RrCIYsIEA+q47IiKs210+OZf94sQp8BSQq01pvP50t6UfaDquBbQus
         18gpiuLjow8GPtvePAnRanzeES1cb9vXCka3XXAW91rgpXDCYsqJc5MvGQWdbb4WmxHz
         qNI/k1sN/98r8tFMEGDdNwXqIw67a5Pwkmhzll7iKHVPgNM+ouFUS35gVB1GmgV0au9J
         D4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUp2j0qewCv8g3hIl7szW1xhuEARbsOWcPyrtJCfXJLXOfVi8XYRjRj5rS4m+lRHb6fPdbLz0PLIGae@vger.kernel.org, AJvYcCVmgJCoBuXR8pVJ7w2Y5gm0Eum2Su/XnzlHWmYJk0VwtWEzuNmUBR6mu4b2am8i2M23B2wxkkygKmv8KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5t7qK1hOlBH8Q2wjkNSA6bX1gYnBTZgNpISXQTr90LWiXIIu
	S80LBKNoXcEfdSUs/hVvSCGEZ+kxxqK+iQHLLnFMjiyqtNETT5wG
X-Gm-Gg: ASbGnctfrAmORoO8aZMYzWkJF6hRMS8QLklcoFD3TQC9HCUTBoWiy7PRN1gndf0OHu4
	U6cJmZeSFI/BYDw3pDgec2qcaGGO9mC3P5/tkWf5G9lY1gENyBNp54Qu+PAN1vkOVWrRAd2V3ww
	ruQpw4TQjJPesWpxYreZQmf148x8H1dvgpSfxnje7eNlEfSI6XKN5SmeftD3ojleKP3HCchuaWL
	M7AE3sfGPBAKfB8M8NOB13OfgRXuOqUasReNaoc48Jb56y0uABrULquPshqftKu+hXeaDlYCtQr
	tLY6O0ilok9Ke3njTbofmHDu+Hi6+kAjlGM6PScAFz4146ZWVrig9i2Fk1eaRg==
X-Google-Smtp-Source: AGHT+IFdtOV+HGFgxbHDwv7y0BFdtLGXgeZc1NDnvBW/7UD9aMQqea5lBQWNemNfu0cmXSVGKwFLNg==
X-Received: by 2002:a05:6512:3f20:b0:542:2990:5db6 with SMTP id 2adb3069b0e04-543e4ba667cmr616950e87.0.1738186199667;
        Wed, 29 Jan 2025 13:29:59 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:59 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 14/21] HID: pidff: Simplify pidff_upload_effect function
Date: Wed, 29 Jan 2025 22:29:28 +0100
Message-ID: <20250129212935.780998-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Merge a bit of code that reqeusts conditional effects upload.
Makes it clear, that effect handling should be identical for
SPRING, DAMPER, INERTIA and FRICTION.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 54 ++++++++++------------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 7db63d686c62..a8698593e432 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -770,48 +770,26 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 		break;
 
 	case FF_SPRING:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_SPRING]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
-	case FF_FRICTION:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_FRICTION]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
 	case FF_DAMPER:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_DAMPER]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
-		break;
-
 	case FF_INERTIA:
+	case FF_FRICTION:
 		if (!old) {
+			switch(effect->type) {
+			case FF_SPRING:
+				type_id = PID_SPRING;
+				break;
+			case FF_DAMPER:
+				type_id = PID_DAMPER;
+				break;
+			case FF_INERTIA:
+				type_id = PID_INERTIA;
+				break;
+			case FF_FRICTION:
+				type_id = PID_FRICTION;
+				break;
+			}
 			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_INERTIA]);
+					pidff->type_id[type_id]);
 			if (error)
 				return error;
 		}
-- 
2.48.1



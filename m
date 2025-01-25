Return-Path: <linux-input+bounces-9528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57682A1C378
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7444D1889A9E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60C7209663;
	Sat, 25 Jan 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXYg1kzC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A42080E1;
	Sat, 25 Jan 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809718; cv=none; b=ZVWnldgS7PYIStov3Y1a/j7TfxOrJAEYIVbRRmaPkVnkfZNWwEmktcg7OSFsM0UOKl942q3rypTS5Wr3kVxsM+qX9Lu7kHIg0/d6KdhaEu2MsrijvzLaOLV+QWFIxjMRu40dvn6fwNvVf5yNan9XYviDyO2b/DvMRB0lB1b8LAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809718; c=relaxed/simple;
	bh=77PSDrwLmmq4FWQbrc+YH5RAdDh5nE1TbHTRgCw3ejQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZLAzgrXVi+Dg0qLyugjuug4IPG938SiweP3Q0/CTw7UtxBJVHwNfyHfrBBOBgPArKXniQGVMS/tAPbN2h7URqRvAFAJp+YbnMFu29+TDxw28zZD+Qr8SMkGGU2L8GpSeT52cNX46lhJ2exq8ANFY/+6GZSTnK1jsf0knFRztBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXYg1kzC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5402ec870b4so448722e87.2;
        Sat, 25 Jan 2025 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809713; x=1738414513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eXjXRn/HZloxKfWmPvwvQzBKEFXRB7blnXKlca1NLg=;
        b=CXYg1kzCjz+SmkvpQmhw8rUAK6KHUwKwsvg5KpA5Cbax3tt45hud8Jv/eDubC3uRfP
         P+x1y5xb9fF9aBKQtctIC0eG3xbqkCPyznb3aG8ESs+yXFkZoz+3T5NqtVlh/3kd/9pY
         jDrVTZeocZle0AAZL9e7JSHWNYf3wBQnpHsaWZ4WMLCniclgElsw/wkcHapZROliM5VM
         e8m3n/rsIajXi2WlqDBTOAJetA4hZF+5EIHhBszYpB1Wl6THaeBFWET4X0yEh7NZXYxC
         mUTPI4od6NX45JaobcAyTwBKyxfWzBPdkdi23a1b534qjTD8y2aRjTqfQm8gz0o2fgeW
         JcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809713; x=1738414513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eXjXRn/HZloxKfWmPvwvQzBKEFXRB7blnXKlca1NLg=;
        b=iIQmTtQM07gN4y6T91id1z0LEK9MvuMcgghh6N/ai3H9hYiDsT8NgmwCm1IADbacIH
         QX4iGyImpjh/RcqyKA5zucBJNVh0xbGoSnQK74eCCjCFO6S1wO3ujVjT8h77wZv0kWRi
         jYx9+Ld/HljycihTyZ7rqOMHZgqr/kTxpwLpoo0ae9oUC9LQGnEGU2jpXmE1gllsbYs0
         yik+VLE7aAmiBHb6P6xxS0WjHhq4SAz5Hg5VmI4R1ek+9oTiL/qHxfEc4SrEki7w2+c5
         2oWI7zBUoXrre9xxb7quNkcR8aOA+05rTThsdA6JltSkds7CL83fQynRH3+ZTec41alt
         vbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2bfG14De/raXYYUWnj5IUPaqk8dWaocKWQht2zu0Al9pEqShxEJBRBx2QF8qFXolwAOjOXB6NB7rR@vger.kernel.org, AJvYcCUZZFHt9xMmirWRda2Yvy3Bsb/g2ayGVrPfBCRNo7RS+qfqpF+I7A/xIJ2WLju9qhKfSLqi/yADR5GzhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgh0iHwphQxyZsTG9yeT9voYxuEVJzAUMrSR8rj3UXTjTjVhzS
	Tb1HiJbg3umqrF8s3WTGYsFBZf/A4Xrq3dMwCBmvkCsMQ8lNu+ZC
X-Gm-Gg: ASbGncsAf/HX2iCwwAQzD1IuMd8APsg8u/0SgYdRHBNTbivHSVJAlWi7Ok7Yju2Urx8
	xdmfR6iuTRX1FcS9kCQUIWswClcDgqMwERvYvjpiUlRejeBLWhKJjRRHdzMlsjmn9dHnzZSAHzm
	anM//Vl6fX3mVul8l6rv2/05rGnrqUMqhUzJ+8+v6SyWfv4gDTl2qjIaUZ1IZQ27DbWKtSaZl+L
	zLDaEhKRAZIzK+aIn3NvqdqzE3Y3RVA7sMpmktIheQhi03bfRsqJcsnd2nUgOQZ3MV993H3yVOu
	0akOUel+R9QnKXQIi5ZJvJiHfRFQfSDATVmb1bKxyxYQgPo/PC0=
X-Google-Smtp-Source: AGHT+IEU0g9uVUM5QqmogXn0w45VpJrTZoEbVf0PIhL6+xyN3OwcdYqdh6WXlLKtiKON4ZSmOLlW8A==
X-Received: by 2002:a05:651c:b0f:b0:300:3a15:8f18 with SMTP id 38308e7fff4ca-307586034dcmr19545271fa.0.1737809712803;
        Sat, 25 Jan 2025 04:55:12 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:12 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 14/17] HID: pidff: Simplify pidff_upload_effect function
Date: Sat, 25 Jan 2025 13:54:36 +0100
Message-ID: <20250125125439.1428460-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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
---
 drivers/hid/usbhid/hid-pidff.c | 54 ++++++++++------------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 689bf516ec55..f6dc6db0b59e 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -771,48 +771,26 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
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



Return-Path: <linux-input+bounces-9550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB11A1C57A
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDA53A8D33
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A10E2080E3;
	Sat, 25 Jan 2025 22:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IabFdap8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6696A207E15;
	Sat, 25 Jan 2025 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843953; cv=none; b=OPStf94CmZ8QJaDSNDdL4OCyuKQM6HsmPPgCOJw1zrie7UQGAesbFJDgIfblO3b97Kn4ot33HDipneysSLnfphr3kIBIjm/ZPiTHW9TqbL/2rMfAzw4tIRscDYBMNY4bRPAynOtqhl8hBqfAciQwcZM6bqf7kNoZA4s3ZL6THG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843953; c=relaxed/simple;
	bh=77PSDrwLmmq4FWQbrc+YH5RAdDh5nE1TbHTRgCw3ejQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMWYLvs3DJLuEnxY3upDGDXdPLqBDdOTPMUm0lbzAF2vTPtdSBf7Ifk0SAKRZfn/Vh/k7eePvG3MHJwhOs9LfIFRawYwkFDWCqwB6A0ybpBKq8XHrlgHCsyK+e1s0s12rU3Qn6HkzT9wmrSMh3HKwbPj0dmAqi06fil0YuPvbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IabFdap8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab30614c1d6so61135866b.1;
        Sat, 25 Jan 2025 14:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843950; x=1738448750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eXjXRn/HZloxKfWmPvwvQzBKEFXRB7blnXKlca1NLg=;
        b=IabFdap8HdLjTGqaGpjfV/cNteXCklRb40KXbWSrZOitwSBGdIc7cfMBfiPG6EhI8Z
         G+jUu1Y/BLPSCj/c0tNiqIRDiehGrKL584rgTw28JXNA4C7L+ae2xsvBKQnIoRQmpGPx
         /WF2JumUbhTZYVeVFZILxyrn1Cmp5FvgAvYGAxZ7kMzzT04aVukHnfxYqLLnLrOwaFiw
         YaQgxc35Faava23OSu3HsMNnsVN4IAbev+Fm6/UQMCUdKgdfl05XlH22CAIZUN7cMVaA
         Kz01kSWJTWNVYrbnW4IMtUDJ5A6sCtq+S9s9mtgrIh8L6gPFG0bLqtHeHdLYLfQJ+dFk
         wE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843950; x=1738448750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eXjXRn/HZloxKfWmPvwvQzBKEFXRB7blnXKlca1NLg=;
        b=CjWlF/KOk15CadPr3e0XkNMydHJUESU3R+1s43Z6ya6Y5f0Sj3TQVZhzzjSFDAA5tC
         T+Ptu7dRndgOgSG807WLypVBjvF0t/vfvRv3Saxdw6igBK8rOyTTw3G43PS+oW4wqJGo
         nTNLidZJRF9rlKZj437iWtFFaUKhTbxz9xvD6bu7uenqPwbtKrX1/5P4I5QkFYOovweM
         T8mvE/66Tpfz93bkUX9umQcdkWmodf89uzitEJUEPg0JOpWF/7DBoVhdKM3Hzp93BAAx
         3i5B4pboUoCQ1TP9LWiV7xNz0FOnSwfzDY8eds/5ZZxanA/B7SbaC3n34jHbSbbmU3D6
         3VVA==
X-Forwarded-Encrypted: i=1; AJvYcCUtx4ouKOlmuNX22KC78Mzy7CFrFy+AXVYtS9yJ421pHwO4fgYZR05FKdQvS9EbVJB7r2Voo2ZM7lBLmg==@vger.kernel.org, AJvYcCXUaDUmPPlKo+gURgsIfTSN/ZpMN2IPB//AOw6gB00j/T8boo2eX1wDGe8V5jlNcOqYKShTaiS1mmwe@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLIErXVFRUJyNUlGq3XzbaI+UX4LN3EbAjRsA/qk1FaQndj02
	DRP6Sj6isQnEepsbT/rmaGJBWAEuO0kEGv6QvzptSbouBIg0LrLG
X-Gm-Gg: ASbGncvBQBipoKTrVI/5Nllx7Nn+8WEWmGYdIUCiJNPP5sskbKgHZ4n1kmvCNOwRZnA
	T26N5slFWuE2LNLiSG2xKn+Q0pX4qCgG4p/0Mur4YgZo0syc0gaAm9NZbiZh7JetWFGnWFkHYvH
	BQUxRHEXFwJZESzR+qPZvuocVepkJY339HnJz7xYc2xPWZ5f7Av26uyYoKoU6MX2gJX5LD0FNp7
	Q2B8NUlNknU/Zio2OMfGIR/HvP/o/qv8JiG1OPNno8CLgF9Df30vbUoMCSRp/bM1wx+HrSTSwvC
	5qtHLmNBbOFzJbl3y39DT4CO1RWi+xvaWRw3YerPennksY0HxnA=
X-Google-Smtp-Source: AGHT+IG0kIth/bfnOxkKTu/sp7T1xrIDdxcL+sdb83Pc0JsZSHbGlPWJ/NtGbfaaWyjNAjdUCsWg1w==
X-Received: by 2002:a17:907:7d92:b0:aae:c058:b8d5 with SMTP id a640c23a62f3a-ab651653889mr670144266b.10.1737843949517;
        Sat, 25 Jan 2025 14:25:49 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:49 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 14/17] HID: pidff: Simplify pidff_upload_effect function
Date: Sat, 25 Jan 2025 23:25:27 +0100
Message-ID: <20250125222530.45944-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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



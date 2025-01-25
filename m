Return-Path: <linux-input+bounces-9515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E59A1C35F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C661886362
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7DF2080FE;
	Sat, 25 Jan 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU8vLbbL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E271FC7C3;
	Sat, 25 Jan 2025 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809689; cv=none; b=OfzcPTBHfXmNBW9zR8B0d77B3SqXhaOfN5dxYhYqjfgM+zUwU2o1yOyAZQ2POQ9ooZR4lkka2Uz7AWOHyhXd7EgV6gfVsWtO7d4J6BFKA7o4YUDeyUrBKP9XLYAeZHLY72xowrq/fBaFEq8esINeZt4lgu4ngSJEDxEbLxzizn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809689; c=relaxed/simple;
	bh=DhKOlDN0J91JsCofHQMVQCBR/3u/HEqZUulpq4EyNyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o16RHTEewUfy3L3pFp7ijMekc/Bu2zPyzNMr4jG8nO6GK9P8reckzbkXi79mBLBWf+veNpGFDSnOwuvEjLeqVFivro3rKttXqJHIvAZIozR1+RJa1/XpVmgpszzB1w6pmb5bK7BrjFRQnhk4uqThspbyQtgbTCuUjDMvHXdlFDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU8vLbbL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-542aae6ef6aso500079e87.3;
        Sat, 25 Jan 2025 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809686; x=1738414486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssFFA6NC5w0PkH/hxlG/5x9jpkiDdQm3Ywo45Mto8CY=;
        b=FU8vLbbLAzQq1xIgsRaVHajfeMcA+/buFGIb7+xsbkXcQYJ0PJte7rSn3EYekpnAsx
         G0V8qYr7nyL9QZvILXsuAI/9JCvlerpU8Tl6Ki8GgoRCzC1EkuP4qwP6oEMsuOH1v1Gf
         JJpWWVe5dQP2TB9rXjiy0c8gX9yxPVySIByGBLhOZ+E3igLUvsqECUMMDR0kWD3OURjU
         a71j/7t14cG2PlnMDWuCUKqcBU+AvVDzif34CX/5EgRCGlnG28wc5DxQpdtfL0O6ZDlH
         wbogZm05MoF/hDokD3L/9NdLG4VaOcmULypd6wqbmFbGNNU8T6XyiGU+AATvOGu8lTpB
         wgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809686; x=1738414486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFFA6NC5w0PkH/hxlG/5x9jpkiDdQm3Ywo45Mto8CY=;
        b=ORDI42hx3rhCNMSwlvURqX4sS4yXdl1KVByM7+OHE1LsnKDiksK8zp4d2GloCU4X0s
         t+BZNJzrLLNVJLxCd6Cxy2gfBaCTNSuzodsF6hocRDe4cisV9i8qbcaMSVdaaGOwx88N
         0D5nj3Elj+53cvQEOGyGQuIqTPru6cxZJCdfLhXkkT6jTao/7XmEQ3WnLOVJcAhWlcfn
         PEpFrJbL6Ji7uKKEjIcfd8AZ8CDZgJcTRZyA4q3inlPm8J2Xu6VkFGZLp4xXHxdWHNiZ
         CQUwL00Kbdgota09YypCiv6dNHU53laKYbu8oGvZ+p12+JH7k3zfVnvSBy6MKuPmk4wR
         vzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMhtFj2G4Q//msjRbTvU7a2Jwfc4O6W5AWoqTT8PTGTgY9Umnd4WQThqUr0RZ7REqfY9TR5cSyBjJkEQ==@vger.kernel.org, AJvYcCWK6iOX04h+Amg+J4YeI7s3hTvpYHGwU364+pyXimDEi1jpdntvzfY25VWi9xxh1Z6+2lmpRicctAGb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xAPxRkX8YOJ3zkBPV8KOhJtv3tozvvjTu0tBitMI4/tMxdtb
	lfTCv4KjB4Ei/9IbcsqzUW/pwIYCvUNLi0OG/97NLAWqoWtvMkBH
X-Gm-Gg: ASbGncvSod7Id6HF/Vxo35HtBG/nAt1Wne4Wa4uxXEkRKRs9SUMr26cNYnLbf0Kzfi+
	Fk/1jUeYE3IIVDVlEG78glKqeGwpJo4TTAR37Ijmf7dEJkk7zpMzCtRCPKPiruLgS6lTNJvKLW8
	sHUB+40JOGXwj5MdHWmfu0eE7qNnWFr5WME1vGpRIxsDoSzUW0vO7JIKgYwGKP2dfSup0v/fEGz
	919Rxy6hcj19mWumvKzlDFWse0LTCTobdfVUoaD6HmwQjJS+HfQ7+pHlu0lr8FC1V5vFzd3nSHz
	S1xSGC4r//lKkrimDe8W0s1p/f8jHaz6tEGt5ETAQWJX47SBDpI=
X-Google-Smtp-Source: AGHT+IEmmvinTd5+6J9LDBzAgz82mIJ1VN6rMVsYWP7sIh1TdGPufRzM4/GIveS+P8DHRkFGbAcoGg==
X-Received: by 2002:a05:651c:b29:b0:300:17a3:7ae1 with SMTP id 38308e7fff4ca-3072cb3d847mr42345571fa.9.1737809685723;
        Sat, 25 Jan 2025 04:54:45 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:44 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 01/17] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Sat, 25 Jan 2025 13:54:23 +0100
Message-ID: <20250125125439.1428460-2-tomasz.pakula.oficjalny@gmail.com>
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

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..5fe4422bb5ba 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,6 +21,7 @@
 #include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
+#define	PID_INFINITE		0xffff
 
 /* Report usage table used to put reports into an array */
 
@@ -301,7 +302,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	/* Convert infinite length from Linux API (0)
+	   to PID standard (NULL) if needed */
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? PID_INFINITE : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.48.1



Return-Path: <linux-input+bounces-16509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B948CB0743
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 16:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7264A3011FB2
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 15:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A131D2DF70F;
	Tue,  9 Dec 2025 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PIKKl3Nz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EF28312F
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295237; cv=none; b=fGJ0slDXdTumcNs3Xi+S84xuSBzorVduEVwril5ra3zW0afWzSE8X3As2yJyJVVyDoXn4TmEC+bjZOr1WIcUCxU0AQKoxO7pA3RFSt/F/gESI8nrS5Ke18zmc+RdeYfB1C04pWIZzciXnX5p+OY+oHkEwmd5oI9h4z5izdi0CiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295237; c=relaxed/simple;
	bh=SSTQV71zhH+KAIMdkOHqBQujgdzOTQUnEVzh22O3y1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZauoVK7PL71uUZMK/aGrvvd3GI1mDUQzFmzZvIGKw9M/dQj203o2vc4ddibbajeZEP2ZZ6DVvOiKRmHtDglwkKHPpJ5sTjG/K+npCibsygELeYHkoxhplCz2MTsGeuQB55vt0Fps/AH+dz/b4julDHAR76QtoiNQOEpgRMfpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PIKKl3Nz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso3468635f8f.3
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295233; x=1765900033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nijc6TapEVx1m//kz19HJEsLmLHghSeoAA0KmTIDep4=;
        b=PIKKl3NzVKDO2FMPktMgbbAUdNwaqQ8UoCZG0i51h06VphZal9cZUpU1emRWgsCDAy
         p8QFtrN5QZx8xJUceqXZ0bFxa8es1vQnmavlnB7k3iwL4l1N5zc77Q5L+kgvovhVpYRH
         nP3TgdpsorSToG7ddMTv6cxjMyIkCTj3I798o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295233; x=1765900033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nijc6TapEVx1m//kz19HJEsLmLHghSeoAA0KmTIDep4=;
        b=uHg/NWmQieUjnoZwYj0jSUsbWkHbAfCRxiXjLfqFoLXehaznkwF5PLyiobijLkqGMB
         KUgLd90cbm1yhzu7TUcNGkG4kEZL0XiYXK0hRdI5tG/qVZgTHLLqLzE7mCFyDGRW/cCE
         xGZGcTG/UTy0zc67T2JIT0jOTv++7u6wUzk0GxqFGWFWbuE3ibPN6BqUs7Bn/ui60qlu
         h+RIdAsBocSK4yBx+kQ0M3jSslT7YAY1fxfVu/ZmmGH/RTpVifUa5ni2aMFUEczwWEW/
         IMgLMhaVMdyAATl4vmpALvsY/7qpFoi2G6/HX6GsEaAIPrd6kjSSNtAlFDZYTEAamIEz
         7vMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSkfR0iafkCQNABzTj+Q67dc8WzcBSCNdiwlxsHXCZDkv36dbpFJPPwTKrKEGxvjWXJBCOqfzVrjGlvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu3tiwTGZL2jtptIfHdoUFUM5Cx4+vksTPA+Dca8Qa6WN9V6CP
	pYRZbWWg8Up+K6JVvqB6+Z+EbIoPQRPNo1yBriD1Heh6eCbmqXVfD4hudWf7rQxT7g==
X-Gm-Gg: AY/fxX7sxR20xtt+tkqghAFFCmvPRwDtkB+Yj/VY6eje9DsBuarVzJbwWQPfoQAow2R
	KRLx5HMeY4TfRvFei4z9ku3ChmBBnVknkRZhGj4fJe0lNOZI7j15XgsNeY61rRQug9DRN4kKef/
	VYPGqg7KLKuy5hps7I9gM1uINP2Fm7DdA7WKmXOOW6dUDCOqYvxzBeveGFQ+FrLDXbUWa0EudAf
	f04Ek1nilVdWRDiYZq0VuYwc2m0SdRgQcf9g4OKcyCga/t0mLJFoozMUlX7RjiLdg6a/feRd5C0
	a8FfwTbmvBs82NpHGcyuy7loxGmeD0wQfR6Hhq98iv6frVBfByg4mw2krsBTWcocgEzeM08R0SU
	J4cfPFAykxxFcH59yg8P636Mlz+JP8lE9QNX3uDtFLyr6cblEhTiaXKWF/rJQymkx5y3osgm3jF
	x2FGtcpRRX6DuBRb8=
X-Google-Smtp-Source: AGHT+IFIwxIRvtKdP7oP+tHCC5AXu9N6uYSmNB+//1Ldk1GFkhn80JY7zzQCa3PkorTGapSGbkUsHA==
X-Received: by 2002:a05:6000:4027:b0:42b:3ed2:c079 with SMTP id ffacd0b85a97d-42f89f897dcmr11220121f8f.48.1765295232875;
        Tue, 09 Dec 2025 07:47:12 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:12 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error message
Date: Tue,  9 Dec 2025 15:47:04 +0000
Message-ID: <20251209154706.529784-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251209154706.529784-1-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword one of the key event error messages to clarify its meaning: it's
not necessarily an incomplete message, more of a mismatch length.
Clarify that and log the expected and received length too.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 drivers/input/keyboard/cros_ec_keyb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 1c6b0461dc35..2822c592880b 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -269,7 +269,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
 
 		if (ckdev->ec->event_size != ckdev->cols) {
 			dev_err(ckdev->dev,
-				"Discarded incomplete key matrix event.\n");
+				"Discarded key matrix event, unexpected length: %d != %d\n",
+				ckdev->ec->event_size, ckdev->cols);
 			return NOTIFY_OK;
 		}
 
-- 
2.52.0.223.gf5cc29aaa4-goog



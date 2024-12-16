Return-Path: <linux-input+bounces-8602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3F9F2DCB
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 11:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECC416774E
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 10:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A11203D6D;
	Mon, 16 Dec 2024 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cp3W37Tg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF3203D4E
	for <linux-input@vger.kernel.org>; Mon, 16 Dec 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343563; cv=none; b=jygiUKQpFGB8PyNcUnbo0LFnZv9qAhX/4s2TEW09oCk9dH4vBHtfF8jgvLr8GatRl+VEGyNThn6WTmO3z10Ecw3cfymIY3D6GdT5KqMHFaatR4kgxN3S6nzpLffz/vSDq0luirxgDbfk3CY8sg2E9wJv3SJTA5WVaQ+LzLBSoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343563; c=relaxed/simple;
	bh=gAPvOX9MA1RfnQEjldGIYfNXLHWHc8W6NhPyeulDtfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZTY/acqIsQvS9rByZHToD/NY6QnuVc4poidz8D6ycbjjOMkdocb8BxxDjsRad8aYw5CtIW0Edi7jpvcicxTrzzCmvj5Vvig30y8bYb9rpwsoLnCqWts1wNWnRus2z9SxGDgDBImsi89br4g+z9okHG7u9tvfJBzes1Rl4Zrwrtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cp3W37Tg; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467b955e288so16610761cf.1
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2024 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734343559; x=1734948359; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a54MOsy6E9jGa95QYlzvvh2hUV8d3jTYLCJlM0YtnOQ=;
        b=Cp3W37TgA9UC4md1hVjvpcDVQLXV09GVI+Ml4YPjFuGAn0DOUiXgUG3qj954nTnKHL
         yn+LpO83L1I3xqf65RJlkeoV5l0pPTQrQs1AsMRFtA73nBPnuYirL9xnaBqcBW6s9FBW
         OTp+7hag9XAD9zbwhRBzti7ltf3M1RTGyoz+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343559; x=1734948359;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a54MOsy6E9jGa95QYlzvvh2hUV8d3jTYLCJlM0YtnOQ=;
        b=XXYvgDAdxMUVrlaEEEfGVADqVKBWcRGgHHuevvCmQKye8+5qE9TQTtWwaaHNz4WpxC
         xnwmXJKMMQyZGxofmvcWmUGUIh5+J9ZASwnQZ/EjDP+UDLOflCZqYTUnWEd78CrIXoPG
         lcFK+x+9NQpOFP6068Dv5DJa/4/kDEwZ9U2TCAq8ivg7hjckEbJmn+0Hkv0hlXtPLwQE
         FlqlzCDSEu7IKJkcfxbHiTkZN2jixlVik88qsC4pxwtw1oskWtK+/aI9CtMkvNPlaaao
         HHct4qhR6Wan/TC7MD2AmmqYGCqMr21VrqbXwNo52HS1DQhmz+464gsTkPerr2S+2lc0
         1NUg==
X-Forwarded-Encrypted: i=1; AJvYcCWFWAbhzSSvmovGmiL4oe7G/Bpl6znYuwDHzFhLKzZr2obI98Jh/vkWUv0FX+AQi3Pjy8XrSMvtBwK7aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0z49++mJE5ljx6XgOK2oeMbpOqsfYO3+PoaQrcJaT7r9iYtOi
	9kVbRLRr3RmASUCfKMSy9WrVOCf+mUfRvt0zczCG2694NZoOKULIVE5PnPfs8w==
X-Gm-Gg: ASbGncu6rSMTfqHXqUrSwolBNHWBS6R5j3UjRyvyYNIucf2tBGIb2u0PWCzOz2agCgQ
	gP3DpgL1N91STLwqZUpi4Xk+tiMj+J4SZW69XA2LGYXcIbAJ8FaUd2OPcH5Sd84ZzPlI/9tqikW
	iFNUsPRes5dOkceBBFG8qIA7oP1MidxpahHcc7bQV8PXNiLQhSI+xJsZYtS3UQuB/+83XZD2ToN
	VtCdiXPwdcF/p+KCZlagwN836H2zacPGChcjuQ7MGraNwtf6jLk1+NMSW9HKAZLwvi9XFnoZmVp
	Br2hSDvbtzpv5Y/G0XEHGeapQaUls20=
X-Google-Smtp-Source: AGHT+IFteOIbUZklbNq6Lvzp47tpuTjAPTyYBZsHN//8HRk3Wlh7C8RoplzbksUacH4TArFOoBbnPQ==
X-Received: by 2002:ac8:7fc2:0:b0:466:a7d8:fd21 with SMTP id d75a77b69052e-467a57895d6mr229719981cf.24.1734343559722;
        Mon, 16 Dec 2024 02:05:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e81606sm26145561cf.71.2024.12.16.02.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 02:05:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 10:05:53 +0000
Subject: [PATCH v2] iio: hid-sensor-prox: Split difference from multiple
 channels
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-hid-sensor-v2-1-ff8c1959ec4a@chromium.org>
X-B4-Tracking: v=1; b=H4sIAID7X2cC/13MMQ7CMAyF4atUnjFKXKCEiXugDpC6jYc2yIEKV
 OXuhEosjL/l9y2QWIUTnKoFlGdJEqcStKnAh+s0MEpXGsjQzpKpsZcXBukw8ZSi4oHYusax70w
 NZXRXLh8reGlLB0mPqO/Vn+33+qP2/9Rs0aK7NUfX184TmbMPGkd5jtuoA7Q55w/oGslFrwAAA
 A==
To: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

When the driver was originally created, it was decided that
sampling_frequency and hysteresis would be shared_per_type instead
of shared_by_all (even though it is internally shared by all). Eg:
in_proximity_raw
in_proximity_sampling_frequency

When we introduced support for more channels, we continued with
shared_by_type which. Eg:
in_proximity0_raw
in_proximity1_raw
in_proximity_sampling_frequency
in_attention_raw
in_attention_sampling_frequency

Ideally we should change to shared_by_all, but it is not an option,
because the current naming has been a stablished ABI by now. Luckily we
can use separate instead. That will be more consistent:
in_proximity0_raw
in_proximity0_sampling_frequency
in_proximity1_raw
in_proximity1_sampling_frequency
in_attention_raw
in_attention_sampling_frequency

Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more channels")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Use separate
- Link to v1: https://lore.kernel.org/r/20241205-fix-hid-sensor-v1-1-9b789f39c220@chromium.org
---
 drivers/iio/light/hid-sensor-prox.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index c83acbd78275..71dcef3fbe57 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -49,9 +49,10 @@ static const u32 prox_sensitivity_addresses[] = {
 #define PROX_CHANNEL(_is_proximity, _channel) \
 	{\
 		.type = _is_proximity ? IIO_PROXIMITY : IIO_ATTENTION,\
-		.info_mask_separate = _is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
-				      BIT(IIO_CHAN_INFO_PROCESSED),\
-		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_OFFSET) |\
+		.info_mask_separate = \
+		(_is_proximity ? BIT(IIO_CHAN_INFO_RAW) :\
+				BIT(IIO_CHAN_INFO_PROCESSED)) |\
+		BIT(IIO_CHAN_INFO_OFFSET) |\
 		BIT(IIO_CHAN_INFO_SCALE) |\
 		BIT(IIO_CHAN_INFO_SAMP_FREQ) |\
 		BIT(IIO_CHAN_INFO_HYSTERESIS),\

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241203-fix-hid-sensor-62e1979ecd03

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



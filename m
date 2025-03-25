Return-Path: <linux-input+bounces-11258-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1EA708B0
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 038857A1CD4
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDA4265CA7;
	Tue, 25 Mar 2025 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuPTv9ju"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752C265634;
	Tue, 25 Mar 2025 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925725; cv=none; b=AdijrvaDxrwc6CgxWo06Tv5k1mpaMNrqNUrTqtoY2HdMDj2u8yPHiwpPpbXdLgfUMbYqwITo3TtYIVVV+/tNNWvxFKH2Vz4sx/PtIaeLOUZcIsYmxiKnZ4rspnFg0gTJpLjuj0C+inDW0EgI4Ua276yh81/iKgniX3be0Dg0eBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925725; c=relaxed/simple;
	bh=bXlLctPeVGlGJrqa34Jka5xzX/KIYnzZYX8+ZQ+432A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSenbI5lBg1aDbyvU4XtV7JBBA7dQkWzAiuKpyQ9QhvhhEs/gDB5UWsSEAOrGY4wG36eLuIqhZ6Lynf/Q3rsUjByM/zZM/6FjX9yk/2aSC+dC9QKPcYlKduGj1CqhNcGZiDIoBX4puXIIdytcG0FPg9qkVc78IebFwAGVL2yZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuPTv9ju; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so165967a91.1;
        Tue, 25 Mar 2025 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925724; x=1743530524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
        b=cuPTv9juDnRBMCkgwjhry9JY9+O/p76IqJYA2xYRcg6t0Bd8Ko/nKm1/VYDeTs1B46
         XuSVGjTLHT4UY4V/lVLcMXkzN5Fuis6FAujt8jx+SgO0YSr4pVZS5A1Sc/m7ktSa3AFd
         jAqGrWS7hAYD8u+fFSSDlj/yyW/EekAMn5RhTb811uD17S3zfmfJbuROc3h/xFqnRbl1
         AZs2XpqvdTzRoWd3TRc5/MOQKE+kWdYkv68JhyqeKTKstk0MG3FXbfpk5hf81q8DCi1a
         peGuSD/xAQcjhsB3JbMj7dkp2cr1HFT8qOZ+PEIY7Ku7G/jDGgdQ7qIBkOLTKIeX6g1z
         Pyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925724; x=1743530524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
        b=ZvTkiNWISjzi9O3oWFW1wcsdOqqJgQN8+t8iazI7U7Wb/lrTuU69zAsPWk0v+028QB
         4ZSBOP25EYGkHM/h08Q89tvwhOrv/AeNWn2tdZw32o/iAM9bkQCgPEuaNr2JBnPsysj9
         7D6Jg9W4NW5msQBH2WjTHzEpzLMTVqwRC3Sx88Kpnn3sy8PRY7U8NKRnqTwDYWv4Ca5d
         MMA8oNiPDJxv1TDcqaP6NlVnj1biLIFHAdWTjyoYnfohXJX+lJYZp8WfE+plFCApv34p
         rCgT/zR4icuMSc0KjO8I9cwQ633wm0CJvci7SKOzZOmUHkI2CiB0kP4QPHnoKWd3uicD
         rdbA==
X-Forwarded-Encrypted: i=1; AJvYcCUua+qJ4eEcpO5qBrB8vU+2bwdcNJE5Dv3BePqVt0rAAtmW6yq9UNgt1DJr6tF3xMrd1rUsb7gilZ1j0w==@vger.kernel.org, AJvYcCVtPmzgAyDOfho7hebe6WGxjLVxorgbQQez6yN+CaDZGcuFMkUF1+/sj3ZYf8bWy4XfKJqM0zT5BtJ1/CnZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp50Yp6M8PReBkrfOgczuedAPqqtL/wxeqQczmzJqsVxjUyBgk
	aBcixza1A6ID5F8+7FmUHZprt9bFbJB7w/VjfM4xpqWha4rxlQo+
X-Gm-Gg: ASbGncsC9DBFNVguFdcNla+ijiE1VJ4BCI/GgFkfPrByCRJI4xPFOxiWwiBpUUqbF5Y
	HfUoAs2wZb48zs/wmh0F8HdEYlfkSAAgPHUZTss8mpZlBeDP18q1fZiY33Iq5UfqPSptGeFgQGW
	mwVlLdptygIEkWvxldDvo2DLVYNwR7JcN2t8okXqQDsbYNLZhv1MVdB1LWebLbaM3Cs2OQkv+Ra
	44tUI8mji0ZTnkm8K1vafPV27tmdjwIePhzCDdBpLu91XJle/jDvtRNUSbRlM1HyOjWhfeTbOU4
	DnatsDLb+xc0LRZoh/N0yJIQJAHr93vGcA3YvLINE71MFMWXXH3XjLufna3JbQQkUyH92MPKOpe
	42V/umXE4EhmQhmaDbdtBrXEzMiHpUbg3r2wNmCcnY4aLRQ==
X-Google-Smtp-Source: AGHT+IEiFvFw4D/a5soxqv1PGPlvrEOlGJ9JeiZQG9DpoC+ZIYhXUPhni4dvm0wC6XSesiHNMEOinQ==
X-Received: by 2002:a17:90a:d64d:b0:2fe:b907:5e5a with SMTP id 98e67ed59e1d1-303788f3c79mr1067896a91.10.1742925722113;
        Tue, 25 Mar 2025 11:02:02 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:02:01 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] HID: multitouch: specify that Apple Touch Bar is direct
Date: Tue, 25 Mar 2025 17:57:27 +0000
Message-ID: <20250325180138.15113-5-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325180138.15113-1-gargaditya08@live.com>
References: <20250325180138.15113-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bar, where
the application is HID_DG_TOUCHPAD even though this device is direct,
so add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index f7fe6aab8..66e33a482 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1349,6 +1349,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
 
+	/*
+	 * The application for Apple Touch Bars is HID_DG_TOUCHPAD,
+	 * but these devices are direct.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR)
+		app->mt_flags |= INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
-- 
2.49.0



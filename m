Return-Path: <linux-input+bounces-13568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53550B07BE6
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 19:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A24178ED6
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 17:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8F22F5C2E;
	Wed, 16 Jul 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXgWRBeF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF481F0E3E;
	Wed, 16 Jul 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686551; cv=none; b=gNGUJxLWOF7fup3zFFsA5cLkNaRC/Bh8nz7u3ZNW1VDY7qSrbFQrKz+Xyen1q+Z19JvmLe3+qR4/O+PskO0mtyEiIRsadkw/yZQZ9Nu+k9vb7bedfbB61f10K2zZ1KDIbO0LFJHGeuNQin7mvltDkmITeqoV3HKgr+/mEwc7hm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686551; c=relaxed/simple;
	bh=dNvoUpoRa5Y1wjumZTX1amXOcXvjUJSrbmTOAzQ0KP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gwHtKirEKdaPlcVT/Pty/5B0YD9wbqEaJ6kc2A2ef4VbS/1bqQIFY+swuxf7xCDFxf1rrg4od9XKFNMBHarH57xsBgpwh/3TfF7/dv/buzZuaJymCXTLWNekaLp4SrN8xZCEBZDylPEw2J5CWJeIVAjOPsFJUfCu4bQpbiuIHBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXgWRBeF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso207323b3a.0;
        Wed, 16 Jul 2025 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686549; x=1753291349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62luRaihefSOD30ytw09M7xPkQEYCchqQIT7epBstqI=;
        b=gXgWRBeFnbx7eMcobA9z7M0XqtQxqS623rC0DbLwTi5NqL3l/QPtPbQgm82MQumswy
         7WEnsg82CRp2ObjDdKWAoWawx/dcMEg364yotE1y4faSul+SNmK3LFOSxDORtpO1N2U2
         AwyXeTeL9jkBylifdbODRhLFmjtP20PqHvGPb8FKY0wWCZNvJ+PM5XEXTSAppmchY+sX
         CiKv1r2tXp/tjZ+lRS5iT4YNJti4p3Zvr74i7UGSlExfwBVpWTYN5mOeYLcyDX35FQxG
         iWlIwersIoudwksXKU7xrpEKaNt5M9PN8hwDsecwL7n9JZTo5dIaM99EzQTXNjpIR92A
         nlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686549; x=1753291349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62luRaihefSOD30ytw09M7xPkQEYCchqQIT7epBstqI=;
        b=M66d0nI7PlqfVnkweDPr4CPccCHiMTsDqRxdrQrHa9QPc0fD3BoJBd2mgHzP+TpAgp
         w4hFhlRIIspLcvDT248aua+2FWBu/i0IhxmGB4UvyuO+SpX0bih+AqyCVsyvvYpOmOQZ
         bsg8O1sLglduUGfDg0KzKUMsvw8dVsMbOllx/YknOsDfNa7XVsoPClFTiz0SJHAuGWzE
         4I9hiEP7dtKvfx7YcHU0b5Vsv3+320ct7VRnev8E0q9QNdykTTRe0hj2s6qxS9SHPYjN
         glJpmS+KdlBdaKeqwn8OBnE6NNDODgr41AgF0iZvKUSryqudXmpDvKDDQUhnkIReHqDs
         w3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdTsohEYwbNyHeId92OxPbp6CUoS3erIHZybf6jN1AGYIXxuz0x+5AgNgIkSdb9+9XOSQgWgMp/n1vXYhu@vger.kernel.org, AJvYcCWEPDagKlCMTxG+NgOol/rK3RdE5ff61mSm01eb5GcT5imCSoWizBwa/X6JO2RdNFq2lk0wQQvXgDx8kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZO5nJQ1bMrijaCtng1ZnkiQASL5zzGNXlFZi3BRwuP5muz7ti
	ztKhEfNciqL9FrQZZ7qzZgUGjAtVlK7NwF/s94L47n78mI6y89OAc3zj
X-Gm-Gg: ASbGncv4SmNq3rMVg8dgW2o7Ksfj0waozkmS6C9Nr6il5apjXCtXE8+86zvYpz9aEkr
	WasnrQpnIh4lu8OTg/ZAKNlBlSP5yA2D/tcKICBIw24pyurdo4BaR/zVhcOEVc+GWK5oasDz+9e
	oHkjI5OS+3OqoWpIOy4K6fwSYJFQTUdcoSNkLc+ELRsa6r3XWeHC2P48O2x4IoPV90aQBENvTy2
	icgT11vWiPHBSbU31jd6f0ytffDaXQJbt8saJHlZQvjCJMIN/6a9kXd/OqYDWVYLEBqufsEIViw
	rp+WgJU45u1SkLyzvcS4vDZAcKapiMBKQLsJ3VSnS9a8QoTkGOeEH/Ab5v7XcfovjKk+Hg2kxUu
	+yXuNpPvsFXkEhQ2U4eK7h/H2u79C3FS7NBT9LKs6yxUXSP3Dwg==
X-Google-Smtp-Source: AGHT+IGVPETf5S6BM0ddjqSPJDjZLQAah3dClp+KlwLDPDtT+7iucojanh6xKy2KwjTXAY8Q81UALA==
X-Received: by 2002:a05:6a00:2387:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-75722869d96mr4998947b3a.8.1752686548894;
        Wed, 16 Jul 2025 10:22:28 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b2f6sm15188832b3a.99.2025.07.16.10.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:22:28 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: andrew.smirnov@gmail.com,
	juha.kuikka@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] HID: microsoft: add a call hid_hw_stop() in probe()
Date: Thu, 17 Jul 2025 02:22:21 +0900
Message-Id: <20250716172221.1360886-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If hid_hw_start() succeeds but ms_init_ff() fails, it will return without
calling hid_hw_stop(), which will cause a memory leak. So to prevent this,
we need to change probe() to call hid_hw_stop().

Fixes: 73c5b254c365 ("HID: microsoft: Add rumble support for Xbox One S controller")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/hid/hid-microsoft.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 18ac21c0bcb2..a27ea59a1bef 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -385,22 +385,26 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-		goto err_free;
+		return ret;
 	}
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
 				HID_CONNECT_HIDINPUT_FORCE : 0));
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto err_free;
+		return ret;
 	}
 
 	ret = ms_init_ff(hdev);
-	if (ret)
+	if (ret) {
 		hid_err(hdev, "could not initialize ff, continuing anyway");
+		goto err_hw_stop;
+	}
 
 	return 0;
-err_free:
+
+err_hw_stop:
+	hid_hw_stop(hdev);
 	return ret;
 }
 
--


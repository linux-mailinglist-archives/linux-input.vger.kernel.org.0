Return-Path: <linux-input+bounces-11472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE088A78CFD
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 13:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EBF01890984
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 11:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CAE2376F2;
	Wed,  2 Apr 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSs2B4Gh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AE214A8D;
	Wed,  2 Apr 2025 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592894; cv=none; b=n6gS9T9t6rRxYhFlNWFpgt5pNfVDuqT/TYheZR5gwEX8rvR4RaeMWoKxLbmT4ytaD0+kuBdQxAQR7j6nNyevadaX1ghrpRsxEMlsraqk9LzmkfkvZ7LDFNyFaly5dBBx4g2/Yk7rUKWk9C/4igrVH25iDg1DtaG9eZViJH+TyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592894; c=relaxed/simple;
	bh=uw7YZxMSPgwgS0/w0ttLN3VboYk2jJM2s2mmZ6bJuKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HHg/bt3fOZl3AHgQeIYbCDRAjKFtGRUJTyFbXypW/Pra/zItkg3wXspjCe2oPecMx0MZ22tTcVN2vnnoDXW1p+2Aw0bE/SyKxywLmdv9UyG/SBFJTuu9Fv8QcDIMRFyyF+8kjf/KWY29t1Vi09Q+0kSnJwTpLAI4QE8yn9+g0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSs2B4Gh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39149bccb69so5796315f8f.2;
        Wed, 02 Apr 2025 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743592891; x=1744197691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPzQ7GZzqncp+Ak5yeGvcwYVrSmu2MRVGApRTYglHVU=;
        b=GSs2B4GhKWmYhjIIz+kZltKAujsWx2Wm5u2kirV1YCZaxxJPTuGJtkq3b5iloWYWAV
         SH/5tWZLbpnpV8d9r9dxDNw1eSCrJ9p7dI+RPd0i7ut6E0zRtBXEpVeVsf21ZWHD/rOv
         S9SaebMA0cM5IQLDhBmvhm4jthOehgb48R0HHNlYE8lJq7U0XosQjdTDKDr7Kzl733D/
         8YJucKR273vePevqNdzf5Fa3i5NIIElLJt/mvG4+Z20vmk7mvbtkt7BzA0OA6/TpWqkQ
         +E/CTYCVNMOWZzPQW03eOlMQAlOj3ymUbWJLWQxe41ifiwaPpoTBTCSoTYdZPUh+WPg0
         kEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592891; x=1744197691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPzQ7GZzqncp+Ak5yeGvcwYVrSmu2MRVGApRTYglHVU=;
        b=oz7nQJKypz5pAHuFrQWXeTQVOmScDm8BjoKU12d5+NwHVQLAUv1ibrVfQ+AkpHTj93
         EHlo+v9K2JeVmXvDmICDo2ZY5ONvhddCFbHFnz2xVLeNrdZpKDiL1bWr3M5l+UaLpBUW
         GVmjpGRekvqzNdU2Gqk22k8D3IgmwDJDx9RMRp6sMBwEmfcGVJxD0UWLe2LH7XuatSYU
         VtPD//NMv+ugHFDs9480X42lid9tekKVsfCqMxSHqzeUig+tFYbfHTX2KbfI8IZaJ9Fl
         rs2nJPd9cSN7S+UHSDjZMmiQTI4YV7nneU9NCmVo6CRyPwL+G7J/wM5eNtLH1n05sNib
         8nqg==
X-Forwarded-Encrypted: i=1; AJvYcCU7SoRK6+Je6prHf1d4AlwCGhppEPA3mjkynkKyX+DGejALdgKO06/naqdC57yh+sTt+AqDxFr+FFq10g==@vger.kernel.org, AJvYcCUNDh96GTPtMmc/EkP8nHz9DGkhR1zvP2YPj2ZsHOkhWxGp0INAIG1pes2Qy0FdZlKVnYwGg9unJrNU0QFr@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWR6ygH+W11/MopxNQmXutr8VPK6rVlNS+ZY9bKxnTO7B563k
	QugugFJDfuTgH5n/icobh0JUxS8/9tgfPYhBbya+C1Fm1kVkB75C
X-Gm-Gg: ASbGnctgY5nv/Q3/bETjFjZhSl4g4k3Zy6mEuV2Ui+YxPMub+ku5YgiGoMH/8w5q3lX
	hCHpf3Pu+LOLHmEfFLFoi1AoNYy4tEo+/PUqdzDOrQ0+y8JMwdGQzPWyl0yZxPJrcIZqMXb1Wc2
	m8qzCjhrNDWr4MVKmUzYfm2F1Sln6jF+6xQyaxc9dbcJZOWRv0fk7XmYpuEzP/gKWBY+6pIeqj5
	yrW/6GDzdvn1AvFHVZZ5no2XeZi2DaPKWLKfpZxbbREULe8a5SAxVMnlQcdwfujUjrSkSD/iDSB
	kUiv6sL8I93+G25RbjSRhU7GWSCHQbWevgDCcksatPPhxg==
X-Google-Smtp-Source: AGHT+IFtLceKzRoy2pv/fkhslNAg68rmy5sUu4mawdA0Qc9efkyj/+Q7apuHGHok1OVMvfuuCqRKrw==
X-Received: by 2002:a5d:6dad:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-39c297675dbmr1560992f8f.25.1743592890830;
        Wed, 02 Apr 2025 04:21:30 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb6138f3esm17406925e9.36.2025.04.02.04.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:21:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: intel-thc-hid: intel-thc: make read-only arrays static const
Date: Wed,  2 Apr 2025 12:21:29 +0100
Message-ID: <20250402112129.410320-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only arrays frequency and frequency_div on
the stack at run time, instead make them static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 4fc78b5a04b5..c105df7f6c87 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1121,7 +1121,7 @@ EXPORT_SYMBOL_NS_GPL(thc_port_select, "INTEL_THC");
 
 static u8 thc_get_spi_freq_div_val(struct thc_device *dev, u32 spi_freq_val)
 {
-	int frequency[] = {
+	static const int frequency[] = {
 		THC_SPI_FREQUENCY_7M,
 		THC_SPI_FREQUENCY_15M,
 		THC_SPI_FREQUENCY_17M,
@@ -1130,7 +1130,7 @@ static u8 thc_get_spi_freq_div_val(struct thc_device *dev, u32 spi_freq_val)
 		THC_SPI_FREQUENCY_31M,
 		THC_SPI_FREQUENCY_41M,
 	};
-	u8 frequency_div[] = {
+	static const u8 frequency_div[] = {
 		THC_SPI_FRQ_DIV_2,
 		THC_SPI_FRQ_DIV_1,
 		THC_SPI_FRQ_DIV_7,
-- 
2.49.0



Return-Path: <linux-input+bounces-16453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BADCA0740
	for <lists+linux-input@lfdr.de>; Wed, 03 Dec 2025 18:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E080D33282F1
	for <lists+linux-input@lfdr.de>; Wed,  3 Dec 2025 17:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C006432FA05;
	Wed,  3 Dec 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYsah921"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761D314D17
	for <linux-input@vger.kernel.org>; Wed,  3 Dec 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781149; cv=none; b=fL+VWVxqBNUWz9Ce8Qi7o3pjGKv50h4EQgW+wAzte+dsDQbYQrXffrYIS5o1vBlHZqfCKJ8kVaE3JSNnYFUSJ02j1eKNSnymHxoj+SLQanT3XPK8aw6yQNY/5zO78GG9ILYpyPxx3UfjO/zZSKy1MMa6ZHmpa0N8pqgNLw7AWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781149; c=relaxed/simple;
	bh=uFoNWaar646Dx22SgB2BnS2gYCYkO6ZUycFbMTuvIkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMPJB3l3wHpb50SzFShzmKt0HTqEynUlOaJoiPVxPiQzjWWBhV3P0NTQ4WZr1Jxd4n5TAlceqH0SJC2UcUafTzwcnzxOLep4dGpuw33tJUlO+SFOaJHDqjJWR0RO4wwRnwdnZs5AQCXu6zME+iawcTtMpXzBNTZ0KjsDhOJn6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYsah921; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b54f690b0so2040f8f.2
        for <linux-input@vger.kernel.org>; Wed, 03 Dec 2025 08:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764781144; x=1765385944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9y+7yd373GhPOUzL9/gOcUvFamZcV6u4OWWAkEESak=;
        b=YYsah921n0Aw0Dj2MkM8Ygb5Jz6gTugbjpKzaUaoXCpDMta6XqIUO1PpdIb7fVd/uv
         R6hfWZUAC+2ORASZZdPVJBTC6jf7b1oBMdc+jDxkyHVR+Dw+LQIYWS0U7RO88oCRkbaH
         179YTQHbCYel6pNg/sIjsckWUk1BH3B2yw9J8uhSNviQ6RcVSQ1yrmgsRb9KPs4Kq6pz
         hfIfHCs+4boXSL/ShQ87TI7k9rYy4mfVhb5PsufoPMWRa70WC4iAxrwF0vvgLupoL/BR
         hc9kJpYobBnul3u5wDdLQKmdHooif1iOvxikNjlXT5M/elSifVhXPpcIOErsoUi0RQrb
         KqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764781144; x=1765385944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9y+7yd373GhPOUzL9/gOcUvFamZcV6u4OWWAkEESak=;
        b=vrjrgIMn7X1W+rbQqoqK8I3Zyjc4aTq3aTcVoNKudyd27zlan2clHyilFow5UpQxmM
         0XTdU9VMu6v+bp0hTn8WcxAk175HLovH/VKNO0NqhDtaiZb1n/HlYIwqWn5CDx8u/N0G
         f1lsN+9B9tVp153dvdPDpnyCpL2w7EXuRobB46yPLYkG/qnPCkFELvuwc3i7Fjc0BDOe
         17C4Qb2Qj8VkGGdXGKmncRgb95FD5Dbx4s1ZDxihCiETD/pAEDuznC6q5oB4m/RePEsd
         /IMWcWkCqi07ktH4Xp+9V8IQu4yab9ptYqrtl5ChI8ORAVdOhDA58CMMPmYWqPS/ECdC
         NiYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqJ0XGoCfbqoYnMFvIj0XlGm2q4tzpzTgtqG97TE7yTXuOi7FLIWhdmpQgG+fe4k1MeIJWcSDirlcjJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pC8BfmxOYIvMFJc5jqfOl9SWCBxx+sDJPgLleHpURZDTCToV
	bYu6Qrz4Sp3HJBeyjUjDhR471VpJyWFJcqDljWlhm1kJKtFJGE8D12nk
X-Gm-Gg: ASbGncsSzPW9BYuXOxUBMr06OKcgFDIJyby7TEWQZEdw2hyW08rIG04lmPrJk91xJrf
	QCJ6QemtACMrNsJ1ogG3LRCCcoTj3zDrMPwm8ZHmRxSNQBALyHgrW76hiNDWLOt8SgYKmWASG5t
	k/E2GO0Zc6c1wqkWNINDcXGzXiiAVg7nZSWsmQem+ec/Nu1gFXW7AlyFJBZobwiaz6Yl2ziAUmL
	mOZ+84k03XyWgcDzSWkJucGD7pMDDHwnRGnb5E4RVMFU4a909Mt2jZ9yjbTBPlT4iYDV0G/0nsY
	e/lU/WQdSCuxIUZcgyZq0/jqYlwkiNNE6JWy86pg0wJ3ZcWj0JtQolhHlGzRpgUgb4XHmQOuEhR
	x/YaHiw+AxKwduMAme4oOT+YLEXetg79ylu2NTAH9tA01lX+Dh/Cqi4ZqZVZIxtqxztkfuGzyB7
	asZ+OI62uIvHgkPf+DuIkuIWZdnkCEfidSRu9ZoYpH2ApiC81PEAct4lRfHp0ykHLjJqWoYDIq2
	45HJ8yBcgSsn9lrcg==
X-Google-Smtp-Source: AGHT+IEyFhvtUoyTIgYHtE052oP4uEJA/8Atajbc84gCrHHu25B8tkaKcNlP5rQT2EY5asBq1BfdIA==
X-Received: by 2002:a05:600c:45cd:b0:477:5b01:7d49 with SMTP id 5b1f17b1804b1-4792c909a62mr12104775e9.4.1764781144299;
        Wed, 03 Dec 2025 08:59:04 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4792b157783sm22811695e9.5.2025.12.03.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:59:03 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents value
Date: Wed,  3 Dec 2025 17:56:35 +0100
Message-ID: <20251203165651.69215-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dma_unmap_sg()` functions should be called with the same nents as the
`dma_map_sg()`, not the value the map function returned.

Save the number of entries in struct thc_dma_configuration.

Fixes: a688404b2e20 ("HID: intel-thc-hid: intel-thc: Add THC DMA interfaces")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 4 +++-
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
index 82b8854843e0..a0c368aa7979 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -232,6 +232,7 @@ static int setup_dma_buffers(struct thc_device *dev,
 		return 0;
 
 	memset(config->sgls, 0, sizeof(config->sgls));
+	memset(config->sgls_nent_pages, 0, sizeof(config->sgls_nent_pages));
 	memset(config->sgls_nent, 0, sizeof(config->sgls_nent));
 
 	cpu_addr = dma_alloc_coherent(dev->dev, prd_tbls_size,
@@ -254,6 +255,7 @@ static int setup_dma_buffers(struct thc_device *dev,
 		}
 		count = dma_map_sg(dev->dev, config->sgls[i], nent, dir);
 
+		config->sgls_nent_pages[i] = nent;
 		config->sgls_nent[i] = count;
 	}
 
@@ -299,7 +301,7 @@ static void release_dma_buffers(struct thc_device *dev,
 			continue;
 
 		dma_unmap_sg(dev->dev, config->sgls[i],
-			     config->sgls_nent[i],
+			     config->sgls_nent_pages[i],
 			     config->dir);
 
 		sgl_free(config->sgls[i]);
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
index 78917400492c..541d33995baf 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -91,6 +91,7 @@ struct thc_prd_table {
  * @dir: Direction of DMA for this config
  * @prd_tbls: PRD tables for current DMA
  * @sgls: Array of pointers to scatter-gather lists
+ * @sgls_nent_pages: Number of pages per scatter-gather list
  * @sgls_nent: Actual number of entries per scatter-gather list
  * @prd_tbl_num: Actual number of PRD tables
  * @max_packet_size: Size of the buffer needed for 1 DMA message (1 PRD table)
@@ -107,6 +108,7 @@ struct thc_dma_configuration {
 
 	struct thc_prd_table *prd_tbls;
 	struct scatterlist *sgls[PRD_TABLES_NUM];
+	u8 sgls_nent_pages[PRD_TABLES_NUM];
 	u8 sgls_nent[PRD_TABLES_NUM];
 	u8 prd_tbl_num;
 
-- 
2.43.0



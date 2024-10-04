Return-Path: <linux-input+bounces-7059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E284798FE58
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9428B1F213D6
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 08:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBF11386B3;
	Fri,  4 Oct 2024 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/GnpiuS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793AB4D59F;
	Fri,  4 Oct 2024 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028848; cv=none; b=W7irc3urysF86D7yWLomr1j3x7XC+AlPsdHldJqZwMiQYbuKi9+g5jpLiO5CKbWcX6HlIdlKPVks097dBt9kBF4oLV1C+sMuF1X7t3z4KveNtH/x3Dd4DoRctX5kZAtOX76o78Ha06Sz7r7xcWgnjomwNsr+WMFO3Z9sqzI1xvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028848; c=relaxed/simple;
	bh=lD9g13riO+Slp8TPw34u0NRH4HM0q6/i/yEMqgmB3gA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tFfkr/SgqaqZHEkRDSSZSmAlCkp6qpV2JgPSky+8kPiarJBaHfKSViDtKp8GcOt8NZTt/nXijrUi8Nc8p5N//RsbFK5tTOle8lvN2PB43G78zx2OF84cwfax/HQMVXlUrSc91U1adoobZgPJR+OOxMTsnqr8hxshl0YPMhYE8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/GnpiuS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e199b1d157so1420503a91.2;
        Fri, 04 Oct 2024 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728028847; x=1728633647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaJUzQZBRfciOxNmEHoxDvtrS7KbDHmKUO7rTJ8eI28=;
        b=B/GnpiuSUOVXWSJvwRD24sm5NEVXPhOB42HtatujtJzjKhgcKwElQunGscSOyKxFWO
         WeQwBxAgEOWvkbubFjJCGttWPcpT7qvXRy6nxeUR8fkdyNZPvOSKjgi8klKROpK6bWzq
         1Ak7G20yjNjPQHa8D4r5PDjazFltWMQF8BHdgFZDqG1htu1Cn+efk/eiGYvtbTXF4sbR
         zDixMT6yQEn6WRwgW1xZRYl8+yTTzu7pGLIVqCndXTMITAINSGdHVz50vjC+ZsFJ22yy
         r5hoo2hsMGUB+4cRWmkoN+ToWdI5ZBA6+zQCaZmEKbRCtsY36NQ5wPHtPa60Xd7rSS4h
         L/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028847; x=1728633647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaJUzQZBRfciOxNmEHoxDvtrS7KbDHmKUO7rTJ8eI28=;
        b=d/sRFoV4yf8eomAsun+V6IF/P91zM7tdQ7hyUJm4Q0T2aq3ubk30H98FQcKO7kOGYj
         peZoS02U2Nu+hWgQ/NJNnDAfEBfAblQ8Atz48ChnydBmstBEUEN/dlUmbRg2lp1UFzFo
         umiecrmDAA7Ur4LRF3TmiiTY86BD7kMZD4AogrZUnoZ9y9S8MPOknznYuC2YnC3AX0AD
         Payf1vakWEmUtQDy4tBCtVxNb2BR8N0unjZGzqbFrArl7OdBgR4js9c8u6lEwkpuy8pX
         k9DVqzS3ksxTFMjk38fIyA7iAmA8gxLYykFmVfhtENy53U/eDmAQYIuQs5SkACpdL+Xb
         TwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW0AbXGCi+FOX25v3kmd8g4Pp8EL39O3T0/wjvhildCPhoxwe+7a57JAdmm41678qoKCJIwTU3FDgy9Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhG6LQac3UMHAM6ad2Mgsl2/KUjgOqma+IHdgyq9Ly1WxzB6zS
	MilsISM9Hi5xkKhDBVDPz14gK1Vo2AcfuueJT52vCNs/8zuZZJmG
X-Google-Smtp-Source: AGHT+IFRMMNyHnXu8f39dYd1F+hod061jiUEL4xNeTv+BMuCEwXttH/YFmMM5Kbk1UMIyMGAJdtUpg==
X-Received: by 2002:a17:90a:6b07:b0:2c8:5cb7:54e5 with SMTP id 98e67ed59e1d1-2e1e636f822mr2187065a91.32.1728028846654;
        Fri, 04 Oct 2024 01:00:46 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2405:204:20:6275:d166:ebdd:d4b:47ee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e866551csm896656a91.40.2024.10.04.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:00:46 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] hid: intel-ish-hid: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
Date: Fri,  4 Oct 2024 13:29:44 +0530
Message-Id: <20241004075944.44932-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the uninitialized symbol 'rv' in the function ish_fw_xfer_direct_dma
to resolve the following warning from the smatch tool:
drivers/hid/intel-ish-hid/ishtp-fw-loader.c:714 ish_fw_xfer_direct_dma()
error: uninitialized symbol 'rv'.
Initialize 'rv' to 0 to prevent undefined behavior from uninitialized
access.

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index e157863a8..b3c3cfcd9 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -635,7 +635,7 @@ static int ish_fw_xfer_direct_dma(struct ishtp_cl_data *client_data,
 				  const struct firmware *fw,
 				  const struct shim_fw_info fw_info)
 {
-	int rv;
+	int rv = 0;
 	void *dma_buf;
 	dma_addr_t dma_buf_phy;
 	u32 fragment_offset, fragment_size, payload_max_size;
-- 
2.34.1



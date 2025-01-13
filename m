Return-Path: <linux-input+bounces-9167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9EA0AF28
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 07:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EBDB18837BA
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 06:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3205B230D21;
	Mon, 13 Jan 2025 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElpooeCl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B593145A16
	for <linux-input@vger.kernel.org>; Mon, 13 Jan 2025 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748951; cv=none; b=mf4s8921iWZSxc0064uZAUKexdyb7mSDKIGnbSyL6l/EXh2yeewRZ1TrCt+XVufS3F7sAcap4EJq8fZwGy1koUyrmiVZCpFJ9PwKM7o5DNfp71vcM7LGW9c+nGNE+bZw79M4sei4XAavbwBoSu/ekzWlxxKpIMst8zhmd54s9F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748951; c=relaxed/simple;
	bh=wJglrbrpbuhe0bcViDXdcbU/vXOT5RSMKFIKdYKZOSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syhlAVRxEQGmBL8VR9OUzEbT5SG/8QQgT77kamkmwzRsLiiuzCH5aJJTW7Z9WYpizUe64DVvBVpIyqOAgT5j4IECcYK8GBu2OL6XZWHdphUen6WyF+LRlDl5iKTw8xEUrDOlOyW4GUKbCZL1FUglR2wwgOzjYw0ni3I+3yOTHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElpooeCl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so693511766b.2
        for <linux-input@vger.kernel.org>; Sun, 12 Jan 2025 22:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736748948; x=1737353748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljpYCVAC5Fhvp7P/AHA7k7jRhiqtXcEAQiNkoKKm8BM=;
        b=ElpooeClhMvpieCgur0BkJ7i2cxOSKgKKC1V0oHDQOPifzd2PF8Utlq5p6wsxXq2R9
         lbb86nDzXvq0fak5ZHcm5bCsvHrchHNFm+6D2ugun/Vew0JFhY4SeC0CzadI+R8kNIj2
         tnKTjBjKZ1kbxY02JOtCZjotnFORhoFWBEqmgPu51Oa9Zbmm9RJFbBIPi/CRJIqGZyTr
         ukbU2ki1RHPKPIclTi4zXLzXheOFztBIAD5eaMYQ3n0E5fmdZ5oBNUZoSDJ7DzphKa1c
         nQ1+knXbjtseRplVJ0BD2/v5TJZhNzJEyLZ9xePIcrPTyfdw3pd/A54jagmkD/DxPlx/
         ZVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736748948; x=1737353748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljpYCVAC5Fhvp7P/AHA7k7jRhiqtXcEAQiNkoKKm8BM=;
        b=hbXX0vHRaeTZvPpbDLPrJ83n/yP5rzagXCrQ/HB0Gvm6ZXrVy3nJH/9vj4haaQ+Npy
         XxJN7FveE/wM+KXQXZcoL549py43VJcjNUNNCL/bbrQFonArcKLk2v7vLS/ofPFCBDDg
         GC/gC9ZtWbmciSFbLixW7XHuCp1CwaQeKOLbfjdOCNL7N29dwGd9jk/z5Addbycc83yR
         VxkJw83JAKMZ9abg4pw3HkoMMGAoQGh3bWH3txLW/yVWg+0MhG/HI0N3XFEF6c0IDc/A
         Q9J3cpGJMfqL1lKPAzoISg2ax4nagOBSNZls3cY6kV/htGsNHx2oGtM5ufQA3p0E0BCx
         ZPsw==
X-Forwarded-Encrypted: i=1; AJvYcCUZIf46omsC7ZG2o/JKSGQBKyi4ab4P41Z+p/riyy9t9QrpNXPjpwA6SfagtPF3g37MReiAbWTFO2z6Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/LZPacButbRtPW+RXhZZkiYRB4SmrkVXSOz5XBvpPoHkBAMc
	X7dnj2vBjn1XE9SC0LId07NnmYRHBuPy9CldrT/gmTx5lG0daVpc/AsiNiXwjCA=
X-Gm-Gg: ASbGncuPOeC5zQMCbtKaxtONgwc2rXB+3zS49yUqIGN2jOvcIYxd8ypmNMMCi6Pvjhi
	lNFrojhqNViRfhkQQjChu7+qODK+1CMXIS7WZDAWGFmQ7hoH+Y9RS1Y0ohQZ2/IcTE68+T9/gb9
	izSnLUjFHD44L5BvyICsU978D8PUH2bECOAYPrcvNQuFTCLsn/ETcbcDVAVbMPK1hI2ozy2AsvJ
	lxoULxD1Oc03RfC4nnAeK5Ycb0NujcyKV2E+NC5r6uOGW6DZU0UTMCfxSU3zw==
X-Google-Smtp-Source: AGHT+IH1/GOLoqjf7Ff0rxYoskGhR3MvBLdbph8W02eRMXEQrG0OrOaaYHpU49nJqe6GOf8x8VpLtw==
X-Received: by 2002:a17:907:97d2:b0:aa6:96ad:f8ff with SMTP id a640c23a62f3a-ab2abc927abmr1766580766b.52.1736748947870;
        Sun, 12 Jan 2025 22:15:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f0c9sm464700666b.19.2025.01.12.22.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:15:47 -0800 (PST)
Date: Mon, 13 Jan 2025 09:15:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Even Xu <even.xu@intel.com>
Cc: Xinpeng Sun <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Message-ID: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if the allocation fails.  Don't return success.

Fixes: 4228966def88 ("HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 92a1dbe9a928..4fc78b5a04b5 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1519,7 +1519,7 @@ int thc_i2c_subip_init(struct thc_device *dev, const u32 target_address,
 
 	dev->i2c_subip_regs = devm_kzalloc(dev->dev, sizeof(i2c_subip_regs), GFP_KERNEL);
 	if (!dev->i2c_subip_regs)
-		return PTR_ERR(dev->i2c_subip_regs);
+		return -ENOMEM;
 
 	return 0;
 }
-- 
2.45.2



Return-Path: <linux-input+bounces-10432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09320A493CB
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 09:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B093816B584
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 08:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392212512C1;
	Fri, 28 Feb 2025 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jggea6Z3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AC8F6B;
	Fri, 28 Feb 2025 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732138; cv=none; b=UeXGo4Q/QIt3T13Zic5W8vMLKji1eyUhbYGASwA7wmKqbLnXUEJAY95BrmLioFBh7J+1eoaL4Cbift1P9adwwuBEz3Ded3P6uQTxn3mkK6zodMQ0NsmixOHlD3l8URYgqLYRE/hIE3UPhGEKfVbCTJ40D0fakI5oY8MkTm44VCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732138; c=relaxed/simple;
	bh=osdo+DPfQvjZ0yOzZ7Pme69F1fImkLi/D5J06hHJ8lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rWLV/ZPebe5FIGB/IqWTPCrWTtvyxE6uoyep2tyDOJFhvpwEQgCvWr4mgFX54TOpsXjj0lEY/DAPFNObn+50QqDrnEC0+bch0WhOOC2hhHb8FuRfKSbcfo/mUh8Ah4CX0OMNUOUIHOPxvFR+j2ufyyjuEMq+f5zhmYsvJSsfNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jggea6Z3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so18415115e9.0;
        Fri, 28 Feb 2025 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740732135; x=1741336935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0gnLYtf1/zA3bARRRWL+C18PA2T1Aj8kNcoFSAF1f0=;
        b=jggea6Z31ALXsHkDWL88jqoSmz2likIqzHIye76FPTtDPdZLCYQcrtKSXz9hTIdtNh
         SqZCcDCocZzyZk3i4qRkAV8ZNVKHzK+X0TLSQuVq9SY6sYKyoTK9uhEuAfNB3UVY60Al
         CBOKpA5wT+5kqkSYKseF6FnL75LipSSRfJPvPEyj6GBllQXJmlhGU1rdHlfgZFqmU6V0
         BsgYMqUSXpCody3m682kaCHFspbmZr/ppaLtbbztZLV/27DwX/3EaLMbNKZo7iu9++6X
         td0wgFpQYXc+m8pBSdqh9XWXVFoCaI0twnG3YzCTHG6nmWCrIxxqfJ9BcvcsnIMVB1PZ
         6uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732135; x=1741336935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0gnLYtf1/zA3bARRRWL+C18PA2T1Aj8kNcoFSAF1f0=;
        b=UnK57AWwEvcS3LXt+livB8JUWCIm7FHVKE0YTTfXkp/Xt2SW9B9wkCEtz2qLkivLwr
         y0wCTZcYH/pftlVBf99FATfQy3jWFU6n//IMoAI3GVzNOZIyo7g8xKhoY/BtQolLl4Nu
         4a5+PbK3cbQrogVdImkyempgpR9+O9d1BhAWtXmJiOAFxxb/B62YUPAZuIdqpkRY3441
         O5AlCFRUvJZIjsqydwaekyE98/Urs5+8ud+Tt9qDkKITT6aQjB3a+PguSbhEKHj0L5d3
         9DqEHwaptylOLEbuAW31diOBs1DuxCOB7Pmwcitf+0LHJGE2FvIKAy+RhjGS58RpdA0v
         XJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6J3Jo1eeeFo6fc9svGMoF6uW1XLkUyph/ozIW5cYYWdBk5W36TnfaedEiD0Kg9bAUcsfq1W5xUvijENY@vger.kernel.org, AJvYcCUsVk0G/6IuuP+LAAmzQYBOG3OZ7QeikhWu9QwbQ/oCNmhDM+dmUlHcISC2aHN0kCkfv12GqKCu3xhAHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaGvWW4G6xDClDeY2s9sOQI7NIVBcw3KWrvvMFibrNRrybUZP
	c/btAPjnOPwrNCcENYjloWOCx+bfIjg0kMQmLULiKTV+izjFItDtT/5qYsoiWcs=
X-Gm-Gg: ASbGnctv0wbDyuXPTC8VKu0GpVjOaQIIWfwbp+eJpvkkfw26w3s/CcOf+PUaf6SsQ15
	7sqRwmcu7NpRY815pjwH33I1JDguHZez4/ArDSyoeyiw3uO25U2WGCwjqieXijo7hgmL+7nWZ86
	FRIl8w4907T5GuQAQLA3w9J0GlLubZPBlt2vZ9KHeYzGRNnvyXNMxABTx7FARaRZVEg4IphA1Xj
	o/WUOcgFNmYXuSggHJJRaPB8W/sbkCSCceLHPKm51v6DJI5ZimU7HtPsFMapKW5fZpS3FrgePYe
	WLm0hCAXXv9wK2dl8qotqRAM6Go=
X-Google-Smtp-Source: AGHT+IF4w/HceXwen2E7Oq1o05vuk+z4iwc9BPVsEhDgiRZE/XRNkqQYvAP5FQfg6bIWxhOfv6FIEw==
X-Received: by 2002:a5d:588c:0:b0:38f:4ffd:c757 with SMTP id ffacd0b85a97d-390ec122c4cmr1868473f8f.2.1740732134651;
        Fri, 28 Feb 2025 00:42:14 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47b7c43sm4433100f8f.49.2025.02.28.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:42:14 -0800 (PST)
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
Subject: [PATCH] HID: intel-thc-hid: Fix spelling mistake "intput" -> "input"
Date: Fri, 28 Feb 2025 08:41:39 +0000
Message-ID: <20250228084139.677391-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_once message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index 7373238ceb18..918050af73e5 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -107,7 +107,7 @@ static int quickspi_get_device_descriptor(struct quickspi_device *qsdev)
 		return 0;
 	}
 
-	dev_err_once(qsdev->dev, "Unexpected intput report type: %d\n", input_rep_type);
+	dev_err_once(qsdev->dev, "Unexpected input report type: %d\n", input_rep_type);
 	return -EINVAL;
 }
 
-- 
2.47.2



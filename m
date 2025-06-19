Return-Path: <linux-input+bounces-12969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE3AE0AD6
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 17:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B31937A4853
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A993239E93;
	Thu, 19 Jun 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBbctc7g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EA111712;
	Thu, 19 Jun 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348005; cv=none; b=EFTWx/fBdXGEIvZuo2/tpaXNHVxkPKOKTgVR1cQM4Qxc7yuqz3WbmopoHwsorbnk2wdTvjXIVUzt0HtDNDsRmHbqlWLPQi3U2p58ZziYe0HnR1tcIhLQonSROsNbpCcdf1iQlsJWhj6cWgaFDWXXhBXkDr5EF/h1cs2eqvmu0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348005; c=relaxed/simple;
	bh=m84LE3Q2FEdUp4zpYoyPbYP7U4oeu6763y4q5FuSRJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFAgHTYKB7llaj5hkZsE3BX6hz9PIUBZyNa9L2amVFlXDamjrb1fT7KizqUu/9ciwGjOM16oOkk5NEgWT4BCS7YEzZAQlNmTjB47j4x6IBJB6fBszuSrPwUnek6lxMNjPSnZ9cHKbi59LMTuPob7d+wi5rABzZudjIu5ITuY1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBbctc7g; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fae04a3795so9970796d6.3;
        Thu, 19 Jun 2025 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750348003; x=1750952803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6B4ve1u7kNtELsGO1WFpcXtViWSwIjcEYc11kcv2iw=;
        b=LBbctc7gmydHvwT16Fr9GsYD/SR1BHJG3PLUrLnpLXH191eu/wGypb5CC0ZAxEmOiW
         tWQUrAj6/HBvIOPr74NrKZQJElJsPJbDfHkiCdcy55HbIJlMyuTvnRLI/pT4a0fVwOiF
         td99S3UxqqGJzJpe3pRFGBfcFChI7Pq+X7EwS+mFFZsluGJN8sPm48RzTHlHe/Q89Xa+
         2O59T2AuSgomgdMaTz/t2NmAYsg8JZ7bj30E3DwdQ/wVykblHIBWPNyNvT/mLZyo37Yn
         9M2rK+0helOMIcvzf4vvU4XQnYKyvOGeaJ4pVDqZq+rHd09BAHJQtmmXpDEYVd6kM5HC
         Bg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348003; x=1750952803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6B4ve1u7kNtELsGO1WFpcXtViWSwIjcEYc11kcv2iw=;
        b=hTKoQ6x8YnE5ozPF7QV10QRPOQ3ATOUaOPZqxYaDn7nmJZWQRLYHYrCx9Sgrp8cTs5
         wvtDV0A0wFvTac/ZiD6yT1BOz3fgnNWQJ1mbjPq43YQL/9uYaRFL7VvL8mvOUDQ8O5bj
         nuHnnaZwC81R/dYe0PV1WPhjtMgiCqtDXMGRX36FH9yCJaCC1QY8e5GSENZ6Pjm7mNtl
         pSR5zPsdvzB/Apcl4H3m2S3qV506Zo5JMWpyGx3k3hr3yXTOnbF3Z8JauMTywumwaahz
         qQQXRu5O1onpHUhcw42Lkxm7utNYAIgUYrxToBUpQXxD0JCOKE43D26q+1qE4t1tx0va
         eCcA==
X-Forwarded-Encrypted: i=1; AJvYcCVeIsw2+/Bsf2ROXvvuPn0COgCMrUoZo1Odhh0yLo6at5dJjXX9iDrXU4YwdD/pHoUkTrl5ccQYZk/Q2O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3y4eWeq79qgxW7n3mwa+7QT6FJo/V7UgETryTAEZfy4EAPZX
	xLNsHot4Xnum1gkF1mU3gc54rNKPhE7r5ekJJ6eVKK9K6gQkduWts+PQ
X-Gm-Gg: ASbGncvw0HVbwka0b1LruqFfrgO4P2/KA4H3C0SnfmkEoh9qz4Tvaw6AWw1VvR663as
	wdl0RjZklb/bxt/+Lkp5csNu0Yy3j3zsvu7jbLa05RP55UhtMjpyGQHpZ17Z+CoWye3GpkjmoQk
	BpJqF/gXvEDxp7shcwVW/POdX0Yk5s1h+HWRughVfsis03xmOUzGSHbqiAdGFbvS9pBi8XFECjM
	7Kniu7LzsogaUqb9MdW90tNXWlP1bxyl/lnWuVTEHLySC5Sb1UK45oTVh8UxdDyjfMVNrTuMeu4
	B8JffcUhYE/LbrdeviL5Qe66eBBd2LBJZ+fTHGmhYLFqUNQAoZ27cUC3mYBKC/HwFYd8DoYB33g
	sF0TiF6VJOpz5fMaLbZt5Dqlp7j3q
X-Google-Smtp-Source: AGHT+IH0pX4OgNTAH4KDF2nGmjng+ZqjtaVRQSnBtxBay7Pw8CVZsonkinMiI2K3A+7/TgeZuWV31A==
X-Received: by 2002:ad4:5605:0:b0:6fb:4c6d:d4d8 with SMTP id 6a1803df08f44-6fb4c6dd5f2mr233401066d6.3.1750348002639;
        Thu, 19 Jun 2025 08:46:42 -0700 (PDT)
Received: from fyre-x-redhat96-client-2.fyre.ibm.com ([129.41.87.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09538369sm1058276d6.60.2025.06.19.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:46:42 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] hid: replace scnprintf() with sysfs_emit()
Date: Thu, 19 Jun 2025 08:46:27 -0700
Message-ID: <20250619154627.415368-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/hid/hid-core.c  | 2 +-
 drivers/hid/hid-lg4ff.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314..4a00bd4a4224 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2797,7 +2797,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 {
 	struct hid_device *hdev = container_of(dev, struct hid_device, dev);
 
-	return scnprintf(buf, PAGE_SIZE, "hid:b%04Xg%04Xv%08Xp%08X\n",
+	return sysfs_emit(buf, "hid:b%04Xg%04Xv%08Xp%08X\n",
 			 hdev->bus, hdev->group, hdev->vendor, hdev->product);
 }
 static DEVICE_ATTR_RO(modalias);
diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 445623dd1bd6..32b711723f2a 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -956,7 +956,7 @@ static ssize_t lg4ff_combine_show(struct device *dev, struct device_attribute *a
 		return 0;
 	}
 
-	count = scnprintf(buf, PAGE_SIZE, "%u\n", entry->wdata.combine);
+	count = sysfs_emit(buf, "%u\n", entry->wdata.combine);
 	return count;
 }
 
@@ -1009,7 +1009,7 @@ static ssize_t lg4ff_range_show(struct device *dev, struct device_attribute *att
 		return 0;
 	}
 
-	count = scnprintf(buf, PAGE_SIZE, "%u\n", entry->wdata.range);
+	count = sysfs_emit(buf, "%u\n", entry->wdata.range);
 	return count;
 }
 
@@ -1073,7 +1073,7 @@ static ssize_t lg4ff_real_id_show(struct device *dev, struct device_attribute *a
 		return 0;
 	}
 
-	count = scnprintf(buf, PAGE_SIZE, "%s: %s\n", entry->wdata.real_tag, entry->wdata.real_name);
+	count = sysfs_emit(buf, "%s: %s\n", entry->wdata.real_tag, entry->wdata.real_name);
 	return count;
 }
 
-- 
2.47.1



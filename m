Return-Path: <linux-input+bounces-5851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6095E220
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC50282720
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2652AD22;
	Sun, 25 Aug 2024 05:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T19ks6CM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B34AEE9;
	Sun, 25 Aug 2024 05:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563862; cv=none; b=Y/D9QwragCmY1xuA2EcSs0WGA60XjbfL/eaQoSEOWRQNLAbpPUWomimQ7/LU3Tbcso/VEbCSCDaEOkRgxGrbq+OGnJzAG3bjjBtXhIyXedFJGAhpWGIUVhgeq/ectCCvKM78P/m64BCTzJps9a73A4EjV18MVkAWZFT51bxB1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563862; c=relaxed/simple;
	bh=+GxSQQm0fwDUVVdh//OLe0KVAGNiXQXtF0F74sU91EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8Rjks0x0be7N/s01NMrmQdT4bFlP5bvjAC8kqBuwF3Zx0NbHmsaAmHnHX4RxgKRWmKQ8dsySev1Au9KJ83S+NOHRoK3cf3D6aJAghEcEY3yFARciSiaTHzHLf+vI3sUq0Ou04L3UqxqGBmiePXdLvQwcAFpPPETmmFgK2A/Tg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T19ks6CM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d679b094ffso346784a91.1;
        Sat, 24 Aug 2024 22:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563860; x=1725168660; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JO/LrOVUAL0TdV6OGNjqW896oM9FWe+b07zKDcy811A=;
        b=T19ks6CM2wrmy0kuh95LccOjX+Dl7njZjmANT5kbgCDPvpiJzO+m06jMSu1rHCLvAx
         bbxWI11OHjSbtmbN8so2A8ZN11fwS555F5caIzKuN9Vc4nG3zMRHDXoG/Ihl/ko6XSDf
         /kw64jzVCDWaQQudvvwWwZIgUl5xxiQ7XOZfkBpvA5Nhp70vfkpLuRI+VS9lR2Zg3/U3
         hYm4GFapU5PyYxdNe5rU0n96pdcWqIYA13Kj2nAYGOuPIBjq/6N9pv4jKmamt6fqDxzk
         uQ3UWTa3cdLvmmjdAvp9ecld8m6mi53aRlkEV9tCCvTG1HEMQT3xLLtQ9niRoklCcZl+
         JPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563860; x=1725168660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO/LrOVUAL0TdV6OGNjqW896oM9FWe+b07zKDcy811A=;
        b=jxJWPJL6sDd/ywjoc5nA9TRtDF8LuFLS6MTa/676EDKYHHdLSBMUQW3Un8+Q1KtA58
         B2HtDNDK3UyrnAsIK1PfJfzAgA1O+3qc0PD1Gsa0SKOnG2reVCIKQUmWb2o6BBvrd6DS
         tgxj4dd0tbS1EdEHwVZhQYB9X2DrmIqEWkTujZughpAjodGYSxtu+94MaMPV03qjTPid
         lFOU0Y7Zk0cTCASP+91LEdmDSeKoqSu39CUs4vwJxij3iMDI8QVTYuMPGiAbbbZBjSjk
         Xn/ArPE9Z85tOiBmUQTA5/V3fVud/ZfiDoykWpWjT6a1PMGFEgYupCAW+i5oya8EclN4
         YuXg==
X-Forwarded-Encrypted: i=1; AJvYcCW/CVkkwovMn27X1nRJl4CNBUEXBCMQ7acx7x4bXFvXJroSuXn0Cpa8If6CDn6ppBenU4G+OkOjJCK+JAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwswjT2MWeqIorEDEUt3OoCV8WmAVQoBxVLhqhRGrQcuu0yOq0A
	1bPXB5fksx/LAexH0jWveZHHwwjcgVUse7dpVC9ZyEhncvo0FcoKcDMi8g==
X-Google-Smtp-Source: AGHT+IElHaXk+qI9xjTMaueKMA1t4aya8d0J+OqaGXjPT6lv55m8t3gRkvfX8E3lROYd6FazWa1QuA==
X-Received: by 2002:a17:90a:d515:b0:2c9:6cf4:8453 with SMTP id 98e67ed59e1d1-2d646ceaf00mr6023416a91.31.1724563859781;
        Sat, 24 Aug 2024 22:30:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb90c542sm9372921a91.18.2024.08.24.22.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:30:59 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:30:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: alps - use guard notation when acquiring mutex
Message-ID: <ZsrBkWIpyEqzClUG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/alps.c | 48 +++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index d5ef5a112d6f..4e37fc3f1a9e 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1396,24 +1396,16 @@ static bool alps_is_valid_package_ss4_v2(struct psmouse *psmouse)
 
 static DEFINE_MUTEX(alps_mutex);
 
-static void alps_register_bare_ps2_mouse(struct work_struct *work)
+static int alps_do_register_bare_ps2_mouse(struct alps_data *priv)
 {
-	struct alps_data *priv =
-		container_of(work, struct alps_data, dev3_register_work.work);
 	struct psmouse *psmouse = priv->psmouse;
 	struct input_dev *dev3;
-	int error = 0;
-
-	mutex_lock(&alps_mutex);
-
-	if (priv->dev3)
-		goto out;
+	int error;
 
 	dev3 = input_allocate_device();
 	if (!dev3) {
 		psmouse_err(psmouse, "failed to allocate secondary device\n");
-		error = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
@@ -1446,21 +1438,35 @@ static void alps_register_bare_ps2_mouse(struct work_struct *work)
 		psmouse_err(psmouse,
 			    "failed to register secondary device: %d\n",
 			    error);
-		input_free_device(dev3);
-		goto out;
+		goto err_free_input;
 	}
 
 	priv->dev3 = dev3;
+	return 0;
 
-out:
-	/*
-	 * Save the error code so that we can detect that we
-	 * already tried to create the device.
-	 */
-	if (error)
-		priv->dev3 = ERR_PTR(error);
+err_free_input:
+	input_free_device(dev3);
+	return error;
+}
 
-	mutex_unlock(&alps_mutex);
+static void alps_register_bare_ps2_mouse(struct work_struct *work)
+{
+	struct alps_data *priv = container_of(work, struct alps_data,
+					      dev3_register_work.work);
+	int error;
+
+	guard(mutex)(&alps_mutex);
+
+	if (!priv->dev3) {
+		error = alps_do_register_bare_ps2_mouse(priv);
+		if (error) {
+			/*
+			 * Save the error code so that we can detect that we
+			 * already tried to create the device.
+			 */
+			priv->dev3 = ERR_PTR(error);
+		}
+	}
 }
 
 static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry


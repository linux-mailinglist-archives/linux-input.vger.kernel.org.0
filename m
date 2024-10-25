Return-Path: <linux-input+bounces-7689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD089AF723
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 03:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0A11282429
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 01:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EC62BD19;
	Fri, 25 Oct 2024 01:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ2GGNs9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48300E552;
	Fri, 25 Oct 2024 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820755; cv=none; b=HmxncdiNXn6vCNSRprFVQjexvOZxTJ6zeih1rFeuB4f2L+i6XiYZXFzgUSzo5XLQXiEv1tzse5h7n5kUrILybEznZvhRhy+k6MiQGqNDa/KDIBNHrqSiUD/xycK3nBN7+mZLWcZVkSl1c7m/b0opM0IVXinNMiXac09UBGv672o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820755; c=relaxed/simple;
	bh=XW2jYSTFBUjqC5EplPs5/BY/OWniAToUsBie0lGfkMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzwUhe+Pnfoco/qYh+n+zY6TJBcbXY1cWIdSuCPr+yT9UP4UFCDR9b7KZk4dc/eaMeMYAXFY3/51633x8SASidDpMn0EzfDZMUuYL1e2hym9YgwOCensACWQCum3PT3v+AUZqBoEu1NDueVe0aeU5nv7g4keR8w8g5WR5H06piM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ2GGNs9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7eab7622b61so959275a12.1;
        Thu, 24 Oct 2024 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820752; x=1730425552; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8o4bWTvDrlArCGcSn7H7BijnezBVYBgrxJXeEiYNVo=;
        b=BJ2GGNs9T/7vb068nt2XCJoIvTvFLMunaIpY9InQw4J+kOkfT10PfHwl4F3rBrskf9
         im00+YceM2AfyQ8mMnnrT7OjvFSRyLH1p3imKDb16/CndwMxDf/XhKFKyOQiaH4SknHo
         qNB3DiQqtEvDiQFSQu01+zitQtb+AxyjO4EWR8lHrG3bZewJLegGOb6cVloncMChm4Ch
         9aVJOehov/sIV7ZiP/JB+0E+OdfkQavkTt+czWVBJWaPxLw5IpX33/T6aO9JIWtsHOhn
         3fXssctOx1PL6qTBkdGPUTUMwBQtB02XK+jzPiu7oP9ttX1f9jZpOfR/Sqk+QBV2m/37
         O5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820752; x=1730425552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8o4bWTvDrlArCGcSn7H7BijnezBVYBgrxJXeEiYNVo=;
        b=HKqbWqEVnItkex1zQVyIWRPnz8JbgOsuxUQtBL89BysOERv8enQg6oOUxyCInCxK6w
         JpQWnFc4Rk7M8agil6N2fmbqA9a+igbp55f60izQw9uHfN1TtyspB6EBsshSCIK84S6m
         bLoNezwuJHIorA+ZlWaBcsIdgADuWfc2qgju+7HtK76p9F2L31+tD1JoGaOwsNrz8Jyi
         2VcBDkfdgDMzPLm31EcaJdZwtNfyIMsnSvKSTfRzMeo8oqtqbleA6oXptU2LfbEBru4n
         NQuepSogovFc3uHyrPqg3FdNGGfxVqfuw+/VivWRMo62B9zy7blso4rxp/zXy+47cgsB
         6n2g==
X-Forwarded-Encrypted: i=1; AJvYcCXI7tJxW66RKarvci/CoMKe6GL5IG0PWJ0PGewB8TB4gPNcNeJGFscIxSUP6psjSGUr9mRqETwycqV/QeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQljmlGpCeW3VdRiOx0A/oj4qrNjJifdZVb7AGojcN+NYczlV
	g6AI+x4dv34oWUXUXGgad9dBQGDaA1JblcoIUBaqDmnGnVHKaWUc4+Tvbw==
X-Google-Smtp-Source: AGHT+IFj6T46o8s1/RAHjEaNpYkK5EOQE2QbPwdDR1Z4iOfCS95qEbE9vKVBO2uHe9UYsJI9BvTKnA==
X-Received: by 2002:a05:6a21:9983:b0:1d9:3456:b794 with SMTP id adf61e73a8af0-1d989cc915emr5915887637.38.1729820752250;
        Thu, 24 Oct 2024 18:45:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a810:a864:e2e2:2651])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc044f82sm787765ad.258.2024.10.24.18.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:45:51 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:45:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: maple_keyb - use guard notation when acquiring mutex
Message-ID: <Zxr4TeGwDGIIyzwH@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/maple_keyb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 91a1d2958109..fca7df1e3ae3 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -132,14 +132,11 @@ static void dc_kbd_callback(struct mapleq *mq)
 	 * We should always get the lock because the only
 	 * time it may be locked is if the driver is in the cleanup phase.
 	 */
-	if (likely(mutex_trylock(&maple_keyb_mutex))) {
-
+	scoped_guard(mutex_try, &maple_keyb_mutex) {
 		if (buf[1] == mapledev->function) {
 			memcpy(kbd->new, buf + 2, 8);
 			dc_scan_kbd(kbd);
 		}
-
-		mutex_unlock(&maple_keyb_mutex);
 	}
 }
 
@@ -211,14 +208,12 @@ static int remove_maple_kbd(struct device *dev)
 	struct maple_device *mdev = to_maple_dev(dev);
 	struct dc_kbd *kbd = maple_get_drvdata(mdev);
 
-	mutex_lock(&maple_keyb_mutex);
+	guard(mutex, &maple_keyb_mutex);
 
 	input_unregister_device(kbd->dev);
 	kfree(kbd);
 
 	maple_set_drvdata(mdev, NULL);
-
-	mutex_unlock(&maple_keyb_mutex);
 	return 0;
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry


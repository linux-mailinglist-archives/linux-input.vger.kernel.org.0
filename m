Return-Path: <linux-input+bounces-7690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A19AF728
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 03:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0361F22797
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 01:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAC3AD21;
	Fri, 25 Oct 2024 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZscfSg+D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF16A945;
	Fri, 25 Oct 2024 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820834; cv=none; b=bwHw6WRVF4aByMcblosCy5VfjFNbcYOB+jkqQoU4R3rJgkcJCvB37NG+2x5FtVdk+7hsLGrWnuecjuYGeSZ5c9yjGHUl6S0qBHSQXty/Cn7yDohu88RomrZsMSDvjQ67IturpMHMv65PVyopmPVMO0D3Ltcm6LdWzSqIyRwaPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820834; c=relaxed/simple;
	bh=nCYOGwRi6T1hua2jxqfGvK/htaH/o5K3TS2cHwG+M1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eefTmkJlxLmF+c1F2zpJnSCYLHW3Eotj6Bxly3czZtbz3MbxUw/UcU6iFK0/pN+evOngkjGJ5AwqmHk9WQJ9PqjjgiVblS0ArZztKCWrWN0E6w095snWzt/EWj8g5GVOo+sHVsFv9sz4qmk3kkqxDRpi/P7ZN3NY28pC9D4f+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZscfSg+D; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so6184245ab.2;
        Thu, 24 Oct 2024 18:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820831; x=1730425631; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7ypO3fZr1Fv0qMRjUVel6CxXBF/wSwiq+a1pizXNrg=;
        b=ZscfSg+DJE6bCAfITEcR31oQgJkMEAhdlIZLkZc8/YLfPlrlTTWa+aMSkxfLx8AWS0
         8eOteQzoHU0UH91iRVdHK9zIMkbN1ID7wsJg8Damy3W5yiM6jvT8VpB7uSdt7Ufkn2Eu
         uYIrrs5PZecUmf90fHOD0H8cSqhjGQAnd6T0ow6rJAXkV7uDKPTgesI+DVnPuv7wu4rq
         rGw/fni+A/WyyTje6+4gV/qJxu1CMSQLV3JnV0YqZccAUXX/HauOhhuMAMJCrJLZvY+a
         dTuY82kOnMaORCCKPkUWYZrOZXdi4vLLE2k/cvvdNzYlaqxtcyyUaavGsOGxxKNWsQ9A
         EzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820831; x=1730425631;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7ypO3fZr1Fv0qMRjUVel6CxXBF/wSwiq+a1pizXNrg=;
        b=Enl4QYOoGr+74s4sxPpmDr3U/6VYMr35OUD40aqz70b0PnQ+EoM1qdGXFHhKDoJ7ZW
         Ogxec/8KdOQJrualTta8UQVFHnC11Y4CGy99Z+wA04zOh39tasoXsj5F770dTXDIaj4W
         8Dpe12wVcSVjcHRbaVlOnso5LaXw1KI6fkUHb4FbXYe8YorMv1GM7CC5/b6xTpaKox67
         6RSwa80Q+Zr1ZK+VZEfPks97dZIjWaWj7i9xUDsy0TaRkdpTPJUChGUmq0oSvSfN6Xas
         qDXMT64wa20aJRrHRTNBp+G466gSrUUzaaNQ1aNUTu7wxQ7bXygFzXWgbkLibI5KC6Ga
         Ns1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKtqXM4NA0tcvwgc3AxYTZTHa8dTfDHv+QyuNaep4JpA/ZjC9V5l8mP1smoioMpb4SUw8OIdeY6CV64zE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lgkQ7xBpfsUGLi92L9Y5CzH6S/c3b0KCaQqKOkFOuq/nYGnk
	nzuCVt7LBX6JrJtVPbCj6myybYv35Czyz1MZO8h6NxCSxnIc4WsnIK92Zw==
X-Google-Smtp-Source: AGHT+IFG69RdXlviIVvtARm9U+8zf/3PDiyOkYfVeAxMlrTKpUSj6ucrfjbnBPQ5XD5ZAGTHVc1zpQ==
X-Received: by 2002:a05:6e02:1a82:b0:3a0:bc39:2d8c with SMTP id e9e14a558f8ab-3a4d59d04b8mr77566585ab.25.1729820831184;
        Thu, 24 Oct 2024 18:47:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a810:a864:e2e2:2651])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3d2easm77995a12.85.2024.10.24.18.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:47:10 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:47:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: omap-keypad - use guard notation when acquiring mutex
Message-ID: <Zxr4nF-igbrmgq85@google.com>
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
 drivers/input/keyboard/omap-keypad.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 33df8885b599..9e13f3f70a81 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -156,15 +156,15 @@ static ssize_t omap_kp_enable_store(struct device *dev, struct device_attribute
 	if ((state != 1) && (state != 0))
 		return -EINVAL;
 
-	mutex_lock(&kp_enable_mutex);
-	if (state != kp_enable) {
-		if (state)
-			enable_irq(omap_kp->irq);
-		else
-			disable_irq(omap_kp->irq);
-		kp_enable = state;
+	scoped_guard(mutex, &kp_enable_mutex) {
+		if (state != kp_enable) {
+			if (state)
+				enable_irq(omap_kp->irq);
+			else
+				disable_irq(omap_kp->irq);
+			kp_enable = state;
+		}
 	}
-	mutex_unlock(&kp_enable_mutex);
 
 	return strnlen(buf, count);
 }
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry


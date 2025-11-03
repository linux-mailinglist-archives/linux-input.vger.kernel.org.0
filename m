Return-Path: <linux-input+bounces-15870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CCC2C65C
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 15:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A76F64E2ADD
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8388B30DED8;
	Mon,  3 Nov 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpHfzqJq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF0226D02
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179928; cv=none; b=Cdfoh2Tp4JMhxEBeJtXsSDWxVQQPvhCdEfrDir9EukLnNjOH8TRGtO4Dm5Z64elQ98HHjY+mUrzlqi2X4hlx1T1XQX0qRcrmvE4y6AsMVh+/XV1LeKsGmBlAOMO8dNLFknZKoI9UuwonLXTANIKxbnOBaWWfjBJhUXYEYiSuano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179928; c=relaxed/simple;
	bh=xWMYardQHnIaK12l1ryDr3bjsr+pXFGz+yDLvCdz8aM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7mFrzJLHMyutxQqewIkq+iftiUDSGtkklB5ICuzza0KasR/uECTYc4hG9MsgvU7NP3LUcIuBmH5FRijRIJik3GaP8EhpQMmZh2zNsp5RSeoo9rssyfi6fMHUXgmhzadp7kGGWdswAfgyjZPtcnk2BEb7M+5CaPek4TI0GG7FK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpHfzqJq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so2837982f8f.3
        for <linux-input@vger.kernel.org>; Mon, 03 Nov 2025 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762179925; x=1762784725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0eHvLoiid9wDCxuP//NlqPdvxc5VD66YHxv5DH3KtE=;
        b=GpHfzqJqfv+4NhnDs7wBZ3N21ZMxK313TY7qWEo+iIpRbnsiAo4d8gmzCAeM4Nn2Tm
         NQOZoEJJRTpyHVJovzK8apqm/5SDXqtYLQ4o54YRBpQjdKd2NWzdoCMNUI9O9ejzohyf
         xBrbA86jKMk7p9NP8PdgJOfpqF8ioxtw8Bx6nkk/YBKGCJLmZiY0kR/AezvUsjBb4mZM
         q0aOcOOeldLJ5ibkrw6iYda69aoxjG5bVhQk84ToPmYC6SMas9g5Firr6NKw4ujGCyMr
         lmj67toayoNq3ptMAKxLBeBAWGkkHWXIvSRF32gV7H8AAolEX6UpK+Q+Zx+U9X18vWsL
         vTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179925; x=1762784725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0eHvLoiid9wDCxuP//NlqPdvxc5VD66YHxv5DH3KtE=;
        b=kM2zvq6vCpyyC75wx8f5h/aDAMvhaJpwsWlkzBxOTzxtNJZaCpINnStzmiP7lV2alO
         pJHB4y9P4JoeDtWxjKrFwlKWOgJd5K1uw2Z5l0EhPgJ9BduI49fJWlpJRqFiIR5l8dDJ
         3t9zjkMzRgubK+B0TA5MM0SHsh8jviRPhKgpwL316xPMPxDej7eYkPak/X9dBoMxwZKE
         4USdk3wcpSB/chGBGZHuxpx0xw42X78XsxUagjS1f1JBrjdoHej1fMfLc09PzJZcVE5P
         fSC6Ks4FUFkCvACkFSQ156c7YxpRJlWu+oUGM0xLb53VB9nR6mUQ+vPeTOE0AOHCNAPm
         AWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJxTWRnm+kmZRVHBynVfgNvDnt1/m+DM+FQX//F62LsPLf5Fhk1ba5Az7Wb8z5y8KGQWyNAS3q+m9Bpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOealrIrC96coVRwpM9xB92SJ45VJs69N0NR4lqDrmlm3kUBC
	oO7/nUNsxXmHWWE2bMkcSrDmf2B2oSCAII5Gcskmpub53EJiDQTsGVuM
X-Gm-Gg: ASbGnct9oo+hwmv4JnbvgclSX/pLi5x9iyagW7EpWKvqx27ENmp77Oo6/BkBTHZpA4S
	I8ANuQ3wZm7Jet/Fq1khaer9pZLDEtBLM+6tHRW4RUSc1Av6C1Zf8OuW/P6vGHtpqFCj3ujNqqM
	SI4AjTxxgi3CSyhwSWhtpVB6md6E1GhMc2tOe291N/TgdSWTTegeM+ldDbOuJgNZg3QhHGhVI+q
	rUSqp/P1pxnMpRXUHFX60gAQpm1Vk/337MipU1k2/0qh9+xfAjXRW8kE8US7PXMy6CoGXBsaCta
	W6xIbH7qaHE8hjnseBcHqt+cBM9sAzrnDena3/AKvZ37BAybIlHciNxikh5nLAUjP1oKrSamMHE
	pHkHy+BDJfRmTX0jhmfWLS83C2o1RNyK+jM9J2Xr0J6ph2zhB6Obw6RA32mGub/TjjZF8fA+reN
	Y5Qb7tp9Fr4wDfc5AG/eQ=
X-Google-Smtp-Source: AGHT+IFVmp7tFVYPy3tim/ILb0m6yD7bQL1F/KHtlrW8xr0PngQ0veSe7mMWCHVQNprA0UG970M3NQ==
X-Received: by 2002:a05:600c:c178:b0:46d:9d28:fb5e with SMTP id 5b1f17b1804b1-4773a7384c3mr92009525e9.5.1762179924825;
        Mon, 03 Nov 2025 06:25:24 -0800 (PST)
Received: from snakeroot ([109.175.243.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c3a77b1sm160531325e9.17.2025.11.03.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:25:24 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: jikos@kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] HID: corsair-void: Use %pe for printing PTR_ERR
Date: Mon,  3 Nov 2025 14:21:13 +0000
Message-ID: <20251103142120.29446-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %pe to print a PTR_ERR to silence a cocci warning

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202510300342.WtPn2jF3-lkp@intel.com/
Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 drivers/hid/hid-corsair-void.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index fee134a7eba3..5e9a5b8f7f16 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -553,9 +553,8 @@ static void corsair_void_add_battery(struct corsair_void_drvdata *drvdata)
 
 	if (IS_ERR(new_supply)) {
 		hid_err(drvdata->hid_dev,
-			"failed to register battery '%s' (reason: %ld)\n",
-			drvdata->battery_desc.name,
-			PTR_ERR(new_supply));
+			"failed to register battery '%s' (reason: %pe)\n",
+			drvdata->battery_desc.name, new_supply);
 		return;
 	}
 
-- 
2.51.0



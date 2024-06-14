Return-Path: <linux-input+bounces-4365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC676908FFF
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 18:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE67AB29053
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 16:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D213A19AA6D;
	Fri, 14 Jun 2024 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4PqSPx+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28D16F0EA;
	Fri, 14 Jun 2024 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381985; cv=none; b=gUuPirLCvb2m8F2dHVmcV8so5C/0ycpcF79w+uYGjh4dGvgk4tEcjMbwrSMxrIm/WkzA/FX8Uacxs51Xwgpl+Nqx87PyO+XEuKq7IBqQaRnOZhmvQVjiBUcsqoAKKQ0SoEyCgY8emHJhhPHfjZZ6yo0MEA2aLjM6f+yzuclThX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381985; c=relaxed/simple;
	bh=pzm3S6HMOVeyFWqYZPhrsR55wYxhjLxv/jUioaadojA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyhlmIQWTvXYBtpXbxbIyT3ohX+GTEOMpuzBMD05KYJ47vwCIA05pEbeTjk8BAuhJ0wVBHeGiXyHnXzMUXfYcHLbCxADCrYz3/q4vQHaFfmJ8q8Eb6lkX4vdpxvB8xBUT5WVgnO03XoXx4GEeyILs2WDJbgw/V1nJAfSId6oPUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4PqSPx+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so22812295e9.0;
        Fri, 14 Jun 2024 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718381982; x=1718986782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOug+sGnOedNaeHuAUNT9DOu+x/5Y4V1q2YZhTmFj8s=;
        b=R4PqSPx+Gu6CYt1tKKiNMmc1IonugGa7oIMIbHZuW6s4y3tx5p8DVxVYYtBVo9c3T9
         Q4TZYPXamLTNEsNGdhdufUGzZKDjGDSlLTZOGFJfZMRb7e9u96Ks2BV6M5884spt+kdK
         GNkJhWWrXWquMhE/lDBgFFHXQ5vbjEzyjRim81M+3l3u4q8rf9TBEJ4qpsyNIk1wbFNO
         lcasnxknX0dYmDrcLxQuEtmo1yGeJ15dTqmknWPqo2+P2Pg67IzaXTXujrtNLBWf+Ck4
         DrJHbvlEuoC9scrsuhwJCqbRZq7C7Wl0PdbvIw81Qa/zHcJ/cXT75lddIf8c2bQRYqaC
         /IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718381982; x=1718986782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOug+sGnOedNaeHuAUNT9DOu+x/5Y4V1q2YZhTmFj8s=;
        b=KiAga5+QWpgQhFZFYfVupAG9pzfJ2e5xh3z5WhUTnPaYZ9yDyo0sW1F5OvaK7ZZzFH
         NI+H8QKmpyEORzy9d3vpAE6Kfi9UhyXFx4tHYLFwsaQSoqZjhVuooVj6KWX1h2/xEqtk
         irsCaRdXevLooICyNXfGUWEN3d8FtrzIzgz6xMMVWaxqP/Z5Ocbed0BJHAXa8rEJsUaA
         AOpIuwoOOWzErAqrxaR7RTBSe7W25YrgAFK2QanJzj9fL4LXfqSn5meJBDmfT7REez+z
         IYHQz5hwcCput8aozUM+5ONnOis7Z3mlm9Lb4bs0ra6CXj4/XQMSt6paQbihU0a5WeNH
         LKCA==
X-Forwarded-Encrypted: i=1; AJvYcCX9MzSnYbTu41QSItDfagpHaB8u0rw5kK1cYn0q+dGGoxDyYrDnSzngFAwAQezBuTSHOdrGMAg9g3QEx1LGQtX5DDWb5+f8e1pH8G+Fm5lv37vYpHUTZItWJh/wNKM9j3EhwfMwqSRZirM=
X-Gm-Message-State: AOJu0Yyvyx/LhVj2jahFoosjXP8/NK+uIrQHl/m35FqzH99b+in6JgJt
	cyRFGe405Q/XFI8+smTfr1Tu+pGjbK2zTHmsmELGBaVlt/IsiBZF
X-Google-Smtp-Source: AGHT+IEw6suXvwf12rmqg2ESZNMniFYRrteAqrsvIP85h/UggupVsP2FPrPXQf5SW3yHlrcuqyYCpA==
X-Received: by 2002:a05:600c:314d:b0:423:2a9:19ce with SMTP id 5b1f17b1804b1-4230484e4bdmr27438125e9.25.1718381982418;
        Fri, 14 Jun 2024 09:19:42 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eefa63sm104638905e9.1.2024.06.14.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:19:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	arnd@arndb.de,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 2/2] HID: uclogic: Add module description
Date: Fri, 14 Jun 2024 18:16:06 +0200
Message-ID: <20240614161935.230529-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614161935.230529-1-jose.exposito89@gmail.com>
References: <20240614161935.230529-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not having it triggers a warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-uclogic-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index ad74cbc9a0aa..26bacbf1474e 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -568,6 +568,7 @@ module_hid_driver(uclogic_driver);
 MODULE_AUTHOR("Martin Rusko");
 MODULE_AUTHOR("Nikolai Kondrashov");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for UC-Logic devices not fully compliant with HID standard");
 
 #ifdef CONFIG_HID_KUNIT_TEST
 #include "hid-uclogic-core-test.c"
-- 
2.45.2



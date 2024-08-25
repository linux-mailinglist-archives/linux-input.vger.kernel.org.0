Return-Path: <linux-input+bounces-5843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFB95E204
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA30B21CA5
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B74812D1EA;
	Sun, 25 Aug 2024 05:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsUVSO+Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982985931;
	Sun, 25 Aug 2024 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563018; cv=none; b=ScnfdwgqtaiJZeQzy30nXq4TeDSPTTY6YCaB5ssEhUHXh7yqv3M+OkpZrzuYsxsb2We+wKzuHU9+6zceEoKO0m4tTl7yE265eH3bYaw5hVt60TpUeAf4707SAgNvA7VP37Bt1OCysdRd08rbVAHiC6GC0xfPUvwZIUQgieSyf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563018; c=relaxed/simple;
	bh=8u/RKtoqbxN7uxSrDW1oudpA5Vw4YPRdgvHxBWSbWZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeTDG+sToIgKxAmEgdSkcnNEDzTX56jbbL0yAAU3IADmEa8+SN4fKhtMIzdsSzxIIUKbvQm/xBTZje80LjSa4iAVXEIVnU/GT8udIqnzYV58SQfupe7A5Ja3tcDuvfUScLeVh4/kexyLPnpBkylT8tpFkj3TM5Jh5+yCWjyyR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsUVSO+Z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so2512896b3a.1;
        Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563016; x=1725167816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqe1CPNPyPwWJltZY/tNpoPncj2b2bW7ofGMYanWSqo=;
        b=GsUVSO+ZdkLLpifLfO5I0HQXEi2eNjiPD5NmuHHM72d+D+gF7JIWzZTO5itJb+Lcrr
         +ypy3fgKzDB/A7XSONRqalRGtowZC3SRd24uHyfgkcOtzgM3KjWgOCnD8f1UTll9mpOC
         wZ4lYJyqYhCSn+lMVcD/hRLMbdouxDGjRShopUYi00ZqZxMhuaexOZZHZygWhshE5uuJ
         9gc9RbGQwfnrc70rqO5q7ZSETK8jCq/dvwE/qJ8CQAQmSvSXtVAiT+WQ5a5hked3mNkf
         aMvIJ64RC6CLdFl4eWeLgQK8pxorsfi6np9YhjTXxjbuCd+bQSjqSB4Zq2zEK3kTsxFK
         QYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563016; x=1725167816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqe1CPNPyPwWJltZY/tNpoPncj2b2bW7ofGMYanWSqo=;
        b=FHAYbtd+HxmQaAJEgGEGDM0KLthdISFQKVNqhi/xJZ9YYIIGyqLgzKkqbmhU6/6CG4
         9BxSiPimvwag69dxySoR9OOxx3aHwZjYvBYyF1czD/TnLpVvvYkvgcJ3ie43xA3A5deH
         HERnt0vqkMNCMBPSHLVsRkNyL702JfgKI6/7HSHtvyHwfcSw+MLfz7LjsEvexbORfR4M
         V6qHbVfwH21KPqvjORZakhYcDdQyf3cciv1nRFTtRTIZyIPNTkVbz9zBbGKzVNPYWuEN
         wXaxByYGW9r6/JUIS7tdUkiS2SFFjnEsvdqg12mxUFXFA1bniLSE1+TmxFs4zmco9+58
         VY1g==
X-Forwarded-Encrypted: i=1; AJvYcCWyBoazg1RDToGCURmDZvIJ3KofbhWBfa1M+ARek9ErzE451r7oTpsPTTMHpy8cY1UM+uEY5Dn2sqOU83E=@vger.kernel.org, AJvYcCX8kA7HhgXZ8p+nCF2ksL8fgB83e2Ppwtg2wjLmguCzBUfwtgxCNL5HrYXNo8k5l2QzT9ReLeq53lIShus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwByrVbelQ3K2tR7lOGpdJ+VEHL1DdaD2QDRL+hmI+YWiLKa03q
	tMgncugJMG+NaBXKu48aE9LlsklXvlsuPPb4FFFJdD5Eig+lVyjXCdSVow==
X-Google-Smtp-Source: AGHT+IE9hfgPOc8K99rlo2yxdGDK0Km4IWYmEWtHARTyEvzXLFTX1fk3uYEqzkP6IiseW8pPeV5XNQ==
X-Received: by 2002:a05:6a00:228e:b0:714:2cea:1473 with SMTP id d2e1a72fcca58-71445883e36mr6910331b3a.23.1724563015700;
        Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 13/17] Input: pmic8xxx-keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:17 -0700
Message-ID: <20240825051627.2848495-14-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/pmic8xxx-keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index 26a005f9ace3..35d1aa2a22a5 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -630,12 +630,10 @@ static int pmic8xxx_kp_suspend(struct device *dev)
 	if (device_may_wakeup(dev)) {
 		enable_irq_wake(kp->key_sense_irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev))
 			pmic8xxx_kp_disable(kp);
-
-		mutex_unlock(&input_dev->mutex);
 	}
 
 	return 0;
@@ -650,12 +648,10 @@ static int pmic8xxx_kp_resume(struct device *dev)
 	if (device_may_wakeup(dev)) {
 		disable_irq_wake(kp->key_sense_irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev))
 			pmic8xxx_kp_enable(kp);
-
-		mutex_unlock(&input_dev->mutex);
 	}
 
 	return 0;
-- 
2.46.0.295.g3b9ea8a38a-goog



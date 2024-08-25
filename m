Return-Path: <linux-input+bounces-5844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8A95E207
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6871C214D4
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883471369AA;
	Sun, 25 Aug 2024 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjDzNU43"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2E3C466;
	Sun, 25 Aug 2024 05:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563019; cv=none; b=FE92Tr0/+BIPTgrgPGSxGfEhJYz4WjzthVbTLp2Dk2tFkYEgYAfn6PPk1pzANvCllAggS2GXuiiPI4rP7v/eoshe/tMwXYSpexAvKMVtBOXT3lDcAFR57BpAlPR4Qjden4tORXBm3f2SMuUp8Wj7ZE3uCqN9IX/7vF2N9Uat0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563019; c=relaxed/simple;
	bh=Pv/v6XA5FLvxkcuQkdC8NGA83UZemTXDDXhaA5ziTec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bngRzu/yEnJ9I/qqnmpCiMSlHrBPKdpRbBiNP2aA2dV+wTS7ySdrrOzIxix6R04cOp/gzwxeaLIr7TI/Q2a+6mT/spB2LtNLtSb632yk0bfmB/dvdp21+vD4r+EQmC/pvRHMqrjSQ+Hfibst7KzsGUK0OOH2CtiSAML84yYSonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjDzNU43; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2021c03c13aso24234095ad.1;
        Sat, 24 Aug 2024 22:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563017; x=1725167817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6On2/1bDkxm+R+4fGzTtvwf3YjBZiAkFwRYzWZ0YLaw=;
        b=YjDzNU43bVM6107yn09oqkjQMLLw7K9ASQmVYKswPe40A3Soo8HQQC3pDrtxlUpcRl
         W+g/rNTFlGmXC+tKFEsAxeLz06c/XdCL0XKxr1nZNbhjfCjqG+Wb72tJP2SbDAItZQ1n
         YmrNd1GzUwu1qd5n/0YyLYX2XKKFb2Xqi37SCl4famrxcoLTt86cr+eseE1g7FLb7NBH
         kPpSI/6V/8eE/gR93JbHflyadHiFQ34jGyI+dvwGADhJ8FepfX18JgV/tROW9Q56nHjy
         50HmOy/ejqMDPSiBB6H3Md8E3Gc4ERb4GlgIppMvr4fcltdipSiJX44262BgTmakSZeT
         zeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563017; x=1725167817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6On2/1bDkxm+R+4fGzTtvwf3YjBZiAkFwRYzWZ0YLaw=;
        b=oKZctDGIfBu1aUyK0NwkGSN3ay3wgi5pnS29aqMCCARp0galY0uPR4zmjjhV6TdunF
         izqnsjCqezzkSnPsRLrP4QHQP92hqF3xmaxs8MOAAHAf89lzRmjrnMdsTUPnkg0nIELS
         dW4VSMRf182sefzzh/BtQDnVsLHCbikAWVlcJMja4JjjE05tWWeWRgOWPBHgaU5jNCKG
         uGJc23KWQZROyrpnvDp1zMk4jd5IlmEm3l2pzkBsxZLxxg1tAivpx+PA+Nrj1nelS30t
         PV/AI52ZV5f0iB1LCi9wSyNSpuYJTsVH37StjXnHDrQk9lt8qHZR2YK1zR/dZEpJ5yYq
         iF0g==
X-Forwarded-Encrypted: i=1; AJvYcCVdZJu2Bfd8cPMr4GOsBaWAaRzdSogFpUIqy5BuWRXVEkmVyVhdz+LUaMja2DCcngLVCS+/d4UJsZM3WkY=@vger.kernel.org, AJvYcCWa0Ph0oSGlVVAhMsa0XZikWXXhGoFrvDwnzFZyD6ltHnPsTq079Jkul2blqnzWpDOuM36kmtELC3oKCfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBb7jPGzeHcuysyoMlSnqPpfPTa6kvdlLEFonHXoDFlQ3XOo7
	StreEob4OswgQflbOsJsO0PqxC0OuqjsVEYeHmAuJgCy6wyTJJCUxayVNQ==
X-Google-Smtp-Source: AGHT+IGTPS2b+A1C17aqp6MUwEwi5FNiFSaX+X5FwBh4QbkvAkE9nJITwi8u1xgUd3TXRjDwffCIyQ==
X-Received: by 2002:a17:902:f9c8:b0:1fa:1be4:1e48 with SMTP id d9443c01a7336-2037ee28d69mr115710795ad.11.1724563016984;
        Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
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
Subject: [PATCH 14/17] Input: pxa27x_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:18 -0700
Message-ID: <20240825051627.2848495-15-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/pxa27x_keypad.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 3724363d140e..38ec619aa359 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -682,7 +682,7 @@ static int pxa27x_keypad_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct pxa27x_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
-	int ret = 0;
+	int error;
 
 	/*
 	 * If the keypad is used as wake up source, the clock is not turned
@@ -691,19 +691,19 @@ static int pxa27x_keypad_resume(struct device *dev)
 	if (device_may_wakeup(&pdev->dev)) {
 		disable_irq_wake(keypad->irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev)) {
 			/* Enable unit clock */
-			ret = clk_prepare_enable(keypad->clk);
-			if (!ret)
-				pxa27x_keypad_config(keypad);
-		}
+			error = clk_prepare_enable(keypad->clk);
+			if (error)
+				return error;
 
-		mutex_unlock(&input_dev->mutex);
+			pxa27x_keypad_config(keypad);
+		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(pxa27x_keypad_pm_ops,
-- 
2.46.0.295.g3b9ea8a38a-goog



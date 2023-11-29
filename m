Return-Path: <linux-input+bounces-333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A557FD8A7
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 14:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAEF7283002
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 13:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A302208AB;
	Wed, 29 Nov 2023 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXEFJcAs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E17DE
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bba815f30so2585669e87.2
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265908; x=1701870708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rhQHcx3LLcsvi8JsQdTsfI9bgCOlf/fMigiqEoXsPs=;
        b=vXEFJcAstXiaAnzdX1XtoXw9BOH2o+1qXPpY0bnLEgjJLOPUCR+F3eccv1cv9H8oUx
         t2TPgQfjaketUo0tMhl7y4g5V9Zba1Khla+fFWZ8T5sCZtMIBX2ViAmWFii64Ts5NoNp
         umT9Ev8KqDti3scLkOMMK6qkrqO/29yq5j6WrspkBo8zscw7VCGJtZbl6h8Mxi4F74nQ
         DBmNSYTxJEB+WER3fRcnrLg1GN3bB85yS9TUGfcYYMGBmidrUHb6OLof/p2Ln6EfYS5/
         PzBXCCMjhvB8tl/IJu/7ElNqO98x0JscfrSw4Op0k8ksQHEsqu/qdl4HnRkWjS1rQT4m
         A7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265908; x=1701870708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rhQHcx3LLcsvi8JsQdTsfI9bgCOlf/fMigiqEoXsPs=;
        b=ovV6e1J7fsxaqgrtiy4bdk+QM9iZiEV84C/gqouAQOxHT8wA75NfJ8PHbEbZO7d53+
         xws7tlhDrQSXPyc5Sg5nj/hDgJb2Mz8fDsqqsI+l1NPUMOEr3w6Na0ZunCJNZryDFnYR
         dSK6brdsaSBKXuo0gAznC+FNhrOt786GO3wK9MGr8/hyNa4OTds3+36IaQEtjGxpZGsd
         M+riy/emHTdgweEEj56h8jCs3f4Fec894tdUQwl2yvsUk4SuRQ6v3OaqLD4bNWe9f1+K
         2P2utwu1bO3t5+3877rb4K99e3b6rZfUfbtFSSDXpdarMoZsK/9eL1oHs5pCM4Hd6V5d
         podA==
X-Gm-Message-State: AOJu0YwBntTZDO5qyPIm+Ti6stKuxx71nFXmrg0vSwECz+jVg2RJ6ylO
	7mpyO3ys6fPXr/lDtMXP5l0bTgDx1AXiC5XWoD8=
X-Google-Smtp-Source: AGHT+IGChNKjkESbJaRp/2YhhSchIiU+eXNhaGZZuGROQ4g/oBNKRbUy3N7ubX7TpW+KphpbHy+rRg==
X-Received: by 2002:a05:6512:114d:b0:509:4599:12d9 with SMTP id m13-20020a056512114d00b00509459912d9mr16538440lfg.6.1701265908147;
        Wed, 29 Nov 2023 05:51:48 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b0050ab88758b8sm2164280lfl.84.2023.11.29.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:51:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 14:51:46 +0100
Subject: [PATCH 2/4] Input: tca6416-keypad - Drop unused include
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-input-v1-2-9433162914a3@linaro.org>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
In-Reply-To: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The TCA6416 keypad driver is including the legacy GPIO
header <linux/gpio.h> for no reason, it is not using any
of its symbols. Drop the header.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/keyboard/tca6416-keypad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 8af59ced1ec2..677bc4baa5d1 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -14,7 +14,6 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/tca6416_keypad.h>

-- 
2.34.1



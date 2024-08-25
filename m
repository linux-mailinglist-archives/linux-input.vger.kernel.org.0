Return-Path: <linux-input+bounces-5838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3D95E1F5
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9F0B21A9E
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF88C7F7C3;
	Sun, 25 Aug 2024 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E64TMfDF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E678C93;
	Sun, 25 Aug 2024 05:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563011; cv=none; b=i7FLDd+vPYphqvYaA7cJrC1YxJbmRPqZEa85qX32vDvvHrgbJfW0AVh28U+1xrtPRn2J2U3TI3t6dXhKDzmisSV6h8qkOxYBSU6COdQ+gDoE+2GY6teFkP0nGTAV/7NRvSWULXfD1YO/DaJOIQVws4PG/LF9C/4s6XFPF5rP2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563011; c=relaxed/simple;
	bh=sqiJcekYlNvrERH/iNSK4e0C6d+JRc5y3DgjnZym+KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tAvyH5fXI+f/ZJd8wsAUlXAEnUiDk/GMKdefTsY3dj/19Zu43BqwGX8axi42gKhp+aiRnJLWeboVyV0W6KV8k7NLJavxh28jLM/WFFx+wb1xMfk2wpCXghafsMYcdceucJvP/bv9W3Vyj53fY9VRAt/AX1sJeEx8eqDyiRH8+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E64TMfDF; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-273cf2dbf7dso2260960fac.1;
        Sat, 24 Aug 2024 22:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563009; x=1725167809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+36NNSRmVK5FdylQPpVTYi2UVBcAisEyHgKp3fnH560=;
        b=E64TMfDF+Sm5RR13I1VktQC/zvcrh0qIZqGXgdNzK3eqRJNwlvDm1CN1qfsEdjv805
         UcO7To85W7j5MB5U4WT0iheb51HPgxyqgZkPrRMMbERXJq5ClE3wG2t3PJmazTYMQUHU
         BfGV6ct4MSmZMIkJAViwNHLGlFuqvNH07Dlj/OFUNDJ4QgrJJUko6mhpC1CyaWbvl248
         uLDCG/qTaaIKUv/vAdPNK3ADj4XAciX28ooarfZOh8BpBnqPOZrxNeVoGpVphehNlrC7
         /Avp2ZTZm6WVe9QUv5zyCWmK/JBepyjUjjONCGZusTf7bBf/7GunLL4uD8L5RYVgny0A
         fcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563009; x=1725167809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+36NNSRmVK5FdylQPpVTYi2UVBcAisEyHgKp3fnH560=;
        b=j11EGJMDS5fyem0Y4MYVR5BGTjpLn5gJ8kZA7ZsD923ql7WWIr707r3hKY0SNgFvdo
         LQjJK1M4CjnlG2edo96yMPAyB6Cm3MWfpk6+X1lbufMFrJrh2iCwsTClquQtwSyWJ/+7
         fEDFP12isd+HBpMCoMxo8QMiilNHC3mWsw/GlVs8Mt2qI8MVX/Cqi7+nk4agLFO0ti+Z
         UPOF4Nlk+92gZykfq+8z5F+El27uXlASiDXQuXt1wIYD0l3iZvCUGmzSHRerBPgdj6c7
         jPZxGs2iRrJZPhIK+E+B7FxqSPHPev4j0VeDN8foX+8tCmlls8ZSMpD8AEYl9cdnVhgr
         TZCg==
X-Forwarded-Encrypted: i=1; AJvYcCVElGkKoLPIPRhoG8i2VMf8xLVjIpHoGzujYNaZNeBi7CD/F9jsQj8JGn/l0mmaOBqfx5y/5vxe70j87sQ=@vger.kernel.org, AJvYcCWTJwZISF+cYrgVnNBUvAGteyp4H8x0n4jjDIevRPTzE8obZpqiqZLoCDK8pVWKTO0XNUUuqGVl8bXxfjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuA+OweMkfEd7Mbg5btuteQ0VfVNiP4vUzVPaCB6IoGCci5Pmm
	vkcgvFjdtNpa3T4LxuvpUDFwAE2SmqG58hlBJH8WI/4Iq1UIL04qwpUSqA==
X-Google-Smtp-Source: AGHT+IH50jfqsAxngsJyrNPRIognUKjg0ENHDCRW+P0AHBitO/WlT6UscLBhxwYmGb+kHjshcMLPag==
X-Received: by 2002:a05:6870:2010:b0:270:1fc6:18 with SMTP id 586e51a60fabf-273e64458d2mr7894304fac.3.1724563009229;
        Sat, 24 Aug 2024 22:16:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:48 -0700 (PDT)
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
Subject: [PATCH 08/17] Input: iqs62x-keys - use cleanup facility for fwnodes
Date: Sat, 24 Aug 2024 22:16:12 -0700
Message-ID: <20240825051627.2848495-9-dmitry.torokhov@gmail.com>
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

Use __free(fwnode_handle) cleanup facility to ensure that references
to acquired fwnodes are dropped at appropriate times automatically.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/iqs62x-keys.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index 688d61244b5f..1315b0f0862f 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -45,7 +45,6 @@ struct iqs62x_keys_private {
 static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 				  struct iqs62x_keys_private *iqs62x_keys)
 {
-	struct fwnode_handle *child;
 	unsigned int val;
 	int ret, i;
 
@@ -68,7 +67,8 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(iqs62x_keys->switches); i++) {
-		child = device_get_named_child_node(&pdev->dev,
+		struct fwnode_handle *child __free(fwnode_handle) =
+			device_get_named_child_node(&pdev->dev,
 						    iqs62x_switch_names[i]);
 		if (!child)
 			continue;
@@ -77,7 +77,6 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to read switch code: %d\n",
 				ret);
-			fwnode_handle_put(child);
 			return ret;
 		}
 		iqs62x_keys->switches[i].code = val;
@@ -91,8 +90,6 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 			iqs62x_keys->switches[i].flag = (i == IQS62X_SW_HALL_N ?
 							 IQS62X_EVENT_HALL_N_T :
 							 IQS62X_EVENT_HALL_S_T);
-
-		fwnode_handle_put(child);
 	}
 
 	return 0;
-- 
2.46.0.295.g3b9ea8a38a-goog



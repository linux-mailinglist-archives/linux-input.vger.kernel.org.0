Return-Path: <linux-input+bounces-4297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E290090272F
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 18:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDD51F21EAF
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 16:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9884A159906;
	Mon, 10 Jun 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB352gYe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD8158DDD;
	Mon, 10 Jun 2024 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037789; cv=none; b=Rw12Yd1qeoGiWjsO4GWDTQg8OBmoIcDIt3OQ0NUNIA6MYq/dE4vYjIAa4b8ZGgNeIwT6/6Hgzjpr1CHI8SejZ3Meb88HbbZZDUXJUyaYK5L1Np6RUEgMJFX3351eYxQ8cwnzHTjFJBL8+7N/9nwxZcmYnPJd9TsEdAE8EU2VAq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037789; c=relaxed/simple;
	bh=MIurSoSSt9UMNcU8rMUkViP6+MSKKbqSoe0jANf2I7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOVWkOxTm+vID/PjzgY257uDgyrff7UW2LvwSLo9EHszGkYlWxdeNGj4/QPKQSUvEuv6LKyOCSK9BThqNoe93FADphRF1TX7h0PVhl7QEv2BhH2ZxVFNcNvMqBN50X4YdAJyx/ghYMIhWVmNiLPsMFgEA4T4yIuUaJRiHAfeYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB352gYe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b594deeso38119025ad.2;
        Mon, 10 Jun 2024 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718037787; x=1718642587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QB4h0GreS2FpZ8gwTT0yYN5B4QpL8DyuQc8MSaq4UA=;
        b=DB352gYeGEYRMGFFwDJeSfXqaIf7MKGVyBQ3EPUk0T2+UT7eiNA8wOybKm4xrgyJHt
         KpDhF5cL8rmKPjn48+jNMGv5h7XcWNBsiQQRs6ORO1u/+r19BLqXOwap5E1gMLInOCjl
         N+RFWbKj8FpYQbqydM9V2UDr71/OKQRhtUioTFbthXunoATa8CymhXlx4lWG8R2/pcKT
         6ajarEZfzlQHwI0OtFyxJNtk1//54E6g1m05F2VCryLxBD/I7xVD+WySGb+F4LteQsmX
         nmQzee2QTminCSOV1K5WhQf2Dj3WfDaeDPb1/N9S41BFYdCelIQhUOFYy9iJvCALGVtG
         xRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037787; x=1718642587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QB4h0GreS2FpZ8gwTT0yYN5B4QpL8DyuQc8MSaq4UA=;
        b=O/WfhWs6JlQoDm/Lqvmr0/eO5B/3Zkz7FRbXwwxEFIQStMcGHF/EmitvodUbjbXcjY
         5N96qLFp4/+a9vs+TAJZoJivcO67KU01kQKRQbrJaYoGTYyUjWoVaCHX6PJjNSBhjiSS
         0KmvGBxj5oHJN3pKSmA7hFCpuj/pDTDYE9VCC58HuoHuI1KIOaHA8a29a76Mbq7vz21f
         iIfwWN70fc4y3qHXIRvAS+qCuAefUroqb6tVwct722zJfwzyUhxMbk/+7fZBjPNrGb6F
         V6rXyRiNkkhfsEeRQaGjVy5Sd8Ytr2LP/x6P/qyqqUCL7Fhk5M5NOjamjbDKS7aaS/Ep
         nD2A==
X-Forwarded-Encrypted: i=1; AJvYcCV9xazcsVS2hNoygm/F+365A8tN1HtKkeACtKDxqh9y4raFwvPey6HjapnE+aE5GxjX9gYdudT7fs5eL4zuFGRSZSjfW+aGAsloWnMp
X-Gm-Message-State: AOJu0Yz4bXN5DmD8rJ+5hT5Kylg+QxVWNAdXNuKVkZ2tHi/A/uVK+C37
	hokAXln1xlhbnqyftfqqiuxgq6RUkU3P7DQLBHO93CrK4Ydrb90+3a7diw==
X-Google-Smtp-Source: AGHT+IFWygY78JM+DU3KmixueTP0lS+a6n7LqLrY5El0iLZUr5XMsUEHLCPoeyO35xEUC8+DBd5Nog==
X-Received: by 2002:a17:902:cecd:b0:1f7:19d6:fb0 with SMTP id d9443c01a7336-1f719d613a3mr28419395ad.45.1718037786897;
        Mon, 10 Jun 2024 09:43:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72479ab2esm5235845ad.308.2024.06.10.09.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:43:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] Input: adxl34x - use input_set_capability()
Date: Mon, 10 Jun 2024 09:42:58 -0700
Message-ID: <20240610164301.1048482-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using input_set_capability() instead of using __set_bit() to
make clear what exactly kinds of events (EV_KEY, EV_REL) are being
declared.

Also drop redundant calls setting EV_ABS and ABS_X|Y|Z bits as that is
taken care by input_set_abs_params().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: new patch, split out from devm conversion at Nino's request

 drivers/input/misc/adxl34x.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index fbe5a56c19d1..830acf29c32b 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -769,18 +769,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 	input_set_drvdata(input_dev, ac);
 
-	__set_bit(ac->pdata.ev_type, input_dev->evbit);
-
 	if (ac->pdata.ev_type == EV_REL) {
-		__set_bit(REL_X, input_dev->relbit);
-		__set_bit(REL_Y, input_dev->relbit);
-		__set_bit(REL_Z, input_dev->relbit);
+		input_set_capability(input_dev, EV_REL, REL_X);
+		input_set_capability(input_dev, EV_REL, REL_Y);
+		input_set_capability(input_dev, EV_REL, REL_Z);
 	} else {
 		/* EV_ABS */
-		__set_bit(ABS_X, input_dev->absbit);
-		__set_bit(ABS_Y, input_dev->absbit);
-		__set_bit(ABS_Z, input_dev->absbit);
-
 		if (pdata->data_range & FULL_RES)
 			range = ADXL_FULLRES_MAX_VAL;	/* Signed 13-bit */
 		else
@@ -791,18 +785,18 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 		input_set_abs_params(input_dev, ABS_Z, -range, range, 3, 3);
 	}
 
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(pdata->ev_code_tap[ADXL_X_AXIS], input_dev->keybit);
-	__set_bit(pdata->ev_code_tap[ADXL_Y_AXIS], input_dev->keybit);
-	__set_bit(pdata->ev_code_tap[ADXL_Z_AXIS], input_dev->keybit);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_X_AXIS]);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_Y_AXIS]);
+	input_set_capability(input_dev, EV_KEY, pdata->ev_code_tap[ADXL_Z_AXIS]);
 
 	if (pdata->ev_code_ff) {
 		ac->int_mask = FREE_FALL;
-		__set_bit(pdata->ev_code_ff, input_dev->keybit);
+		input_set_capability(input_dev, EV_KEY, pdata->ev_code_ff);
 	}
 
 	if (pdata->ev_code_act_inactivity)
-		__set_bit(pdata->ev_code_act_inactivity, input_dev->keybit);
+		input_set_capability(input_dev, EV_KEY,
+				     pdata->ev_code_act_inactivity);
 
 	ac->int_mask |= ACTIVITY | INACTIVITY;
 
@@ -874,13 +868,13 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 
 		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_3D)
 			for (i = 0; i < ARRAY_SIZE(pdata->ev_codes_orient_3d); i++)
-				__set_bit(pdata->ev_codes_orient_3d[i],
-					  input_dev->keybit);
+				input_set_capability(input_dev, EV_KEY,
+						     pdata->ev_codes_orient_3d[i]);
 
 		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_2D)
 			for (i = 0; i < ARRAY_SIZE(pdata->ev_codes_orient_2d); i++)
-				__set_bit(pdata->ev_codes_orient_2d[i],
-					  input_dev->keybit);
+				input_set_capability(input_dev, EV_KEY,
+						     pdata->ev_codes_orient_2d[i]);
 	} else {
 		ac->pdata.orientation_enable = 0;
 	}
-- 
2.45.2.505.gda0bf45e8d-goog



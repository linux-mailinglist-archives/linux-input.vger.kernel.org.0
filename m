Return-Path: <linux-input+bounces-6151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1D96B025
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F431F241A1
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4A583CC7;
	Wed,  4 Sep 2024 04:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIjCz9mU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8CA82863;
	Wed,  4 Sep 2024 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425374; cv=none; b=cN0Vr+8wvP77wuuW9Ui3yhT/yGULQhP9HHyIsc2F4xpIJ/wpdwMNAP+bl7F9K9brQJ6I1m6inU8jwBHcWXQeZDi0g1ojgyV4wMSjordwU2SBMCSAWeQBTP8UhTrf1MGJ1wim/15IVytuT5hLurh9FT2kb87Cx5KKbivG5+1ez8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425374; c=relaxed/simple;
	bh=SQRFpRxySb02gVqyZ782C5GM1DtxFXd/MlnoQvm/3dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3p1ZmgqHxsC1eaN7BfbrT+1GcwdvOuKCt0PORKCQw6mvEyfP9o1gjAW7D+Z6yvjKRLxb6ntTZBO5m70Na74uH7XwL2uA8LYnv2D7WmmjFbG9Z9vApch4Tyj0GzDdd82bnJl8FH+Jrz2HA1IVB6sPwtFyUjbbf9ihWLHOGHcHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIjCz9mU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7092dd03223so1990083a34.1;
        Tue, 03 Sep 2024 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425372; x=1726030172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR9UU1kYO+J4sEnQlebP6OayNwvuBqZFhQRqEobtUCo=;
        b=YIjCz9mU9GzpjpVjrbRw2A+4HHn+Nzq31ZVjA5obVrUYNZLpu1CsvFAcJx1zANJzSe
         WjRiglEiLuZ2RswR2XXmRtwwsqm7ZJQJtrkQ8AT+Gz944IjunyvBlFH/uTDXW8tyhyNE
         9y1M38uhAFtDwWKM7pFrJghIoGHiZ09y2pr67EvOpLOIT9wEXwGH5w1ToVFEiGE7dfwV
         snJZMbmjQKn3S4pakWugpJrdfIaLMEZ2v9gbjev7liKUXcF/D8N+/GYBqk58kedUX8Jh
         m+3WauSXIOUOkTShgtnY4F+BU4+jGB3wWeyM9U8Erj6avloBcgu5Cuy8j+F9cORA+U1J
         Y9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425372; x=1726030172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR9UU1kYO+J4sEnQlebP6OayNwvuBqZFhQRqEobtUCo=;
        b=e9h7yl4MXUmFbcvQaPgB81tHOwXCZNSh2FtqTkM+eV8VV1PJHUoobg+nE9B2V5wies
         m0IsHMGaTGJCezeMnbPcfi1XtmR02orxCkSkTWlqgu5TFirAOpr46OrYzFA+UIPvUZ2Q
         qLsGOEq0U2ceYWN5R5u9Tk9c3/myEMudA8bhcJ6CXAw0NX9ZXuVUE4RGswYo4lNuX2Ba
         F44xnnVtQr73o1xVwS/VrR5VzOJcN7+XQEURw8Nhd5ZmXMwPONN+NtJYvLA8SxV2G+73
         3FhSD6GvlESGvMZ6AmeQToyPRZjn3bd2+0WFY/RzeoWDJXW4uzO0ggxqsrTQG6qVaMDO
         S1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVgCqGVO1IQ3AFKlQx1BDVFo+9xJYOTgg250iok9Tfo5skl+bVml36PFUFWfN1LyImgGn1808W91M3Alo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2I7gpKYiPb5kQHpipNZTAhfhqrXiq+1xzzPInXH2omyFS5B+
	iIuiNQuttnMSC1FSY6vb88rv89uFaqNZRnusffr9JsVqJwdo3Lx9MXV6nQ==
X-Google-Smtp-Source: AGHT+IGJMb5zmmPT7Snj4k4w9D6jZ1WLtYhHqNBtwVekeAJ1zWgrmZ6lTgUWxeZ4LbtYBxTd9O7Idw==
X-Received: by 2002:a05:6830:621b:b0:709:3d2f:7b48 with SMTP id 46e09a7af769-70f7072eb57mr16296489a34.24.1725425371520;
        Tue, 03 Sep 2024 21:49:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785305fbsm718093b3a.45.2024.09.03.21.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:49:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/22] Input: rotary_encoder - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:49:29 -0700
Message-ID: <20240904044929.1049700-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/rotary_encoder.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index 6628fe540834..52761da9f999 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -113,7 +113,7 @@ static irqreturn_t rotary_encoder_irq(int irq, void *dev_id)
 	struct rotary_encoder *encoder = dev_id;
 	unsigned int state;
 
-	mutex_lock(&encoder->access_mutex);
+	guard(mutex)(&encoder->access_mutex);
 
 	state = rotary_encoder_get_state(encoder);
 
@@ -136,8 +136,6 @@ static irqreturn_t rotary_encoder_irq(int irq, void *dev_id)
 		break;
 	}
 
-	mutex_unlock(&encoder->access_mutex);
-
 	return IRQ_HANDLED;
 }
 
@@ -146,7 +144,7 @@ static irqreturn_t rotary_encoder_half_period_irq(int irq, void *dev_id)
 	struct rotary_encoder *encoder = dev_id;
 	unsigned int state;
 
-	mutex_lock(&encoder->access_mutex);
+	guard(mutex)(&encoder->access_mutex);
 
 	state = rotary_encoder_get_state(encoder);
 
@@ -159,8 +157,6 @@ static irqreturn_t rotary_encoder_half_period_irq(int irq, void *dev_id)
 		}
 	}
 
-	mutex_unlock(&encoder->access_mutex);
-
 	return IRQ_HANDLED;
 }
 
@@ -169,22 +165,19 @@ static irqreturn_t rotary_encoder_quarter_period_irq(int irq, void *dev_id)
 	struct rotary_encoder *encoder = dev_id;
 	unsigned int state;
 
-	mutex_lock(&encoder->access_mutex);
+	guard(mutex)(&encoder->access_mutex);
 
 	state = rotary_encoder_get_state(encoder);
 
-	if ((encoder->last_stable + 1) % 4 == state)
+	if ((encoder->last_stable + 1) % 4 == state) {
 		encoder->dir = 1;
-	else if (encoder->last_stable == (state + 1) % 4)
+		rotary_encoder_report_event(encoder);
+	} else if (encoder->last_stable == (state + 1) % 4) {
 		encoder->dir = -1;
-	else
-		goto out;
-
-	rotary_encoder_report_event(encoder);
+		rotary_encoder_report_event(encoder);
+	}
 
-out:
 	encoder->last_stable = state;
-	mutex_unlock(&encoder->access_mutex);
 
 	return IRQ_HANDLED;
 }
-- 
2.46.0.469.g59c65b2a67-goog



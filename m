Return-Path: <linux-input+bounces-6419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03340974525
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 23:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369111C254C9
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 21:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA0F1AB536;
	Tue, 10 Sep 2024 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UF1D18Hh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70498193431
	for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726005535; cv=none; b=X266lY4fh9FoRa4NubYnncwst7kkeRFrBD5p7t0sKxZ33UgA5S5w6FsnQa5+SSlkBE4qqoRQ0k079DURXen3JZPRuiEOeBEi2+QqNaGW26cjo+jPCWDBiGdFoQ10ZN4rX8QmpKj37kQyJoILfVr/x7A3GsDG0dUX/Qd/PiQAzRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726005535; c=relaxed/simple;
	bh=2wDslfw24GSPG0EMYcKfh1mwx17kKgkL32mKlCkYvIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ObaE15U9L/rxOjZ6WZPqShJLgpXc87/s0Ts7UktW0hpxAlqOtfxta7Kr770PftGS02OFVrGXdYFiErF+It2bdRYZeSB2/dm5Ej8JOUx28nCULozHAMEt76+m0NP+JSwAI+2POmiE00phe304t4XFKO7g7ndKQs3NX6c6/dm+UH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UF1D18Hh; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e03974b6a5so1908092b6e.3
        for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726005531; x=1726610331; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/sv5il8mfJbCyj8JT+aqiunnzSEOi+g9TF0iDV5AFt4=;
        b=UF1D18HhKTud/w8MqCnb/C21x53MGt04ZXc/bpGC7gMZTnPaxEVelanZjHvA3fyZDa
         zO+f3Oqb1QEsbEIkE6hyOypmXoc1H9vIWZcVj1yh2QdLqu5a/9LMcARuLeoiWJvc3MGH
         lC6Iy4JFvO0j50BP4bUDFbgWnF93x0FWg2iUdgTIK5fR6JefGNlhKOBEuv6jh1ZVz1Qu
         C5LpAi3qvbvunMIf3ogrBGrRZ5XmvYsJbf3FEt5Xk/K2m2O3mkm06frN2KSoJEpPgRUI
         M9k2+3uUL9IUuqCf3Od4/q+AmzCyO3UDHIhGp5Tv8V3yjRBhfF1a/hTHO2uR0dkt59II
         /jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726005531; x=1726610331;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sv5il8mfJbCyj8JT+aqiunnzSEOi+g9TF0iDV5AFt4=;
        b=UKzVOI6zXkOocj3UEbeKLF6jH0ZZbWIEH7tWTYr2XWcEoGhTHdn7XzIONyrgAuZyeo
         Zso605vCU+7w9jVd99yrRXJL8N7thf3BSalsO7hToGHWCcMuVCzSfwKdyHFV/9My5XEQ
         IqgC2Y+POjqQ3rPyQMzDp+Ez6Ny+J0fh0xEMMAXH2JokiOQAlJ9iZu0YiXDTI+AttgYE
         sVQwmbDdJ5eK4qZkGUjDBQT4KJI7qsbwiekRkXf4/oO2QJUkyTAUgg0cq4EjT95DGTrb
         htjAuqHG6Q4yTTpBlPy6c6Np8S8DceMTkDCMy6hD9SK3PxjbOJFJcNjAA16OH2HQniKl
         Qp3Q==
X-Gm-Message-State: AOJu0YwQU3Q2ghgtJczwmb7RfbcHVr2wq3gJEOCBhJxaNAuNRO2ZbUAL
	t8bmYJFXN343/s2oVPIAskVkybmuxeteJNh5hr+hYESPLnuKFj/B4sEUyBlLLVI=
X-Google-Smtp-Source: AGHT+IGJ5kc7+uhI2aHOq0Bnrhd4m2D91bIKbMlbjCpoIsOfX88bV2ca30yPTSXgMP34rWLP2PM9JA==
X-Received: by 2002:a05:6808:124a:b0:3dc:2878:c2d with SMTP id 5614622812f47-3e02a02d94cmr11088331b6e.47.1726005531386;
        Tue, 10 Sep 2024 14:58:51 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e039b7c4bbsm1760150b6e.27.2024.09.10.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 14:58:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 10 Sep 2024 16:58:47 -0500
Subject: [PATCH] Input: ims-pcu - fix calling interruptible mutex
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-input-misc-ims-pcu-fix-mutex-intr-v1-1-bdd983685c43@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABbB4GYC/x2NSwrDMAwFrxK0rsAxoSG5SunCH7XRwq6x7BAIu
 XtEl8Mb3pwgVJkE1uGESjsL/7LC+BggbC5/CTkqgzV2MstokHPpDRNLQE6CJXT88IGpNzp0bBU
 X72c/u2eMzoL+lEpq/Buv93XdTd90EnMAAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.1

Fix calling scoped_cond_guard() with mutex instead of mutex_intr.

scoped_cond_guard(mutex, ...) will call mutex_lock() instead of
mutex_lock_interruptible().

Fixes: 703f12672e1f ("Input: ims-pcu - switch to using cleanup functions")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/input/misc/ims-pcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index c086dadb45e3..058f3470b7ae 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -1067,7 +1067,7 @@ static ssize_t ims_pcu_attribute_store(struct device *dev,
 	if (data_len > attr->field_length)
 		return -EINVAL;
 
-	scoped_cond_guard(mutex, return -EINTR, &pcu->cmd_mutex) {
+	scoped_cond_guard(mutex_intr, return -EINTR, &pcu->cmd_mutex) {
 		memset(field, 0, attr->field_length);
 		memcpy(field, buf, data_len);
 

---
base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
change-id: 20240910-input-misc-ims-pcu-fix-mutex-intr-9bb7b7a6dda2

Best regards,
-- 
David Lechner <dlechner@baylibre.com>



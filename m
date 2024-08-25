Return-Path: <linux-input+bounces-5845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3A95E209
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509721F21387
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6470313AA53;
	Sun, 25 Aug 2024 05:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0Z66uEw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7B13A3F0;
	Sun, 25 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563022; cv=none; b=Kd+2Tqu7NJt2/G2u15riQhkhyd6tLIMPgDjFXileVDzolvTWW7ur6kisB/T0RXpGt4AA+/FBT5EhDbJsyNyi5fvsJC7sq1hELHqXaADUHKOG0xGdLpq0k9H0X5eok/1ogUBE1b6TnN0zR68JLT+heb+7F22y4C1d3aMEZBr+eO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563022; c=relaxed/simple;
	bh=IrS48fhMXQ2EQDYHGq/C0cKMwPzDtqfAfI1Zv8GuGP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGMWIgtKIQAxAlE/CFgKmITZYV+3r5NuEcMMOFQTaJsg+adwAVlcloDthK/1/8nF65ZQia6cF16L3kuetqNlDEuXFeBNanr9a/AeKbRDapomw16TRIzuVqxjtzWSGWQ8AC9n8Oxg1nWSeAe7LUD/2yBbqg9EkKD3hXsjDfw55Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0Z66uEw; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5dcd8403656so965790eaf.1;
        Sat, 24 Aug 2024 22:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563020; x=1725167820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NGHCiulzh9gyI30mSR8DfFWb1nfUXRaAntbygPzyeI=;
        b=W0Z66uEwZC+qrLjUnM73suTAleI1duNUKlPO+jhot8S0z7a212rS50vnnqaljgc4oY
         92L7cRdczYOXovlRFjZeRmerlQaCqYiPAUkf8+2JSfCwjUm9Dd3WUs4OS6fQO9mGYj7y
         xxjiFkEHoMzn4PXLGG8IeMd1rVtHBBnl5OuPOfUqrCqwtaxhFGkJd3xlbvtSHTJkDRut
         ZeUWvFoEtXAgZKPoppMI1JbEguQu4qVGAUVfpdC0c+maM8tLkZGkXXVA9xEo+1QgtlXW
         JsE/KSvmGAnrMXq5PHQLmGYw5V7eiFu/Swi6ttY7rOuDs5rSxhwhmJH+x15lXcRlrgV3
         0Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563020; x=1725167820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NGHCiulzh9gyI30mSR8DfFWb1nfUXRaAntbygPzyeI=;
        b=h6kOvGittYmgZ+lzXHMtB5vWFdLoEtxPjHeMD8ILFDbpW3WvZYl31mT/z5xZKnqd6Z
         BlNlkwBgRegyyKUmqWzZni3tCYd8JQ+i5Q4FmkID+zYpJi+4pFBfKJIHfn3y3R3uykhq
         XbLEX7d2HNS1AvM6hG9bDcZhnYg0CbTK7AVSJF9Sy5JOvGY2CUOhDW49FRZ+Q7XQKd3S
         DQq1cVBZxSNfiKKEuYEbcjxMQPsJyVIj/HuZTAe3LxjSMU10T4gd2tKii1GtgUM85hbp
         Y7Thd4OETR1tA8Gu3X7ujKXRxjH53qCOB/DQbLWT6ARWcpfZ8bU2Zez6nMypGv+s8zLX
         rDsw==
X-Forwarded-Encrypted: i=1; AJvYcCXpreuBQr/ztIuBV7vjmyuLtXnkbtcZgaiqIK/GqnF3GG7W5LvsUd9kBsNFAxMiqsn6ougwvWdD8YGI49s=@vger.kernel.org, AJvYcCXwlYMxWe/ZsiDTmn8RdOVCs5ZU9WBKtG/5CMC/zCqEfBK8HqpTcvRUlSzvfYhooVlWsuy0/b5y9y52CMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQU6QFRlXbZp8mZgOGTsFRxE+vz5Y5nLRRADdO1D/7ZlTXXchN
	5s5UWl23hDcm5b6a3RyY58J/XdCNQqFeEiiklA/a1/ythZ1AbDbdrtn0rg==
X-Google-Smtp-Source: AGHT+IEQYgbglgd8I3qc/P81ZQRecoGdRxN5BkyvLrd2/7rQzAPvHkH9Capk9njsg6VV/xAvADHbUA==
X-Received: by 2002:a05:6871:2284:b0:270:b0a:cc0d with SMTP id 586e51a60fabf-273e64321f9mr7289887fac.10.1724563019693;
        Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
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
Subject: [PATCH 16/17] Input: st-keyscan - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:20 -0700
Message-ID: <20240825051627.2848495-17-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/st-keyscan.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index 0d27324af809..e53ef4c670e4 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -216,14 +216,13 @@ static int keyscan_suspend(struct device *dev)
 	struct st_keyscan *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input = keypad->input_dev;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (device_may_wakeup(dev))
 		enable_irq_wake(keypad->irq);
 	else if (input_device_enabled(input))
 		keyscan_stop(keypad);
 
-	mutex_unlock(&input->mutex);
 	return 0;
 }
 
@@ -232,17 +231,19 @@ static int keyscan_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct st_keyscan *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input = keypad->input_dev;
-	int retval = 0;
+	int error;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(keypad->irq);
-	else if (input_device_enabled(input))
-		retval = keyscan_start(keypad);
+	} else if (input_device_enabled(input)) {
+		error = keyscan_start(keypad);
+		if (error)
+			return error;
+	}
 
-	mutex_unlock(&input->mutex);
-	return retval;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(keyscan_dev_pm_ops,
-- 
2.46.0.295.g3b9ea8a38a-goog



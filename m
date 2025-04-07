Return-Path: <linux-input+bounces-11550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55008A7D5A7
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 09:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9585316561F
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 07:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8AD226D0F;
	Mon,  7 Apr 2025 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="az8NH4TE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E250223339
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010356; cv=none; b=De3GbZTYB/EQ2wiVgA3HHg7pnbF1s5VBnKle/BGI/9w/Iebfu/2YZ5k4uJWa/Wtd/MJsnXPENwOzw6JyTf8Gg1O6V+T7AAePHJpfOhpmqU+6jt6d0ypVmn2afAEN4eehQF5Y3QVpO3tk67wqWxTJiWLFab9ZqIqtCwrGP1ntkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010356; c=relaxed/simple;
	bh=BlY3UN5r5ZQCn0tDpg4oRi8gowXTcjflrHOZG4T6F4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fHa2jV/3qEXKrHxiJcMB4OGCOLbuqtGn3P7fwytWZlz7yj+mo9M6Ks6rTKX9LBrNXKGS1P3NZJUPpXoN3dY9IMHObIsL9RiJNuSx2OTUR0Orn7IPaEAxEqnA1LP43aBUtDNwlJgDZZqo1+eXoGXvG3WSI1Gxxe8VKkpsgxuP+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=az8NH4TE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39727fe912cso1641722f8f.3
        for <linux-input@vger.kernel.org>; Mon, 07 Apr 2025 00:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010352; x=1744615152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqKh+14kSRTt3VLgemwcn051J7IF3QB71JoxU60RwiY=;
        b=az8NH4TEk+ZEeX8OVtLOqMTMA+k/HIZeKrpuQoIGu2DNEB/VY2gHoXRxCGtsfshwQl
         p+ZKXuuWI7tjDpGvn6okSltVcJTcjNSav9enyyPOq0r7gWcssSbyGnWdFzCFM/uOCz1C
         HKn4emztEJcvmKYq5HhoQ2qW0uutn/+MHQIoH1hIEYyV68Jwge5syv7lAmuylqibgu8z
         /7H0Pl9VJoFBj0/ff7TKHJ14ej0C9vAW3BouNN/iRloXzF9epaJWBUhru4Gg1EDnG5Sf
         i1E1y1/1Ul/HT7zfFZmOGTKfWUE+7YVsUXOiU/8bd30P2uMNF2OJFd4xrj5SvvyX904b
         GDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010352; x=1744615152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqKh+14kSRTt3VLgemwcn051J7IF3QB71JoxU60RwiY=;
        b=YDiw24haysF/tPtG9rEceG0K3DUjCMAr69jvGQnLiWTeSQc6Ny9mLlCsrOD8o1usaX
         b2/63IgFWp4bS4f73viWs8daiS0nF9Iti5QQi+uMMYkA6mjiz1SS8hoXegA9yqsVv47+
         hDODvPW0etoRxPNg1z7Xx8KXXkJCOShgv1O1NKcJJRLe1i22tRaBZ/7jAospYvw5/XAl
         rRblMSF8xGmrxn1d4JMJnld+1nDDfisysSUZ3VrFnI9TousZJfI09LLj4YO3CzmviDrX
         DJQkx/PU/lsKm3Z3ZZ4Tc5BDlGWAl+WENM2c2Y1e4iV6Kvee/jsqHKfDRclbdq6mcmrk
         kSNw==
X-Gm-Message-State: AOJu0YwHbhCcx31gIKzCgnbtG0KdxqNSRddS0MItzwthttvRrMAgqI8I
	6AQFVxC5xPD8a1zxXyW8rBFaRRlGryI2Dse050/1aYL9yt3GZbrBRVTtVR05T1Y=
X-Gm-Gg: ASbGnctdSTr6uBFBG3inA/wTs0wxkrCO81o6tdvtnVrZwWjWKOBx6qYyymEVjJEtMdp
	cgANkJAfu45jdhzURmoSjNDP/hwGDn7Uaws3GNsIsqwjyW51hdqBx/7HgNl/Ptb9O/PWuO6GU4M
	V1S7ACUW/GRm5XtFCYuWBGF9VsmHEDRM3BNdtk795OtJrdZ9aIRzl7esSiu1DotViIdgrC7JK4e
	Pmd43AlQqYMzJL5jjCl7Pr/voPvYENAv66zUCPqysxoawK1l6fYGVZGtJv6hKIzplBK58VIPrJk
	NZTgpeneB5EQ6oO9DyFynJn/ZOgIEPoO80cca/z4M2/iIUw8
X-Google-Smtp-Source: AGHT+IGvMdRPD+kjJ9Hujy59G/36mNIjZPkQ7ysnvQL9hCAIjtiyBVlbUsUp0SDWyYOEmz2lXL6QBg==
X-Received: by 2002:a05:6000:2283:b0:39a:c80b:828a with SMTP id ffacd0b85a97d-39d6fc56dd2mr5544644f8f.33.1744010352600;
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] Input: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:19:09 +0200
Message-Id: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1882cC/x3MTQqAIBBA4avErBvwBym6SrQom3Q2JloRiHdPW
 n6L9wpkSkwZpq5Aooczn6FB9h1YvwZHyHszKKGM0Fqii3xazxEzXZge5BDvCzcr1ShHawatoLU
 x0cHv/52XWj+2dvWEZwAAAA==
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BlY3UN5r5ZQCn0tDpg4oRi8gowXTcjflrHOZG4T6F4A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvMKyHBavWMOsfyMnVmVhp65dXSJW20Oolq
 K6mqIAwtxSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 crMxEACb8LC3x3XGrTmU8mAJ0CIwJGyS9Z6f/YjHflKW3t+xGNYV2Mpa5Sm8/gMmLufd1ZG/7qH
 tL/XTn+onWyHHqhjV6teuLm+sXA+htDwn7jaVRLzNuS+W/EcQYkSgDeY97H1+qF3/k1yrkA3Ki9
 ln81wTFNuo6RKJve5+qmY5goKp2C+HuHYEciQqy+VGtKt071ibqEHH9flV7wiH9l1/e8RWp3ngT
 8c1fjG2HmzWuJINEimIE0Ik7PGSf1yn0yT1SVRcT8uJZLUQzYmdJKStphph0/Iiitsoma6COOIg
 7LKUzu0puqXOUjkViclKytOdXrft3Z9km4lkG809AlVdvBHlOwJ28KQR1cu3iMezKvE3NswtrjJ
 Etlq6wu92rD/fnxOmQ6pUBy6UxXtbV7SzBPO8JIuGr8779328/eiLb3kt9/DU/7tkHjnXINQnjF
 Wb4u5v4DD7KNKGzs0K7pGYafwPRP1IclhWS7wiNIbDCvnSx3P5EPgs66BJQH8LJHPWYH3O3Ob9D
 PKPtiiTLvUfnb+mUIPzMSYoXUE5tUfmR1dexTOqteQRxcyEPS0BybIJDyn1cChWy+4tiIuXnutb
 Mhb92PRqY5+CwzG0TCw1v54dmpk8sNo01zpApnJjuGCJP0mOTMdKJs6dzS+3HvCe2QcM9DDjs6P
 KEzCLIZgo8AayAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the GPIO controllers under drivers/input/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      Input: ad7879 - use new GPIO line value setter callbacks
      Input: adp5588 - use new GPIO line value setter callbacks
      Input: adp5589 - use new GPIO line value setter callbacks

 drivers/input/keyboard/adp5588-keys.c |  9 +++++----
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 drivers/input/touchscreen/ad7879.c    | 11 +++++++----
 3 files changed, 18 insertions(+), 13 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-input-bc12818c5732

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



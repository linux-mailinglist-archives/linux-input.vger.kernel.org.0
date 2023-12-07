Return-Path: <linux-input+bounces-589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB62808674
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 12:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DA3E1F22710
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE8037D14;
	Thu,  7 Dec 2023 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzBXI2MH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6104810CC;
	Thu,  7 Dec 2023 03:13:29 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3333131e08dso927688f8f.2;
        Thu, 07 Dec 2023 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701947608; x=1702552408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY+6+R8v4aRIvSFz5uHIjnM8cd0n2dPdBglyETOqCeY=;
        b=BzBXI2MHrJ4pDxQPfWQP9eEuod9/Yr/x7s6jE9mE8r+BLv1xWzA9EEVG4bHejEae15
         mNcCa2XrjDEdo8U1Jo+GdJrPI5ZSI9/fJ8231tZRcwINBVXub6WGEGSD7mVcQyoFom01
         P6nk6NUVdIEIypyQ36fp89877dygaNC9Ov/AM+Ns7QFunDaGdNP7+qCWniGpuuXBUNIj
         jnuOJHARS2GV9P+LLr+I/MjTHKg0QVPWdmL6PtogY8hINTnOne1RoyDfJqngBZ4NLD4O
         QP5e2g67M/q90mWC+zzu3cm9jlx3f7k5fIbJ0o71tvxorFuL/bN64insX7k7c6Ez4otC
         zUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947608; x=1702552408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY+6+R8v4aRIvSFz5uHIjnM8cd0n2dPdBglyETOqCeY=;
        b=qWPchIpm163CM8n7KaACUCJrEO9tSHFZ/K3cHaZqY+SLhYSEI1cMnpoBQSSHpJskPj
         nXojKr6wGPl+mcidZ+vueeV03x8Oze+U8HqH2nK0Fc5FtiTXkxdzuEP2pKZVa81KYgmf
         jRuH4S8trZNmlvzhK6ObL68EEUBvG1UNM/wKnULTh4BPb5siO8pN34qFWjB3HBaTWhEI
         3A8R/r7QrkbgjAnH/daUcMmolbDB0O30pEfyJK+U07GBJwoR1cll4jjhvlPHIS3uzeer
         gMj5g+n6xZ3yq8jYV6BZmm1XrML6MVUejMMgUAXLC7rL7vHsyy0hq065tURuui2/BdTq
         mzuA==
X-Gm-Message-State: AOJu0YyqhTr+345TcTIDWM3sROURzqv7bTUzkxqQViNHMZUK1Z4alJId
	OoUX2bf9yrgll4Whq0OKFIw=
X-Google-Smtp-Source: AGHT+IEwKw1JVypNLO2jgvKNhNQ/YOGneVAgciUWuj/XaC9Fss2MjipcrbFcF+6gAEFLb9MlHRSbuQ==
X-Received: by 2002:a5d:4fca:0:b0:333:387b:687b with SMTP id h10-20020a5d4fca000000b00333387b687bmr1203565wrw.34.1701947607741;
        Thu, 07 Dec 2023 03:13:27 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:5036:93fe:290b:56de])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b003333541a5bdsm1166096wrv.80.2023.12.07.03.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 03:13:26 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 0/2] Add a property to turn off the max touch controller in suspend mode
Date: Thu,  7 Dec 2023 12:12:58 +0100
Message-Id: <20231207111300.80581-1-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Our hardware has a shared regulator that powers various peripherals such
as the display, touch, USB hub, etc. Since the Maxtouch controller
doesn't currently allow it to be turned off, this regulator has to stay
on in suspend mode. This increases the overall power consumption. In
order to turn off the controller when the system goes into suspend mode,
this series adds a device tree property to the maxtouch driver that
allows the controller to be turned off completely and ensurs that it can
resume from the power off state.

Stefan Eichenberger (2):
  dt-bindings: input: atmel,maxtouch: add power-off-in-suspend property
  Input: atmel_mxt_ts - support power off in suspend

 .../bindings/input/atmel,maxtouch.yaml        |  6 ++
 drivers/input/touchscreen/atmel_mxt_ts.c      | 72 ++++++++++++++-----
 2 files changed, 61 insertions(+), 17 deletions(-)

-- 
2.40.1



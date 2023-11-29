Return-Path: <linux-input+bounces-331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F107FD8A6
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 14:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF905B2133C
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C4210E2;
	Wed, 29 Nov 2023 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyvKDWY+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE8DCE
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc8b7d8ffso348048e87.0
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265906; x=1701870706; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Nt/ipiv6oUlF5/EDw4XOjKktbW66DfEIkDCySpa6Q=;
        b=WyvKDWY+9HLdzm1YeLTPMqoI/3YFrOAm35MNQWsYYnS48e93ZDYdIs9VPcDb7Kjbgz
         gj04URlOXeen0odqzxjqCZPO+duWekHssXr2HPWW/z279o6hsWXCjKHVDg1+mj76ij7C
         rGIqHti27ahj5DYEaUMs1wmtZzkfDmdsylMh1HiMzLSrKsIFsJJX/vfWIXcC2gfZJEDo
         HyQg1LEE2KcQyJprJF3IxE/qWt491DAnNTxzQ7GG5LduxEOUk83OzbQHtXdaTljkc3jN
         j212o/oqetUeggXuHQPzpsjsoGjaiL6G6qmndanZ7/Eygp/NdzIAY97qluc0dsGoGBIA
         mELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265906; x=1701870706;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1Nt/ipiv6oUlF5/EDw4XOjKktbW66DfEIkDCySpa6Q=;
        b=ixY48bGYYBRvQIsqXQMuSdT+g9TDD7UY7qVtgAGqxCZEkPOdGP8KGMk09LO6fJ8BEm
         x6qcvS1r0Yoxs811XTyTsAb13aSUNRa/lGzt9V2+jVK0rDatAlZY1OxhlhsMDQ9sxwj3
         gQjmA6DrFxZHK9u8Ius7yG9tpEFv/ODfeCPE3TgxkLw4QqutbKD2lRE+mAD5QIkXjh/o
         Fswf4szgZVftdf2DtZECQGpeNq4R+IQjdGNUs7PxTz74Xl8XxlRr3SodphZq6puYaB1j
         C9uRIXNrGtypbXu4mcUZqjOeIIWXCJeVErr7UHyagpY/k1/V5BOVombpsGvIxd68GvTG
         1mZQ==
X-Gm-Message-State: AOJu0Yxywth7n2W/8wdW2S3FMJC18mDwafXIteURALtgsNKfvl7Qxp12
	5rnt6kXzmIGodPtAFRUUJ3v0nHCNKtL2eE8gON4=
X-Google-Smtp-Source: AGHT+IFEiMn4A2t+OoXVq2n6l+5Csm2dYI68cP/HuNdtMNbvja176GeKabQT03Qhmd3DQWJUrDO+zA==
X-Received: by 2002:ac2:5390:0:b0:50b:c1ec:93c3 with SMTP id g16-20020ac25390000000b0050bc1ec93c3mr1951683lfh.54.1701265905896;
        Wed, 29 Nov 2023 05:51:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b0050ab88758b8sm2164280lfl.84.2023.11.29.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:51:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] Convert some input drivers to use GPIO descriptors
Date: Wed, 29 Nov 2023 14:51:44 +0100
Message-Id: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBBZ2UC/x3MPQqAMAxA4auUzBba+u9VxEFs1Cy1JFUE8e4Wx
 2947wFBJhQY1AOMFwkdIcMWCpZ9Dhtq8tngjCutdb32KAtTTAeLphDPpE1VOt+unannBnIXGVe
 6/+c4ve8HqTgugGMAAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This clears out some oddities with unused GPIOs, or unused
platform data GPIOs passed around in the input subsystem.

This is done to get rid of bad examples and step-wise make
it possible to remove <linux/gpio.h>, see
drivers/gpio/TODO.

Cc   <linux-omap@vger.kernel.org>

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      Input: navpoint - Convert to use GPIO descriptor
      Input: tca6416-keypad - Drop unused include
      Input: omap-keypad - Drop optional GPIO support
      Input: as5011 - Convert to GPIO descriptor

 drivers/input/joystick/as5011.c           | 24 +++++++++---------
 drivers/input/keyboard/omap-keypad.c      | 16 +-----------
 drivers/input/keyboard/tca6416-keypad.c   |  1 -
 drivers/input/mouse/navpoint.c            | 41 +++++++++++--------------------
 include/linux/input/as5011.h              |  1 -
 include/linux/input/navpoint.h            |  1 -
 include/linux/platform_data/keypad-omap.h |  3 ---
 7 files changed, 27 insertions(+), 60 deletions(-)
---
base-commit: 226edd1152ffe82c080d8ddf5faef69278447c9b
change-id: 20231129-descriptors-input-0432d7f805a6

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>



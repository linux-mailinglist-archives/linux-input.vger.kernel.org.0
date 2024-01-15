Return-Path: <linux-input+bounces-1237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FED82D554
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 09:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EA01C213EB
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 08:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20997F9F5;
	Mon, 15 Jan 2024 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3QVAqah"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EBF9E2
	for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e69b3149fso26489455e9.3
        for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 00:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705308657; x=1705913457; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2910EaSJimoxj7S9UbVP581OYEFXh/5jg4WfdJzrEAM=;
        b=Z3QVAqahulMokf5w2z1so3pibsXYsDo4PUK49nrXz9ohevq2tMEI8OVzg1P3Il8HSQ
         8BWHcAhITQnsf4djFeTIVbNi/WjlwmTh/8Mlvj+KUWg1gr45d4s7UvywHUWhL1X0bNVF
         NCeY2ltF2br49YHWDPypd8ACap0OUUl5jsK7Z5RetE79DfHUAczyyvK4o4sSgsOiQcIl
         EsLfrXd2hDvPqHjW+QofYEULc3sA8iuvTJp4UOP6IbvOnYDVxNgTGFpCZ02w/UvvGqBl
         LSeBEJeAGvEscCVj2rxaGD1tRoMF58ILKvP2qkBZYPFnz7+p3ji5T1/wib/doi33slMM
         eKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308657; x=1705913457;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2910EaSJimoxj7S9UbVP581OYEFXh/5jg4WfdJzrEAM=;
        b=k+xON0u3HtqZzjwcLiS+9hGb9HqJJVwQh0r8CHjksealJzYK/6X/LeRjCHAfPjwRuj
         5Y/DEcC9YRyPsLW5oIx13PXERksAbkKGbla5THmXnN8CghRMY83gMhWCK26ONxkMPHa+
         WdD2mkmH0EQCpjt8NCSnzVuRhmpKSq5gN+zJhFL2doP0ocsAnU743DuIFNzyFT4QI9vQ
         DNNCveVJ8wVfE7K/cYmdTv2qZQ9ulIXDIFY3U22Q43I1dG8eHwo1OyxW5iC5XFxN2nX3
         rdAr4e+zAVeEwBTbHFenCQJllps4UVkhxKSnRhWkqlpZSzc99Bf4K2TY+wv7iQwMeI/H
         EHXA==
X-Gm-Message-State: AOJu0YyM+mKkwjLpMPt5bM2eHc3843fB1K5ZjMh+zfwaFoZLoHF+xr4R
	u9KqKYbU132fmoU5N5hbFf//6pZskOxsNQ==
X-Google-Smtp-Source: AGHT+IHMUgFzEwrbsH/HJYEzpeov6g2IZYbrbOHGNw3QDftCCRh8iuDQuKAS+QoP2LSbXn/T7pQ5gg==
X-Received: by 2002:a05:600c:35d1:b0:40e:55b0:64df with SMTP id r17-20020a05600c35d100b0040e55b064dfmr2801729wmq.101.1705308656641;
        Mon, 15 Jan 2024 00:50:56 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b0040d87100733sm15182436wmg.39.2024.01.15.00.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:50:56 -0800 (PST)
Date: Mon, 15 Jan 2024 11:50:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bartosz.golaszewski@linaro.org
Cc: linux-wireless@vger.kernel.org, linux-input@vger.kernel.org
Subject: [bug report] gpiolib: use a mutex to protect the list of GPIO devices
Message-ID: <f7b5ff1e-8f34-4d98-a7be-b826cb897dc8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Bartosz Golaszewski,

The patch 65a828bab158: "gpiolib: use a mutex to protect the list of
GPIO devices" from Dec 15, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wireless/ath/ath9k/hw.c:2836 ath9k_hw_gpio_get()
	warn: sleeping in atomic context

drivers/net/wireless/ath/ath9k/hw.c
    2826                         val = MS_REG_READ(AR9285, gpio);
    2827                 else if (AR_SREV_9280(ah))
    2828                         val = MS_REG_READ(AR928X, gpio);
    2829                 else if (AR_DEVID_7010(ah))
    2830                         val = REG_READ(ah, AR7010_GPIO_IN) & BIT(gpio);
    2831                 else if (AR_SREV_9300_20_OR_LATER(ah))
    2832                         val = REG_READ(ah, AR_GPIO_IN(ah)) & BIT(gpio);
    2833                 else
    2834                         val = MS_REG_READ(AR, gpio);
    2835         } else if (BIT(gpio) & ah->caps.gpio_requested) {
--> 2836                 val = gpio_get_value(gpio) & BIT(gpio);
                               ^^^^^^^^^^^^^^

    2837         } else {
    2838                 WARN_ON(1);
    2839         }
    2840 
    2841         return !!val;
    2842 }

Before gpio_get_value() took a spinlock but now it takes a mutex
(actually a rw semaphor now).  The call tree where we are in atomic
context is:

ath_btcoex_period_timer() <- disables preempt
-> ath_detect_bt_priority()
   -> ath9k_hw_gpio_get()

Another warning this change causes is:

drivers/input/keyboard/matrix_keypad.c:95 enable_row_irqs() warn: sleeping in atomic context
matrix_keypad_scan() <- disables preempt
-> enable_row_irqs()

drivers/input/keyboard/matrix_keypad.c:108 disable_row_irqs() warn: sleeping in atomic context
matrix_keypad_interrupt() <- disables preempt
-> disable_row_irqs()

regards,
dan carpenter


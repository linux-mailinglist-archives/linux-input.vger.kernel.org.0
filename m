Return-Path: <linux-input+bounces-7682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1E9AE692
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 15:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8F40B26733
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2024 13:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4D31E2619;
	Thu, 24 Oct 2024 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lg3ATmPT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FC1AF0D0
	for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776550; cv=none; b=ht4ze1b+O5Z1bWbM+ux1HqpTSfUTR8JR06ZyveMJxvI0AbofB7X/QLVkvlWpcfQHi3MqucQv5S6K7YCHVvdzZmw6jGw8f7GeV091gqqRH87Dg0C96AlcxcR50VzYhzesX37FxVyniI0Bk4GbpGDW1lnjzVLatdaFg+oWsxDLvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776550; c=relaxed/simple;
	bh=q68HfXlHTWWl4rbaigobDcpvpCJTjQLMfFVW8h0dY2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZJS+jYrmiiwXaPTDXAqafFuMuSwE1zFfMsk5/K6mtQeQWq/I4rsqQO6oHraJ8X4UobAKcsMZnXdc0a9u4Qno1iL4cA/sMsWMKf3IWwADX1pOmb7h+VMM3yxXlGboXIoCAXjQd8FikeF4ATuWsYx6WHHpEtaG4LbJUIGiZbo+h7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lg3ATmPT; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b155cca097so74912285a.1
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2024 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729776547; x=1730381347; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2C1zNVTnqxK3bfhcpA0Ha1gOp3kHd+uO9/rg3CaC1Y=;
        b=lg3ATmPT2eJd1aJ9Z7eJp2Ae/K84OQuHDsygmNX+QKVjESOxfDpVlJUwHM0HvkmuY6
         TFTBJrGraIa2N/o2nKIc4NOYxtX8TjYXnX/oYEGoLutIjTj83ClHc4m9lrKf+aI/vFp7
         2n1V6VqL/Vw/KTl56yoGc+VkuIlNOdX/VsHS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776547; x=1730381347;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2C1zNVTnqxK3bfhcpA0Ha1gOp3kHd+uO9/rg3CaC1Y=;
        b=XM6flmzXPX4tpVQFJnVSi+tKXl6AAO+QCC6Ei9kkx/4T7ynJENUQtPrDAfdmqhquej
         Nn68/S+zBsNxHINTBmNZAtei9gm4/Bnk4MfzT1mlQFaICD01RrmM9I1x+SZxkLfTYFxg
         EkHfkHutYMm+9OKpM0rVj3eRz/dmkUGlPCzQVWeu25IPc6R5FDic2NnTroYuRLar7fwB
         Q9cH0wsDUoJYoFORJZKt7aKm+NbsTiOuisde+MFava71pGCLMTzEJtgNd5llFOxgDE25
         x4zcK1HEDSrwhwiy201mIAIxahd9KSLkMZM0wBl0r3R4ICQM+nXnN2OcQmHsxZOtcm3Y
         mCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV55M2IMsTxTOx4JDl5rKjM59D3cJz54a1P7Xzep5FAonQZdaeRQ7buReFKo/lljuXk9GZJxg6H3D/e3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywun/sjGKYrO3AiLIgDddyczpnbKzfjMPTgYDOE//SVdvJkDZul
	e/HSqhhq9LBitNbpCIbkH70Sh7JVIDTO+28mLDmxPLBhiaas8FQHFzstDkFwaA==
X-Google-Smtp-Source: AGHT+IHo6T2ehrPfPNdovec+8cu0oAkEDPWTP6Qxezwn1gUeaYeTy3QxY04P2gTKRbvhnZyY+AAyEw==
X-Received: by 2002:a05:620a:2409:b0:7a9:abdf:f517 with SMTP id af79cd13be357-7b186648cf8mr307570285a.25.1729776547153;
        Thu, 24 Oct 2024 06:29:07 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a5d663sm484204885a.94.2024.10.24.06.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 06:29:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] iio: hid-sensors-prox: Add support for more channels
Date: Thu, 24 Oct 2024 13:29:04 +0000
Message-Id: <20241024-hpd-v1-0-2a125882f1f8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBLGmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNj3YyCFN3UlNQkY/M0w7S0ZBMloMqCotS0zAqwKdGxtbUAuuzIFlU
 AAAA=
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Harvey Yang <chenghaoyang@google.com>, linux-input@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

EgisVision 620 provides two additional channels:
- proximity
- attention

Add support for them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      iio: hid-sensors: Add proximity and attention IDs
      iio: hid-sensors-prox: Factor-in hid_sensor_push_data
      iio: hid-sensor-prox: Add support for more channels

 drivers/iio/light/hid-sensor-prox.c | 177 +++++++++++++++++++-----------------
 include/linux/hid-sensor-ids.h      |   2 +
 2 files changed, 95 insertions(+), 84 deletions(-)
---
base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
change-id: 20241023-hpd-edeb37f1ffc4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



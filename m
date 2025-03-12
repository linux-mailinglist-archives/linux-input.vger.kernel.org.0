Return-Path: <linux-input+bounces-10724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E566A5D5FD
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 07:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FA71789B7
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 06:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95991E377F;
	Wed, 12 Mar 2025 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV+RtJR4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23E1DFD86;
	Wed, 12 Mar 2025 06:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741760579; cv=none; b=qpAG7OvhoBA9r2WP5snHyUuyN86H+QY0AEI3VbSear3bzaIlTzEao7NQIUPPevcmG+cQYz3+y14HqGKDlr6+ksQn4i7eRmepb4/NXiIdyQTGsBoIHJv+0juHybhuUMka0sAwlP0bxJzGlAzB6ZR+XNY7gOS0mj3ZHYuDDAY0xEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741760579; c=relaxed/simple;
	bh=Xc0rFLtXnERzBghwNqjwjIWQ3Jz2QFIxiamdTT3BRr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOnHb0gPsqZIis8wpUiDW2bDE2zY4mqqcHd/SI0H1ls5XCdKDy26hSx8KBBscB/9uA0sSMGMBMu+sqJAw/VzuyoH69r5MChZO2vu2b1U7QMuYwK5VH/WFvIPOOlr5q6+i5J1FqCZYlfI2ThCoj49wU7dRjGfj0IGclBiWsSRsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV+RtJR4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30795988ebeso66710071fa.3;
        Tue, 11 Mar 2025 23:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741760576; x=1742365376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwr3CagSoS9NORMuiYNSzeUajjdGZr7+Rut9vr3Cp58=;
        b=iV+RtJR4wsTFkpVTuvyDXOkSZK7O/O0926EPKnPhbmCwylULffdMR31r2JA2mnW8eC
         efrQ/rfAC+flNhdKUibMh4N4P4jbY0sVIIa3AmHRgDVHBry+aUw7Pyz3DtlQkuTuMHDV
         1e/b2pgk28ODEPQgt44rGCbfGdGq5O9gQj/kRj83dMT9i0tNmcvnyTBd+4w9yfmP1ppH
         eIY6FY3tOqmoeIIGCkXZ6WOzD/z0bz81dJ7byK8U+KeHA9bdDh3F/AxmZaVoOITTUxiN
         bWZBy/wGUo+2YYZBmS5KkW7xfLFRNWXBYG0RausTm7jsRJQH4Qx3AC4R3MhkLyUF2kXb
         dqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741760576; x=1742365376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwr3CagSoS9NORMuiYNSzeUajjdGZr7+Rut9vr3Cp58=;
        b=k/hARLMDb5ghLsx5jhY3YPSAQD54sh9SNYVOyhMKDx14mWemvnVPEal2Hz8bU49CEl
         PUPV9GD0EPlo/dnzkPF2HVTUCHNdAcxKllDUhiJl/u22m4Z9TmUQmv19EBuHuP4mi+pJ
         CxYdnYbrTfAryX4YP0G7fUVae5bIH37TxuQ0E/HIOqdFoK6yVCymg3NolP4QeMmgRzbN
         ioBuCWPdOIpwJW6N/d1K/6DnM0Vl0rdFJ3naUUfd2cGQtXmpstm26eCDRcI2n6qUK0TV
         Q69GuYjKbfVpfHoIZvzNgYkxgCXBLE5z47bcat8AxrmnEhKIPkvHC0+X/cSRouk5oaxW
         Iy2g==
X-Forwarded-Encrypted: i=1; AJvYcCUQC8H6YTMp+kSM3+goeD1HZXLPS/OQGjgF9blOnUr1cYWbspB+hrTL78akLddt+R41+3blBDXtmaJDyVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2DMpIIMux9v1UOSeg7kI0ANJ2N6lL99I2Uas2rcR+oHs6xcm
	9+sLOSoUUqvUuysaFej3sxbWdVqQ48RwhcRroiLoowaO5fHQElnH
X-Gm-Gg: ASbGncuXkHjW502GA+L+QITyu2Qwa5flZNDKhtmXQshhpIDmGPzZty/mKTwrv+2Ux0S
	aIgqgU35MX7FzRyRIkAOkSeECJ/vuwkfgiLzukDXTD9kzVpotU9x8QLoA81O9MRnI2/OIgxLToL
	A0jgNWTdWC2RusYxSvKDjW2BatwT/Y5ILFfscRUu7RphwEw4ZPK7OuW9mt+ZHH56JhvuCEHMhLM
	ZcnnAnJOKvPXv1ALLaG6t1Ie6/aOegg4ZEcS2FCQkDfQdhfZlMXzVIdBhX7wBzlF+tukGkaS9FC
	dP0ZWGQaP2Qq9G+7QNWmRsayIVnGtrmpgFWE
X-Google-Smtp-Source: AGHT+IE+BbduhxIeLiasW0v3AWVVk9UyGj5cwEJ08IRO9OtMTFTrnC+2uzciuRiWoV60SJGSIHVZbQ==
X-Received: by 2002:a19:8c14:0:b0:549:b0e3:925d with SMTP id 2adb3069b0e04-549b0e39500mr779742e87.7.1741760575908;
        Tue, 11 Mar 2025 23:22:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4623asm1991728e87.49.2025.03.11.23.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 23:22:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] input: touchcreen: tsc2007: make interrupt optional
Date: Wed, 12 Mar 2025 08:22:26 +0200
Message-ID: <20250312062228.11195-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case tsc2007 is used as an ADC sensor there will be no interrupt
provided at all, so set up an interrupt only if one is present and
remove associated warning.

---
Changes in v2:
- commit spit into making interrupt optional and changing message typefrom
  warn to dbg
---

Svyatoslav Ryhel (2):
  input: touchcreen: tsc2007: change warning to debug message if pen
    GPIO is not defined
  input: touchcreen: tsc2007: make interrupt optional

 drivers/input/touchscreen/tsc2007_core.c | 30 ++++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

-- 
2.43.0



Return-Path: <linux-input+bounces-5830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF095E1DA
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FEA1F21E9F
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F4A2C1BA;
	Sun, 25 Aug 2024 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1PtnGDu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388722BAE5;
	Sun, 25 Aug 2024 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563001; cv=none; b=i6lDSZxx8y0QxZJRRduUpd7X3OWeJU2PI4QUsjDvnm87Nte1X7dlpSNOtSa8ZClokDqYUYV/1Rzs0e4qbSKG/pghS7m9ozrehDY85bZhVrpouzsL83+JsCIqoj0PwI1JlT+gfsu4131n/OwES6geEZbZ1jLcszGEmlWG277j0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563001; c=relaxed/simple;
	bh=s5wgK4Qzugtu6DQ7chbTlwIxyhWffDlpy+oXXn0nhCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7QjIHXxSQvUaehSSQFVStcBAH82s3eRiPOHtdN9Ca6wKrDE8w26SSxi6sO+NMsEyP2HqztGa4j57HmW0gqySy4e8Ttzqb21NbYGJlwMbWJvuNlBBtVsQlZz2rQtA2XZmGfxWqsgX2YjvRpG5buCd0tz2cXRSWWd2pMavM+IPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1PtnGDu; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5d5e97b8a22so2535322eaf.2;
        Sat, 24 Aug 2024 22:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724562999; x=1725167799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7M8d2Iwbu5bICVz8NIEjALytlWBvPo1Tua0bm0Ig2w=;
        b=U1PtnGDuBhvTNjgH9/twLP71/KS9JyZfSH7HweRabClwjWs2NxUTCHeLvpfar3WUzR
         ut42I4Co/G2MvQXq+/p/BNeBMS5LLRg03awI/+SHj1VJi5PMdddNdzJLk7+jSW6WUso0
         9NPDJq+kHyVLvX9Yhl9gVAzxhHS/z2u+sc6Q4Z+kFyTqjNvP0RqN9bQNmpA+KWdpWADO
         YH9N9oidHb2xX4rWuDWIrIAu9ndws14d8yvgNgHW6sSeEDBxUVMlQ4r5H3DCFwDK2xHY
         dmH+cwdBbAfnzBwbaC32UyYPIsiKArTxC8IFBDn1ekTQPx73ELNdkne0wP+Qkc4oFzwD
         R0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724562999; x=1725167799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7M8d2Iwbu5bICVz8NIEjALytlWBvPo1Tua0bm0Ig2w=;
        b=eTmCH174vWAqhUGzs8YZwCApykO8k9zmBt7mUJOFQ+5q+QSXi5lyttBBMQnAoKudbQ
         D/gPqY6UnfWBswyqC0ZtHdBneFGbOYPUfV59OJXvbmKD2FWEIcy+dCH9R/R267gxDisp
         /l6R8nR0jabR0jf26qabNUf1GFTc11nOAPL8ObmfftydopKISUAIjtOnfCx/o+o7RSE7
         CQTg0Fo9eRsDZpPkuXTL3Xo26uWT5/r83gmwfQJ58hNqGgqIUUCIv9I4v/hP689psA8G
         3TmrK7j4rrwtSzOAnRUdf9k4ElGc0RHunE4hHHQ/GvQzz8En5uQDgBFfdxwNn7XcCsl4
         aGSA==
X-Forwarded-Encrypted: i=1; AJvYcCVlBn9z26zycVDAXCJW+4uSOxljEuSfQlPcf8A5IWC6Y8l9rhGSozWiEqIE/PgT5vS3BKhGrwFEsJQvIII=@vger.kernel.org, AJvYcCWswAgRQ0F0kgFcYxJMd59pIuKd840ti8MHNyW89yswIQos/0LILitZv98JJo7Rb10JX4CMPbuzQNoFAWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNOoWB3+Xiaux6PWg5tyBeK+sz+Tb0Ul7IiorhmKstC1LisAi
	bHNT6qAh5F3ir4wy/Mcl36uL8/9u9t03zxLq/nP5ZYu9eol0tLVdvFc5sQ==
X-Google-Smtp-Source: AGHT+IEu/+1X05YCf8jaUm1G0cNhbqDxQwzltk1XvDFoQrjwwCsat+bp2wBTAollbQUz/0WMsmlMyQ==
X-Received: by 2002:a05:6358:3a0e:b0:1b1:ac7f:85f6 with SMTP id e5c5f4694b2df-1b5c21edec3mr830073955d.19.1724562998831;
        Sat, 24 Aug 2024 22:16:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:38 -0700 (PDT)
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
Subject: [PATCH 00/17] Convert keyboard drivers to use new cleanup facilities
Date: Sat, 24 Aug 2024 22:16:04 -0700
Message-ID: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts drivers found in drivers/input/keyboard to use new
__free() and guard() cleanup facilities that simplify the code and
ensure that all resources are released appropriately.

Thanks!

Dmitry Torokhov (17):
  Input: adp5589-keys - use guard notation when acquiring mutex
  Input: applespi - use guard notation when acquiring spinlock
  Input: atkbd - use guard notation when acquiring mutex
  Input: ep93xx_keypad - use guard notation when acquiring mutex
  Input: gpio-keys - switch to using cleanup functions
  Input: imx_keypad - use guard notation when acquiring mutex
  Input: ipaq-micro-keys - use guard notation when acquiring mutex and spinlock
  Input: iqs62x-keys - use cleanup facility for fwnodes
  Input: lm8323 - use guard notation when acquiring mutexes
  Input: lpc32xx-keys - use guard notation when acquiring mutex
  Input: matrix_keypad - use guard notation when acquiring spinlock
  Input: omap4-keypad - use guard notation when acquiring mutex
  Input: pmic8xxx-keypad - use guard notation when acquiring mutex
  Input: pxa27x_keypad - use guard notation when acquiring mutex
  Input: spear-keyboard - use guard notation when acquiring mutex
  Input: st-keyscan - use guard notation when acquiring mutex
  Input: tegra-kbc - use guard notation when acquiring mutex and spinlock

 drivers/input/keyboard/adp5589-keys.c    | 39 ++++++-------
 drivers/input/keyboard/applespi.c        | 72 ++++++------------------
 drivers/input/keyboard/atkbd.c           | 37 +++++-------
 drivers/input/keyboard/ep93xx_keypad.c   |  8 +--
 drivers/input/keyboard/gpio_keys.c       | 44 ++++++---------
 drivers/input/keyboard/imx_keypad.c      | 27 ++++-----
 drivers/input/keyboard/ipaq-micro-keys.c | 12 ++--
 drivers/input/keyboard/iqs62x-keys.c     |  7 +--
 drivers/input/keyboard/lm8323.c          | 49 ++++++++--------
 drivers/input/keyboard/lpc32xx-keys.c    | 18 +++---
 drivers/input/keyboard/matrix_keypad.c   | 18 +++---
 drivers/input/keyboard/omap4-keypad.c    |  4 +-
 drivers/input/keyboard/pmic8xxx-keypad.c |  8 +--
 drivers/input/keyboard/pxa27x_keypad.c   | 16 +++---
 drivers/input/keyboard/spear-keyboard.c  |  8 +--
 drivers/input/keyboard/st-keyscan.c      | 19 ++++---
 drivers/input/keyboard/tegra-kbc.c       | 45 +++++++--------
 17 files changed, 169 insertions(+), 262 deletions(-)

-- 
Dmitry


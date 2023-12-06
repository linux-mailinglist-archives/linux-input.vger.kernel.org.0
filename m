Return-Path: <linux-input+bounces-519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E66718066CA
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 06:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D82EEB210C8
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 05:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2824010949;
	Wed,  6 Dec 2023 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m5ZmOD9I"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1ED18F;
	Tue,  5 Dec 2023 21:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hbjoSIyl9QoK27efhpqBsMqg26tMTotTFPXa+8t3xFE=; b=m5ZmOD9IV2/hkfAjw2X/04sqMa
	Ic4f7pymAirhazpqWEmoFJpKGVJDBfnrlsGofiBIJdynATFpizpRLnO5PJTrIyjdL5nSlwoKYNJ1Y
	yDOjuxl6tja8Sf87VD0NogKUJ8di2j43/SJX4daYrZ2kzU7Tbt5eEHw7UGXxBiI1H6utmfAZuVFtv
	x59GVDPeRi4693yd9+Zw0OKz7TxRhyztdD3oS8M0bjhXp+i8v4LwBFje2q88vw1cChLmXqC+V88Ow
	Kot3zUigItcxsDYVQoswAiC+7PL6EELpz+QIQ1Q+RmxNw5cUrwCX8w1X4m4Tw7uc8Ev3vK9FPeblw
	P4f3woeg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAktI-0098h0-2m;
	Wed, 06 Dec 2023 05:56:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: twl4030-pwrbutton: don't misuse kernel-doc marker
Date: Tue,  5 Dec 2023 21:56:12 -0800
Message-ID: <20231206055612.17142-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a common C comment "/*" instead of "/**" to prevent a warning
from scripts/kernel-doc.

twl4030-pwrbutton.c:33: warning: expecting prototype for twl4030(). Prototype was for PWR_PWRON_IRQ() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
---
 drivers/input/misc/twl4030-pwrbutton.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -1,4 +1,4 @@
-/**
+/*
  * twl4030-pwrbutton.c - TWL4030 Power Button Input Driver
  *
  * Copyright (C) 2008-2009 Nokia Corporation


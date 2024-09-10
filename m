Return-Path: <linux-input+bounces-6377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34C6972678
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 03:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037051C23761
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 01:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758361FE1;
	Tue, 10 Sep 2024 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IjTEegX/"
X-Original-To: linux-input@vger.kernel.org
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD50320F;
	Tue, 10 Sep 2024 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930107; cv=none; b=LyzoVPtQLuX9TgEcMn1V+QJ13E4IJjlveOmnJxWohk9UEg8+/fbdLbEGqrt3M+lrvuVDV6vp0nV7W9gQZ4iSMt/bdTqCTKR7qg7GY47PWaPyPC+2QQtGgpD0jhLwd2Y80df12y1DRYo6CEeAjEENN12jGSExUiSrX227z0MUqEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930107; c=relaxed/simple;
	bh=ecRoSkaO7LLkC1OiV5sLJwfWY4LgbqU1t/+68KDD2ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aM2mAbUz0hXHkoUZSFjPuQbA9YxjQbOBmWRUT/1OnhodUL7TwzdgOEOtFaZWVFBxCBDwAxgbX0liEQKI8XdpMpuGfeuMIn52lcTWKM+DMEFi33moiRb7zVE0BMUkoflUOlOomN3GgWYifC2S9X4OUz1jkOByHbDkXTTNox4hWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IjTEegX/; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1725930096; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=cep1+rFxnIrW96inJRQYWiCIl29CAsTntLKoMPOZ0XQ=;
	b=IjTEegX/5Hmn0zk09+WYrR06wnNmii7Lckul9zwsDEfzyPXxtbswifLHkShCTh/fsVENmWcijVvGgvX4C3lJ4wRfcROu9w3dWuai8scRVCrMRcqJPlJH9mVTHsju8FtNAsA+Lf83QZQmpxOXFIKXjTDfrxgxbP0f+H6LiQ5DkrM=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WEhwXVf_1725930095)
          by smtp.aliyun-inc.com;
          Tue, 10 Sep 2024 09:01:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] Input: matrix_keypad: Remove duplicated include in matrix_keypad.c
Date: Tue, 10 Sep 2024 09:01:33 +0800
Message-Id: <20240910010133.44579-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header files consumer.h is included twice in matrix_keypad.c,
so one inclusion of each can be removed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=10823
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/input/keyboard/matrix_keypad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 3c38bae576ed..4cfdac922022 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -17,7 +17,6 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-- 
2.32.0.3.g01195cf9f



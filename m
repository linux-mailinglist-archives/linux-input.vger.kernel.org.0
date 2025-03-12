Return-Path: <linux-input+bounces-10725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E904DA5D5FF
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 07:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 586333A8778
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 06:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2F31E51EE;
	Wed, 12 Mar 2025 06:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvloU0DK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C51E260A;
	Wed, 12 Mar 2025 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741760580; cv=none; b=a+GdAHE3SKP2iqAZCF6n1/G79kGj4ve9yGtcu5svWhvV97kivsARpcL/AxbX8Te3Ulu6YpDZsCaj8OglGwGTCSZLqu5op/uIUGgSPPiGZDrVI+alD+yJP6iCxSIYfnA5kjjnatHSgUMAFn3EuAomz9SPone7kZtrCYvshGwgaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741760580; c=relaxed/simple;
	bh=CLOxWccIYnvvu3kJQ2b/QNmsXCM1KjyWuzm/WqI7bsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEYy6W5P9G0jD+bxGrtIboZv/DsxNm+3YmVsYOSuxrwwc9bxPm690cdVyuAajG5ggEIUjUrfMbhhCEDAoMbtqppOBKZ6Oe1Nz8EPtUaOELmXhjhS43Eu62AwdKwC89Vp4XPyZluy2VZamtSgJWxvz7T6dP+leuqgJcxON95yB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvloU0DK; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so5786611fa.1;
        Tue, 11 Mar 2025 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741760577; x=1742365377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoiYlwnNrCIW8lexuGkUDfV5aY2e9GYzOXh9ukM7g0=;
        b=JvloU0DKHkBm0bz+wTRjSGmGNKyn8S0TWyY9IXhbMiV2sD0pNLPNAdBwiHRkc68zfr
         Ofsd4/g+oHHn+Z2iyi83ycOgWJGbjiBWCnbXXDzTCw76DdDAnJ/hIqibc1yEeY+mbbKf
         ndDwqkpZ2NJtCmbdc4lPXrAvTatNKWtFyqOr+J7/05elOOzvC59ZFK3usYAjwziUj26L
         o8YVr4zcDHftTu3dbR7gvjZ8VoePZ7KA4oI4AFYEFmV46kq8yUL7m4xjXOPq2Po1T17t
         fm5gCdd9BbjVMAVXasXN1btqZFul9cnVgWSs0+NmJHAAn4sIZM0mtNlccubLiibgnD82
         ybrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741760577; x=1742365377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoiYlwnNrCIW8lexuGkUDfV5aY2e9GYzOXh9ukM7g0=;
        b=ugCNPqJkG1Sd88r6Hb4rD5Qx3ixpsXJUW98dUHaDWwT44pfsTRtddQc/zyd8zAWWdq
         gWQPvHjzmazMmGoXvHeighSgM0cxVx2y03HQqTtosfV8zgZl0pW6FKKSZxpxEzYDYiat
         HnEr3yI6niu6RLEpST5dUIQfK4xtO/vHOe+n3cZt2SVQawVN8qzBMnBG4z97f7xowO7V
         8NrKYKneQn7AAHDfBnpSMK9rbWfqKnvi/oW8DVEBoEuK/RvDAUAqYql25GnlyHBM0qJc
         1tVQrZBjGhzBSbR9doNU3J0AQzOY5upkLUA7U/1yUj4w0y6GYx747fZsK79ySgWf4juW
         OVvg==
X-Forwarded-Encrypted: i=1; AJvYcCUnQp7Yx87OqvBBLIshRCMgfUUhnhnifNPZHUzfExqQFyCqRXpou2OrChlAsyIZXuBkdq6PTBrww7k+Hn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfOw81RJUTqwEGb2ZNlXKPQfd4jwezI+MQ/HUUPfygcM2sTfx
	zoF2g5f7aC0m8RObFjmpgtRjih7+7kP1hfuC9oS4PoG3Wk38VcQm
X-Gm-Gg: ASbGncsE5sOFap6RaJI+3cGzrtDPXG+i6Xkdx7NuvPW98Pc9ENjEEKYZXL4qmurhi+W
	6g+BocJpGIKQVNZE+DzEWXEzpCQ5CNMH3j4/AHRb9mKfa7tAkehd2HxfbGC1+xlfI4kXrq4Ig+o
	qPEkkM47toAl5TGFFE/gZPhtlU0NU7m6t2Oo9c4F0LgBSSW9jFHVfVU8JmFti9IAgccMF1/NQ2K
	WzNHuLQNgcUz8wVQxUSNTXI15tY3XLcC9HtVhR7qmZXZ/rS1cflkaL2dzdoA1o9ism+AMP3bzs9
	rFQr8LzCCWPaBuKC/asX4kozGaeXBFhxc5++
X-Google-Smtp-Source: AGHT+IHqIMcZ6nJ6zXSP8GPY6Hq0MU3VVNeO4Y0McrgbugmANnqsTdkdOv/WTbu0bG+eU1JQQsZocw==
X-Received: by 2002:a05:6512:2385:b0:549:5769:6af6 with SMTP id 2adb3069b0e04-549abd1ca54mr2148100e87.9.1741760577252;
        Tue, 11 Mar 2025 23:22:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4623asm1991728e87.49.2025.03.11.23.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 23:22:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] input: touchcreen: tsc2007: change warning to debug message if pen GPIO is not defined
Date: Wed, 12 Mar 2025 08:22:27 +0200
Message-ID: <20250312062228.11195-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312062228.11195-1-clamor95@gmail.com>
References: <20250312062228.11195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since pen GPIO request is optional, there is no reason to throw dev_warn if
such GPIO is not defined.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 8d832a372b89..17c82baf87df 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -254,7 +254,7 @@ static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
 	if (ts->gpiod)
 		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
 	else
-		dev_warn(dev, "Pen down GPIO is not specified in properties\n");
+		dev_dbg(dev, "Pen down GPIO is not specified in properties\n");
 
 	return 0;
 }
-- 
2.43.0



Return-Path: <linux-input+bounces-6127-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A696AFDC
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 527C6B242DF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8276E84E0A;
	Wed,  4 Sep 2024 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIIDPQe8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CE83CD9;
	Wed,  4 Sep 2024 04:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424281; cv=none; b=E55bHg66sc7AkzO3Q11QFirgIFpmRDGrC9caA3RxJOBM2AoIQXvMpFeJLiO3NgVmPr/Mz/9IQWb1mnfdoQatGQoQ+e+98OJJEkvz3Qo/tegVTrL74g45yJu2aT9sUZQlS+53cEe8EjjJmewoOuj2q+aY6R0q3fDMplyJfNYwiC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424281; c=relaxed/simple;
	bh=qsJupgvB05zPy8V+FqhBDe8t6X0p52K2TGgaTcj5xC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iusyCpR0aJ6m738X2KIdqXvjfiUgtydyxfWI4bbbRlbF5YN7Zj084Ese9b5vu/J1GUKsBWwTwspEV3JXCL8KPcRyiQB0BM0TBleAkXEB6qV59ag+wZaA0M2/cHzuTX9TkB4Wj0CGoJv6aSh025kXG7vElQO3EkWZwkhUkfjfV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIIDPQe8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7cd9d408040so4540756a12.0;
        Tue, 03 Sep 2024 21:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424279; x=1726029079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wO+7gee83CsLsM7sYii7cqnFdXQ9E+GWWcO+DnEDlDQ=;
        b=LIIDPQe8bSQRwAe1hyCBRJh8umIaeq5v36sk/Ct4zPaCc6ApygzxRJbgqN6j2BkG42
         UW0QsBFZS4g2jrlJ3nEK8NZJoP1ZhEnLXbTF4eHuQhyePGWYyaOIxMHi7FnJbz3TP2cR
         LHqMYtdFr9k4TKKY5F3hoEixdWcIOIGiiWXPcqsFJqtgwdLCRC03aTaslBrWciL+8vUN
         kStMz7XWLmnC4Z3fj1a5WnI77z29CG85C7AqIF62vU/J83kgDy+rr/bnoCY6gmaIW8vJ
         J2p7YE9vLC2kxpXM3nvpliTtT90BtGm1LeAGfsvGbUEXbKzKsNSVMiRuHd+iCIDRI0Ig
         2mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424279; x=1726029079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wO+7gee83CsLsM7sYii7cqnFdXQ9E+GWWcO+DnEDlDQ=;
        b=d7zr14d1r+T7Ru8CS0CcbZYX9bplIxlt29/C0PL/YZjJuJ17KZeZMhZxV/YCvFvcLs
         lyC36qWtk4T5iVcfSZ56sMFCF37/4tclDCwcKWvpmSeDbJozPWA3rOjTFkzVEKZRsacT
         HYf29iNM30ohadpvzYIeiPs98du+dGEA5HAaqYWeHIzYy0W39Tn1OBOSMt8E3iaz/Rmn
         mE0q6Jq3N024b+PCBBXnP8aTbQ7bc/eOdxeAYEI9w/kpPmeZqxP6m7VUDqKq6uqNT2AM
         F0fiaYHNUYtDQwsXiZE77HDSelrwkN/DQXJS/x7vHZyUsxk8Be0gLJf/RpxTL9vnIl5Q
         7/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWEK/MHRUCV/p9/ofnEQpMmGsS7W2+89zBAgtz4DIdUGkBpL4ssqEPxWVPPZ4LhS08N9Iq71l7ZjpP2uqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKFmotlVgRe8Llt7zFVpD9cQgN0c8EWis8HqZmbwd2dcuM6ZS
	VCy54XpiNmprRLNCDJmdjjPXkg2fOkofu2f0J8OVpX95KFzk6lvsB+v3cw==
X-Google-Smtp-Source: AGHT+IE3Z+c0rj00rM2a+Wkqo3oBJbD+lht50s7aTATJbOyllMNnS1GTsuIiCSTHfCiY3R6vKtzbiA==
X-Received: by 2002:a05:6a21:3305:b0:1c4:7929:a593 with SMTP id adf61e73a8af0-1cecf5146c9mr17715923637.23.1725424279123;
        Tue, 03 Sep 2024 21:31:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] Input: turbografx - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:31:02 -0700
Message-ID: <20240904043104.1030257-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/turbografx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/input/joystick/turbografx.c b/drivers/input/joystick/turbografx.c
index eb8455c34e67..015010a928aa 100644
--- a/drivers/input/joystick/turbografx.c
+++ b/drivers/input/joystick/turbografx.c
@@ -103,33 +103,31 @@ static void tgfx_timer(struct timer_list *t)
 static int tgfx_open(struct input_dev *dev)
 {
 	struct tgfx *tgfx = input_get_drvdata(dev);
-	int err;
 
-	err = mutex_lock_interruptible(&tgfx->sem);
-	if (err)
-		return err;
+	scoped_guard(mutex_intr, &tgfx->sem) {
+		if (!tgfx->used++) {
+			parport_claim(tgfx->pd);
+			parport_write_control(tgfx->pd->port, 0x04);
+			mod_timer(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
+		}
 
-	if (!tgfx->used++) {
-		parport_claim(tgfx->pd);
-		parport_write_control(tgfx->pd->port, 0x04);
-		mod_timer(&tgfx->timer, jiffies + TGFX_REFRESH_TIME);
+		return 0;
 	}
 
-	mutex_unlock(&tgfx->sem);
-	return 0;
+	return -EINTR;
 }
 
 static void tgfx_close(struct input_dev *dev)
 {
 	struct tgfx *tgfx = input_get_drvdata(dev);
 
-	mutex_lock(&tgfx->sem);
+	guard(mutex)(&tgfx->sem);
+
 	if (!--tgfx->used) {
 		del_timer_sync(&tgfx->timer);
 		parport_write_control(tgfx->pd->port, 0x00);
 		parport_release(tgfx->pd);
 	}
-	mutex_unlock(&tgfx->sem);
 }
 
 
-- 
2.46.0.469.g59c65b2a67-goog



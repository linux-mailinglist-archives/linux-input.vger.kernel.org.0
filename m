Return-Path: <linux-input+bounces-4836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 070ED926A78
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE981F233EA
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8F0198831;
	Wed,  3 Jul 2024 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksKqERoU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4E1957F5;
	Wed,  3 Jul 2024 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042695; cv=none; b=GmjIvRPdOfPX0tUisAw7zecqIy8qkb20BJFUJ5jTgRv5DRcR9zVNmtzkDqRiozEA9y/NZH3jN+O2iMZiG+eIOH5mAqsKlzDlWu4dh+J2HPp1st2GVMAX3n9z/AtkBuLNAJMPAtW0DDao8blYOBUvIQYri85Qun5PzQR65ooAzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042695; c=relaxed/simple;
	bh=9qZegVREjpcFu6rFG6b8BVPY7mtyy65rRh3gEusvRXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7WTjkGEhIl/2uQpAxZUSUtLBClJ5K4s24UAN7CRrk8iZLbwH7WRbz4NkBiavg7POWWROKPhmZmKRHk9aLP4YCwleZPMYHm8Wr0bYqOktFJpU6MXLDj5JnzwQVeDoemkfUDDT5D/L2shx29WoKKeWT/xdSzAFtXz16Mv6BLxYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksKqERoU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70af9f7104cso13171b3a.3;
        Wed, 03 Jul 2024 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042693; x=1720647493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWYq2mldW21wrkhKd5QkzgDqjV6XraGfPZcmcYa5WyI=;
        b=ksKqERoUS6l9fwGO9CtyBNg517m4i3dExqRDPbfUspJewgcgjH6Tf5juAZgY2MuU+M
         4iyN/HhzVuqyiuArICmI9f2wHVWc0hiEWmfbaQC28mkhuVB0245th/PMKgi45Vt+PI3i
         WXCbotBAYv2d8O546qakMXi5qXCCbYxK6OM0H0YCf3J//3SnJzN7znA3gjTSioqY+9Jf
         QgSrtcP8UXT/3FbUSpTnvGzV2vyjENdaS7y8fcdugJDz/koD2lJ88MP7iBR9uCt/AIry
         U9bv9d3Bp6e626UJrrud5mTxmK1OUuZQYUksRTX8vQxk7v7OU+fBp301Az5viXs7bk4V
         AXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042693; x=1720647493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWYq2mldW21wrkhKd5QkzgDqjV6XraGfPZcmcYa5WyI=;
        b=XSRQFbnqOD8OPOPHykDnyGX9wUNavdgfNxoNDWBZGz4G+8xmU2oLQFkbv+kZfZDhTR
         Sjy4I9LNuoKy4PqbSXH2BA43Iz5KzzllAktWWWitPzHABYUFdueJWkXgDE/K3YeFBc82
         d3lvP9NogEk5jQS1DZvsmH24PKTHVHsKEcH//OslhA1Afx7IdFbGVlUaRL/I8XmNuXNB
         WRcs5LQCwgiIaZJpLMjpU9nhzFVqrj0wyH2h7MO63Y/O1/H7V372WWuThNujlZXsvDzL
         yaJMCDYQeX6IInROZi0bhpItRbIw5TdamZcCrJmXuALqM9gzLY+P9HR7u6QozEyb77ka
         NVMA==
X-Forwarded-Encrypted: i=1; AJvYcCXcbyN6ZHunNDlrCTQg22sH8j2iLWFLYTkHtkx88O2K7PmlUigQidM+Z7HDnJH+kCSsohvx5+268QJLNFTggxKDnHOHxrtNI4sAbGOA
X-Gm-Message-State: AOJu0Yx3prIkJPL2EhiEeczA15B2yMlAEsAGqsaVKXvcqHQt9vwTdPEw
	q9reacqU1I+JWotIQgxQpiGLYnsxkJO12DcXxkcfdfgyn5VzTmXJ+S7xew==
X-Google-Smtp-Source: AGHT+IHEhh69PLG82n5vY+BtpFKKfrj5gUjcs0d1FiHfumZ7TE5MvFAeQiyfQMc6wRbTOJrZGW+8ZQ==
X-Received: by 2002:a05:6a00:23d6:b0:705:c273:d19 with SMTP id d2e1a72fcca58-70aaad3b4b5mr15035807b3a.12.1720042692969;
        Wed, 03 Jul 2024 14:38:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] Input: do not check number of events in input_pass_values()
Date: Wed,  3 Jul 2024 14:37:54 -0700
Message-ID: <20240703213756.3375978-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the input_dev->vals array is always there we can be assured
that input_pass_values() is always called with a non-0 number of
events. Remove the check.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 4e12fa79883e..54c57b267b25 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -115,9 +115,6 @@ static void input_pass_values(struct input_dev *dev,
 
 	lockdep_assert_held(&dev->event_lock);
 
-	if (!count)
-		return;
-
 	rcu_read_lock();
 
 	handle = rcu_dereference(dev->grab);
-- 
2.45.2.803.g4e1b14247a-goog



Return-Path: <linux-input+bounces-12552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C9AC30C9
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C453BD864
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26171F12F6;
	Sat, 24 May 2025 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTjSaF9y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CBE1F1524;
	Sat, 24 May 2025 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108856; cv=none; b=Va5YKXUrgA6u6jaNiF+p2/2EpmHRVhHZrRnqqObAyS6dFo+lYZVK4SAZo9H0407RnIx9QBZj24oO74wevL+Guz6NOfUU31gYdxzWHRBC7NantvRrZjMiCJP5PeYam+DZnOJLm+7g19I+seFuEPQ7pwmmA/xhqOBf7eWsDh6cFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108856; c=relaxed/simple;
	bh=plxgnBC3/TSSTHavnweC+mX7Rx6meyv7logqYNGVEVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7qXt4UXVUDMffNIzaPODI7xRwqYjLBgo2gTg80OaQ6R67m2L6snzmv1y1FzaAmOicSyISHPjjWNajbf8WPfQnJHS/8Z8GopaTZ3WP+yM9gHbIJVdkTB36BBZ2E9p0qDfhr3iJBPo0mpMEQ+ccN5/CFWmrVPXtaPnww1bPZ4zGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTjSaF9y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6041b38c94aso67196a12.0;
        Sat, 24 May 2025 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108853; x=1748713653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1jNkw/6MR5i6Cr/2hMjKLeS6l2X7bhc8cyPl4fASrY=;
        b=OTjSaF9yc34vdoW4Pg7fmsPz1kuLT+Do66m5PDR/wwaWDgg51pG7UZ4voQyOGmpeA+
         zR0qR0WR7TTHosllbzvEuCCZsvCzCXTP7zHevhI4csdRMPmIARoRL0zv9cqXJoErQXa7
         b4riRMuEkglQSEnBkcAAuXFjVU2kuoxK/QnU9pUPtqmdYb6waWwXzq0YVjLqg6Jdy67W
         XOFZvsmJjGQV9v7KAK0ST9rhHZS4qOdeDZGFoN6Uh8oy3ruT7Zdhd9ZWwlvsaEmXYzhP
         GN1EKZta2LN6G/FNIxuQ74E6mVfUTPtALQQ2IRIVQ11hlJjh4et7/g7WERzU0vlaP0QU
         OrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108853; x=1748713653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1jNkw/6MR5i6Cr/2hMjKLeS6l2X7bhc8cyPl4fASrY=;
        b=TZontHfrggnyH0cogtXHOKVhy5eY19SlOPkYU2/WJU/dXJ80tAbyXCwean25wnhpzk
         ffITmPMdQUOAvNJWizj4wlzmiU22rBpSp3HGeyr5nMzW/bAJ2E7An0nP5THEFSPYrzOi
         kIi0HqYSvE+wDLjf6CM8pUwDbGi5HWtQw9+fWkplWk1AwiLOQwrYBYoSikqPCPlszRv9
         axuOMapg1nmeQN280UBzKWCWBlAae8Co73oqWcN1+LFTwQ5oQCiQ/6O8HI3dKVC0sai3
         nj3eYf9kW23pVqVb6dYJWEAmKb3hNFMT8gJmuVYZcEeOgqj8FI/8vvKBH6DtYX0MeF6E
         Kw3w==
X-Forwarded-Encrypted: i=1; AJvYcCU2soY9yZ2DJxVAgkhwjqRIEVnsBn+uBbn9QHPASO2ZTE93Vm3p+i4RzFlEVls68+j7b0/OWsYrhTuo@vger.kernel.org, AJvYcCXkP3xF1jZIinarthylFweXO+wwE2bI6p8N4qVYLnBcAi2RT3ZegEeszN2DUj0sbvv71IqrgZ3Wo9M4Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoqimk1LYvh88OolHAGsEtdv/vndk/Edl7hx6a+QX7xj+wzQw
	LKc+sPUZRs2T4PsdqS5VDDkX4oBU78qLrES76xJji6ZrISAJB9mm1vfi
X-Gm-Gg: ASbGncuEjzqitAKvUW4WqHVf8rs6sf8qhSvIx9XVZj0mqBVoOP7v1W4dr8lkteoM7lh
	QksFgqQcC+fEUOzf3e6MermYvq+RUZVSqv2cCOXhOZdQ3ffnNtBl7T/egKseIo62Om6LuECW3l7
	71d8wfUyZMmj4NndlQrgDeoYiiPrsP3M0yLLhiV9c2BP0ly2SpIe934W3a/1SlofQtIFjHpycvJ
	jZB7O/E2fOWqpTD8ktuia1Auch9iv2eqWMnRr+aJBEG1LGx/yvk7R/hIG7zFqVhAlmFbAEtHQGa
	DXnIUFDksI6Nn6Gxvnxct64YjLBywqx2S/eScOKv21Pf6aB+A/ETE8jhu80NC7yHZQ==
X-Google-Smtp-Source: AGHT+IE4W1WB8obcvELVn+wfAIx5Jo4kUWsgTf7DpJX77pKDmtKaACgzTfTL+g1STqrPnix5Pr5LPg==
X-Received: by 2002:a05:6402:354f:b0:5f6:c5e3:faa0 with SMTP id 4fb4d7f45d1cf-602db3b4ebdmr1141430a12.10.1748108852944;
        Sat, 24 May 2025 10:47:32 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:32 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 06/11] HID: pidff: Rework pidff_set_time() to fix warnings
Date: Sat, 24 May 2025 19:47:19 +0200
Message-ID: <20250524174724.1379440-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes blank line warning from checkpatch.pl script

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 44cbd2a0461a..743b76c8d3b2 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -273,8 +273,8 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 
 static void pidff_set_time(struct pidff_usage *usage, u16 time)
 {
-	u32 modified_time = pidff_rescale_time(time, usage->field);
-	usage->value[0] = pidff_clamp(modified_time, usage->field);
+	usage->value[0] = pidff_clamp(
+		pidff_rescale_time(time, usage->field), usage->field);
 }
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
-- 
2.49.0



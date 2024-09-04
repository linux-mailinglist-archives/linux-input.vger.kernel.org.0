Return-Path: <linux-input+bounces-6149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C796B021
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516111F2291A
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66084039;
	Wed,  4 Sep 2024 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvUkLZzq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686A47A6A;
	Wed,  4 Sep 2024 04:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425358; cv=none; b=FpYalDXWkqXg4M+k0GC2MFCNvxstH+Ds7CaSxKwPbZ2gsT2iXa9AV6K6A2O9cdHJdPKhmVjfDmCkvvVuK8UreeSYnWdC3MKs6Z89YMToxTXd6kUfhjYSK1H6OX0RLJz4UcYoI8zRE+6256ISAVo11M0apAbTsNJYPk2uqioZhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425358; c=relaxed/simple;
	bh=nUdcUk0n40QbjO8u1pYU6pVpuCTqIUYlN9e2hTZhJ0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSC15tk75TnBil+Ymu9AIBUbCj3hGpa1i9bgk7pBPB8Y2ZOoj0XErVtfdyByb9jToV25KF1jFydTKMn1DYE9iFI3JxYGFYoqGymPuNyX2wl7F6YgeanUfnmiM+OZP9+0NF8JZw00D4dn0Mp0Eo14xn9jjKZB39ggqQxvhpYpD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvUkLZzq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d4fbe62bf5so429485a12.0;
        Tue, 03 Sep 2024 21:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425356; x=1726030156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNM1TbwY3bzDwgc7KYSWOhzEj80svR9YA5h2CIzmPCA=;
        b=cvUkLZzqt7Z57fPeen2zDEzFrmZUZIHB6utlGBSyXbELWc2Dzna8Ma0AdH8QW6ojbb
         C/IxqWg4vjYB8zP4BCDFT7acmWxyGQeKzs4U57QoD2SYp81B5MrMBVfrWIi2lIE9GO1O
         563MVlLZYJYu6y47uYkrw3f+zR+0uJ+b3Rb35NyJQKRGlwYkp7sHTWierH9xYm1vUa6L
         h5a4KBd91BS99fXAL3Qekm4vw4JcmhFiWga90bUX7Wh8UT2rJG2TczZN/wMPO1kvfqpR
         mlA88za5YJBPDXb9PRYKeIKpzZ/i94z3jv7WXNrKfoFD8huSucnGIlMXr5h9SKnGCPHX
         kqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425356; x=1726030156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNM1TbwY3bzDwgc7KYSWOhzEj80svR9YA5h2CIzmPCA=;
        b=TgUS3VVsbGYwwRgZpP+LgOTh5Q0T14E5rSxvcUyZN1LHCRAdG1c1JDt501vV/L7lux
         sN+tbnjnV5wUoTZuvJhlpKO/KQJmH1xZ+3tURMhdmbBSVoFFNiwi5eX42pBZh1Sgb2aQ
         /2TFD8LLmq+BDQI1E9UugjNrBg0p/UflvMpUTLVApvdPkzKj1O0RM1CNkVVxtGMhkh1G
         fGH/5/h2fwu3suAByFl3p2Z2cR0CptJJzjIoYhWfnBwEqBp8ADNbgdXpWvsZfjBYocbs
         M9JPWrLYAAIt/6sBDgcYT6zb0p4GYCJs0UegB8XVJSHwWJwf+EJ1VLAsYQ1GksoGOfeR
         VWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUGit5oJjMJDo80nSQ4EUrNIZCZxUCvBL4zmCqwqI32JDR1Jyj2YGW0UkWDvg0Q/iYUZxug2ScCzuWfhcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz20pEDDIIj4tkg1dIDgHO058HwBVs4Ykl9qubXGvJ5Egu5UYK
	0l/NbPo7z0hVFTn3LRteg+m6mIpoJbReTHNKoJQsViAHsyX68gULFp49yg==
X-Google-Smtp-Source: AGHT+IH96zZqHTBl+pedV3aEY995kllbLfzD8RbqaAZQdE55RmOvvfB7Lg1v1DedpcB2kFL41N/dqA==
X-Received: by 2002:a05:6a21:3483:b0:1cc:de68:436b with SMTP id adf61e73a8af0-1cece503ad2mr11545611637.20.1725425355958;
        Tue, 03 Sep 2024 21:49:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae953d92sm5777595ad.73.2024.09.03.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:49:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/22] Input: pwm-beeper - use guard notation when acquiring spinlock
Date: Tue,  3 Sep 2024 21:49:12 -0700
Message-ID: <20240904044914.1049280-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/pwm-beeper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index 5b9aedf4362f..0e19e97d98ec 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -203,9 +203,9 @@ static int pwm_beeper_suspend(struct device *dev)
 	 * beeper->suspended, but to ensure that pwm_beeper_event
 	 * does not re-submit work once flag is set.
 	 */
-	spin_lock_irq(&beeper->input->event_lock);
-	beeper->suspended = true;
-	spin_unlock_irq(&beeper->input->event_lock);
+	scoped_guard(spinlock_irq, &beeper->input->event_lock) {
+		beeper->suspended = true;
+	}
 
 	pwm_beeper_stop(beeper);
 
@@ -216,9 +216,9 @@ static int pwm_beeper_resume(struct device *dev)
 {
 	struct pwm_beeper *beeper = dev_get_drvdata(dev);
 
-	spin_lock_irq(&beeper->input->event_lock);
-	beeper->suspended = false;
-	spin_unlock_irq(&beeper->input->event_lock);
+	scoped_guard(spinlock_irq, &beeper->input->event_lock) {
+		beeper->suspended = false;
+	}
 
 	/* Let worker figure out if we should resume beeping */
 	schedule_work(&beeper->work);
-- 
2.46.0.469.g59c65b2a67-goog



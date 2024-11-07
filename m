Return-Path: <linux-input+bounces-7944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFF9BFEE7
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19577282D29
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9209219580F;
	Thu,  7 Nov 2024 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HljgRCNF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2757E1953BD;
	Thu,  7 Nov 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963757; cv=none; b=eYeTWtMIf1mnWRExw6nY40DeX319RWtolNNr4gIGUwG2DEEtTTgOBRXX38pR2r+eck4wgROx35IBrqfCru8LWEhSJsLa5XtF8VU3Z9EQiIqybmVWqkDfgL2dVg9da/q4HvHRAUSG8zpqCifGm3W8f5oaxCjAMQeTc46D4t8PXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963757; c=relaxed/simple;
	bh=gZg3E9TEbMgr0TWfCW02bIVmzctcKC1CnuaUU7RaWpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F54sN6BwrsFmLMtJJEZAG5Obeshnss3ukYQ5GgM0HRCuwX2161JBaw/bt5o+L2I8OqRMT+eneV1jH3LEQ+ORlZ0pIFvgU4Y/51CTw9v0k7ap/Pvgbat9A3LUqsfcFNeSfuLjU9srDJwTWrSN8udp99dJWq3zJbWpOFRW8K0upaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HljgRCNF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cf6eea3c0so6857935ad.0;
        Wed, 06 Nov 2024 23:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963755; x=1731568555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMYrbEqWbCEht0e4TRSS4DBG5we6uEz9lb8VuRuD1JY=;
        b=HljgRCNFoCu9My23Q3Bd1QnpkEU8rj+kmDqCCXXYpmZJ5GTIqEX6koudhF52Wdv2/s
         ixYK7cxktBVzagJ/XKGgrg4RADDzctOlWWwSmy917EDVV80h3baooPVJp/PZSh8phMOQ
         1PmuvMXtvSCcAvISItpZVV8eOZ/d3e3LVl1TCXPAJTZrBc5esnJ+cfrJkVhMn7c3AKyM
         mzGqYhCUceAd4TU9bZegn0n2TFwer5S16aUvxLHS0cgd+f8irWe5Umd8Jyi0zZ+otpm8
         68RYtyCEI1/cb4nRc1+7HqpVB4xwqcOTFJP8RLlCQwAa3VlCn3uGv5QTnATsbjY8851o
         iyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963755; x=1731568555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMYrbEqWbCEht0e4TRSS4DBG5we6uEz9lb8VuRuD1JY=;
        b=AVLv9nzrN5NDeLuJ++kCoVerlyd4AuOCg6MTTxaWTiz+YJgBRcdjimVQvXi91bu3zl
         lLsWL6kMqbF1ttd/MglwnlRqjBXK7XPjo0CqgR+w/+gUHHpryVvoAfZXedYxEKOVaYFb
         nMMj139Wl5aT5rnUJoemWYbuxSpP+SbGiUqMJmoM8sCRPjMbcIO1bJcK53RXO2M1+69T
         TLkhtB4p6+4eZ3xsWNOVAs7z5TpcEiAt9zr9Zyemll/D3935SjFK5DvR3NBekcrXOH+C
         sbmNjT+fbQJey2z5gP3Aa7c+21EuoyrZbsXMtN6neUBr378Yq3u18QDJWOdyxNil0p2N
         tNnw==
X-Forwarded-Encrypted: i=1; AJvYcCW80X+Y/HBEzBr5ypfRSL5mfwRbxLVPwOjKNOvFixDbNFAvc0QWaJx60mPhKzdJnHYK0jEyGL4cupz/oNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGAks+oC2wyKIxqEUDaQnLBdo6l7bC7tq+80kcPFEFqQN1vOO
	nWAtLFO8xoZMf55tiQSyW1LWHhZHzEANSLfPOl4xM+wEc3ITfP9J
X-Google-Smtp-Source: AGHT+IHqnRb0PLT8SwT3u/Nr4etLOltYCJVDi7KRvMS1jlvFJW0ZVLCUUFQvESc7nGZhBcRpBzaEhw==
X-Received: by 2002:a17:902:d485:b0:20c:7c09:b2ac with SMTP id d9443c01a7336-210c6c5db72mr555605805ad.52.1730963755269;
        Wed, 06 Nov 2024 23:15:55 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:54 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] Input: poller - convert locking to guard notation
Date: Wed,  6 Nov 2024 23:15:34 -0800
Message-ID: <20241107071538.195340-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard() notation instead of explicitly acquiring and releasing
mutex to simplify the code and ensure that it is released.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input-poller.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
index 688e3cb1c2a0..9c57713a6151 100644
--- a/drivers/input/input-poller.c
+++ b/drivers/input/input-poller.c
@@ -162,7 +162,7 @@ static ssize_t input_dev_set_poll_interval(struct device *dev,
 	if (interval > poller->poll_interval_max)
 		return -EINVAL;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	poller->poll_interval = interval;
 
@@ -172,8 +172,6 @@ static ssize_t input_dev_set_poll_interval(struct device *dev,
 			input_dev_poller_queue_work(poller);
 	}
 
-	mutex_unlock(&input->mutex);
-
 	return count;
 }
 
-- 
2.47.0.277.g8800431eea-goog



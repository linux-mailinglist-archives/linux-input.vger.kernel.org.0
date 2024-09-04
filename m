Return-Path: <linux-input+bounces-6139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692A96B002
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1446FB24570
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2561369BC;
	Wed,  4 Sep 2024 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4Q5UMPo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632C012F5B3;
	Wed,  4 Sep 2024 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424992; cv=none; b=coq4Vj8ZrYUqKrHA+eGrsdTlMGneKUOlhPLk9W4Q3eHLQKBsXTStHrv+cijiTyj4YZI0SYjDtxYXdnqTOPu+IjVGcQJK+uRDR+JYUz5YWV79S0k/N1NgkTSpBLQ2SCH6CifJDDJqtMEJsdCnS62QsaRdvoN07A/fQHYVDs2oVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424992; c=relaxed/simple;
	bh=1Pt6or8cuLRPc9wW+hTjki8JybNe3kymIZ/5ddMvGr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqSifD2bTdwqWNvc6nPFtQ9bKsA49UPyvOZ0m7nwg8fj6bq6rYy/dtinSjsj/kBSOhaLrjj1KCalDcNymW1s1ey74Q6stm0wM3SW5F0Fbuj6cZt50Z/i9CmOxw+j4dfIOLLuz8S3ucaqgTJdm6ABdafmczzpaXdosUm/MJHVxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4Q5UMPo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2055136b612so34892585ad.0;
        Tue, 03 Sep 2024 21:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424990; x=1726029790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV5jGamf0WtM+OqwlCcf8yN7/00KMm+XqnA+y9L7oQk=;
        b=E4Q5UMPonUibQLZs+bPE5qP6Q1yez027p6I95bSnbtO+lJBA7WyUc5ZiEyyMSBQaKA
         HDxKTU4SiaKBnfnx5qVO+ovoirEbmdu4wGHSw06w8IZSZ6+Z3KQZFtq3ZViT7EGKgRVF
         WSCwGznb2GRdVMFYDo5yPr5uTRPn+YtCm5hO9g1M4f0NA7UvlwluzN7fZvdqbO6wC9HN
         30Yeva60XWWaDd+WGtU+gRmJYJSlmp+JJsEvFMKs4jJup4bM+Z/7ymtBSvUl6WSzFx9G
         3s3gMOGnBYxQIb+Dn+74sAGVvYKCre1gcZAt0kR0DGhzJ/6SOL8UGMtkbCYB+EJrXFsi
         YPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424990; x=1726029790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xV5jGamf0WtM+OqwlCcf8yN7/00KMm+XqnA+y9L7oQk=;
        b=CMjFA0+NXrT0sF15UakkPPNodNG9d19WRJn4C1zpS4LvSKx/dfqVCS1ABsVA0ZEfJu
         J4sJiscPo4JDI6N83IPdv+/I50PNc1VAmAbnuCmfbjPP3Nd+SDofc78Rmmu0pzse1FDP
         FRSBliNlCAIkIknv1Az1y+AaZ+L8iY5hSZs16aFpIC97udVT4bQQxYDacMf+FSLNla6c
         LORGk0SEznXBbxjJ3TwUqk2s68IufIviaGlxULfTO32mgDBSDQDxrZYAa9/WIyG2FvsD
         BPzkbnQVwgDAY6G+PPXSPMHalMiggURRGxjKmJqvyZS5DpYA4q3utn1fYy10I7DXjbtE
         FAbA==
X-Forwarded-Encrypted: i=1; AJvYcCUyDcgpI8Y0Mp9edOLdGhymc3VmotcH+Ib4SC0xWbzh8YKVvgrIzqs2DTupkYwTmCE99V5wRZtlJj1NFv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxF/qZLfeTmwUKRm23Q+5Kn1eNH+I4oSSyhCXf6aCv3pSwtma6
	3IsmwIh/7aD7GWmnmOok7L/heRMx3Ah9dzxybsKY9Nb7hRndSR8c5czSTg==
X-Google-Smtp-Source: AGHT+IHFL6ukxR/ccsMugP5VjPf9FnxxkLtel9Fym4Edwu4xHTBNAqg6vXiFm3NDAZZbOn1qkQYwPA==
X-Received: by 2002:a17:903:1cf:b0:203:a279:a144 with SMTP id d9443c01a7336-2054650bf3dmr163102295ad.25.1725424990447;
        Tue, 03 Sep 2024 21:43:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:10 -0700 (PDT)
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
Subject: [PATCH 10/22] Input: ideapad_slidebar - use guard notation when acquiring spinlock
Date: Tue,  3 Sep 2024 21:42:30 -0700
Message-ID: <20240904044244.1042174-11-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/ideapad_slidebar.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/ideapad_slidebar.c
index fa4e7f67d713..592bd159a194 100644
--- a/drivers/input/misc/ideapad_slidebar.c
+++ b/drivers/input/misc/ideapad_slidebar.c
@@ -95,41 +95,29 @@ static struct platform_device *slidebar_platform_dev;
 
 static u8 slidebar_pos_get(void)
 {
-	u8 res;
-	unsigned long flags;
+	guard(spinlock_irqsave)(&io_lock);
 
-	spin_lock_irqsave(&io_lock, flags);
 	outb(0xf4, 0xff29);
 	outb(0xbf, 0xff2a);
-	res = inb(0xff2b);
-	spin_unlock_irqrestore(&io_lock, flags);
-
-	return res;
+	return inb(0xff2b);
 }
 
 static u8 slidebar_mode_get(void)
 {
-	u8 res;
-	unsigned long flags;
+	guard(spinlock_irqsave)(&io_lock);
 
-	spin_lock_irqsave(&io_lock, flags);
 	outb(0xf7, 0xff29);
 	outb(0x8b, 0xff2a);
-	res = inb(0xff2b);
-	spin_unlock_irqrestore(&io_lock, flags);
-
-	return res;
+	return inb(0xff2b);
 }
 
 static void slidebar_mode_set(u8 mode)
 {
-	unsigned long flags;
+	guard(spinlock_irqsave)(&io_lock);
 
-	spin_lock_irqsave(&io_lock, flags);
 	outb(0xf7, 0xff29);
 	outb(0x8b, 0xff2a);
 	outb(mode, 0xff2b);
-	spin_unlock_irqrestore(&io_lock, flags);
 }
 
 static bool slidebar_i8042_filter(unsigned char data, unsigned char str,
-- 
2.46.0.469.g59c65b2a67-goog



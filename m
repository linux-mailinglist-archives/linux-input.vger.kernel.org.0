Return-Path: <linux-input+bounces-4140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B08FD319
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 18:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82101F23014
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9226C10A0D;
	Wed,  5 Jun 2024 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In5euuUo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C713211
	for <linux-input@vger.kernel.org>; Wed,  5 Jun 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606023; cv=none; b=cvBTyhrrWEXEqZNwMR4Cdwbb4MR/Zb8La8lZRS/WcKGf5XjbeaEdEYA+ykRacnMnRfDQXRj/pCie1syWOdWfufACj8xmLdEBGfNNLcbZUtx2I2QlMn/eYAgZirWWUZoWklFtPVoqV2CCNiDcaII07NPYyYya5KRn17ezb9EB6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606023; c=relaxed/simple;
	bh=88QeYzlwtwgCLxcQ39+GSta4OStmZM6g8CYACM2VLsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYPWze9YDntiqbR/LOuF6yskV2qdO3tJ/eYGsd9jdWPOCmzDC4dFk0B4vMrEVzme+Tl2AlR8LtBa7hpr8Ybi8eCdQ0sPU6a8aVbUJcbjvPFZfLTA4ST9equ/fp05aPdvI4sxCojWcyET0R/ETpyl8RTVpN1L7g2Akv0KHmb0brk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In5euuUo; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-374a817a184so40295ab.0
        for <linux-input@vger.kernel.org>; Wed, 05 Jun 2024 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717606021; x=1718210821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEK4EmrGg/T1UvUYCKuD1YC94HNzsGWgNrYkaLmMqH8=;
        b=In5euuUo63TJ/jp7EMuJmBtvyFQeDtkfgyvRYNTSWn8xeT8J++yctfSE2/bGB1bE8+
         oX+QrI5cTWCwXghODi6bdQeX7icC4JxY+wkED2fTW9PWKlA9AT7C38pnnx8X6gYFjqLw
         82rPHmgCwilLC2lhYaWzzKWPe4/qyJBg6z5WmOvmPmMr5zQ4ZAfuow2mTwuPkm4gqVyQ
         2sUfC5Ibh8RvfjWwasxHTH3kafdAHLrE/zXynEYOBTDENL749rcf/cJy/doD2XuNCw/X
         LzvSAP7KE5yqYKCGsyn7KAOsLh1TO6WCdQ2m2n9SWR8riQG0i2529ZgvyVokw3dKtcLe
         NkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717606021; x=1718210821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEK4EmrGg/T1UvUYCKuD1YC94HNzsGWgNrYkaLmMqH8=;
        b=JXPjh0RlvddDZaNMbjdJjXZ/dDqwKKqERN64/hNzSdXn0dORkJfjzmFOTmF1zqpzuf
         imddLEp66kCjdG1uipXut/pCm01XCKIy5Pu43R32zeYzzq4XthwwJJb/H6zxmt0aeVFM
         lfBITAWk7Mk5SBgKnBqQbX1yOoOsldN4bYvQjbs++zr16PUX2e8pAlH+CB12mDLaDiZb
         iVZHeIbJ7zO3g5UWGxco/bvOtzJOnQLgRh2ADJfCcj0VOKokborqZlD7Ht+7dnE0bFWY
         85FqvK5IaaVOtx7F6oobD3MkX1DyYS0n4oKyHx6TIbxpqX/xeQ2yTSMGdYVPla86vRPx
         +OHA==
X-Gm-Message-State: AOJu0YzliQyvap1A3wfDeGh+tnG0jdeY36LPR3uwZbQ4PS2BgXwi1p1p
	gwPp68iEgL1Co0XlTMuEX8qVwjqBAYJ1q1ehDs8FEwzVnp5qLZQIRDm+sw==
X-Google-Smtp-Source: AGHT+IEfeP3PNyt1McrilLkDTw31aNt6sOWfzTZmKBYex9S7scUYjtOgojzoBNnUoAVxAWzCRXU7Nw==
X-Received: by 2002:a05:6e02:2185:b0:36c:7eb2:50d5 with SMTP id e9e14a558f8ab-374b1f3bc07mr33838905ab.25.1717606020547;
        Wed, 05 Jun 2024 09:47:00 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c3598482dbsm8572106a12.62.2024.06.05.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:46:59 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] Input: wacom_w8001: Correct device name generation
Date: Wed,  5 Jun 2024 09:46:56 -0700
Message-ID: <20240605164656.61623-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ZlkQZsbDKTkzUfE2@google.com>
References: <ZlkQZsbDKTkzUfE2@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Fixes: 6c7cc1a29d1e ("Input: wacom_w8001 - simplify device name generation")
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/input/touchscreen/wacom_w8001.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index e3767db8a664b..ed9cfdd616cac 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -648,7 +648,7 @@ static int w8001_connect(struct serio *serio, struct serio_driver *drv)
 	}
 
 	if (!err_touch) {
-		snprintf(w8001->pen_name, sizeof(w8001->pen_name), "%s Finger", basename);
+		snprintf(w8001->touch_name, sizeof(w8001->touch_name), "%s Finger", basename);
 		input_dev_touch->name = w8001->touch_name;
 
 		w8001_set_devdata(input_dev_touch, w8001, serio);
-- 
2.45.2



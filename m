Return-Path: <linux-input+bounces-11456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D376FA7781B
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 11:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6754B169792
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4600C1EE7A5;
	Tue,  1 Apr 2025 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy94/jXc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5761EBA08;
	Tue,  1 Apr 2025 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500948; cv=none; b=tVLdgE1cf3AroYV7s6ocYMXEEBB/0zZePxjmH5hMaCe2NClSKl4ZndR2TubKSr8Y8ErbLDv2azOD3K5j6Qt0fhDx/Ww9yYmi1hvuqLxQOwl1LQQzqQjaoNj9AdEuGBCWM1RW4szNzguT7ryCoKPd8edkhRgia303B6dmTNKoQYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500948; c=relaxed/simple;
	bh=6UIHKpioFCSDTBZJdoaNau7nO3dOAZCBegSe948qaZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XsqpAIWggPJWu3XoaGX3/FU7VHscDywuEGTYyYTvXhNbqV0fWKpUUrQDaqFUWkXq70sUgMGYY331BjjRxHg3F+xTS5eVTOXFgguG9VCxgkd3vaH9PgBRz+nrvBXCT7ZgGSDsP6t7lt7hF+GWtWNO/Pa4ezTAe0NoIBmyhB4YwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy94/jXc; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2295d78b433so9995005ad.2;
        Tue, 01 Apr 2025 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743500946; x=1744105746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nEv9T0J1M02Dgy0xMLGwijEFtNEDHB5qZ41sJwwoY8=;
        b=iy94/jXcW4CzvB9xWFa7hvHbcjRnwFqAbVNSB31WSGrCou3upyE32Nk7YVy1tpaJg4
         9biZ4VKEn3leI4rW6Ac3LqjCEy94kHzZV+2lD4ndl1Qa53JDpMXoEYyPTkp6UQgXkhhp
         dNjYEAZIsrwS304/FqUzoQPgWDWrfelYR7qAulVjxkLqH8h6/h/tUOd4z/5bQmAN+wlG
         Z/lXKXU/kOTPeLTJKJxvjOJXGAo+M0WmjDuL0KQwJYbF3lxpd3KmYRdP0FKYQi6GVS1h
         RAZppm+SvsH7j+o7GrCgf5R5XuUdRaKYWyheg/JXFDFEu6izjTrfP4ls8q2j+3oNbmEa
         YzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500946; x=1744105746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nEv9T0J1M02Dgy0xMLGwijEFtNEDHB5qZ41sJwwoY8=;
        b=Kig8LQP+//XZi8PpgDAeG1v5HGi0xJElc02EvjTTwowhT1qaonx3S6tu/Nc6Bke8Uj
         +JMA1DJC4cCasocxvRLLXtz4KTPjNXEFX4+j8gmta8O7OekANEhkAenvp0qyYOMczan6
         y0iucsrexiuZgN6HmrFOAB5/57pyHohwm8CJdAhc1RxooomxJJYU/OTgxFy8+AXSt4wr
         KhOqJ7rOyw4IY1FRPTBdkY4MoLf2DHtR6ipGDLf+MoMJZq/2i6Vcl1SoPgUXuvPTwxMh
         Jng2T6kYvl8llZ2JoatTrJfko2Yi2Hwf1OO2dVyJgj37k96D9h7iu/INk+9lvLuTROnQ
         G3zg==
X-Forwarded-Encrypted: i=1; AJvYcCU7QdFHhWMAd0k1830d+Syzt9imH4+MN/7hc8Qx4B/2xtJcs5c98GrA4ZUetYPDSdLIfj/3cdZv+pgkqX7b@vger.kernel.org, AJvYcCUi2pEY3tpv+QzrAVpaALvlQRp8HBzZH4axD3rC2Tao4l5pBlH8cqwq09nSXRMf6rJh2eVn8bvK0cDJ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdtIR2GBRholL45JfJ/s3pvD/DTxc8PQl+i9Xee/FF1a7YQLMF
	JiI+NUhNikGelM9VA3aeIF3WFSA62/FB27QpLrtUybt0iENGbflu
X-Gm-Gg: ASbGnctLXH3JFeuALey9rI50tD10Z/wZ+NUxxMkjSzXOVv5h+CjxkQYGnYydMMibXsK
	BUBYniN70JxRrN8kq+g57HWoqJcs4CdJsX/ntpAOGLMEfnE+9DElOVMYSaZ6yA8rWXL3uWEzZLZ
	wAc+8K96/a09aVTWulUUaQXMR6IXTgw4OwcSKpbzrxRYlHPcaGVATFVN0sTHcf4RDOn08eYBSUp
	dA9Sx3X0PKbvaVIhVQbwaD64L37rvP9rXfbhULUlPJh+677MPLMw6YrslN21dVLRCfvjMghHfJ8
	i/wZxLo83C/BanpXRinfIYSfOvPeKeCcp/lc2DuPOv9r8f62vP/Bg/bo/sgawDho5rsPzRw=
X-Google-Smtp-Source: AGHT+IGjgIR0WZz2Z5CMj8dSWpejQg5NiXCOS7Xfiw2NFywEclG7UN2EGDZ0wYQQ5AtwTEsRZZzpig==
X-Received: by 2002:a17:903:2311:b0:227:eb61:34b8 with SMTP id d9443c01a7336-2292f9777d6mr179473385ad.25.1743500945891;
        Tue, 01 Apr 2025 02:49:05 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f84fcsm84327575ad.228.2025.04.01.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:49:04 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Markus.Elfring@web.de
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v3] HID: uclogic: Add NULL check in uclogic_input_configured()
Date: Tue,  1 Apr 2025 17:48:53 +0800
Message-Id: <20250401094853.24143-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a73250f0-8fbd-40a7-b4b6-bc45050c9289@web.de>
References: <a73250f0-8fbd-40a7-b4b6-bc45050c9289@web.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
uclogic_input_configured() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: dd613a4e45f8 ("HID: uclogic: Correct devm device reference for hidinput input_dev name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Kept the original switch structure, only optimized the outer
conditional checks while maintaining safety requirements.
V1 -> V2: Simplify the handing of the condition "suffix" with if/else.

 drivers/hid/hid-uclogic-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8008933c052..321c43fb06ae 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -142,11 +142,12 @@ static int uclogic_input_configured(struct hid_device *hdev,
 			suffix = "System Control";
 			break;
 		}
-	}
-
-	if (suffix)
+	} else {
 		hi->input->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						 "%s %s", hdev->name, suffix);
+		if (!hi->input->name)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.34.1



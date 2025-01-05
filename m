Return-Path: <linux-input+bounces-8914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB6A01B9C
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC6BF161ACB
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2965F189B83;
	Sun,  5 Jan 2025 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz0THIaK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC71C3F1C
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105893; cv=none; b=PQw9UERFfWJ+nGH6+sUOh7VvRWLQ0PFLcPXVkC0Nh8PGMROJBCtalySCs20n1J9al15pRpCTd9/leGlFaV2X2mS2JvlqbAKHqJcF7rGN+BnunsQlHYMACBFXcXsvUd7LXYrgf0thQ0WhLfIH1kDIy6fuWQ5uSw3HTBb+p+E599I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105893; c=relaxed/simple;
	bh=bM54ZyaIQjGoqs0cBihxOZIsdwj2ZkvengKo2A7Ku2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2b0viFgQSIujnsbOcma2FXoECZAZbOfbr/zuMB+CodVX7t1QYf6FFSZaaoSG0vU87lC0Kdt9bhAJMZx4Jz4icALamRLPeOeBKHexi0gEOTRkXXgq9MFkziTSX/fFw6bNdDMC9vPiFXfdtxzZHqmStpTVsdlWTGM5gvfL/9sv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uz0THIaK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436a39e4891so42750455e9.1
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105890; x=1736710690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEX+NAdBDoaB6TEqF3DaqclGaBaxA+ArpAVDhk3GbyM=;
        b=Uz0THIaKRKG+6Fpc1syN36hWlH1GBHlXxRowstycJa/WaQk53/0lfH8rRuzt3iuuFr
         e3mJi2qGHEb/sW7cO1iSdSEKY8WgaxTACXVut1+VI6Fc0Loy0IMVm+GMjW3bonsFuDZ7
         O5LTWk/MFDz9JchbtBroPtBmyLXT+ECBnoZImfeziE4CZM+Ekqv5PfmfSMDyD7i/4emo
         Z0VvGFlBt6fjEWyeL0TrU04TxSwgh2MRbsqm82xkF3E2OrNyJVmmXIg4z1/a8PSFWv8P
         6nTlXIT1473cy3KpUUU7XckBlp4kWjraLwvTUD11OyZPN67ec8/3myqZ0lDYd1hEiDG/
         UcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105890; x=1736710690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEX+NAdBDoaB6TEqF3DaqclGaBaxA+ArpAVDhk3GbyM=;
        b=QXTtkvwjY/paKCa4HWhe/x5/ezBKCc96V4PHFeZYq4lkY7cZsZyGCI1fqjMh553oRE
         WugRKhxxzlzSPVhNbmyywe1bGhKtusyfVh1Wzw6VTrwt2rJL69V1qXEzzZi1eUv59Axc
         uxJd2eU/r3vg/Exm+YUBluAR9JLewAf7NaS7jKPFtBrbudVnUs4+pl4s8a+D26XwOJsR
         0Ef5HS3wz72QDoAIFwXaJkO4O+7QI0W8uyJpbtgwv/mmHkCQP38EMCFlf+OfuHV2pQaj
         fhUUNwih0hoG4eGHEU+oPHgyK94yV+p5ujbBmiFFL1S2rJt0CuiFjBtd4mKzYuSLfUpm
         I5Rg==
X-Gm-Message-State: AOJu0YyWaHJGvAFocnRxt6Bv69VTeyht3kNzf0XB8ilLCEmWq+ZdlkjT
	JE+UaxeXMVwD02q18Vr2iepCk9YpHb/SYEPLaMxvhQp9/cwsLmwqglhCLbmOLO7cCQ==
X-Gm-Gg: ASbGncu7pkT/agkZlV0Vbj9nOPCnzVR4k2WqXry57JolBK12arMpgTlSFQjthHNxU//
	QymSv82L5Y6kfFBfOK09cGS6tK9arR/ezowV9pjGwN6oj0wOJbDOXgIWHZnW1serlxxRySNeoLC
	LC07AQaibkrcH4qxM7N9SSsxSYm3PSRUXIZ3gLmgCCpzYIeig4LtQx7K7+wWKr42catZXtjrH4W
	WiGwWwHYVIjvNFHrgJrEx7qOffhZiNtGidjiMPF7DV9zlLSAfIYBI4V+ZbQbPjnYgUW
X-Google-Smtp-Source: AGHT+IEaBydAAq1NW5l3UelWGTiBrwqJMI4QtvLLwgzKMiDNPqrYhOx7+w9MTHZqloio5uNgtPUtBg==
X-Received: by 2002:a05:600c:1c1a:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-43668548301mr458500855e9.5.1736105889735;
        Sun, 05 Jan 2025 11:38:09 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:09 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 09/13] Input: xpad - add USB ID for Nacon Revolution5 Pro
Date: Sun,  5 Jan 2025 20:37:46 +0100
Message-ID: <20250105193750.91460-10-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Stolpe <martin.stolpe@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b2716b49d3b6..1cd946b26451 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -390,6 +390,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
+	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
-- 
2.43.0



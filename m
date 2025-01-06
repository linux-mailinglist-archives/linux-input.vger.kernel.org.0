Return-Path: <linux-input+bounces-8981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D826A032F6
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E5516288F
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFAC1DF993;
	Mon,  6 Jan 2025 22:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5FClYFj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6351F1DE4EB
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204105; cv=none; b=WXbArIcg9Ii/wxdXwGanYLtRb9l4VsHstdWZcNuodHjbOe9mrCZdnydXLrk4ylsVCpPs6gNofPlX9L6ka5LTLOj83g07HSjZEYOE65ZGMueyYoOAcGCiGARdQra8oZuzhULUTj0SsA9d49ub87uqg7Z8DuArerHlDfk6PA4Pvv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204105; c=relaxed/simple;
	bh=3mzlM0CzumBbsyf6fF6Zrmt5bkTlWOWJ+vEiSuStkN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9YCmg0obWZDVZlqZWmAXdsCT4CdJF1DQiHdLTsbK4/0dNF3HNA59zNL5+kYgUbdREZ6OGtztxfndMxv2EFV5nizIaL8Sxi6vZ265TbYBiWvYoPrPfBe3xW8M7i/vil+HzDDSfDppxBV+ENpR+hwxlSKV1kJAnAqJ3k3oiMmYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5FClYFj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436249df846so103313605e9.3
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204102; x=1736808902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA8huwrj0q3Uc0qIXFUpZxFeFcf3HkWyWWQwfPo7SaE=;
        b=U5FClYFjhWvZfnNzUm9oAVNJLYG3JHIJjqrxcjtjlTp1XEMFMe13yhDIF1p3VI17dW
         puz4x576U/X+bEEk+1BaQ1VMDBTEpuZt8QOmoC6m+Pu+YhOmBG6Z2HnIujXSc6TfV5es
         rtWjJyMtp8hVYaFlFs8XKEqx6nM15Qh2WQmMU0uq9RtWCpzXGOEgaQU4joT13pjdrhzC
         w1hqNTlkyjgV+LJnt9B3rFmNDJB8d9eFPMlNCGTgDheR+1U0vF6dQMYDC4qAjZln4Vl+
         NrCdF6ajkrFqDipIGpTiMGXvO025sZWi0sjEb7rGo+P6tvIE0BAqbvgiwtQl6J8X9DbJ
         w69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204102; x=1736808902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA8huwrj0q3Uc0qIXFUpZxFeFcf3HkWyWWQwfPo7SaE=;
        b=B9GsDVBBF0lUkx/TaGGVPtdM3oKFv7uKW7FllT0Z5uLd5cfg91QU42EOknRbd+E6uH
         PC3f13Obc4FHqJDHrB+dtQ81T5FC3L3PBBfAV4jLTLt8nyHdl5bVyql0BY42IBPMxuPo
         L99AmyrXtZW1pkNQ3VqjGMj22qSdVC5gcfYvMFmBEOHD5th2IEVE2VJX5aYFsU26xdaE
         cx4hvdPfRPnemM22WDfCIXcPCwu7Wjhx2qCUJW8SSwv4+DhIVz6X65kg/IOZKf1ZxZTc
         LcSeM5ycTRIxhMy54lebHE3IXRZOVjF1NxgpLdHRz9VSe8g52WPuJgOei+7nsu5/NiPj
         I8fQ==
X-Gm-Message-State: AOJu0YyG8tEfDUa7fxuTSslNZz7iN5fMDHH2mB7yy5yzC+bnZFRcgFKX
	Q7t3uHIAtl1OVmQQHbY2vkPmzhTIJxRzntsRGU8E/fjMneFWc9dbdfSuuvTzRRsxeA==
X-Gm-Gg: ASbGnctL/fsD5a9ldcdWQDa0f8Nv2GuuF+9ZvLLS2Vre22buvPOXkjtAxdQ9QgZ3zdQ
	/e/y9ZnOWtw2wiGql+Nm9+D3G7TL3IZiQRxYLF9b1+WlS1/Kunds8vO6WH4N5D65DJGiYBKREpF
	dtvHhtpQMKaQ9b6UMWOTKHMpN4A6eDvsGof5qejsQYdJEgNbRoD4xS7eWVehdJpG7vRHDmrLK1a
	nSQ2KA2Z9Wj4Aa1/rmXKKGBrqWqU3DRknJODOZUcTGeO72L2vOGe5D/XTqR3piVXZHQ
X-Google-Smtp-Source: AGHT+IEbddqj6251evGmZgHf7AxBcYKkbHWBNDJJ6GnVIt21QwNl612S8I01dAcTLHoakwwZtIgBQg==
X-Received: by 2002:a05:600c:3c97:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-4366864346fmr498284045e9.14.1736204101545;
        Mon, 06 Jan 2025 14:55:01 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:55:00 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Greg Savage <gsavage13@hotmail.ca>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 08/10] Input: xpad - add support for PDP Mirror's Edge controller
Date: Mon,  6 Jan 2025 23:54:35 +0100
Message-ID: <20250106225437.211312-9-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Savage <gsavage13@hotmail.ca>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 18e33e2aeaa7..509e8681e5dd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -238,6 +238,7 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-- 
2.43.0



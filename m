Return-Path: <linux-input+bounces-12407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3DAABA992
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 12:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D85D7AFD19
	for <lists+linux-input@lfdr.de>; Sat, 17 May 2025 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959421F5842;
	Sat, 17 May 2025 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW26RYkb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9D1F473C;
	Sat, 17 May 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479090; cv=none; b=sXvdjKhgmisAX7amwzyYWYBzyXFEKv4uPmCINvEeLOll3d+B4VKtlJqJBDQpqB3qudHzIBwQiNvc7jVVROSbmEXOsn4MCGulo9ZhHOMNI5bo4/dYUSkz+1IX+DzxG+kIn/KnRHbZUPEfucvGjqK5CtXxwICv247QvB+Gsxbg3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479090; c=relaxed/simple;
	bh=1XvKBOSD3xgOL+z79wApuYno6FZ6rSI1CbkP/aP9Vno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD3/uqt5sI2CrDhwax9ZRQXm+1TNUEzqWDynxNCc5SPr0ujpnr8PB4R8z7PgPcCSudAzoLUKxkcooCU8wLw7yMWTkL+BI1Hb3PFAPa4ItslhA2RDcEtpuUMB1qWlkTPuxl80rgZ3LaagK9GpuxMJnb3F+g4jGD711jy71hTjSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JW26RYkb; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so29691b3a.1;
        Sat, 17 May 2025 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747479088; x=1748083888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHVW8TGLuAFezbf0hRwngFWGRXQ+PK/CEwivyg7jtt0=;
        b=JW26RYkbGI/qJphOjLesEJRPEL8bs+ZrB2GZRRYk/SCH6fPbCjNohptXBxJn7IfF0I
         5ghbVILgXhYksDjGyIMDALQ/Mtb/VrdMPl2ndu02UcpwuIjtCBd+MXCRhXZU21tmBGW9
         eqIvsDq3vpcQyETpTkr6yIMU5uqm5WYo6IBdmCaRZDorf4fflYIgyu44ju9PgjXlsIQl
         1qRJGVxY1ygTo7WHR9khKCNP9//SNhiwH2ucGco8P4INg1QtUiN1dVBYF43pY5veq794
         MfKBaapApBqWRgAUefNWU5SVYv9n6NELT4gMs6GZateIr9mggVQeEXenaN6vxR1eYOfl
         y9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747479088; x=1748083888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHVW8TGLuAFezbf0hRwngFWGRXQ+PK/CEwivyg7jtt0=;
        b=AbjQ0Ti2dTsrKEoVr6yODe6QlEbZ0+G9akr1dIyfTxYNG11oMO31zFI8UBIwb4+7q2
         I9OQewJs3uhLTi0K8e5T80GBWCAvJo9LyN0/9pbtVUzEuxcwEmzhpZEERY21ebCTX7We
         nJSUoSr67+aQqcqoSeAWi9QyglgtImQuLnB0OKROn4pFAR9TRXUWUVlBTWdeffV9fcsR
         TB9XeXLs6hRS2XK560Tqf3OBCiuaWHW2b3J5hDQLJ0/m91+OL4+WnG6hsMqilHuf+GS0
         BlodIgs/ykPcDQ29hJCXaFHl0jQ7CdmY+79GKMweFMVfI/v6lk86CRW+IzMaIdnCu6tQ
         uZew==
X-Forwarded-Encrypted: i=1; AJvYcCXlIEoxAy88f8DAXnudgVjFmDpBKBKstsGYkTToflfndYTK3tDwETk+5aTqX5sWuSuYPkg9SVZhvabETv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIG7IeBH0QM7LJvCK0LW5b57/bFIqJy3s0h6cstWXd6WrkKXBQ
	LOHCBe+vzBj5ByhZREfi/usA2hYGomCXvk6ahIjcKnRiOR2kTitHyiFt3zvlmA==
X-Gm-Gg: ASbGncs5ekJvZ0brIFxySwgQhoDZrh5fJ7o2L4ltmakLmA4D9blLJ7GEO/MlwyNGFYX
	UP6er646exjPbjf+MfbtSuEQcN9PzWQjtIM0oYpri/vpQzWj2EzIESBvyAIszMg6nL3A6tX/zMc
	g+2DN/1rxgzW+Mltdd9bZbGqMlhdPkRvx4XRu0UCcJoLZbgkuTTe0y1vpwBm8WVUkcU2plGeKjB
	b7XjgIfom7otjsrycnVkAy3c1svjEBn9sWJzzAJRiLc5zLO8EgQxzZ2cZEvyu5DPEFqiqiTXWku
	kXczP+WTT1wX1aOBBtmUsPoZO82ZIk6xo/yooOoN0DILs9PnCcQcAQNqioCJEFY3SMZ6nCeu6vG
	ShmoNiJ1qK2OYfr5h+9w3aLmnMIla
X-Google-Smtp-Source: AGHT+IGhVgMy+85trh+zjMU0spCs0rLmqC6BXFFPL6uKKI+wi3M2mFF5WKFiWmsEhmDlLRoyrxHa2w==
X-Received: by 2002:a05:6a21:9988:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-216219b25c7mr10810097637.32.1747479088236;
        Sat, 17 May 2025 03:51:28 -0700 (PDT)
Received: from aparle-thinkpad.lan (c-107-3-154-49.hsd1.ca.comcast.net. [107.3.154.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5f0sm3051480b3a.56.2025.05.17.03.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 03:51:27 -0700 (PDT)
From: Apoorv Parle <apparle@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Apoorv Parle <apparle@gmail.com>
Subject: [PATCH 1/1] Input: xpad - add disable_xboxone module parameter
Date: Sat, 17 May 2025 03:50:45 -0700
Message-ID: <20250517105045.70998-2-apparle@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250517105045.70998-1-apparle@gmail.com>
References: <20250517105045.70998-1-apparle@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This parameter skips probing for XTYPE_XBOXONE devices, allowing
out-of-tree drivers like xone to handle newer Xbox controllers
without conflicts.

Signed-off-by: Apoorv Parle <apparle@gmail.com>
---
 drivers/input/joystick/xpad.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 57a5ff3d1992..5bab5c2250d2 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -121,6 +121,10 @@ static bool auto_poweroff = true;
 module_param(auto_poweroff, bool, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(auto_poweroff, "Power off wireless controllers on suspend");
 
+static bool disable_xboxone;
+module_param(disable_xboxone, bool, 0644);
+MODULE_PARM_DESC(disable_xboxone, "Disable all Xbox One devices (XTYPE_XBOXONE)");
+
 static const struct xpad_device {
 	u16 idVendor;
 	u16 idProduct;
@@ -2089,6 +2093,14 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 			xpad->mapping |= MAP_STICKS_TO_NULL;
 	}
 
+	if (xpad->xtype == XTYPE_XBOXONE && disable_xboxone) {
+		/*
+		 * Disable XTYPE_XBOXONE based on module parameter.
+		 */
+		error = -ENODEV;
+		goto err_free_in_urb;
+	}
+
 	if (xpad->xtype == XTYPE_XBOXONE &&
 	    intf->cur_altsetting->desc.bInterfaceNumber != GIP_WIRED_INTF_DATA) {
 		/*
-- 
2.48.1



Return-Path: <linux-input+bounces-8982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29216A032F7
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124371627B0
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F93B1DE4EB;
	Mon,  6 Jan 2025 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCatFlfj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A61CEAD3
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204106; cv=none; b=ZUoItkUoaZkwni9KCNYOOYFghKw2my9EtjNY/fE2vCQ/F+wGHNW24C1cjpHyAvHaNzssvhuIvjegG6WP3AbtvWC3/5m1X4btcAeVCN8xwvFQrlSzWp1Rl7G4P3bT1pU6phPJYviI0hSjctjGk+X6uqRuan55Dv3QGW1x4RFh8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204106; c=relaxed/simple;
	bh=xaGQFB/3tHoelS+lAm4HlmNSPyjqkE4xvVsDWOYfmOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgO0iZYszbmjNkMXOxtVi5dBe2w19dTBDwQPaIuR2GI7422htF7j1lOOzCkewelITO+XC0MuFO2b+TgLwWLSVUeWr3UA6iSsHKBrlnQmdTeESnSWxNaJtU2dM1tzuVcU3SsMWz6Yoem3XQAD/NbhtXrGxP790/bCDnx6tZfIjRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCatFlfj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436341f575fso153935745e9.1
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204103; x=1736808903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uww1KxRaoTyZr8TTwGtplN/ZUFEPEypX88fWvlepoWo=;
        b=ZCatFlfjU1+kCWoh8Y1BReZ1G7mOg24BhgmZjr64d8U3LENVh9v5RfrygHK9RlC/Bt
         T/Hg/QhJuDb6cv/L8fixj4wtwB76GKLJE2Weh3SN3BPgElDlMSzPBy54B8tq1uhLgrRw
         Sjv3QgoOxxkbYfj/j2OAYKIvXtJ1M7Na/on91J8h9gfngTHA3bl+hfvaYjH5vUJ2T32u
         lrC9s+ZRs3GWQGQ4zBIcWMaBiOGUCbvrFiPDlQ1V6xcjfbF4Wz5zLKpG/eym4YYql0Oz
         zKYLsCdYY67fFek2SIgA28IxBCCNy5vNx7hZpBIIneT9GPYHmgjDl4Ub+z1MlvpYFwAi
         a98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204103; x=1736808903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uww1KxRaoTyZr8TTwGtplN/ZUFEPEypX88fWvlepoWo=;
        b=GKdQO3I2rpQuId1pa4EQdAaGPfUVtDvY87i6yl4a0V0Qs4i271djp/URgXYsslV25C
         eltdOH1RZGINDaOLwPaPPgkyOCRm8zf3hyFiW5nSq6LQs0+FNNfSmpZmVpXeC75nfbd8
         dzEAgDKW7l7NLQhmOVg0uPUfmtg0e2W5LwYEIn/f+6YgQrtLPJUAOpGzfNwvcqubaVR2
         lObAs46QtyL3ErdHwgwebvWQCcMGmms+2TPsYBXTttlBApU9my3cLIu6ADRvHsRbG61u
         bzjsPFMZgfF9ur/yma4N0I7E4mWsX2YuU16pyTUVNzYt9yMPBYLXSFSO7JqituZqkh8v
         qH3g==
X-Gm-Message-State: AOJu0YzrDJ90VBhJjhTHg4pegQS5KdN4XE8mf/TVy661PP1/IHUpnOdT
	t7PShlYTWoD06T45zn7dg2y18TidopDkAEpiZUOo6x+vkj3M+Q71hW2i8V9v1IHiSw==
X-Gm-Gg: ASbGncvFJByuW/PGGBGysdlE+4NqbfF7byqQkSxMlFvNf4fpVZ7st7lHajVI3Bx2DGs
	wOMchXkKzCPapIWONM6vFn8M7d8TSBJS6OpONbhbdaFjd6UhF5bZOlO2ldjqwVcam19p9Wf10dX
	zTu9g3ONy0aWVwXgISp2wsZQEaVGpy5EK34PIcbPwSlgVCTagyLw/1xri8zvgZ/kqi5VuEN1ucz
	cRUsUo39IbzBKVM3MmiYd7LZjJmFJllv7MlMie3RQ3y1V53aWhQ6uaQntYjsmLAMszy
X-Google-Smtp-Source: AGHT+IGSvK+qG+Q0ENkL/wDd7vvIKsmSeV6e8OTE90QJQlZIJD92dl+lDSF2857GoxA0GfSj4VwWDw==
X-Received: by 2002:a05:600c:4f49:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-43668a3a334mr454312195e9.25.1736204102739;
        Mon, 06 Jan 2025 14:55:02 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:55:02 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Fernando Petros <fernandopetros@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 09/10] Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
Date: Mon,  6 Jan 2025 23:54:36 +0100
Message-ID: <20250106225437.211312-10-rojtberg@gmail.com>
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

From: Fernando Petros <fernandopetros@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 509e8681e5dd..647c788ec5d1 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -140,6 +140,7 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
+	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
@@ -497,6 +498,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x044f),		/* Thrustmaster Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
-- 
2.43.0



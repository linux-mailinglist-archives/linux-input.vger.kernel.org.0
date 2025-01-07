Return-Path: <linux-input+bounces-9018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F70A04A3B
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48493A63F9
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87AE1D63EB;
	Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kap/TvZU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7F1F542A
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278126; cv=none; b=QkN3KWEAdth657GtvfFgU1yCWi0Qo2BEFt7S//p47pA3Su9Or17FvZpR3mKfYF9Dnx3N+IHWKwysPo9BC8+lTa6p05/A2FFkolOqWB5a/zOy9DIEqbr7Ce6FjuQpAd37sZp7QtaegAGhg2rVmWTTzpOuj8PN9yio8dpdeuWKEbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278126; c=relaxed/simple;
	bh=IaXVmeNNYfQOu4rUi97+QjZvXWvDEi6cWW+Gb2i4f6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXl5qCFq+50QGdaMl9WazC6VbeNUygnVG8U9ac9GFOdTaFoBY6vQps+j2L25nosOg3MvC7kWBy8qnUylP397B4ymYzDEKvpzbTBzy3Ijm8bdH8xg2BWSHsjOXI3fthWbl0dI04qCBjW7W1FlP3sR3YXeDZ87HCnnUcyqbN2DsTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kap/TvZU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso758375e9.0
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278120; x=1736882920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wc0V6PLdXXk4B9VRfekhxm/qKIdoJCR2Ud8roODqlio=;
        b=Kap/TvZURKY0jHIG9vMGVltVAaUvW224z6ISi47aramYeg00NT+7cOFvALVr31pT+L
         96uBLEDUh4GwPxYjSXVDmYrBAambBHZiULhzNV6yUCyTArJBOl6FmTay3TzNpIQ3O7/e
         ujaecSaoa2D7X33daVfIHQvyWvgyefCjSLOednQ/T9KGk2ccYKFE/3IzYF0qxvae3huV
         XmIOjexqwHZIVVUFFMDP7JvApgJlbMZQPOQY7Mv8ZRo+RV7gpxxuu1bV+6UOnsoF8l/E
         ql+d9DbljzXXyGfyifoaimoy56CKth33uF4J9/ljYbo4CkOjrwfANbYvoaQT38MupB6y
         SayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278120; x=1736882920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wc0V6PLdXXk4B9VRfekhxm/qKIdoJCR2Ud8roODqlio=;
        b=SJPvtG4nEOpmB1yVrRsnjz/8xOV5gpT/jqyW007w1bDBoa2Sm63Ex0Uc+EigVvZaXc
         /H9AAa5iBgolv+vi7w1dnuKc1+AlVRDSGZS820EXS1AOxfS65nOty9rmO6td1AXbRcEy
         2iltdqjwYRgRh73HBCtqV9K/nU0IaEE0AcG8zXgG4PNNClxHLuq50AfY4UdxrI80rtTQ
         P9gW5U5VsZ0RXDxKigMRXWIBk1AKzFKK/jRin3TJoZp859Th1EudfzaP2SVMycdtMX3+
         UmdwXv75L7dK+kMG6XcgIr3hmQ1SHir2nu5O87GsQa6VGpKqzWjsNVBtgGIwLXYjehFv
         pgMg==
X-Gm-Message-State: AOJu0Yzr99yeoo6Ubw+Z7oPsqzmxtoGfKpDtKMFbWx0mP3IF8baUV82T
	YddsANfBWpzTerqM8PaUQDz9NukAZxKGGYPz74Ej9J5wSrTf8AOfe2+7DuAn9mi+ew==
X-Gm-Gg: ASbGncsZ1gW0es6++ZsOTdGXaeFE8QSBdFVPhjND7b2s1t5khpJ4erUVCsi1/Ktf7zt
	/SMTM/uo6Xd2yyanLCW+vd/YzYzqq8XcZljsAQsKThzD4jP4k46rRMABjqhR3QlDd1mXpSamnrF
	pUpfLqukoadEyVzC6XS7J/iFCb7pBvtc/W1IpVcdhY73Ci7XB9jddwWAWIeoQflbDkdea+TKpVK
	dbpa2m+OUUs7+Ni10IgRGPJ11ypv2m7FFvVuVrN8XdjLKLGBPDtjAB2T+uvR92PULKb
X-Google-Smtp-Source: AGHT+IGmHy6rwI/2sn+FIDTFNsZOOL/fVhmUFAzgRzWIRfmL8ZnWfI54FThlTzLy8N202BjOfsbK+Q==
X-Received: by 2002:a05:6000:1ac8:b0:385:f892:c8be with SMTP id ffacd0b85a97d-38a79242f7amr3730444f8f.23.1736278120046;
        Tue, 07 Jan 2025 11:28:40 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:39 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Thijs Reus <thijs.reus@trimplement.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 07/11] Input: xpad - added Turtle Beach Recon support
Date: Tue,  7 Jan 2025 20:28:26 +0100
Message-ID: <20250107192830.414709-8-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thijs Reus <thijs.reus@trimplement.com>

from the diff from:
https://www.spinics.net/lists/linux-input/msg75512.html

Signed-off-by: Thijs Reus <thijs.reus@trimplement.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1cd946b26451..237704b3fab5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -176,6 +176,7 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -283,6 +284,7 @@ static const struct xpad_device {
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
+	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -366,6 +368,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
-- 
2.43.0



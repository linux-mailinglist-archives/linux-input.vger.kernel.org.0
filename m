Return-Path: <linux-input+bounces-9014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D064CA04A3A
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DACC1188804E
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455B01F540C;
	Tue,  7 Jan 2025 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4LpRgI1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D41D63EB
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278124; cv=none; b=FL787rk3/k8XF3cAWBlXfSWh26+324hvBLOpZdk4JUxt7QptAR4nFaOhksBr2HkMBjGPd27PtgRfmXLDQWOgdEFbI4KBu6OrDxVQrYcRRLHml3EQng5yqccgSHYrUHBJ8LLOUPJD0BFgkJqTeculOYFvHrJk8CdwzD4DDbPWIVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278124; c=relaxed/simple;
	bh=Bp6xMrdNZL9TY/cNDFbDlgr6l7fvIPI6S6aCL+BNfCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsCJ6gYDn5BNX6hfOmpaj4RXbHsVOYUWsFm0p/9uJpICvdiyNXtxsf5Tddaqrw+XjkA7IesBxFNRmXNCnfKQu1WoqgeZZcvG5tdwRSegfunSlJSG/nYUfzPWlahPGGExFdN/DTN8TswgNqNDOcU8NDcjZCpDq/h7FRA2j96wdvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4LpRgI1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363ae65100so164350435e9.0
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278121; x=1736882921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNFZZmfnbpgq8EWMI6Meo9ZVLy5ORfazJIfWmb6RXn8=;
        b=X4LpRgI1GSI8VlNcmgRGwumRE96t6xsphT/UycgAlgRfjnaRzqAKEcZrMCmTPeY+Gx
         j6qx7YpilMI5p3Ewx8TG5q249xJPQJoVEQEOkTI99wMOOhR769UAmC3a85fHY/HO62Hz
         y64oyV7qGqBKCpIIKzHbGjgrc5Xt2KOSD6rUpR/Q9DQCo47uOg9onwLCLruJFY/zbuvH
         1pcmKQELm/NEG83AT0HuwGFLiOcHPGitcBhm7MRWYRAp/arqv3T+nSpWkWrlprftLzxR
         1nZ0t3IO61ZhFqyj/NcrO+Ms2ZnWSjFAGrt3dcW3qMHqO0NJabeiKMpp2AaeUk3OUNN0
         ABew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278121; x=1736882921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNFZZmfnbpgq8EWMI6Meo9ZVLy5ORfazJIfWmb6RXn8=;
        b=Cr39I7zm52qCytv+C/x2mS6QmUR9zujaOKyRUlea/dpBR7Z4k/SSkBl8SjlYikZlLW
         lCQWxlxqGccyoZFI4yAxri8xO7p0UBHgLpscid8AeiMVuGxG/bcU5oonGoDEdLVmxzbk
         OcGONHfI5PkW066ZeQqXu2Fk1Lcu6gI38q+OBgvhOkXB/DwM/MYdJD8EQUfHxSyp5uHk
         EmkJ2RFZ08RC+NTDvRPfZJx/trm3UwskT365RmFRTun5D0X/d9dVDNkR/NqVdQMlMsqJ
         8dUaBmDllsX5Jt46NopdeKIiLa4EU4bvRboL/EhiwRJBhms/PxAsi4eEtts4/0kdzNPq
         JJoA==
X-Gm-Message-State: AOJu0YxOrmACfMAAf9TaYpMKwbxkD7nlzjdAXkoXYziFfakrh1B27Hyn
	huy2qrr3kiAa42IA2dQ4NQG9DRuMJ2wpDP+lW4i8kMoPEuze4DZ0EQWUwVdv01u9xw==
X-Gm-Gg: ASbGncvvDUxvbvy5bFRU/ceIBlYFzMKaOlHkndP87LIi5prPh7VI4F4r9hBXwkpMTSt
	HQ41ZF/syr6XM9qB08l/1lqwP8TVDQEK4F/GBqoNV1bPjcPFO2GEBUXWMj6e4MBURQB4B4RXBs1
	DGk6FwWWg3AFjAhWRS7HlvQivv3U/7oPUOuWXjThMGDNI1u5Jp+arEgBab8O8NXBAVUzuMpqyaS
	ha7j1Ouj0+5c+Sy+9TnN64mbYYUOcMZy0T0mqewuKy+8ypFODeI7zy8dkFnQ82//azT
X-Google-Smtp-Source: AGHT+IEqiwykVLKzwzYhVMd0FM/hg4RP7LHox+IErj0cBWW3EhKrsFrrIcrJVKeBNIJpqpf8RsEv+Q==
X-Received: by 2002:a05:600c:450d:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4366835c1ccmr429380785e9.1.1736278120721;
        Tue, 07 Jan 2025 11:28:40 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:40 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Matheos Mattsson <matheos.mattsson@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 08/11] Input: xpad - add support for Nacon Evol-X Xbox One Controller
Date: Tue,  7 Jan 2025 20:28:27 +0100
Message-ID: <20250107192830.414709-9-rojtberg@gmail.com>
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

From: Matheos Mattsson <matheos.mattsson@gmail.com>

Signed-off-by: Matheos Mattsson <matheos.mattsson@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 237704b3fab5..18e33e2aeaa7 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -394,6 +394,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
@@ -543,6 +544,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
-- 
2.43.0



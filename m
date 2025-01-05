Return-Path: <linux-input+bounces-8916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D7A01B9E
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39211883121
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB28B1CDA15;
	Sun,  5 Jan 2025 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHTdSphQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955C1CBE8C
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105895; cv=none; b=sfKxTqAAMP2MJ2U4RQdJq62IvSWJnaAUddthL4jnBxdxDrZasg0Lww0xzRSwvfhc9tChKdaH0GMFamdbzJDHS6kKlht7vboVdu6s26lm4cmQLVrPCdOejsN6n7NH0g1AuKx60iyfhZoYWzOZkgCP8CJZeCsLv4vSo+ZSvZo6tt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105895; c=relaxed/simple;
	bh=3mzlM0CzumBbsyf6fF6Zrmt5bkTlWOWJ+vEiSuStkN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrJ1O5MxP6MIoWxulrGlkQ72oSLRRushG33+hNeu6maioC8GkbwJNwkiqeysCn7mtbS/uWCNZ5KBYJ+kCmDaLAZplcM2Av2j4xCm3YKGr1zLQhFB0xiIMChKQmHkb5CZC0JMYu+IP3lxeSvDV8z/w7zL575zCwTguubo6TnRaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHTdSphQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso93878705e9.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105892; x=1736710692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA8huwrj0q3Uc0qIXFUpZxFeFcf3HkWyWWQwfPo7SaE=;
        b=HHTdSphQk1GCBrM9uawfomZFfObsumrA7PDfGaewsm7ef4Xqsn2VijmIvmVn6WAk+O
         PwTgEK/rS2qKBF0Qj5SPpdoDLRpCmKmqjQbaYELxq2xS6+kQrW7v/QhCUOqz+V/JcK1r
         MfzZKjKb1HtUwxlH8MRzBHiJ4bFUYt6IVZLKd/pEjc6OMel3TpREpuTil1xFSAdtOjcm
         Vbomp6KBu78hQ1AIZxrLWdBNKJ22Tv2MAE69o0vBUQBjJ43MbqF9kjwhMbxHjT5PhtmM
         ERJqV94W7mxEzT3IXS0wiJgC3gyWCU3aNyaGoZ30roavT5OnxDwRkjiUewBN7C5M+jAy
         Ti+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105892; x=1736710692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA8huwrj0q3Uc0qIXFUpZxFeFcf3HkWyWWQwfPo7SaE=;
        b=VCFFQ4jG0QzcOw+ncDf4JiWnqRgM+7DYAAH7upo6a3S5jNWbSi+/Z9RBBwikFp/8RO
         E7urzTO7977fwQvNhHxSE07XazvKGrqevu0ndIbR6RMJGvl6KFbjoVP0bnHiBpjSAqsw
         MgZCdmziB+a/feI5hKinQih5XwctVn3FfjfGmP3LoFty1DxFpmAjqri9o7VWsdQIz65t
         udNR55JHDTPZ/gIkNU33tXRAbZdL1QHDV0MjH8/wBN5ETAeITQk1r5R+PeNTxXP1zv5a
         7cuJKB1xT6vb/+e58zNeUs1G2NbP2dG62L1cXPkgW+KL3Kx28UHP9iZbuXLuMOd45We4
         tMww==
X-Gm-Message-State: AOJu0Ywtp6CD7XZUjyhtmPs4rzZy3til6OwlHBkyGQEqm5KktzhdgktA
	Rx4v8E1sfguC2JwsPdHifW/itReWtOHe5952MfeJ4I1M+sVofIEpmzD04NiWv5kcVg==
X-Gm-Gg: ASbGncuGxV82S4ewy/ifdQUXjlcVal2ADpqr2nBBR0jL7zNGtW4Qn+xzKi7WjMgG8z9
	0DMtTnQG+Nm9IqgBWJ4Et9SlcmP+EHNZEUuaIGR1Bs1fIcQPjh6bWvqoseeREClnBEmRpak68uj
	Yd/D6DGJANCZytxUPerur5l+SRMvnLibueRK03fqMozqAjKmlHjdtAAM9R++2AkgZ3i1ljKoO/z
	Wty2qZR549RUlEwoz77rOokcX0AaNXHdpsSjuOrV+N5xARQKGlunC7Z1iCBhcS4Mhra
X-Google-Smtp-Source: AGHT+IHn1MLiAwfukPrRwBVE39bEciPiNAzUop0UxltBnl7qjcLrr/WTBHDPS4lrfUSirmgZdpVlNA==
X-Received: by 2002:a05:600c:1d21:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-4366790e3fdmr529944625e9.0.1736105892274;
        Sun, 05 Jan 2025 11:38:12 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:11 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Greg Savage <gsavage13@hotmail.ca>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 12/13] Input: xpad - add support for PDP Mirror's Edge controller
Date: Sun,  5 Jan 2025 20:37:49 +0100
Message-ID: <20250105193750.91460-13-rojtberg@gmail.com>
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



Return-Path: <linux-input+bounces-12732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0ECAD1116
	for <lists+linux-input@lfdr.de>; Sun,  8 Jun 2025 08:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770D7169910
	for <lists+linux-input@lfdr.de>; Sun,  8 Jun 2025 06:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0E917E4;
	Sun,  8 Jun 2025 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxKzenDg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6E1372
	for <linux-input@vger.kernel.org>; Sun,  8 Jun 2025 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749362729; cv=none; b=YNZGST1NoZ2beOPs7tC1+Uk20XhBVIwPclPGpyba5FH6RS165o+djuJB9LT3ffdIaV2cCtc8OQcqyqi0Hpxsiyf85zzLSrWOr4WOXUA5j+KREsFr8c1vqG7Y1kWIr7qT1IJmUVNWFmoVbb+OavvBC8ernohdNC0xGs2CkbCA/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749362729; c=relaxed/simple;
	bh=BeZiHagbl8L6GtXOUA9WlHQH72DwC2qJ88+czeo2JWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/mqYiDLLPLhcUVomA3vFsWZOkBf1BEU+vPaxXB0lnRYd78+eUWfhH0n6xBOnfnuUpXbOdwu7eficCLDuZIcfZCGtfoNsbuz3kHo50bRRh1dc92G8QsPlPV6KLUGuw/8E/utEfQFk2ezw7oXkJPXojfabxDoEkUi6MXCAbU08pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxKzenDg; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e593c81ec4so67414137.1
        for <linux-input@vger.kernel.org>; Sat, 07 Jun 2025 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749362726; x=1749967526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBuJr60MeQjavRL0IScPw/JY7UVQgoZlmsrRTJrtYeg=;
        b=bxKzenDgUuhMnV/Rj+wS98SLo10hPJMpSJKhdAx45SOUcaYYcD54LqQjZ9L2MuTrL/
         WOFZaKf+MBYK1MqTvuCxdJx9MVT8OcYNFPyNlAPMbKvQWCOJNqGUTo3nSkDWprjkvbbT
         wiMjBFQ6d9669/VewaEJ57zsLReuRKeNNv1n4dSyajHmPE+m0P1S28Y7lmWpEf0aj3nw
         IbEqtknS9hGMyAimIUBN8GyPdKVXnloPDNkPBazVLY5rW3zTjo3WU+nEhBJEqkn+LqTK
         m4JTIuARB3uAxQ14xPwopcw4yTB+uRo5LcQWvKRY/rM7BY7brCFxPDwIDJ6KKrOh3FhF
         4g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749362726; x=1749967526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBuJr60MeQjavRL0IScPw/JY7UVQgoZlmsrRTJrtYeg=;
        b=U6EMCQ20k+DWhu4NSt51CpFsXV/3GwuzeqD5xtszbmqFVIALrgjUxuM4PyDmRotuOC
         HlM5jp1vG6ivwQ0aAD4foaBk7MieQ2xumwyEzknPqb6eo9flgEqADCa4YcIoUOyutIUp
         K0eoU+YG3q2s855pJc9AavwZwCYKHhLOZKt+F2Jz4834w/k/iSXU0R8jwuDSIS2QcbL3
         6nTMM9gx2ZNUXUsa2WPSL7lc0NPAMtzmgfO5/mGbK0/7Bhldl1F+B1Ll1ScWFfUpUdiU
         MpVF8/wGJK/kXVAQlvp7XmBDpmWmcqc51JygVESOGzLl7Pe2IrZQm3bKQwVMseg4Q+zB
         40hA==
X-Gm-Message-State: AOJu0YyjskahwAWHuB8As87wFpiCyBSm8/5wGilppJ/SGQxUz1y1NYND
	tGqDEso1KPXmme978KWsaZlIFwaCxpFvpRwQiNOnW8aHSEQVJTAo4g3QOHRq6A==
X-Gm-Gg: ASbGncvafzquKQnJrfIUHxy78qmNYuPCUultUhGa8gcnC1efgGRgB++M7ofbR2oHJAg
	iG+5L5PKx0aiWPIsIyid7G0XrlIMpGbGIR3fcKzXYCeANm2LM7fsBNf0sZCaA/zX/zoLuCOK/oJ
	btXmVzxOKTvH7ShVaCWhYkarJ8DvgUy7jjkdAAtxfdG0VM9deMx659LPFh4/bCPaTWW1bT9aPCI
	+smZyqtYJCjm2SHyGmtXvXX9AGoSSyfgbgZrhhfITo1Su8ivTLgzVnK2VTJp4BFS39rFKsxFsjW
	E1eZAeiguJn8AiU/yAHYGTxW/ik7gswpJyB1twt8j4ogArI/roBkty6yZfw=
X-Google-Smtp-Source: AGHT+IGB2XQzzcsJ0hiSm/UDf0cU5KVTuQUzb/FdYQs7KtIM/tsLDF1k9JrdtPU/p8TJcz2x+JLoQg==
X-Received: by 2002:a05:6102:8096:b0:4e6:d890:5513 with SMTP id ada2fe7eead31-4e7769b5c3dmr2184932137.9.1749362726244;
        Sat, 07 Jun 2025 23:05:26 -0700 (PDT)
Received: from LAPTOP00.. ([2804:3d90:ffe8:f920:6461:404f:bff3:30])
        by smtp.googlemail.com with ESMTPSA id ada2fe7eead31-4e77380815fsm3457611137.9.2025.06.07.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 23:05:25 -0700 (PDT)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH] xpad - Added Acer NGR 200 Controller
Date: Sun,  8 Jun 2025 03:04:45 -0300
Message-ID: <20250608060517.14967-1-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the NGR 200 Xbox 360 to the xpad device tree and also Acer's VendorID

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7746530da030..100aaaa7a5cb 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -177,6 +177,7 @@ static const struct xpad_device {
 	{ 0x05fd, 0x107a, "InterAct 'PowerPad Pro' X-Box pad (Germany)", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3030, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
+	{ 0x0502, 0x1305, "Acer NGR200", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0020, "Logic3 Xbox GamePad", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0033, "Competition Pro Steering Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
@@ -521,6 +522,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
+	XPAD_XBOX360_VENDOR(0x0502),		/* Acer Inc. Xbox 360 style controllers */
 	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
 	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
 	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz Xbox 360 controllers */
-- 
2.49.0



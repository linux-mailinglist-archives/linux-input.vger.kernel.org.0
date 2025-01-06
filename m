Return-Path: <linux-input+bounces-8980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31FA032F5
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4C643A44E1
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A451E0DC3;
	Mon,  6 Jan 2025 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgEVZFTG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189271CEAD3
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204103; cv=none; b=HJ6TSDS1n+sw2H2rWWkwQBlyNDvPrvQCOa8eoib1tNcTlDtzdev2VxskS21woLaXRHr6964kWHr0xPAcpqqOw8ENn/J6sfvBG66Y/dCKpbYTNG5AM4+n+vBERHmNhCymombqrGzbO9rO+glWLC5JBBR4arLQV0EW84TW7xWTOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204103; c=relaxed/simple;
	bh=bdAhw0nOJ3gMlwXW6fj6vIVj/mzHEAxs+HQq0rqYgFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=renbbG77LWBvEkc5z7miyvIobH6S3A5TQGK260bEh75K7t3PK0+px2mEAYONJXaQmgf9icBqGO7/tGBPEQWF118GHhc0t/ZyNIZRGCCnJm8b13EN/WUWXP5/b9BiDiOlidP1PhtdOMOsUgxoAI0zW1GbqKmwLoWoe+K3nB2Fv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgEVZFTG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so155840065e9.3
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204100; x=1736808900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5IdXdhiuC4G8QgetXQKn1DDQ9a+7iNLXhj3vhY83Do=;
        b=fgEVZFTGHHFMiaNbZ9iWRoC3jnr874udcge/gKruWhUiF2X8LvJEY6ukEbmTHW1Dy7
         YTwXfDW8jrwuiyqCYafwhwVn8Z0Y4HofvgmJIr651hBYqJ5d3PwKrYc8Tth0QLu1Nr4Z
         IQLbx0UVpI3WRm+5vYYemdvZDnZBFCGl0qPLwL41JT4KlLfqaLp3sG+XPXCiK0PVAidU
         0zPRBRbd6vONwxnzSu7dtFGSfjLcyxgn12qmRO29sjaoNe2Z97UuERsd5Yg3d5xcmD9A
         UwI5t4xuKjQLlr7t+KzWF8M8XnzgW0jey2rTApuX+B3H6ojrxyOzP1/YI6ASgTAHvRHS
         jbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204100; x=1736808900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5IdXdhiuC4G8QgetXQKn1DDQ9a+7iNLXhj3vhY83Do=;
        b=BkvalZsvm2VT3OEDVuN5gcNEBjeWK0TSiSNw+zxdBUUFspUk2cLHvSG1EPpDhysjFn
         CxtjDegZDgHhKd/9VKBPBk1YzSeQT/1N8/KRrQcRmDFkr1OQfs1tWTLsPeoPsrx7fG4R
         mNPmLCEWgNmpNq0qmLjTkm6OBTHc86jPm7BwMFUXwTA3w0UW8QaGYhPoNhqhHTqJPsfV
         kDTjZdrJ88UHrRjDbaqUtSFGG2smksKmiKsdwwlPFeEOEayxWFEvD0mkseWx0ZL1zPEp
         G5E/vN1h3/DqUxnZt5xXKjZVHbElGugJ6HifNX49S2Kq25fBXvn9WjjNQR6fVK/0hFuS
         cAAw==
X-Gm-Message-State: AOJu0YygIrCpsGPRhknWb3qJ34cRqzBmxHgRozc2GzN+m/uNGqcR5r6P
	CPFA87PbwW8UvM5mo9nrsqm7IL6En43+z/XEhNLTPp63O/ABULsnMXQfIp8uUe1oDg==
X-Gm-Gg: ASbGncvHn+tU0PJ0QP0iBhAYzONAZpgEXMzNevdKMD+P+8ECTaPmmjDrVLmJH7LsXby
	yHO+BDy7uxIMmrh+HJU+nBV2XCD27KrZVmHq6/1mI/Sg1MAEi6YXUwKD3OH6gQyU1yVP4FZHDV4
	8ULgW0l3C1U0zga4zl/3NKsj8bMKoZpReL/SzXEaU9uuvGSpYd7dJ8nxJs/w78XV4FMJ7XJQ5bb
	unS7Pn7uX88J6uj4ndWDqKwD4AAnV5m+Uq5XW6yzmUsGro53Mf7Z9DyurcyKLLmGS6q
X-Google-Smtp-Source: AGHT+IGTyeNeP+XY7aNZQxOvM39KLgfBH8aABRFDsCQVb8dPwoa8cPTbOZpWm6ma1EzPjTfFGZLCUg==
X-Received: by 2002:a05:600c:6b64:b0:436:469f:2210 with SMTP id 5b1f17b1804b1-43668548aa7mr396824765e9.1.1736204100305;
        Mon, 06 Jan 2025 14:55:00 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:59 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Matheos Mattsson <matheos.mattsson@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 07/10] Input: xpad - add support for Nacon Evol-X Xbox One Controller
Date: Mon,  6 Jan 2025 23:54:34 +0100
Message-ID: <20250106225437.211312-8-rojtberg@gmail.com>
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

From: Matheos Mattsson <matheos.mattsson@gmail.com>

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



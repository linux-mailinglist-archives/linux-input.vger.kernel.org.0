Return-Path: <linux-input+bounces-8974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D88A032F1
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F3087A25C4
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8F81E87B;
	Mon,  6 Jan 2025 22:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5EgFVWL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926D1CEAD3
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204098; cv=none; b=MAkQBeScJTzNPvlIQS+qlVe0wia2YZe8fudueyhj3yWBpZUIOkLxjhNUX9FjidJNrwDSp9nJmAY86Peao29AFPqX5xF+I3vrvKCaE+9as4JZnR4MHu4p3FqJNOQVOB27qUxHlpYU7PnlfRkoABMIAKd9uHvmcMUdX5JibnEjohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204098; c=relaxed/simple;
	bh=UrsIFDteo8Lr3f7hDrb8UKdv77Y1AiDtVGViM8XJWz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6HDLj3VPQ6Y3VBTYmyyriIdPAmuYJt/kspM9U5h70ZKEl9ZMTxT7nmxJTWyu2mv1LRuXmM4lmzBylZhxNeoSeEo6csnaUnC+8A1Suc0FD/t03h+5UKUDiv0VgT+iOyOKSgC1wqAM3C3Lq0lPANJSh6loiMrCQiUQLYyGoe4EUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5EgFVWL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so153842335e9.2
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204095; x=1736808895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=E5EgFVWLnapxSguyd4ddFm7LB7fwez7KfU3UnKc1XTUN2TN3YCjvMnP3NWECp9k+wl
         yjzO4NZZzl8vY6bU0VMnp23AgeApMtiKAHibMH2e0wZ37L4q6d3Roc8MPEDz2wOtd6nH
         zwAycKsCP/uLpoZNDDgnNiSK5UO1lPJczasYctmglTo1cT2zUPZKkDy1JxdCKNjgHMhB
         3Axc1bN6I4uDUCt8lxYRUku+eHwl7zmJO0m4jrm4r+AoC5lS/H3/ibZ1422Tm6iy5VvQ
         hM6xlwebuQTHIZ64ZocmGFxvyGRrU9uXRorDj1ZGCL12hKSecBWV1USV34DKGa8PafBp
         R8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204095; x=1736808895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=k+74vAUcQNO+3lZSv+UAhe8sSzkmHD7rEYrYlV0yx9u7YJJI2kS+c9vxfpBrTIo7sN
         /cUvPWHc/w9vBr1abcKMZXwBnfDvEGWaLX6VM9a7iZJufnsaSEB1EbNaQNA8REKguErD
         q/nny9aP1Kw3sp5riceuoBALcTUajkJ2F5FCYVgKICfwl/NPRcEz54uqbDmwlbJSd12z
         5xR5WeUMSM7wdFOCBHoorV7kqAeF4Ot2yHcdT6bzjnLlgX/XoTBFd6mE3bfED128sLkB
         QbGoSGjOUi8w265daQvpX59G8tta7chr+IP2h4yUc+FRmj7dUkZTAgd01AAPUNUtuWzj
         8AxQ==
X-Gm-Message-State: AOJu0YwuW6MxCQQQkyoqVoMOaX8qUZNjXgtxwzvZwC+ifJYTOFzY30TV
	6UXAasuwt6OmHNo/kVuEJsSDxUneW46rOfIsrmr7dth1lFRdwsmswFDRSo/YAQ0oNg==
X-Gm-Gg: ASbGncuGnOrQK3bPQOit07HQLsM3EbAmjGP95M7eY5b2mS5bIPOp3muRr6HAxrGhOUr
	Hx1hAgzVncAdZmkJ6q4P1sC7+apqcNMUbPHhaydIfQzlfCHOOMxBwv9IwJAAAUWb7z4PnDZAp8V
	oI8mt3mL4WAP35bMViLGgwHAoqbng+dypBto4zFhPMxEDJEpOgnUGKGsNIMINcmyNkWpuu+t2+t
	dl5OkiMwyME0FNGbILkN4VP6t2Pl/6Eha85jT7s55MUQ6KEdw3WwGWxaD5qA5C1ix9p
X-Google-Smtp-Source: AGHT+IFjRAlVdSUuE7ZJF5/4GFf6ymJVLCbo+pNLKZALp/f50tTswrKlWTLwNVt41VwC7QTnDeozNg==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43668b5f691mr489628905e9.29.1736204094398;
        Mon, 06 Jan 2025 14:54:54 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:53 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 01/10] Input: xpad - improve name of 8BitDo controller 2dc8:3106
Date: Mon,  6 Jan 2025 23:54:28 +0100
Message-ID: <20250106225437.211312-2-rojtberg@gmail.com>
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

From: Leonardo Brondani Schenkel <leonardo@schenkel.net>

8BitDo Pro 2 Wired Controller shares the same USB identifier
(2dc8:3106) as a different device, so amend name to reflect that and
reduce confusion as the user might think the controller was misdetected.

I have personally tested it and I can confirm that Pro 2 Wired will also
not work in XTYPE_XBOXONE mode (buton presses won't register), therefore
XTYPE_XBOX360 remains appropriate.

Signed-off-by: Leonardo Brondani Schenkel <leonardo@schenkel.net>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ff9bc87f2f70..8a02b9a5ef79 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -373,7 +373,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
-	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
-- 
2.43.0



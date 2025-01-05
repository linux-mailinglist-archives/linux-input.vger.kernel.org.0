Return-Path: <linux-input+bounces-8906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B0A01B94
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF48F3A2F89
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498281BBBC5;
	Sun,  5 Jan 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3qdICPW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE12143725
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105887; cv=none; b=bmshrBmfRerqEQbzgjSM5GGc2HpNv8WCNHvU3ZXuVZbX1JJ7FtR6jws9I1mTjnPbD91i8tY7/5km7L5gsgllQzdCegos1+YnzBISWQgvH3WFOXxw8lqMa2isxrkoqjqZ8o0nyZGJhVoVjWAPZPrqNn8CVsGMiUixKITx1E/k48c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105887; c=relaxed/simple;
	bh=UrsIFDteo8Lr3f7hDrb8UKdv77Y1AiDtVGViM8XJWz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ab7+zeuiMtBQ1oWWQgAWrA4QCxkX7Ugf6RlQqbEYvevU2VrrecH1NgQZ2RTUlUgcwX/OmYXVPHRDaxgQMXwJDN7VdtKKiCYKk5yVHGoGeU9llfaNbFMaC0JolwStqA2sF0EuA304bIXxisuSlMrR86FUn/Ui0OxfGOMFFyExKRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3qdICPW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso11683561f8f.1
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105884; x=1736710684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=P3qdICPWVgalLPiDvm8U1xzg2BY/ErF+b4LRprVzIhKvdlUOmn9rWF/AXyUxW5WRXh
         Abrr3lh5iAAV3929u2jwBfEK60okJYthRj/KvakgG1b4qnBPa2shgd1G2aiG3LOtNkw7
         VG0/rBdU6qj+4pxKvU9jPsmU8gGjxa3e3vl8HXltGuxVukro4qfPu/jVqkFjigV7x4QF
         eMqeUQP6IoZ0wZzen68hNMi5UeBkLGeBngscm+szFHaJ7qzkQwVF7oaPQqhBqOv8TAeV
         YfFRxRVEs3NZbBlD8vx7vV+pB6crMi3UF/4DLXyHvaga16oWpOWLbXtXfwAYu5xdeg6N
         qlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105884; x=1736710684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=dZSUcG6vkjjnNHbm1xuJ/iRGqbAsy7+bsnDfhkfGW88Zks/nSZMzPWYFg/udUkAco4
         F55Q7xTMDR1st8Y0539iSuoCtYuwjhf1/7+NR5HZbNpGOSA3rTbLbHSQpPtDym/k1clT
         zR5RHai1jilBEtxBENOQQcNdsRaon77HhmrWuGT5Dal5ngVrEwIqVqciwvhjxvaj9P3u
         vfWWBMfuX/QbocLRo3rso0jS8M6bknpwD2l7/9VozRIpVSME0WPEaf+IiwucMZekYdJq
         p2QMGXcCDItPaKxFpBUH/mOS5qn2VtnsUii5kalo8/belUv5KIkJOKgSffVFIlD6YpV9
         5HrQ==
X-Gm-Message-State: AOJu0Yxx4zuS3T6KcNgkOV6GTC8WLKJxsnBdiOHk7JZ/RQf7i3KQX1mB
	omMMRQ79vr376WG8DQvtehMRCmskxfpNCnmUZYllryV0v6hrk3cRc1bAQDCeuvCoyg==
X-Gm-Gg: ASbGncs2Ucs/3KGfkuvPtvMGwW4kDgxxQbxeDqPEOZAF0yyFYIvrrizeNB47hWdzAYJ
	dl1tCrtd3UU9CPUCNkkDTBNtCPcZqZCaRN0hIBu+wFT93YEVZSbws2mcwm+QsP5Xh72s2zntFl3
	TPaXt0vASnHfzWsMlNUBKjOONhLnYGcO2uMFb/J3bLvq0zH5cAo6zChQGsEyviEtYrlwfXnsMIT
	N22LV+suEg8wUISds65Ax8Q50yw6wUdb2Eossptdn4YQ7nw2XHN/jHYYh94syykjLhY
X-Google-Smtp-Source: AGHT+IHJbwXrT/46BJ9ZcZu85lfUY97jO1mf41PxcGUmE/5Zq77IlHzvF9Avuzki8QZbxhaDprqueQ==
X-Received: by 2002:a5d:64eb:0:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a223ff5bbmr50654957f8f.48.1736105883712;
        Sun, 05 Jan 2025 11:38:03 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:03 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 01/13] Input: xpad - improve name of 8BitDo controller 2dc8:3106
Date: Sun,  5 Jan 2025 20:37:38 +0100
Message-ID: <20250105193750.91460-2-rojtberg@gmail.com>
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



Return-Path: <linux-input+bounces-9016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A71A04A39
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A223A64C1
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897C41F63E2;
	Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGCJQPqo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF11F63CC
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278126; cv=none; b=dm+pp+CUFp9VFlcSlB4Q4d9FrGYDl2nqJESb5qiz6UTF+AVlli22tESw0u2vkAWFHOs4r939U829yRuNMNqWRTEqzpJjndJza+CTf4yfLGKjjx8wnhy3nwVGSYjO7sTY8mtYcJ3JDaCf6OxyOH4ybbkghWFLnR4ZR0DLX9ncric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278126; c=relaxed/simple;
	bh=1yzlYI9NVySHSg9GevxD9ZNodisMQG1E6OJ0dKqbfO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BADZS/+J9pRW2qgpoxcvIIhh8AM7ZdJrwKN0hHsEgEcLNFS5fXeL8c1LPDoGAWwOj8VRoIfI6xqR9Co6KmI3gMiVtSqV/2+sd6Bkuaab2s4c8BCNP5IfXBUJ1EoEwvTzDMlUf1/UTZY0Kh+ZAfWMZsEGt7wDaPNw8FAu08KPY6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGCJQPqo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso115435695e9.2
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278122; x=1736882922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Fquh9PlocvI1SRygVhgi/5h5vVVkZh1VFb+tvR+Oy4=;
        b=BGCJQPqoc3R/jyvrvKXIQxNPFC3ePrGItGNg77xvy33W51dIaAU4zjB8bT9vVocWXY
         qTTadaVUFMcwq1F4cP3czyOZwa0a53rwRyn1EEgCbjol6CRKizLCPYjFSBSAN7srcefo
         LmMWcS0798TslMxYMX8phgvZZKs0J7TrkAZjJFXbG28DF3qVaqYa6T+5Jog1/inGlFsc
         rKazwkJNHXzGft0EOLbJr5Dvy5xZmbPcSYIRidr1ZLQTkdrSVwnz17G5N0DGntin3YZD
         k1K+3rQVB/voM85DDWlx5eqtWZkDqykpCUB5VDwGzvspLaxqMygBLltgMF+fzdmz2T3m
         CMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278122; x=1736882922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Fquh9PlocvI1SRygVhgi/5h5vVVkZh1VFb+tvR+Oy4=;
        b=rm75YCEV3/sLBkvazCPlrV6dre9nzW0I3zEutHt2xkfz8/oPGnAOiCxpAFxi/sm5n2
         Qdz3UU/xrb+co2vFeDcx3qauJi0lC4vAfYnb6i9WMGIGuTzGWZ5/qU4Rde+swGYdayzC
         6BVV7vwOp8jvsHbu9+0FOjCJKLvn0c53fJ4B1ArAwDBhef0dk4y4ussIw3tAkmh27xut
         C42TDzIucTsyOZkuaIy/Yo+zVx56ehADoZyZ4Wbpw0bstCkscu9Y63g/02VAjizJvVBq
         3zdogeUOLOb+L0zGGrXHpxK4+Nqh+fkFndKVIa3Or6GE3sUWhGxDpY+6EbZ4GMXGWWSG
         lfMQ==
X-Gm-Message-State: AOJu0YwahJaxVYOfKOmRyJPmRY7V+OMoDCLP9Wdg/CizCHhZartWZx7e
	UPqgPYBHm1zxLhALm5AkphewjXKaKDjGs736UhQPp7uGZfBXnez17jYCyYmYQjidlA==
X-Gm-Gg: ASbGncvdHXDI3skwee/KPf3lDYzhb+C6G1SP/U7tzdI0I+ItE5dUR+Z50HRyZZisx+s
	p+MxE7ka47AGhFQvZll/ig9y5KYYSMLCNM4tj1VZYd2Y2Mruw24IzyZ8w1Ey51xBA/S6b08cZ+x
	F3XMh1D/jOdZ5J2tP/dEIHFFzP3djkLSkIxEgzeKFdmbFPzQmKRBMiE16V67Mib5erDsIVo6mno
	He6/O6Pa3gUZI4pHdI3Amragwg5ufwkA+8XuZAIfQva0PWvqjDPPHuztK101ADXUF04
X-Google-Smtp-Source: AGHT+IE20EiMJHDaxeo/9RnN15+ZnhV0tYdLsF+t0ZytaTK9InFB/Kc7davfXvMiNAX0vyMBOikywg==
X-Received: by 2002:a5d:5885:0:b0:385:ef8e:a641 with SMTP id ffacd0b85a97d-38a221ffb82mr56955759f8f.28.1736278121624;
        Tue, 07 Jan 2025 11:28:41 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:41 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Greg Savage <gsavage13@hotmail.ca>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 09/11] Input: xpad - add support for PDP Mirror's Edge controller
Date: Tue,  7 Jan 2025 20:28:28 +0100
Message-ID: <20250107192830.414709-10-rojtberg@gmail.com>
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

From: Greg Savage <gsavage13@hotmail.ca>

Signed-off-by: Greg Savage <gsavage13@hotmail.ca>
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



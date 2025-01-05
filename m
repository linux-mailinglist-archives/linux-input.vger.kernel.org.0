Return-Path: <linux-input+bounces-8911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C10A01B99
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0DC188315D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DDB1C9B6C;
	Sun,  5 Jan 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEubTdFO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECFA1CD21C
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105890; cv=none; b=TVpBdKIes15ZX2XFc4ftwr2O4AcsiZgeXyPv53Sp6ZmFXJrC7/EI2tY3stoATaQ7/QD/qzFEsBn/lmchuXlnNz7YTl64h7h8OK3H+PD4AXUOv0h4dw3qvMEuyLyjt2Rr6sA1muWeFP6vT1Gm1mSYUNo96smH+ZVIfqzFMXesaoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105890; c=relaxed/simple;
	bh=6n6FM5ob1cZuQDTlhxd9xRweUmu1C8pFP44DlLRMPno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJMfkw8fX2iJsGYgP3324q3vd0BKeW5qFyr64B3IEdqAcZVB7b8zMpeJIjgXAL0qvJnYB9pKG4lsElYfzDhtSuWzsitZ8af8GnBUDGqLQyaaN57DQwHHq7SxKC0SF+FZUkHlOckEibXad9Es73+M9RwwXjBFkfFMB3U+UaJ14pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEubTdFO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385df53e559so10830359f8f.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105887; x=1736710687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjQsEMUcu55KWzH0xteu0lrIHtDAj9COFJ1Qs3EgXWg=;
        b=XEubTdFOIYtAPFRDXp+YV3yt11jhAOhE8LJ22iHVrN7A3t/LDnAMwLTe4BEwpm13bc
         mEVfKIDyhGi8EvPlJ/lsU+vt9Pho+qLrEnZInYVIgLf40rdsUt2tthiCGrsTzWNdVLmy
         r5stngAAfGXp+601NRWe2Y2wkRIVpAvWs0zefJBQqo2KGg9snLkb9Xtvy57jMmASLXeP
         E4M3nYQRaHWbaDhYkbf59dcZfIazQTX6z3XWHz8DUdxpCzT1X2JBEZIWN3H+fjaSjC/V
         qdsd7aWlorfsl9Odlud5fDY1sfY/PvsJq7H0Q0Ph7Y27QLNz99t0wATAraihaD7taBrq
         iiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105887; x=1736710687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjQsEMUcu55KWzH0xteu0lrIHtDAj9COFJ1Qs3EgXWg=;
        b=D1MSWAiH0m7ApTwJQ1Z+MBGE35GlElJe+JI+Lx+fNcrLvXuWEEuzanej6VujiKu068
         7MHSGZpYE9v5ROxO8CSg1I8uLSyskpCas9ed+Z9Z1LQK8VrMLYspe1JjfzSM2V1y5n59
         MBeDA3WHhrOw7PfCGieppYvhNKBI5QhIHi6lZ4l13v55BRix85W/ELhuO/rb/mrqzkeR
         x8Ax5S9QmKKjFGPWi9YrUmW+RQ0R7AppuCQHUhlywy7j4dYvkjD4hjRcpsDmq3+C6J/F
         hyh5Iu+BYt/Y0oPlKbB43hxGq66AFK78fRXZDnqGrjYuaNwVG3rIZN14hW5+NWHSzTeo
         6UNQ==
X-Gm-Message-State: AOJu0Yw60kXuw/R3sEwtubFmC4rR3q4cZu25potg2MMX4T7LVzfW36zf
	PIpjou9PUZc68wPMyMh1Y07qXy5DzSigiVLwXbRhYvupOZUZ2xoiuRU14YG67q/T4g==
X-Gm-Gg: ASbGnct9OKT5PW/7ijXUeuB+ioHafTz+0gYT2U5PS/dUx47kEeYLOFomdstYgTpe1od
	kBTDALmeqHG/QxRcA0lpLOnCLu1JU046r0I+HJrJR4IwMGXVJ85yVilDYxonN9dzNw5wA6ERpQw
	7VNKH4+kyRp0o+cfsVbe6o2qfwZWato2CeSudcl6tHzi1Ny8yOeAPgF5NvyaByOoTKdhdUtTPE9
	JAtn2sQh2MlaKPEImvzIdUxOprPc2XMfw1xaINb+58lFamo4gg3gaCZZqYh+thaQ90J
X-Google-Smtp-Source: AGHT+IHnX0bS5vnp+DJOBBRw/U+UMIyCZtvziJHYsZNPc5w3tqDmBve4vX4TbuDqDf77EKTYlID5rQ==
X-Received: by 2002:a05:6000:70a:b0:37d:4647:154e with SMTP id ffacd0b85a97d-38a221eca99mr47900512f8f.9.1736105887471;
        Sun, 05 Jan 2025 11:38:07 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:06 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Kikismine <66830108+Kikismine@users.noreply.github.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 06/13] Input: xpad - add Hori Racing Wheel Overdrive for Xbox Series X
Date: Sun,  5 Jan 2025 20:37:43 +0100
Message-ID: <20250105193750.91460-7-rojtberg@gmail.com>
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

From: Kikismine <66830108+Kikismine@users.noreply.github.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9d9f73fabe9f..4e66635fd7c4 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -275,6 +275,8 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
-- 
2.43.0



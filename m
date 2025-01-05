Return-Path: <linux-input+bounces-8912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC535A01B9A
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE713A32B9
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05E71CD21C;
	Sun,  5 Jan 2025 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJrLNfsX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EBB1CDA15
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105891; cv=none; b=NJroNd4ipPEUOOY8qyIISgFOjSSXaEETgqiIz8nn5y3M0D44WFv9XFsBdsgTWtkV3UgrJC+9aWi31mkQXzOE5Aev+HVUEG8vylgP3CG6KjWhX+7v3nh0LJHIvx7Nid4NDgoKNDv66Pb+pC0i1KeKeOkuYpO2ZieyRAiTHOhcK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105891; c=relaxed/simple;
	bh=ML7SWqZlBgSi7mJ1X64m83lsH430Nm3UXUapvVtTAR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5Q0HZQG3r2DNutn2SqD6PuH+dkh+SYU5MKZC1VGk1YGLr1QpFKcSLmcV2+dfhOhQh0CZqGZuAphI+wrUfpoMLgV49JuhirV2d5y6+ssYynAMOd43l8qrG4G+HfCLHFrgZ7O8Jnl+WidUif/+iCKPXVNQG7RSWRm8IxzvkeG+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJrLNfsX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d6d5765so8053536f8f.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105888; x=1736710688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+0kEnCsl2kJPTck13/qNp+7CLLZEXG5bnvy8FQhV8U=;
        b=iJrLNfsXOBpaTAqbIKmV+NdKcjColWqCcNnBV7aTQj/gtpRzIp+wP71N1Lb54uP1xk
         Z5DJn8uyet30EimwXYYvgAJ1M2o+KkXK+j1URupjma3WmKtE3e8HE4V5HRCkYUDrG8aW
         s5mxtxqmIeLOQSZ7OQz1zgGKkcgyl2RThD8xS6SP3LSZu+6vWcGmxEWTUStCc87Orqkt
         cZEg+d0XDV5F/jguWkdwX8/vfdR9usOXPcvaJ76S72LNXpKKq/YUFC51FHF5/jIgaDwQ
         RkIjFeCy1pVZ03YJ5CCz7Q2ZaOG9OBvsq9LgUnxYMHVAjY/IxGrUIQDm8/qaAGtfelWb
         dGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105888; x=1736710688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+0kEnCsl2kJPTck13/qNp+7CLLZEXG5bnvy8FQhV8U=;
        b=AoT+lhOFksWjHTjajrV8QaqpEHAKpr4GyaKbUFXbO51ab+BNoF5dfXhW+WdNtvy4LR
         p4YK/5ayR0Z4N8IOrGY/BiPsTgbeeUEoQjYNtCYHFLYNPXppzH5kqz7ay3YguQdp78Yr
         hOb1wLcYpzZ9oJwUIpezbhLUMPsz7bswxukC2lHTPrra8FemW+MMmE0SuMfmEQPZA1l5
         v4/UWN7olOeMDt8zBZWtBi3M2lEU8mYH1vMH7sx30hSujGZLFDZRNt999VsrwJGT8GaV
         g/8kCnvyX6IvB44FMYYbjz0nQm0Zvsp8cmiVT76azF2n8eQKau1G2SGd9ElN5CvcK3V5
         bRUQ==
X-Gm-Message-State: AOJu0Yy2hyZCXvH7T7N51NIvw1Jc4RBzKV8ebAa60vOkN0ptmTX4sHfi
	ieZOgs6gKVDxkazEb4Iyvxnwb2JpHwucd52rZwI8/g+00daEFaYGOg83qij5kniX+w==
X-Gm-Gg: ASbGncvEB4UmBplMNjd4O48aEnkOa9tpHrgdKQeEaRsucZCzmC+AbPa9EEtDVvA/23N
	hFHuUfRZHKB7RROULD7NF/ojhMFREwbpwTbd/5s0JcMJ6xE4P6783RTi3AZooRQeKVEerovnyt5
	i1LslIJtLzeuD6aka5+wwP3EBFF97XfPVFBYoXgz7orDUL/GrdDMJAlsXrXWDK+rsZKtAMdGlVH
	dRY5EYtKwMaV+uFUsysuRUDJdlsq48qDLpiX6genAWjkUoITWlQQlBQrutCCbc34ygi
X-Google-Smtp-Source: AGHT+IEWWRkeC6ESlzKnMXtUh7UCUBqJX5nPvreaR9Ak1xEQDlKBoehZGwsqtgbfQKOunikRDvMm8Q==
X-Received: by 2002:a05:6000:3cd:b0:386:1cd3:8a03 with SMTP id ffacd0b85a97d-38a222009camr40240288f8f.32.1736105888072;
        Sun, 05 Jan 2025 11:38:08 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:07 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Javier Zepeda <18448386+javichz@users.noreply.github.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 07/13] Input: xpad - add support for Nacon Pro Compact Model NC7271
Date: Sun,  5 Jan 2025 20:37:44 +0100
Message-ID: <20250105193750.91460-8-rojtberg@gmail.com>
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

From: Javier Zepeda <18448386+javichz@users.noreply.github.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4e66635fd7c4..450a45152d63 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -387,7 +387,9 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
-- 
2.43.0



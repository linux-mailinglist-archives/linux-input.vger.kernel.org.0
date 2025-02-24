Return-Path: <linux-input+bounces-10281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E591A41932
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C40E16409F
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA61242937;
	Mon, 24 Feb 2025 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O89drmDH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7B245007
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389418; cv=none; b=jP8YbBynfn3pJXrE2gIMJ2UO0TsRigGvDt9G4yKZBb9K/kM8AcDLuv/x+rnac6+obvFIkCqYoxRBF0yJFWfsXsrvt9L98q4hODNcHvOZgkpapd6Cj772Nzbl9mn85zktIhsienkUkeG0zLQeJgwz36HH7io+O4R6O4B5AArkYgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389418; c=relaxed/simple;
	bh=rDNXna+gN2QDPeh5Mes6QRGVy0ST1p5cqn2Zp5ZQ6EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jD3gjvRo1FhfQAA0q4WPwgCwWvTf3MF+pTQFKr0Oy9CMIHsMl8X1CPOGFxnZtgu4EjemjNB7FO9v/QJj1G0RjjLqt4Fl8vQCUJFg9QPjkyupvYoWbufIYvkVx2Do1bmHQs6RBw8hEez46ihQfbL/l6q9QnNHSbJc9NVWY6gyJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O89drmDH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5debb4aef2eso716048a12.3
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740389414; x=1740994214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTk2aSpUgOWcjZ+Aa61IU/vjwVvxUJEha1zttmZAei8=;
        b=O89drmDHrukoCPS6XqBsDMVTJ7oCn/9AJiis72HUzH5hsPxUP4INVnYTYet0v5Eb1y
         N9LPG360HyquWyQTW9q8nF6ePEe+ZX6D9uAFiRebAGtwUOg4z75xqvMWp4cL2ThTw7BB
         nFQ+Yd8TGBCgDCw9T18Fb5+16Rw2uvOhQz7JkvxYhN/RS9FmsuDzKbohUR6qPlDUCd9q
         3Ddb9NSxsbdpDToaXI0/x255eA9PEz2rsHUliTsDKL0RVcqB+G/K8l6SLXJC+qxVMlyj
         7OrnBTmThIMwcMoMwubVK214Hkzm4ETjP0iPKi7V+eCluoM9lnW5y7w5koF/B6iavTjh
         tXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389414; x=1740994214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTk2aSpUgOWcjZ+Aa61IU/vjwVvxUJEha1zttmZAei8=;
        b=M2MadGY+oNpi/LJ4gk7e5ryiu0ZjJu4j4qamv47O5yWPASE/HonjyfUJGM1MqPMSs7
         2JzTCX2LWUUFZ94dyYnJ6GXgSuIvgbxpq92YnMIrO1BIEcsFS3vZkzuFJ9VtUp9xNVTw
         /nbxZAY466X9/jq/mbIe9/8uQwC9n7CUGs712H7LqUGLVnTwz1d7fudAAMjuK6LDdKCF
         c84OUrSUFpgGBBWSdOBWmG42PjomdJrS2POoFfD7JALNWgfMLpEkeDJJcIZC6o6D2oiH
         JhBOnbgcleArgoEFQkjRH1drCLiry0CoSAbKg634j8F7z0lH1NZOydn1nQE7wo00jLgZ
         8tsA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgy/9JVu2nOylnJU6wPYLOYNtjqsaWUOP/bm1l4aBZMXUIEPcr9s/LOQ5uqZ/w98J1sna49RKb0wJPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwmyuDPRRKjdTI+47X6BOTs7yqpD7ECLqn7vvxH4bVW47GnvF
	0uOtdHkR4o/SrX7Ma5eA6ZFf/aXFTWxaJXoAlaQXnFs//fLnsot48+Kgb3yt
X-Gm-Gg: ASbGnct1ULuR3iCXY+RMXMVpLXu0llFaxD/oX++5C/46MrRa44MADW93jERDdVOOwUo
	ifB1UMa0f5+HnjKdninorxqzWTdXpEA/yF6xc1jm25aRmSehMvUvEoGudq3NvrrGENHA3T+yBP9
	I3L55LFUDar+zRqh5zg3JL7NDAqv0PeR5LzDMjDuK9XioZZEWe2A/zxb7PmAtIBml9CX6H8C8pE
	YoKCJEDHRbso3G9feeoVSnnZTQ/gM4+Mg7WlWZdjC0q0t+nnkL/YdlZf7UWXqKKiIespy/1XOWi
	N7jLPUypqBx4TXgfF2AA3BU0xAEoId/J8+ljaAnSk0BakozklD1hF8trumBGLcDxLzPkYZpC
X-Google-Smtp-Source: AGHT+IGjLASHafgq9RZXxdgQTy9f3RB9YMVWHWC6vKuOdqJOXC3O0Ahtnbg+S6+1cMGnbC0VF3fORw==
X-Received: by 2002:a17:907:9406:b0:abb:e7b0:5449 with SMTP id a640c23a62f3a-abc09c30bcemr385394766b.11.1740389414240;
        Mon, 24 Feb 2025 01:30:14 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4b9ee98sm1416668666b.167.2025.02.24.01.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:30:13 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	anssi.hannula@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH 2/3] HID: pidff: Clamp effect playback LOOP_COUNT value
Date: Mon, 24 Feb 2025 10:30:08 +0100
Message-ID: <20250224093009.1831811-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ensures the loop count will never exceed the logical_maximum.

Fixes implementation errors happening when applications use the max
value of int32/DWORD as the effect iterations. This could be observed
when running software both native and in wine when driver tried to
cram 2147483647 into an 8 bit field.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index ffecc712be00..74b033a4ac1b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -690,7 +690,8 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 	} else {
 		pidff->effect_operation_status->value[0] =
 			pidff->operation_id[PID_EFFECT_START];
-		pidff->effect_operation[PID_LOOP_COUNT].value[0] = n;
+		pidff->effect_operation[PID_LOOP_COUNT].value[0] =
+			pidff_clamp(n, pidff->effect_operation[PID_LOOP_COUNT].field);
 	}
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_EFFECT_OPERATION],
-- 
2.48.1



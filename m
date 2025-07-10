Return-Path: <linux-input+bounces-13480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473BB00DBF
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 23:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ACC01C437A4
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 21:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4698027145D;
	Thu, 10 Jul 2025 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbEFydFN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53C194124
	for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182974; cv=none; b=mkQ9Ttmtjl+rMPN3RBNs8t0Bvm15aYDjTGEJ8BPi7wDsLF5FH+iLUlSAtxC3vkNyrgqsgfE7zoO3tnUHIhaNGMZ3Q27NO5VGBpwj9SmdRjgunOtF71RLhlq8u1OUzdTzdogVSDvHbxCSTUnEbxy0C5kF9ZOriEpOvNDdlPc2nLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182974; c=relaxed/simple;
	bh=Z0q5llDgY3UvUZdIR8lGMWvEeLnTXFaM54VNzgLvP6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AACjKfUeelQx0x7rzQTgTHt4Gkp1mQ2T3zh0eKgzJbSHt2NIH14UA9CZ+tw1Od6fesnZzLbjLXSZldqDOQMQI1IhXV5EZWBLezWUXLUj6otNwDogaXJKaaisyOMbcFDZ3A4R0DsvS0fYA0JqwIW5HH19tqTQsBZADwSvx474MMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbEFydFN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363616a1a6so12779685ad.3
        for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752182972; x=1752787772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FB0Q06e6mw5QPEIeE3NlRoABWw8tVLLRVw7qc6Jun1w=;
        b=HbEFydFNqFShD2QkIrCC0xkqR9PLC0Wxb+/h23YC6YazZt17dctW53Oz8ty3e848Vf
         kkmIRr/YS3G+w24Q08sZWVN+clb06S0MQsDPuYyIgH2wJPdRLfjd8+h55krh0zDOe0OI
         FGBxhE6j/3QT21OSyU6JI6cBIGqj+39DCKCSEyR1KMEIClbLS/gy2WY1nQhPC6zXEfJ3
         qX+ADa/d5TpOrmYy0WQpKbyHbHNnCvjqRvUmD2ioyX043seEsyKHqUTgMQWHmkTGpweq
         PQPkZH8lVSPijUceOrGfroZ0zVZuvHCfv1uqoLOLYs+aVTEk58js5eZ1+lYfIZHNwUAb
         /GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752182972; x=1752787772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB0Q06e6mw5QPEIeE3NlRoABWw8tVLLRVw7qc6Jun1w=;
        b=V8zCCxltsmzCqfFR3/P0m73V2d0+UEfQ5WjYopR51zubvtbJDHToYSHvNLxPzEGVGd
         wlBGNQpIGCc9pg50NU7EkWcfTJo0fiEwiHzgN3fszk4n9S+7OMs7AsnU8K1UnzLtMBuw
         lQ7VnxtdNwZUXeBv8Cn9YBGyOjXRnDtcCIRv4Jzw2yah/CmpKaYGEG88PtMnbsqq/9EB
         Bg1NUkwV6p2H4czjt6aEACZlK2ahKDtNyb6aM1Gj4lsfrjY/U8ZMkG5IpjOuLHwIdbK8
         Jua3Oqag2Gp305mSFVj9CWQXwyVEm3I+pSV8yJ0Xbnx5gUeueli6Jp5Evmn0TCH0dMPB
         rZ2Q==
X-Gm-Message-State: AOJu0YzcUd5fkGa4UlszjxC4jkuvtqVnyB/TQS6NCdBaUIo0HrMbl5T+
	y5uJ2OMo/cq/aeviWJ+/iOqQsPC11VKPY+tQOmO6Cgz6Yst47gagNHk67WYrcQ==
X-Gm-Gg: ASbGnctaAF/j0zMUlHlbI2IKAgX9HEzPwZIP30NP/32OlVdWObz/GNPZ1nrlATEyrp0
	fvKl4yDFj6nHXIqxySoR4c1P4qKZ23cXu3wi5AdM+R5JLverjq5U+Hj5Snq/8J2vqS9Crv8U3DL
	jCrHeJ9Sm5msg1c/3bI//fl1FordX2HheN3e+da4wSvX6fRQhLOlI1TV6ACvdDRe8gCdKJio3a3
	R2yomZ6P3nj61UQk6cQ7CyQI8rFfHCvqDt6LY5lOuOc6Kga8M6lFq2xlWmWWSOdT9fqMw1YkZ1I
	XabshEEbILPDIrBw4ECVa4vgF3iD/XtDhtMJHHNfk77vM07CQQkNdkLzZJNEOYTkiPc+preIjeW
	04kKWmisda1no22NaD0oo1nNzLnKxKCYYBKAhJlZDEyE=
X-Google-Smtp-Source: AGHT+IErbMBIRwcicXJ8GwctEnpYZSObUoizc3xFdEWcAN918e+TMqIs8Hf3XQrtVbIXzQUcheGhfQ==
X-Received: by 2002:a17:902:ea12:b0:234:ed31:fc98 with SMTP id d9443c01a7336-23dee29dfdbmr8170155ad.37.1752182971590;
        Thu, 10 Jul 2025 14:29:31 -0700 (PDT)
Received: from ping-dynabook-V62-B.fvrl.org ([66.96.79.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad2f1sm33902375ad.63.2025.07.10.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:29:31 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org
Cc: jkosina@suse.com,
	bentiss@kernel.org,
	Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 2/2] selftests/hid-tablet: add ABS_DISTANCE test to stylus/pen
Date: Thu, 10 Jul 2025 14:29:28 -0700
Message-ID: <20250710212928.7944-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ABS_DISTANCE was not supported for stylus and pen. This test is to
make sure the ABS_DISTANCE event is supported, if reported.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 tools/testing/selftests/hid/tests/test_tablet.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/hid/tests/test_tablet.py b/tools/testing/selftests/hid/tests/test_tablet.py
index a9e2de1e8861..40f6c3495394 100644
--- a/tools/testing/selftests/hid/tests/test_tablet.py
+++ b/tools/testing/selftests/hid/tests/test_tablet.py
@@ -451,6 +451,7 @@ class Pen(object):
     def __init__(self, x, y):
         self.x = x
         self.y = y
+        self.distance = 0
         self.tipswitch = False
         self.tippressure = 15
         self.azimuth = 0
@@ -472,6 +473,7 @@ class Pen(object):
             for i in [
                 "x",
                 "y",
+                "distance"
                 "tippressure",
                 "azimuth",
                 "width",
@@ -550,6 +552,7 @@ class PenDigitizer(base.UHIDTestDevice):
             pen.backup()
             pen.x = 0
             pen.y = 0
+            pen.distance = 0
             pen.tipswitch = False
             pen.tippressure = 0
             pen.azimuth = 0
@@ -929,6 +932,7 @@ class XPPen_ArtistPro16Gen2_28bd_095b(PenDigitizer):
             pen.backup()
             pen.x = 0
             pen.y = 0
+            pen.distance = 0
             pen.tipswitch = False
             pen.tippressure = 0
             pen.azimuth = 0
-- 
2.50.0



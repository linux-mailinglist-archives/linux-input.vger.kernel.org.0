Return-Path: <linux-input+bounces-16269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298DC76B2C
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 01:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4930D4E5DA7
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 00:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CEDFC0A;
	Fri, 21 Nov 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VePy7+KN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AFA944
	for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683479; cv=none; b=cgsuoYJczBztCJBREyKQsr679TQLHiylVMpFwVcimBPDzsnXZCm9z/N7zZ72I0YtfdixRNy0Sxkd04Y0Ub3SkCQr6Y8t+GN2Adr+j3cNm61f74WQJmLv0E+u2Ija2c5mda/JFxZuRiPlosETxVfi6FGmhMjgJtUbOpouwUwx878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683479; c=relaxed/simple;
	bh=2AXrSv9Whw8ZnmYI11LonZo2zoxqHUg4PkT1bewu+LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbosW4zuj8DuJ70W9J07Im+cSNX3sSUkjMJlG4WnwOs7iQR8LQUEK4UaLUSDp4BEn8xDdmaEleTZnzLwdYYT4Tlr4M2zc/QzGuGcJjdvhmai+x+LOzrNXaUxYP9v6I8nqygr5pZHlX8bKA9750O8iX/jvVI7X8cQ7uP1wPityJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VePy7+KN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1269670b3a.1
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 16:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763683477; x=1764288277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSsLiiSTL2av7klPupKbRan+kIsIZbAf1eXJiOEAwnc=;
        b=VePy7+KNE7vd6Gsm2JDK/Z4LToX2hxktSsuldlzbGOmJZYYHMI5OLZQmbjPtZ8FHfH
         Da14lZVEv5iSIilF8IlFIm8XY5fRdFXz/dV3jZiBlEJYiw7SKQVndUhIt5heuLwG5hf+
         JeepQH3SY7JYmyStmtF8lbzaMhxoY0ItX8JCcxrnpvYc+yqWD2EGHp8j6Dd670/QV/Ik
         alyh67o5i0kBHkUozS5M3zxoNu3UYwPJWrjrhvGFrJvbAAZF9QeMQyS3vWe6DeeMan/b
         OMYQBzZDOig6/W0IMROzARSWsioACHsJLwyEvw+E7FkYeEjJq7InnQ0SO0hC6fQxWOwK
         GKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763683477; x=1764288277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSsLiiSTL2av7klPupKbRan+kIsIZbAf1eXJiOEAwnc=;
        b=eAjGC8iAiuhUp4CCNZXg32mjVKV+Hzc9aOinRvJxEByuyqvKW/UWxb0n7iu+BJqtPc
         oNI1G7FIhYUjed3XKAGKh/g2XRZd4appoW2xSwPtF8/u6dyywiDQOYREZ2KpSDzF+71a
         TBs6ibUhK64XFz+knyVWQtcztc5Ygcc6+59IeemHBxFCqAsCP1yEaTKmRdyMRy3yzwuP
         abdF/FGz/y55TJWH2waZU9rLeFgZsy1s6/uiTi/7qD+x+QOfl3/Ftt9GfJ8YsEj6HNxc
         K89ENhkB08lm8S2z6u0TVyinHlvVBt8X2LkDVZ//w/Optb3BRPbGzbAZ7g2IQZ1IAJqP
         9kHg==
X-Gm-Message-State: AOJu0Yyij3hFSOe7ngg4eLy0ZxSImQAoekUg5csv1PpwoMPEijmB82bS
	aNMdnSdD75xBlpa3ykTNuainxNcu0/yRuILI3OAc5ixEFB/AcUDi0Xvj
X-Gm-Gg: ASbGncvuSuaeeemX6osfPDRy1EeQbvnIqMx316QIlpXjhx1rIw23reda7vE2pkrDkDs
	yfgNG4OxwhQsPBIYyInbbyX7d5SSydDKVRybv7wKokWCrzjVAbjwDJB0BOp5agsWn59XBiQS0h4
	jHcksh2YLJe7DXzu13Vx0e9IsTj68AgLkU+75OuclfTvyCUcqzoUgnQnGbFYtpB1hVWR4cthKsf
	a7MqGwHdx26+1ouhHIWMWBz2cxw1o5u7OWUmR1JqVWZHa2+xGc+pWSHlFCh2Z7z9duwQX/MCSKK
	SqNRrm4ikyrEZzWhaGIWhXLHIqUTaI+4dIFTG3Ba/qX6nEzEbfOqV8Zes5HZfXtyAUl9GEirCm2
	jM2ZvAW5Ftl+A/DU28DrXh9+LfDf2fudLOpkmNdA4zYjIVjRF3Z77kwh/gZUluVQ2X1tJ7bran/
	qsq77nIpNvBZA=
X-Google-Smtp-Source: AGHT+IHEEykjr6frs/VgM0X+yEhuXraBfQZb1stxpNE6IIjwHd7vKqpUhN1IDF8q8RL/oojJYuO/FA==
X-Received: by 2002:a05:7022:a92:b0:11b:1cae:a0fa with SMTP id a92af1059eb24-11c9d55469dmr197846c88.0.1763683476748;
        Thu, 20 Nov 2025 16:04:36 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm15035710c88.10.2025.11.20.16.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 16:04:36 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	shuah@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2] selftests: hid: tests: test_wacom_generic: add tests for display devices and opaque devices
Date: Thu, 20 Nov 2025 16:04:27 -0800
Message-ID: <20251121000427.401283-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117014721.3142490-1-alex.t.tran@gmail.com>
References: <20251117014721.3142490-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify Wacom devices set INPUT_PROP_DIRECT on display devices and
INPUT_PROP_POINTER on opaque devices. Moved test_prop_pointer into
TestOpaqueTablet. Created a DirectTabletTest mixin class for 
test_prop_direct that can be inherited by display tablet test classes.
Used DirectTabletTest for TestDTH2452Tablet case.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
Changes in v2:
- Removed the tests from the BaseTest class
- Removed disabling tests for certain subclasses
- Moved test_prop_pointer under TestOpaqueTablet
- Created DirectTabletTest mixin class
- Moved test_prop_direct under TestDTH2452Tablet
 .../selftests/hid/tests/test_wacom_generic.py | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/tools/testing/selftests/hid/tests/test_wacom_generic.py
index 2d6d04f0f..9d0b0802d 100644
--- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
+++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
@@ -598,18 +598,6 @@ class BaseTest:
                 if unit_set:
                     assert required[usage].contains(field)
 
-        def test_prop_direct(self):
-            """
-            Todo: Verify that INPUT_PROP_DIRECT is set on display devices.
-            """
-            pass
-
-        def test_prop_pointer(self):
-            """
-            Todo: Verify that INPUT_PROP_POINTER is set on opaque devices.
-            """
-            pass
-
 
 class PenTabletTest(BaseTest.TestTablet):
     def assertName(self, uhdev):
@@ -677,6 +665,13 @@ class TestOpaqueTablet(PenTabletTest):
             uhdev.event(130, 240, pressure=0), [], auto_syn=False, strict=True
         )
 
+    def test_prop_pointer(self):
+        """
+        Verify that INPUT_PROP_POINTER is set on opaque devices.
+        """
+        evdev = self.uhdev.get_evdev()
+        assert libevdev.INPUT_PROP_POINTER in evdev.properties
+
 
 class TestOpaqueCTLTablet(TestOpaqueTablet):
     def create_device(self):
@@ -862,7 +857,16 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
         )
 
 
-class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest):
+class DirectTabletTest():
+    def test_prop_direct(self):
+        """
+        Verify that INPUT_PROP_DIRECT is set on display devices.
+        """
+        evdev = self.uhdev.get_evdev()
+        assert libevdev.INPUT_PROP_DIRECT in evdev.properties
+
+
+class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest, DirectTabletTest):
     ContactIds = namedtuple("ContactIds", "contact_id, tracking_id, slot_num")
 
     def create_device(self):
-- 
2.51.0



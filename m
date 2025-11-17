Return-Path: <linux-input+bounces-16136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0581C6206F
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 02:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B5B6B2005D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 01:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0404208AD;
	Mon, 17 Nov 2025 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSgQZMVM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430981FB1
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763344051; cv=none; b=IeE0Z+ebV1ZVdVstg6/m3rt+MdtBIiHSLYlD2TJZpR1u1P8JkItIwICey46GDy3rUAo1VU3eA94GYuccHOjlEY2C+8jziEKzTcmeCrytoa1uKEjq/qnKGxyHPWZkvAMXwZkf/KoZvY9BhSy39EakuazMlhAGIORli44rUOrUXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763344051; c=relaxed/simple;
	bh=ci1MJqonUW7+fRPgF29LNM4X1wJ2QmGrj0EhSyjLDd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdQDr9K2lcY4M+/D9sehafeYWmh4domIb95juZI3C63e9GAys1Hx1K+XZCdcO89wAKlQdSO1INMFFjvOVVY6yELu2SdVx1XXnSh1KjuPOr3+t39+3awMe1zqZ/Dj7CzQswtFdCRElSe2nRmR5ki8FCUkgDvR27XDlUgLGN0A5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSgQZMVM; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bb7799edea8so3140052a12.3
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 17:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763344049; x=1763948849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NN+0/WXQ+hiU5DStJXAkgWAwjWLdOPrrNQUogMgbThM=;
        b=ZSgQZMVMnJPP38v1HH7sJaqxeM6skxHKst0sC2Ab0lOVYIwzgKHwbAsetGq84mp2A+
         LGqkhDm9f6R5hjtS0B5Zw4ci5SjxxEUUQ0UrW3VAIgyJKq1Eb1x/W0x4FKLxmfX+vZBv
         7QVJQ0p0GY1cHAecz6yXABDTr1KS6q0xxV7TmtrPjOaYm62O3ozAu24Idjh10PcWC7LL
         2uAxMEjVzcphN3X2SZ5hX1Aq1pNZJQ+35g6Dk1FBTRNlCmBWUCT0Ga/NXXA9Mw5NhBmv
         EJkNdOntncBxJ9bO1nEvGh30M3zv8qWSiNOvYuwYXo1EuNblBtpdhNm8yHoDgRVXzcEL
         gnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763344049; x=1763948849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NN+0/WXQ+hiU5DStJXAkgWAwjWLdOPrrNQUogMgbThM=;
        b=iqGWbca7wJLu8/aGF+lrM6R5CRTCwPRYDs/qiZvplXrz+llH8K+TfMX6N/hLe8H0qP
         O5tCs/a/crLaenSh/P7oSYJ/IoJ119KRfh8uSFtriKKvsnLDSxwIe4y+izpQr4tqePll
         vRhZBazHhCWTjyUfV3j9Q1ETzBKmTG5BLmTp5ww+RVTLnnEkCpqzEXN5eA1+kihkE4Xo
         QVio8BBYPevWYiezNrzXvG8x9M94TwZAk4bb6krKmzw1zMwX8lRU4j6ErcBGmJA615I0
         7B+5Zd2/xUZuHWmCkLWr1TVHtFqJJNtXyZtM5+BrPfsp3gkqT8fDK75sbCMd+J7k0CnD
         yUqg==
X-Gm-Message-State: AOJu0YwqHqX6ksO5nt4cna3mm9jd5F7VPxtoBiG0xSiVk+TtWGA+MSoX
	kJ6MtvLMnl6S836rA9SJ27ZNMH1vmGZAorAgEsjk68TP4q7s/+6es4B9
X-Gm-Gg: ASbGncuyW2kC7jH+5JgjbcKqUs3oT8OR5rYYpEDp3mcDBeOMlD80riNnq/zypxv8E22
	iXFEJA0hay4LDuzvxwzlRS0tNPx4d1WcwD7h1H197KpzRSwzTg9aig3NozLbUic+KJNd8+AcdWB
	bnH8p8ml18MHl7NYk3XK863WKzNEWwwz5CFz35XAFUakODxzOTTKIEICC88OjzPwk08l6hMQL0L
	kh2j0SxAzK/nZYAJ9xzIf5PNVseZD9H7kqqzG0RQ4NDMlxc06ZTd4u+VKcRNppEccEkn/QneF/U
	4b3OjwVsZjYxB/8u8Lr3j0THeoZi1nqYY0XNdthRhz4t+/WNcIG3VCmlg4kLRZn07fdL3tzAJlS
	8EWKVVgUii6feSLtsr4AGC5GVCRm4sK0+52CcjEtRl3/p2tA/CY7trBGFd6EeqJ2MihqRk7bXWU
	X2
X-Google-Smtp-Source: AGHT+IG9DWYfri2RoAj4ysET577lbaipDwCtVOsVcnfV9nDn9tuThKae221+nKnKPpNTGD8Rd+Nq2A==
X-Received: by 2002:a05:7300:ae1c:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2a4abb330b7mr4686136eec.21.1763344049417;
        Sun, 16 Nov 2025 17:47:29 -0800 (PST)
Received: from fedora ([172.59.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49da0662dsm42088815eec.2.2025.11.16.17.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 17:47:29 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	shuah@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] selftests: hid: tests: test_wacom_generic: add base test for display devices and opaque devices
Date: Sun, 16 Nov 2025 17:47:21 -0800
Message-ID: <20251117014721.3142490-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify Wacom devices set INPUT_PROP_DIRECT appropriately on display devices
and INPUT_PROP_POINTER appropriately on opaque devices. Tests are defined
in the base class and disabled for inapplicable device types.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 .../selftests/hid/tests/test_wacom_generic.py       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/tools/testing/selftests/hid/tests/test_wacom_generic.py
index 2d6d04f0f..aa2a175f2 100644
--- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
+++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
@@ -600,15 +600,17 @@ class BaseTest:
 
         def test_prop_direct(self):
             """
-            Todo: Verify that INPUT_PROP_DIRECT is set on display devices.
+            Verify that INPUT_PROP_DIRECT is set on display devices.
             """
-            pass
+            evdev = self.uhdev.get_evdev()
+            assert libevdev.INPUT_PROP_DIRECT in evdev.properties
 
         def test_prop_pointer(self):
             """
-            Todo: Verify that INPUT_PROP_POINTER is set on opaque devices.
+            Verify that INPUT_PROP_POINTER is set on opaque devices.
             """
-            pass
+            evdev = self.uhdev.get_evdev()
+            assert libevdev.INPUT_PROP_POINTER in evdev.properties
 
 
 class PenTabletTest(BaseTest.TestTablet):
@@ -622,6 +624,8 @@ class TouchTabletTest(BaseTest.TestTablet):
 
 
 class TestOpaqueTablet(PenTabletTest):
+    test_prop_direct = None
+
     def create_device(self):
         return OpaqueTablet()
 
@@ -864,6 +868,7 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
 
 class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest):
     ContactIds = namedtuple("ContactIds", "contact_id, tracking_id, slot_num")
+    test_prop_pointer = None
 
     def create_device(self):
         return test_multitouch.Digitizer(
-- 
2.51.0



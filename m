Return-Path: <linux-input+bounces-16652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E145CCD3726
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 21:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F38B300F303
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 20:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F832E7167;
	Sat, 20 Dec 2025 20:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLTGuJq4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3551313295
	for <linux-input@vger.kernel.org>; Sat, 20 Dec 2025 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263710; cv=none; b=IcLtnCX4E4Naub7VCZcO9B4QpJLfxLXuf9k95SDd0PjURzimlUSko18LBt8HV2fBJZNtLJ7b5/BKLqNxdOKBm5SqnfNzhetYy4oymzzutlTZDWKohgUE6KiDN9EjxdtQeuCxR8wu94j5HfmtfLLAmMvGnDpFsHJGT6Bs7hJMrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263710; c=relaxed/simple;
	bh=2AXrSv9Whw8ZnmYI11LonZo2zoxqHUg4PkT1bewu+LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nFqxCyN+WLNTzr0+9f+r1VzugBJgFE6V/fr6ju3JMldUw7UwSrd1AaiiUyVQC5C+ixHd1Qh40iMXvnFbXts/t/4vp/CLzSfm3T+yebQangUNkefO+6woM6CN4hsXUA/yCE6ssYJ9Alj1xCAByRi0OsmGSDqVja1kRVJCzwUmnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLTGuJq4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a12ebe4b74so47476405ad.0
        for <linux-input@vger.kernel.org>; Sat, 20 Dec 2025 12:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766263707; x=1766868507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FSsLiiSTL2av7klPupKbRan+kIsIZbAf1eXJiOEAwnc=;
        b=KLTGuJq4EJz1+1neb5hXe48GHji7J4xJD09lMpOhPoNwt8knQqhznwavvHFcz+67KD
         iswAsidLdhAhEYNdSFKmWmuVZgORKmM1W7c7xSwA6NWLsLfxxB9yDyYNfzYsQrvD5BRV
         ohvnZuaBmgy8HxdXLks8P3kXLvtDXNZ+rotYKW+PYC0iTzDWP7bsFSl81tze1qtkKeNy
         0QtwsNVPPoRrcYkVj3YqLApLsr/0jCJqItYxrwj+ZUPDH1rOUr+0VLx1ogPCHf81+r/r
         1rSLmrNiIllhRizqrjv7mlIJQBbkxWpEI69irzGxaC3zx1irDEkIgBWQdxfnYT51OAA6
         b/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766263707; x=1766868507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSsLiiSTL2av7klPupKbRan+kIsIZbAf1eXJiOEAwnc=;
        b=SsYEo1rmJxczGxQRCjuHtA4/l42qPe0Mt6Ef3FUKGnIpZ10vXW51Cu7NcOXb4HRrlG
         jbsEfCU9/IyuiTqEh4qnbp2rB35xJRB7DSdBI1casNVPrz6t3OVqwhzyBpSse9dp+Jcf
         VSmoVLdVv/aQvv7TXJDuoM3cjg2yftnuMsz2wp4l7FZCE1ruLm2XPSW2SWw+AkUrr0gA
         xZHqxKWR27AgQIcIhRQnx7Ww28hajEdgcKrV+YL9FcIyg2rN9xA8xq+5EHGJBXvzrMEF
         PfAEvKaYa5SQIeylI24lwqmgKtXh/N1QToCCae26sz8+HjCjVbZos5I4/ythJQrtnr4I
         /cNg==
X-Gm-Message-State: AOJu0Yw3jg8+ryTy8Ie8g7shBjSJhv3NZ8sJsvBdyGzvKXpDorIF5fH7
	x8QCQ0MZDuRlFDVPGiyL5xApdGH9I48KRsmkX/ZgugKEaSzCZEvcktZG
X-Gm-Gg: AY/fxX7JxdN3A6NVCz4jM48E0NBze79I6E/2Iqe8bPsTAS4XtXi7pbjBEASkBRe0cPD
	YTs0aS4e10sNMHCshatN7DWgncLN7eCGSrIi5eoSaVuFoliinlK6/hcSbKFOEMU3p1AUbsTIAF/
	5Zxv+/lpdiRRf1zLEYMKHkELWmmijkI7l47kL5q/v1DJIP4R+OnDukYlMvJzfA2RoMVNwVVFlyc
	geZ1avVHEwMyN1DgEifZv1/NyvSX1qxJ/koUrwdzebE2tt56HYczmmN67p0iyW3kuiSW0XQCDNx
	9mvmS+5Js4fjGMlAfo2pvZuSKriXOZ2kHVVsjwsHAkcclPJskzn+xD0OeDDcK/NtAqKjvQ8rhVz
	MIa7fxwbQTrsB7vMq92AFWC6BIe6Kwpmgcu/wcJ3eEx+y0q5bwu8TGkGokT0W+Un6jdwb9NLUkV
	/yk6a5cB22Ch9TzEYMJDbndQ==
X-Google-Smtp-Source: AGHT+IHJ9TDxVg4JDg/3TYZVX5GS4uVFekWGVR8sJr7Lo3J8+b+7PTIbB121gqzYNlncKBx3kNGuRQ==
X-Received: by 2002:a05:7022:68a3:b0:119:e56b:c75f with SMTP id a92af1059eb24-121722f7fd4mr9036656c88.36.1766263706893;
        Sat, 20 Dec 2025 12:48:26 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm18097539c88.10.2025.12.20.12.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 12:48:26 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	shuah@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 RESEND] selftests: hid: tests: test_wacom_generic: add tests for display devices and opaque devices
Date: Sat, 20 Dec 2025 12:48:11 -0800
Message-ID: <20251220204811.3539836-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
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



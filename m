Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A26FFAD2
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 21:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239324AbjEKTs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 May 2023 15:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbjEKTsf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 May 2023 15:48:35 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B0C35AA
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 12:48:08 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1aaebed5bd6so65065635ad.1
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshua-dickens-com.20221208.gappssmtp.com; s=20221208; t=1683834485; x=1686426485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vC0rNuPx0IWbkz7Fn9Bis5ExEOwUS4ha7xvVAnEDyM=;
        b=I1q+KtIplOawBCueb+mem/TAK2t/+um0VWOCqSPNt/WyUHCcuXOtzHf6jAPHVH+XAi
         5d8dJQRwAhKl0Rv5yMR50ogpHJkt0G26lu/Pwwy4A09oze4Vhv7Mg7wNHjNGR0i4psrS
         sNUv1+k1ZZi99GOp4OjTOI/USxuOamqb+BqZ6Vi8MOqADhXwkwjlbAGBixxsA7J9Td4D
         BPTpK9yETIkxdSjgaMwP7vI+HopevevEaPldT3/98Ay7VcViGBVSaCMoexD5tl/Z5DIB
         HHat+2voV1aPhj+psWi39G/0kQL3c4febkmJdsZyCUbjcWN8xXFljh6sONvuUxsyI53l
         C9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683834485; x=1686426485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vC0rNuPx0IWbkz7Fn9Bis5ExEOwUS4ha7xvVAnEDyM=;
        b=J9KMFWFjRtDbbhozy0KQ39L8N7gr0kpBbhs284Q2QODtewQR1+iBY17GeHaeW+q6U1
         dJOSru3iN5AZM9dEtAN8CcGD3IAWsH+NMDcsA3zuF/3Ky31k3VrkbsbxuHqixkb6BXqE
         kv4jKA/mm5j+UppElMXuo14ehY4wbK3nWQtMT2J/TA1awKZFQlRuRv5UAdiMAuzNye8J
         ywOVyGUh/iPiJ8slVZ34onTgHgJT6/rJ1FfagP48pj/O1lTbC5+YkL78FUwpT/VwPH7w
         QeWrOej+Q6DD2tX8MyAnx2Y31GJ37IvBYsy8NgJ+jyg2OUa0buqRYMECz3gAfFCuA3do
         SqaA==
X-Gm-Message-State: AC+VfDxtPDS8U1qBEzyrv/eusoUkcKzVnj1oNKthfBRAgbyThjXhcZWU
        QiAVBgaNuVOgORxPUJWhDQW9XPxtI34/Ci/KAczL7Q==
X-Google-Smtp-Source: ACHHUZ4+tb0QDGfnO/UIx7po9h291CGcIhAnaLbbS/pmgWKFLBiossUkNC8w/zOhVOLWNTUNG2fqEQ==
X-Received: by 2002:a17:902:db04:b0:1ac:8dae:d842 with SMTP id m4-20020a170902db0400b001ac8daed842mr16298503plx.46.1683834485356;
        Thu, 11 May 2023 12:48:05 -0700 (PDT)
Received: from fedora.. ([50.39.134.154])
        by smtp.gmail.com with ESMTPSA id b17-20020a170903229100b001ab39cd885esm6288744plh.212.2023.05.11.12.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 12:48:04 -0700 (PDT)
From:   Joshua Dickens <joshua@joshua-dickens.com>
X-Google-Original-From: Joshua Dickens <Joshua@Joshua-Dickens.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] selftests: hid: Add touch tests for Wacom devices
Date:   Thu, 11 May 2023 12:47:54 -0700
Message-Id: <20230511194754.129571-1-Joshua@Joshua-Dickens.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding a wacom touch device to use the test_multitouch tests.
Adding a 2 additional tests.
 - A test to check if a touch event is sent when the contact_id of the even=
t is 0.
 - A test to check if a touch event is not sent when confidence is set to 0.

Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 .../selftests/hid/tests/test_wacom_generic.py | 84 ++++++++++++++++++-
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/tool=
s/testing/selftests/hid/tests/test_wacom_generic.py
index b1eb2bc787fc..f92fe8e02c1b 100644
--- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
+++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
@@ -31,6 +31,7 @@ from enum import Enum
 from hidtools.hut import HUT
 from hidtools.hid import HidUnit
 from . import base
+from . import test_multitouch
 import libevdev
 import pytest
=20
@@ -517,7 +518,7 @@ class BaseTest:
                 for usage in get_report_usages(report):
                     yield usage
=20
-        def assertName(self, uhdev):
+        def assertName(self, uhdev, type):
             """
             Assert that the name is as we expect.
=20
@@ -526,7 +527,7 @@ class BaseTest:
             this assertion from the base class to work properly.
             """
             evdev =3D uhdev.get_evdev()
-            expected_name =3D uhdev.name + " Pen"
+            expected_name =3D uhdev.name + type
             if "wacom" not in expected_name.lower():
                 expected_name =3D "Wacom " + expected_name
             assert evdev.name =3D=3D expected_name
@@ -549,6 +550,12 @@ class BaseTest:
                 usage_id("Generic Desktop", "Y"): PhysRange(
                     PhysRange.CENTIMETER, 5, 150
                 ),
+                usage_id("Digitizers", "Width"): PhysRange(
+                    PhysRange.CENTIMETER, 5, 150
+                ),
+                usage_id("Digitizers", "Height"): PhysRange(
+                    PhysRange.CENTIMETER, 5, 150
+                ),
                 usage_id("Digitizers", "X Tilt"): PhysRange(PhysRange.DEGR=
EE, 90, 180),
                 usage_id("Digitizers", "Y Tilt"): PhysRange(PhysRange.DEGR=
EE, 90, 180),
                 usage_id("Digitizers", "Twist"): PhysRange(PhysRange.DEGRE=
E, 358, 360),
@@ -603,7 +610,17 @@ class BaseTest:
             pass
=20
=20
-class TestOpaqueTablet(BaseTest.TestTablet):
+class PenTabletTest(BaseTest.TestTablet):
+    def assertName(self, uhdev):
+        super().assertName(uhdev, " Pen")
+
+
+class TouchTabletTest(BaseTest.TestTablet):
+    def assertName(self, uhdev):
+        super().assertName(uhdev, " Finger")
+
+
+class TestOpaqueTablet(PenTabletTest):
     def create_device(self):
         return OpaqueTablet()
=20
@@ -842,3 +859,64 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
                 libevdev.InputEvent(libevdev.EV_KEY.BTN_0, 0),
             ],
         )
+
+
+class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabl=
etTest):
+    def create_device(self):
+        return test_multitouch.Digitizer(
+            "DTH 2452",
+            rdesc=3D"05 0d 09 04 a1 01 85 0c 95 01 75 08 15 00 26 ff 00 81=
 03 09 54 81 02 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 03 09 47=
 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 0e 05 01=
 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d 75 08 95=
 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 45 00 65=
 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 03 09=
 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 0e 05=
 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d 75 08=
 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 45 00=
 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81 03=
 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55 0e=
 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d 75=
 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02 45=
 00 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02 81=
 03 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11 55=
 0e 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05 0d=
 75 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81 02=
 45 00 65 00 55 00 c0 05 0d 09 22 a1 02 05 0d 95 01 75 01 25 01 09 42 81 02=
 81 03 09 47 81 02 95 05 81 03 09 51 26 ff 00 75 10 95 01 81 02 35 00 65 11=
 55 0e 05 01 09 30 26 a0 44 46 96 14 81 42 09 31 26 9a 26 46 95 0b 81 42 05=
 0d 75 08 95 01 15 00 09 48 26 5f 00 46 7c 14 81 02 09 49 25 35 46 7d 0b 81=
 02 45 00 65 00 55 00 c0 05 0d 27 ff ff 00 00 75 10 95 01 09 56 81 02 75 08=
 95 0e 81 03 09 55 26 ff 00 75 08 b1 02 85 0a 06 00 ff 09 c5 96 00 01 b1 02=
 c0 06 00 ff 09 01 a1 01 09 01 85 13 15 00 26 ff 00 75 08 95 3f 81 02 06 00=
 ff 09 01 15 00 26 ff 00 75 08 95 3f 91 02 c0",
+            input_info=3D(0x3, 0x056A, 0x0383),
+        )
+
+    def test_contact_id_0(self):
+        """
+        Bring a finger in contact with the tablet, then hold it down and r=
emove it.
+
+        Ensure that even with contact ID =3D 0 which is usually given as a=
n invalid
+        touch event by most tablets with the exception of a few, that give=
n the
+        confidence bit is set to 1 it should process it as a valid touch t=
o cover
+        the few tablets using contact ID =3D 0 as a valid touch value.
+        """
+        uhdev =3D self.uhdev
+        evdev =3D uhdev.get_evdev()
+
+        t0 =3D test_multitouch.Touch(0, 50, 100)
+        r =3D uhdev.event([t0])
+        events =3D uhdev.next_sync_events()
+        self.debug_reports(r, uhdev, events)
+
+        slot =3D self.get_slot(uhdev, t0, 0)
+
+        assert libevdev.InputEvent(libevdev.EV_KEY.BTN_TOUCH, 1) in events
+        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_TRACKING_ID] =3D=
=3D 0
+        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_POSITION_X] =3D=3D=
 50
+        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_POSITION_Y] =3D=3D=
 100
+
+        t0.tipswitch =3D False
+        if uhdev.quirks is None or "VALID_IS_INRANGE" not in uhdev.quirks:
+            t0.inrange =3D False
+        r =3D uhdev.event([t0])
+        events =3D uhdev.next_sync_events()
+        self.debug_reports(r, uhdev, events)
+        assert libevdev.InputEvent(libevdev.EV_KEY.BTN_TOUCH, 0) in events
+        assert evdev.slots[slot][libevdev.EV_ABS.ABS_MT_TRACKING_ID] =3D=
=3D -1
+
+    def test_confidence_false(self):
+        """
+        Bring a finger in contact with the tablet with confidence set to f=
alse.
+
+        Ensure that the confidence bit being set to false should not resul=
t in a touch event.
+        """
+        uhdev =3D self.uhdev
+        evdev =3D uhdev.get_evdev()
+
+        t0 =3D test_multitouch.Touch(1, 50, 100)
+        t0.confidence =3D False
+        r =3D uhdev.event([t0])
+        events =3D uhdev.next_sync_events()
+        self.debug_reports(r, uhdev, events)
+
+        slot =3D self.get_slot(uhdev, t0, 0)
+
+        assert not events
\ No newline at end of file
--=20
2.40.0


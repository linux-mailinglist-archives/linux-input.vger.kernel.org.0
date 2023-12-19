Return-Path: <linux-input+bounces-864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6B819252
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 22:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1108D287BDE
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34293B18E;
	Tue, 19 Dec 2023 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lma2KZ5y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D023B18A
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-67f1880a849so1058216d6.0
        for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 13:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703021632; x=1703626432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5oYx55oTlUZRh38Bzf5ko6N7kt5zzgwyD71A4dFAfQ=;
        b=lma2KZ5y/MT73hWVn7dL2YtFGljxXDNIA/dElOj6gpMxcgzhJ8KsDLzprV6MHT4352
         pstFQXBU1ej6YlK48w2sXw1s5fHc/uhjOf84tdLukPINMZ+IjZOnHqyMMDCdM974IC7K
         HSC7inRLzkW31zw78bIqIvqsAxdaKKILpS6Xr2Qd7OiSi2llhCVqjxFUrD5UKcSqBG76
         8x+7srNZMp4nmEv5uCBpX/xvZJsbp8FnrpOIhmNSAH0ihDmVr+va4ccZb0Pazn8LsSIN
         hz/MQjdovOtkqczN+UTfF5PVZ/arHiPWiTFz7EHh4nZLqCXWVGKoF08uNRtuCpYIceD/
         eeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703021632; x=1703626432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5oYx55oTlUZRh38Bzf5ko6N7kt5zzgwyD71A4dFAfQ=;
        b=jWDw9n1pIoib3jtIJA2fwdNFy25tKfHVMAJWlzysrA8nMH1kkmzYJhz5WLPr+8d/H2
         NWcSAWynVnlgNwbk8FTYGDV8c/6l2VzgP/8SaSlgonOoEjTS4IdHFnAKC2jQKfWw6Dfc
         So2m3ndnwPwAfgbyoEG5ebWNy1+qxKZK9DQ/+L8fvFmLSHmPAgQKHSLr5KH+ByRKT1Qo
         Z0xSpNpOl/z8FqVkF8ZBGdoKjV0L3eSFtvOFBI7GnKu0uDZwAamLnp0gECIqBT8rBqXm
         etgyycOhY8gvPX8lFMVcjkDmAfBaA3aACqt4P9ZCff/Y3dAsbaSKaCpO94PZyxayEGD5
         9VtA==
X-Gm-Message-State: AOJu0Yy3v1UKc7TcwQhPXqzW4OaH4gwu+F8aJFzAB9ybn9ZsBp6FiFZa
	swCjKQ9pdZAkd+HVn0Mj5B8vexnkoB4=
X-Google-Smtp-Source: AGHT+IFYoyr8Dpq04IQjFRD+qTEJA9oW5fivIJscOGBmAFD1uWxSchgCDVyPHKqRqvcayoDPZsnrWw==
X-Received: by 2002:ad4:5f86:0:b0:67f:1677:7e0c with SMTP id jp6-20020ad45f86000000b0067f16777e0cmr2847290qvb.0.1703021632243;
        Tue, 19 Dec 2023 13:33:52 -0800 (PST)
Received: from localhost.localdomain ([2607:fb91:1ee4:153c:b0e5:6075:17c0:82cf])
        by smtp.gmail.com with ESMTPSA id dy7-20020ad44e87000000b0067f213933bdsm4083922qvb.2.2023.12.19.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:33:51 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Aaron Skomra <aaron.skomra@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Joshua Dickens <joshua.dickens@wacom.com>,
	Ping Cheng <ping.cheng@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Joshua Dickens <joshua@joshua-dickens.com>,
	Ping Cheng <pinglinux@gmail.com>
Subject: [PATCH 2/2] HID: wacom: Add additional tests of confidence behavior
Date: Tue, 19 Dec 2023 13:33:44 -0800
Message-ID: <20231219213344.38434-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219213344.38434-1-jason.gerecke@wacom.com>
References: <20231219213344.38434-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Test for proper driver behavior when the touch confidence bit is set
or cleared. Test the three flavors of touch confidence loss (tipswitch
cleared before confidence, tipswitch and confidence cleared at the same
time, and tipswitch only cleared when touch is actually removed). Also
test two flavors of touch confidence gain (confidence added to a touch
that was "never" confident, and confidence added to a touch that was
previously confident).

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 .../selftests/hid/tests/test_wacom_generic.py | 278 +++++++++++++++++-
 1 file changed, 277 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/tools/testing/selftests/hid/tests/test_wacom_generic.py
index f92fe8e02c1b..a7ee54e5090b 100644
--- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
+++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
@@ -27,6 +27,7 @@ from .descriptors_wacom import (
 )
 
 import attr
+from collections import namedtuple
 from enum import Enum
 from hidtools.hut import HUT
 from hidtools.hid import HidUnit
@@ -862,6 +863,8 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
 
 
 class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest):
+    ContactIds = namedtuple("ContactIds", "contact_id, tracking_id, slot_num")
+
     def create_device(self):
         return test_multitouch.Digitizer(
             "DTH 2452",
@@ -869,6 +872,57 @@ class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest
             input_info=(0x3, 0x056A, 0x0383),
         )
 
+    def make_contact(self, contact_id=0, t=0):
+        """
+        Make a single touch contact that can move over time.
+
+        Creates a touch object that has a well-known position in space that
+        does not overlap with other contacts. The value of `t` may be
+        incremented over time to move the point along a linear path.
+        """
+        x = 50 + 10 * contact_id + t
+        y = 100 + 100 * contact_id + t
+        return test_multitouch.Touch(contact_id, x, y)
+
+    def make_contacts(self, n, t=0):
+        """
+        Make multiple touch contacts that can move over time.
+
+        Returns a list of `n` touch objects that are positioned at well-known
+        locations. The value of `t` may be incremented over time to move the
+        points along a linear path.
+        """
+        return [ self.make_contact(id, t) for id in range(0, n) ]
+
+    def assert_contact(self, uhdev, evdev, contact_ids, t=0):
+        """
+        Assert properties of a contact generated by make_contact.
+        """
+        contact_id = contact_ids.contact_id
+        tracking_id = contact_ids.tracking_id
+        slot_num = contact_ids.slot_num
+
+        x = 50 + 10 * contact_id + t
+        y = 100 + 100 * contact_id + t
+
+        # If the data isn't supposed to be stored in any slots, there is
+        # nothing we can check for in the evdev stream.
+        if slot_num is None:
+            assert tracking_id == -1
+            return
+
+        assert evdev.slots[slot_num][libevdev.EV_ABS.ABS_MT_TRACKING_ID] == tracking_id
+        if tracking_id != -1:
+            assert evdev.slots[slot_num][libevdev.EV_ABS.ABS_MT_POSITION_X] == x
+            assert evdev.slots[slot_num][libevdev.EV_ABS.ABS_MT_POSITION_Y] == y
+
+    def assert_contacts(self, uhdev, evdev, data, t=0):
+        """
+        Assert properties of a list of contacts generated by make_contacts.
+        """
+        for contact_ids in data:
+            self.assert_contact(uhdev, evdev, contact_ids, t)
+
     def test_contact_id_0(self):
         """
         Bring a finger in contact with the tablet, then hold it down and remove it.
@@ -919,4 +973,226 @@ class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, TouchTabletTest
 
         slot = self.get_slot(uhdev, t0, 0)
 
-        assert not events
\ No newline at end of file
+        assert not events
+
+    def test_confidence_multitouch(self):
+        """
+        Bring multiple fingers in contact with the tablet, some with the
+        confidence bit set, and some without.
+
+        Ensure that all confident touches are reported and that all non-
+        confident touches are ignored.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        touches = self.make_contacts(5)
+        touches[0].confidence = False
+        touches[2].confidence = False
+        touches[4].confidence = False
+
+        r = uhdev.event(touches)
+        events = uhdev.next_sync_events()
+        self.debug_reports(r, uhdev, events)
+
+        assert libevdev.InputEvent(libevdev.EV_KEY.BTN_TOUCH, 1) in events
+
+        self.assert_contacts(uhdev, evdev,
+            [ self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = None),
+              self.ContactIds(contact_id = 1, tracking_id = 0, slot_num = 0),
+              self.ContactIds(contact_id = 2, tracking_id = -1, slot_num = None),
+              self.ContactIds(contact_id = 3, tracking_id = 1, slot_num = 1),
+              self.ContactIds(contact_id = 4, tracking_id = -1, slot_num = None) ])
+
+    def confidence_change_assert_playback(self, uhdev, evdev, timeline):
+        """
+        Assert proper behavior of contacts that move and change tipswitch /
+        confidence status over time.
+
+        Given a `timeline` list of touch states to iterate over, verify
+        that the contacts move and are reported as up/down as expected
+        by the state of the tipswitch and confidence bits.
+        """
+        t = 0
+
+        for state in timeline:
+            touches = self.make_contacts(len(state), t)
+
+            for item in zip(touches, state):
+                item[0].tipswitch = item[1][1]
+                item[0].confidence = item[1][2]
+
+            r = uhdev.event(touches)
+            events = uhdev.next_sync_events()
+            self.debug_reports(r, uhdev, events)
+
+            ids = [ x[0] for x in state ]
+            self.assert_contacts(uhdev, evdev, ids, t)
+
+            t += 1
+
+    def test_confidence_loss_a(self):
+        """
+        Transition a confident contact to a non-confident contact by
+        first clearing the tipswitch.
+
+        Ensure that the driver reports the transitioned contact as
+        being removed and that other contacts continue to report
+        normally. This mode of confidence loss is used by the
+        DTH-2452.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        self.confidence_change_assert_playback(uhdev, evdev, [
+            # t=0: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # Both fingers confidently in contact
+            [(self.ContactIds(contact_id = 0, tracking_id = 0, slot_num = 0), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=1: Contact 0 == !Down + confident; Contact 1 == Down + confident
+            # First finger looses confidence and clears only the tipswitch flag
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=2: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=3: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)]
+        ])
+
+    def test_confidence_loss_b(self):
+        """
+        Transition a confident contact to a non-confident contact by
+        cleraing both tipswitch and confidence bits simultaneously.
+
+        Ensure that the driver reports the transitioned contact as
+        being removed and that other contacts continue to report
+        normally. This mode of confidence loss is used by some
+        AES devices.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        self.confidence_change_assert_playback(uhdev, evdev, [
+            # t=0: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # Both fingers confidently in contact
+            [(self.ContactIds(contact_id = 0, tracking_id = 0, slot_num = 0), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=1: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger looses confidence and has both flags cleared simultaneously
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=2: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=3: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)]
+        ])
+
+    def test_confidence_loss_c(self):
+        """
+        Transition a confident contact to a non-confident contact by
+        clearing only the confidence bit.
+
+        Ensure that the driver reports the transitioned contact as
+        being removed and that other contacts continue to report
+        normally.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        self.confidence_change_assert_playback(uhdev, evdev, [
+            # t=0: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # Both fingers confidently in contact
+            [(self.ContactIds(contact_id = 0, tracking_id = 0, slot_num = 0), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=1: Contact 0 == Down + !confident; Contact 1 == Down + confident
+            # First finger looses confidence and clears only the confidence flag
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), True, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=2: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=3: Contact 0 == !Down + !confident; Contact 1 == Down + confident
+            # First finger has lost confidence and has both flags cleared
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)]
+        ])
+
+    def test_confidence_gain_a(self):
+        """
+        Transition a contact that was always non-confident to confident.
+
+        Ensure that the confident contact is reported normally.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        self.confidence_change_assert_playback(uhdev, evdev, [
+            # t=0: Contact 0 == Down + !confident; Contact 1 == Down + confident
+            # Only second finger is confidently in contact
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = None), True, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 0, slot_num = 0), True, True)],
+
+            # t=1: Contact 0 == Down + !confident; Contact 1 == Down + confident
+            # First finger gains confidence
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = None), True, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 0, slot_num = 0), True, True)],
+
+            # t=2: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # First finger remains confident
+            [(self.ContactIds(contact_id = 0, tracking_id = 1, slot_num = 1), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 0, slot_num = 0), True, True)],
+
+            # t=3: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # First finger remains confident
+            [(self.ContactIds(contact_id = 0, tracking_id = 1, slot_num = 1), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 0, slot_num = 0), True, True)]
+        ])
+
+    def test_confidence_gain_b(self):
+        """
+        Transition a contact from non-confident to confident.
+
+        Ensure that the confident contact is reported normally.
+        """
+        uhdev = self.uhdev
+        evdev = uhdev.get_evdev()
+
+        self.confidence_change_assert_playback(uhdev, evdev, [
+            # t=0: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # First and second finger confidently in contact
+            [(self.ContactIds(contact_id = 0, tracking_id = 0, slot_num = 0), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=1: Contact 0 == Down + !confident; Contact 1 == Down + confident
+            # Firtst finger looses confidence
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), True, False),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=2: Contact 0 == Down + confident; Contact 1 == Down + confident
+            # First finger gains confidence
+            [(self.ContactIds(contact_id = 0, tracking_id = 2, slot_num = 0), True, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)],
+
+            # t=3: Contact 0 == !Down + confident; Contact 1 == Down + confident
+            # First finger goes up
+            [(self.ContactIds(contact_id = 0, tracking_id = -1, slot_num = 0), False, True),
+             (self.ContactIds(contact_id = 1, tracking_id = 1, slot_num = 1), True, True)]
+        ])
-- 
2.43.0



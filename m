Return-Path: <linux-input+bounces-15760-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C266C116BE
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 21:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE863AFEDE
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 20:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3395F2E54AA;
	Mon, 27 Oct 2025 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKvKLvHT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA22C11EB
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597591; cv=none; b=BRm5Ijub1uqGpHqsT0RtFJ2KMCsZRtvj9i8LEgWuG+lrj9l9XR2uVgUtqI3JA8HhDhd7b5ZVf2C4BQL26fGJlbR1+dIC4NUQtDLhH55NF3BIXj/ED+sIZ2vOGQ0UP7ggpTVnAtHerHof8rg/YIj51jM0KiVsMzZq1HU4q1kwWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597591; c=relaxed/simple;
	bh=2LJVJXNkk/JZCerwaseYf29y36ZQDCAFG6+zS/Evqg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPRglG5HF/2w/zuMMK9/3yuhdfQHaoKfYzmQUT7CMk5YDsLsj0INXYbwTDRAnpugevdE/cbwU71Rs7JpOD7NCsWFhXe7yST1kuNz0z6ljQM0PdquNH31MxKPN+b2IcFLEZm7zlXsuN0KwoBpF3WxNoPhTq5wEMIkyrPQsD+/cJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKvKLvHT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so4010081a91.2
        for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761597588; x=1762202388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpCHQiwHR6wkCcUG9kfh8KOltrV4krqnTtNTpw9SSQk=;
        b=bKvKLvHTWkcLqZq/R+mECYmdlE451MILc663zSlUsjDA7yBOByPB2sHD6zV9XN0D+h
         Bg+APQweohR2+ohyf2aCdzbGCaqn9o8bsXTPxebqOZ2L2w98YPLGk7yvKNzU3NajHnY3
         JIVAzncwkCcmJ5oPjiqPlLnH4jSTgJcgDMZuk90GhoKT69GGnsEYvfh7yX+dRCKCs81y
         VmKKumdU7bPbqAqGqXq9Qg2LU8xhcHP35oKHVU6oukCVsIDujEJzvLNBSAI2ar887dxF
         nx5ZCZFuPvv1bBkom1sEx+q+18/WCXzmfNRNVBlwYKDZNpgXDZfYdSOOulnZenSFktTE
         mN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597588; x=1762202388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpCHQiwHR6wkCcUG9kfh8KOltrV4krqnTtNTpw9SSQk=;
        b=jqP3hDNQyLI3C9Led0q8f53EMchdyntM8w1VAAxM4MjKpbVcLDz8OdGSV6bPwVfuDM
         8vb+GNbHf82ATd/nBFJX6ruw8cK/SIL3b268sOFz3B6LbUP0jsVNW4RnzIJwpv0bFqAq
         77OnSvabbBVhfyG2QUflx3MDvyAIJda22EbZt/Rhj0UeXbkhE5aZUerffXVkX2oBqRmD
         D4faMUg7g8tXK8AkxMcq1IX6eq89csmDMr9BPnYjBAEAqGF2HqghtyUCN4/Thhv15Ybn
         N3uUymQHA7bz9Osc+gV+atdZHYknbuaURvxIrTB6wX7wP7MASi+upx97eJQniydITdzr
         zVRw==
X-Gm-Message-State: AOJu0Yx5aBzq96kMR1wTFSbnVik4e/+7cGPIye0nXgvGKWrC0deJ372d
	7B0JlgXG4XA7GrCsqU13835ZYU2YkM8finmqp5f3ohtbsLXyd9ACPinDcBXY6Q==
X-Gm-Gg: ASbGncvzwjWSij1YNF3D+gEGNDD43E2sl4yA3ttr/X04xb3l1iuog8jziIGlcwdcJR3
	GHn/wdoWVhYxYzmzrJr7RXAQ3moqA3jxcb97QYNTy11LXwxblhpsU+NNuXn9eIG9FS09y/UtK6k
	NbQa2XFGEAOGuV8vKY4bN0dZdzL+HYO1yE0SUayiRZWRRVaHNYjPQmgJY1L+GirNnR6wnDXHMmr
	XY1WioD4l3YVEV7f3hkDvdgKKdgIIC3q7qswB2fW2H6uDI3VHUFTasG/GjNKlktXIZpThE0HnL5
	ze1D0L1kXUHXAlhSBAF4sZXhRK/pfuyf0AXGPi0tEPS0DhXupVmq4dSjt8bsfUhQZ+1U11ycrVG
	u2hkvc8nDo+X1iFq3kREOkZfoYLkqZ9aEUp5NeBfZpZhvA8UH5aE+haYVg96IQyyHkDs=
X-Google-Smtp-Source: AGHT+IESum6eI7k3T+wP64K2kP3lnybEwK3NzDizDYdjfRAgezh4/+o0WpmfxRlp1oKT0USnACaA3g==
X-Received: by 2002:a17:90b:3806:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-34027a0741emr1216505a91.9.1761597588280;
        Mon, 27 Oct 2025 13:39:48 -0700 (PDT)
Received: from fedora ([2607:fb90:33aa:e805::ff98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm9601332a91.17.2025.10.27.13.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:39:47 -0700 (PDT)
From: Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To: linux-input@vger.kernel.org
Cc: benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Dmitry.Torokhov@gmail.com,
	Ping Cheng <ping.cheng@wacom.com>,
	Tatsunosuke Tobit <tatsunosuke.tobita@wacom.com>
Subject: [PATCH 2/2 v2] selftests/hid-tablet: add ABS_DISTANCE test for stylus/pen
Date: Mon, 27 Oct 2025 13:39:25 -0700
Message-ID: <20251027203925.23968-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For pen and stylus, the ABS_Z event reports ABS_DISTANCE values
in the hid generic kernel driver. This test is to make sure that
the assignment is properly done for all pen and stylus tools.
Same as tilt, distance is an optional event.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Tatsunosuke Tobit <tatsunosuke.tobita@wacom.com>
---
v2: updated hid descriptor for the device and the test logic
---
 .../selftests/hid/tests/test_tablet.py        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/testing/selftests/hid/tests/test_tablet.py b/tools/testi=
ng/selftests/hid/tests/test_tablet.py
index 50d5699812bb..5b9abb616db4 100644
--- a/tools/testing/selftests/hid/tests/test_tablet.py
+++ b/tools/testing/selftests/hid/tests/test_tablet.py
@@ -452,6 +452,7 @@ class Pen(object):
     def __init__(self, x, y):
         self.x =3D x
         self.y =3D y
+        self.distance =3D -10
         self.tipswitch =3D False
         self.tippressure =3D 15
         self.azimuth =3D 0
@@ -473,6 +474,7 @@ class Pen(object):
             for i in [
                 "x",
                 "y",
+                "distance",
                 "tippressure",
                 "azimuth",
                 "width",
@@ -554,6 +556,7 @@ class PenDigitizer(base.UHIDTestDevice):
             pen.tipswitch =3D False
             pen.tippressure =3D 0
             pen.azimuth =3D 0
+            pen.distance =3D 0
             pen.inrange =3D False
             pen.width =3D 0
             pen.height =3D 0
@@ -868,6 +871,29 @@ class BaseTest:
             state machine."""
             self._test_states(state_list, scribble, allow_intermediate_sta=
tes=3DTrue)
=20
+        @pytest.mark.skip_if_uhdev(
+            lambda uhdev: "Z" not in uhdev.fields,
+            "Device not compatible, missing Z usage",
+        )
+        @pytest.mark.parametrize("scribble", [True, False], ids=3D["scribb=
le", "static"])
+        @pytest.mark.parametrize(
+            "state_list",
+            [pytest.param(v, id=3Dk) for k, v in PenState.legal_transition=
s().items()],
+        )
+        def test_z_reported_as_distance(self, state_list, scribble):
+            """Verify stylus Z values are reported as ABS_DISTANCE."""
+            self._test_states(state_list, scribble, allow_intermediate_sta=
tes=3DFalse)
+
+            uhdev =3D self.uhdev
+            evdev =3D uhdev.get_evdev()
+            p =3D Pen(0, 0)
+            uhdev.move_to(p, PenState.PEN_IS_OUT_OF_RANGE, None)
+            p =3D Pen(100, 200)
+            uhdev.move_to(p, PenState.PEN_IS_IN_RANGE, None)
+            p.distance =3D -1
+            events =3D self.post(uhdev, p, None)
+            assert evdev.value[libevdev.EV_ABS.ABS_DISTANCE] =3D=3D -1
+
=20
 class GXTP_pen(PenDigitizer):
     def event(self, pen, test_button):
@@ -1292,6 +1318,35 @@ class Huion_Kamvas_Pro_19_256c_006b(PenDigitizer):
         return rs
=20
=20
+class Wacom_2d1f_014b(PenDigitizer):
+    """
+    Pen that reports distance values with HID_GD_Z usage.
+    """
+    def __init__(
+        self,
+        name,
+        rdesc_str=3DNone,
+        rdesc=3DNone,
+        application=3D"Pen",
+        physical=3D"Stylus",
+        input_info=3D(BusType.USB, 0x2D1F, 0x014B),
+        evdev_name_suffix=3DNone,
+    ):
+        super().__init__(
+            name, rdesc_str, rdesc, application, physical, input_info, evd=
ev_name_suffix
+        )
+
+    def match_evdev_rule(self, application, evdev):
+        # there are 2 nodes created by the device, only one matters
+        return evdev.name.endswith("Stylus")
+
+    def event(self, pen, test_button):
+        # this device reports the distance through Z
+        pen.z =3D pen.distance
+
+        return super().event(pen, test_button)
+
+
 ##########################################################################=
######
 #
 # Windows 7 compatible devices
@@ -1504,3 +1559,19 @@ class TestHuion_Kamvas_Pro_19_256c_006b(BaseTest.Tes=
tTablet):
             rdesc=3D"05 0d 09 02 a1 01 85 0a 09 20 a1 01 09 42 09 44 09 43=
 09 3c 09 45 15 00 25 01 75 01 95 06 81 02 09 32 75 01 95 01 81 02 81 03 05=
 01 09 30 09 31 55 0d 65 33 26 ff 7f 35 00 46 00 08 75 10 95 02 81 02 05 0d=
 09 30 26 ff 3f 75 10 95 01 81 02 09 3d 09 3e 15 a6 25 5a 75 08 95 02 81 02=
 c0 c0 05 0d 09 04 a1 01 85 04 09 22 a1 02 05 0d 95 01 75 06 09 51 15 00 25=
 3f 81 02 09 42 25 01 75 01 95 01 81 02 75 01 95 01 81 03 05 01 75 10 55 0e=
 65 11 09 30 26 ff 7f 35 00 46 15 0c 81 42 09 31 26 ff 7f 46 cb 06 81 42 05=
 0d 09 30 26 ff 1f 75 10 95 01 81 02 c0 05 0d 09 22 a1 02 05 0d 95 01 75 06=
 09 51 15 00 25 3f 81 02 09 42 25 01 75 01 95 01 81 02 75 01 95 01 81 03 05=
 01 75 10 55 0e 65 11 09 30 26 ff 7f 35 00 46 15 0c 81 42 09 31 26 ff 7f 46=
 cb 06 81 42 05 0d 09 30 26 ff 1f 75 10 95 01 81 02 c0 05 0d 09 56 55 00 65=
 00 27 ff ff ff 7f 95 01 75 20 81 02 09 54 25 7f 95 01 75 08 81 02 75 08 95=
 08 81 03 85 05 09 55 25 0a 75 08 95 01 b1 02 06 00 ff 09 c5 85 06 15 00 26=
 ff 00 75 08 96 00 01 b1 02 c0",
             input_info=3D(BusType.USB, 0x256C, 0x006B),
         )
+
+
+##########################################################################=
######
+#
+# Devices Reporting Distance
+#
+##########################################################################=
######
+
+
+class TestWacom_2d1f_014b(BaseTest.TestTablet):
+    def create_device(self):
+        return Wacom_2d1f_014b(
+            "uhid test Wacom 2d1f_014b",
+            rdesc=3D"05 0d 09 02 a1 01 85 02 09 20 a1 00 09 42 09 44 09 45=
 09 3c 09 5a 09 32 15 00 25 01 75 01 95 06 81 02 95 02 81 03 05 01 09 30 26=
 88 3e 46 88 3e 65 11 55 0d 75 10 95 01 81 02 09 31 26 60 53 46 60 53 81 02=
 05 0d 09 30 26 ff 0f 45 00 65 00 55 00 81 02 06 00 ff 09 04 75 08 26 ff 00=
 46 ff 00 65 11 55 0e 81 02 05 0d 09 3d 75 10 16 d8 dc 26 28 23 36 d8 dc 46=
 28 23 65 14 81 02 09 3e 81 02 05 01 09 32 16 01 ff 25 00 36 01 ff 45 00 65=
 11 81 02 05 0d 09 56 15 00 27 ff ff 00 00 35 00 47 ff ff 00 00 66 01 10 55=
 0c 81 02 45 00 65 00 55 00 c0 09 00 75 08 26 ff 00 b1 12 85 03 09 00 95 12=
 b1 12 85 05 09 00 95 04 b1 02 85 06 09 00 95 24 b1 02 85 16 09 00 15 00 26=
 ff 00 95 06 b1 02 85 17 09 00 95 0c b1 02 85 19 09 00 95 01 b1 02 85 0a 09=
 00 75 08 95 01 15 10 26 ff 00 b1 02 85 1e 09 00 95 10 b1 02 c0 06 00 ff 09=
 00 a1 01 85 09 05 0d 09 20 a1 00 09 00 15 00 26 ff 00 75 08 95 10 81 02 c0=
 09 00 95 03 b1 12 c0 06 00 ff 09 02 a1 01 85 07 09 00 96 09 01 b1 02 85 08=
 09 00 95 03 81 02 09 00 b1 02 85 0e 09 00 96 0a 01 b1 02 c0 05 0d 09 02 a1=
 01 85 1a 09 20 a1 00 09 42 09 44 09 45 09 3c 09 5a 09 32 15 00 25 01 75 01=
 95 06 81 02 09 38 25 03 75 02 95 01 81 02 05 01 09 30 26 88 3e 46 88 3e 65=
 11 55 0d 75 10 95 01 81 02 09 31 26 60 53 46 60 53 81 02 05 0d 09 30 26 ff=
 0f 46 b0 0f 66 11 e1 55 02 81 02 06 00 ff 09 04 75 08 26 ff 00 46 ff 00 65=
 11 55 0e 81 02 05 0d 09 3d 75 10 16 d8 dc 26 28 23 36 d8 dc 46 28 23 65 14=
 81 02 09 3e 81 02 05 01 09 32 16 01 ff 25 00 36 01 ff 45 00 65 11 81 02 05=
 0d 09 56 15 00 27 ff ff 00 00 35 00 47 ff ff 00 00 66 01 10 55 0c 81 02 45=
 00 65 00 55 00 c0 c0 06 00 ff 09 00 a1 01 85 1b 05 0d 09 20 a1 00 09 00 26=
 ff 00 75 08 95 10 81 02 c0 c0",
+            input_info=3D(BusType.USB, 0x2D1F, 0x014B),
+        )
--=20
2.51.0



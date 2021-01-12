Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD1F2F3FD6
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 01:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395258AbhALXEG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 18:04:06 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58391 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728490AbhALXEG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 18:04:06 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 9A7ED1898;
        Tue, 12 Jan 2021 18:03:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 12 Jan 2021 18:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        fm2; bh=mYWmDzHWBoB1V4UN4/tY87hDOtYWQ4SrN8ymzI8LjVg=; b=cYWjSMx6
        GAtvbf/Pvkwv1zD88BKxRLUCnmLI/Kmo0xkEnHxBrC+DuJH/voVR/QfoghNthus4
        K9PGF2BcynfG3FJO+CGyVxp5zBfDDVbeoEdiWCanvnolfsBR9JVDC4KHNuTUqpH3
        tMJvNmbMmD1MheJByOBGK1IgWMO3b4lrD4XUsk8SC84I8LmVH8Jt7l3pXzUmFSyg
        A0PnA24q0uTf2GKJgpuRRGECsh47gUW1AKXBgYXf5oATHMHrhuV3837M9CfUIrIC
        YXyqGmKq8fGRIm18fIkjCq3DJdOszPFRW2vcMEFDSoF4yYoBZs5QAsxUHuZq6FP8
        CfJ98S8yKAWBKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=mYWmDzHWBoB1V4UN4/tY87hDOtYWQ
        4SrN8ymzI8LjVg=; b=liAkEDZ8CQv8s675+zTXSD3RRVVuE7mRo9WT4sk6/Hvx9
        P1ATml5gCjVTdzxwEU4OWj+tvn4JHJ8i9gjIC/pHeZixQziqXhEO3UZQQq/Snlzx
        9JfZoJlV/BNldf9RL3UfMrviyUXMnMUt2kEcuQD5seWZlPNyU2MN/CMbXkUH6FhN
        1lcdLNuirPVxc63/tu6Ym+YAq270x0o8O6EqWqpEt9Gqsl30rmlPyrBTc6b+HCiO
        8nsEYPP1qtQIwvWKsdAUMpQ7wLuISRUHg1vqFJcb0Gc8KadCAObB+GWP70Cb6kor
        sdnUn5uJ6OWO34np4XguqtphUVW9CRNt7NKl79uyQ==
X-ME-Sender: <xms:tir-X6TCVlz-Hw_Hc0tVxND0Mt3wSrPjTn80d8pMw_Wt75egERCl0g>
    <xme:tir-X3i7ytNCtvZ8xCRJcmEgsA0m9NfXAu8mTTsQmYWcacztrnIDy4mO8c-rl6yRD
    _EQo8PTQ5mj4BJcfps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomheprfgvthgvrhcujfhu
    thhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqeenuc
    ggtffrrghtthgvrhhnpeekffekgeegjeelieefueejveehjefgvdehleefveevfeelffei
    teehkeegteeuueenucffohhmrghinhepmhhitghrohhsohhfthdrtghomhdpfhhrvggvug
    gvshhkthhophdrohhrghenucfkphepuddujedrvddtrdejuddrjeefnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvg
    hrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:tir-X64dwZ5uYKkuecCsXFRFlit84yS_-lCHJoyym8xNcXuJgjinLw>
    <xmx:tir-X0B43WPNZ4DEtR1JBE8fAz5729o3ia2SJLL0sjCxLQPM3QuwNQ>
    <xmx:tir-Xxa9KEgr_rfjf5etkXIm2z36weOSmcozt9MstBpPzIenSyTrQQ>
    <xmx:tyr-X8UeGdcTQjEuUG0-GcukTUpC_Hodnoo77lny_3oJas8F-aqfgQ>
Received: from jelly (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 58D8B1080068;
        Tue, 12 Jan 2021 18:03:15 -0500 (EST)
Date:   Wed, 13 Jan 2021 09:03:10 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: input: define ABS_PRESSURE/ABS_MT_PRESSURE
 resolution as grams
Message-ID: <20210112230310.GA149342@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

ABS_PRESSURE and ABS_MT_PRESSURE on touch devices usually represent
contact size (as a finger flattens with higher pressure the contact size
increases) and userspace translates the kernel pressure value back into
contact size. For example, libinput has pressure thresholds when a touch is
considered a palm (palm == large contact area -> high pressure). The values
themselves are on an arbitrary scale and device-specific.

On pressurepads however, the pressure axis may represent the real physical
pressure. Pressurepads are touchpads without a hinge but an actual pressure
sensor underneath the device instead, for example the Lenovo Yoga 9i.

A high-enough pressure is converted to a button click by the firmware.
Microsoft does not require a pressure axis to be present, see [1], so as seen
from userspace most pressurepads are identical to clickpads - one button and
INPUT_PROP_BUTTONPAD set.

However, pressurepads that export the pressure axis break userspace because
that axis no longer represents contact size, resulting in inconsistent touch
tracking, e.g. [2]. Userspace needs to know when a pressure axis represents
real pressure and the best way to do so is to define what the resolution
field means. Userspace can then treat data with a pressure resolution as
true pressure.

This patch documents that the pressure resolution is in units/gram. This
allows for fine-grained detail and tops out at roughly ~2000t, enough for the
devices we're dealing with. Grams is not a scientific pressure unit but the
alternative is:
- Pascal: defined as force per area and area is unreliable on many devices and
  seems like the wrong option here anyway, especially for devices with a
  single pressure sensor only.
- Newton: defined as mass * distance/acceleration and for the purposes of a
  pressure axis, the distance is tricky to interpret and we get the data to
  calculate acceleration from event timestamps anyway.

For the purposes of touch devices and digitizers, grams seems the best choice
and the easiest to interpret.

Bonus side effect: we can use the existing hwdb infrastructure in userspace to
fix devices that advertise false pressure.

[1] https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#windows-precision-touchpad-input-reports
[2] https://gitlab.freedesktop.org/libinput/libinput/-/issues/562

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
 Documentation/input/event-codes.rst          | 15 +++++++++++++++
 Documentation/input/multi-touch-protocol.rst |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b24b5343f5eb..3118fc1c1e26 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -236,6 +236,21 @@ A few EV_ABS codes have special meanings:
   - Used to describe multitouch input events. Please see
     multi-touch-protocol.txt for details.
 
+* ABS_PRESSURE/ABS_MT_PRESSURE:
+
+   - For touch devices, many devices converted contact size into pressure.
+     A finger flattens with pressure, causing a larger contact area and thus
+     pressure and contact size are directly related. This is not the case
+     for other devices, for example digitizers and touchpads with a true
+     pressure sensor ("pressure pads").
+
+     A device should set the resolution of the axis to indicate whether the
+     pressure is in measurable units. If the resolution is zero, the
+     pressure data is in arbitrary units. If the resolution is nonzero, the
+     pressure data is in units/gram. For example, a value of 10 with a
+     resolution of 1 represents 10 gram, a value of 10 with a resolution on
+     1000 represents 10 microgram.
+
 EV_SW
 -----
 
diff --git a/Documentation/input/multi-touch-protocol.rst b/Documentation/input/multi-touch-protocol.rst
index 307fe22d9668..21c1e6a22888 100644
--- a/Documentation/input/multi-touch-protocol.rst
+++ b/Documentation/input/multi-touch-protocol.rst
@@ -260,6 +260,10 @@ ABS_MT_PRESSURE
     of TOUCH and WIDTH for pressure-based devices or any device with a spatial
     signal intensity distribution.
 
+    If the resolution is zero, the pressure data is in arbitrary units.
+    If the resolution is nonzero, the pressure data is in units/gram. See
+    :ref:`input-event-codes` for details.
+
 ABS_MT_DISTANCE
     The distance, in surface units, between the contact and the surface. Zero
     distance means the contact is touching the surface. A positive number means
-- 
2.29.2


Return-Path: <linux-input+bounces-15825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F8C233D7
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 05:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D25188BA73
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 04:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51C119C540;
	Fri, 31 Oct 2025 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="EVafAw/l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1+LvbS7H"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709EC8E6;
	Fri, 31 Oct 2025 04:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761884151; cv=none; b=HzahZ33b+L6sctoK+poOCv47KCHJTCAxUdxgiaCnlsdIA3TgApCoG0u5RE07KhCS2Cx29uiZBUn+IrcFYYp5o8Owx9Tq6nZit2wtp85LZgUELGMRdvxPE/ag2C/qwACWDE1eQSPDGHpRkbO8cuzSt7IvdpFT1nAbrYMv3yeKXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761884151; c=relaxed/simple;
	bh=+SAQiwlYEmc63A4MpSPlTTZLNg/J4xixV8dIc7Ysmas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Y0K33y2PTG2K3MA2gr4MjVdJx6SpTViCEfgQ041Ow2H3TWfHHutNacqGXYiTUni0COTN8Ki3tf0wrH9oK4HDFko6U+eTOPpkdhxrN/tinWwwjU4ZmCwqzxyryievV0Ryew4DJ1XhRzh/KUQ19YI02gtGE5jbX/yPYxqX4HZA1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=EVafAw/l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1+LvbS7H; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 270031D0017A;
	Fri, 31 Oct 2025 00:15:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 31 Oct 2025 00:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1761884148; x=1761970548; bh=Rnm5WS4en/lneEU0tC8nr
	OxYAJZj6pQiDuSR3Rc/UX4=; b=EVafAw/lUo9v+5zxpLKhRaV5ZBspgvtMAymVR
	4Zj+NxMzxUO5f0UKoHerhmUOTU4fxtmhbKvfDPpsKLN5GWmepLqL7NCuOhkIHCnl
	1e7v12CDWlljFmUYsp/iDWvMo7C+/HDzpt4LlPy97/VR4LPQawojga4PY/ewBUiL
	oxquOjgPiXN7vuxy75FpYehzW4dozQr8UIWtRvWtr+eLnRZTnjqm3+mOZEd41js7
	I1k23QUkOYAqROTCUsORkH7umC3sYRqL88nppikiDRFlpcKGp1+IKsklnCNQlUTz
	xzZtXL7tT6IpKibmvvT9hP23c/cA7du8mYog940s1ZQLbkJ6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761884148; x=1761970548; bh=Rnm5WS4en/lneEU0tC8nrOxYAJZj6pQiDuS
	R3Rc/UX4=; b=1+LvbS7HD26toOhx/TgP3FPmGJBL8+kxLAPiuH63SkBFEUlWFw0
	BLmbw1YxQWjwaOfs8C1863o6ieYX2N/gnNNIIQy1i48CT2S2/PYVoEMH6p8kWpP+
	ug0I+GPkyiYueqLFzFHogbNU4EPPimdLCHbNrulNzZD3bMQgC56nnJENCVGWypor
	mfw+WkPW8CQlo3TgekfYjgEPk8i7+2IfHEJDOuDJS7spvBaWCse4AGeIuK404UJJ
	Ll3B+dcG9jZhSshRpWaxMcoRBvlemGkNzjaBZTGW89RjMOCeYOuDilxhf/l+btAH
	mJC7EBhVQd2SMp1h86e4MvVw2tPhjUpUDcQ==
X-ME-Sender: <xms:8jcEaSnlhvf4eiFShgdDEAP6uLG6_b_v_XrZ1O8_BWxUmiVGhdFpdA>
    <xme:8jcEaR86HZFBfdSxMEKRs-D3SntsgZ7gxAgu41GyKZkke6kei3-9hUpbCMy24NzUc
    BKf_oPKsLM74FKrsvbih_SpBM-MUXINQfH2RRKc7oBSDIZhfuQmIWI>
X-ME-Received: <xmr:8jcEaQKn1kuTEK9OwAoTSr6Dre7FdGBQY8H_vZO5sfGJE3zpP3AI4dNf9_U_HRPs1SggYoKQF34SQaFUbGGiRn4x-FZi4UjkWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieekhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucfj
    uhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfelteeufedtleevjeetvdejvdffleduveevtedugfefveev
    tddtudevgfejveegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgv
    rhgvrhesfihhohdqthdrnhgvthdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehjuggvnhhoshgvsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpth
    htoheprhihuggsvghrghessghithhmrghthhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8jcEaWhmsyi7NF7tFFdttM2edfl0_IYeYWZe13TMdA1lR1JB4gYOmw>
    <xmx:8jcEac8rNJcyAJoYSQUX3-a1AeWfJxr5YmhqkDAWDy2PTvyqtjNjbQ>
    <xmx:8jcEabNA1IpHRCyhtJ2_EgMNldCo1VOC4tN3c9NUON54lXNDf1u3IQ>
    <xmx:8jcEaQBpbkakFeTn-Cz6nd5Ye-kYvtWEvczqnCQUij1_qCa-mw_eyQ>
    <xmx:8zcEaR5EAjxomy7uLPVCV4PnV4TTi5WbtFQHXF1lxvc2klioVWo_N5W9>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Oct 2025 00:15:43 -0400 (EDT)
Date: Fri, 31 Oct 2025 14:12:45 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] Documentation: input: expand INPUT_PROP_HAPTIC_TOUCHPAD
 to all pressure pads
Message-ID: <20251031041245.GA1316325@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030011735.GA969565@quokka>

Definition: "pressure pad" used here as all touchpads that use physical
pressure to convert to click without physical hinges. Also called haptic
touchpads in general parlance, Synaptics calls them ForcePads.

Most (all?) pressure pads are currently advertised as
INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
by defining the resolution on ABS_MT_PRESSURE has been in the docs since
commit 20ccc8dd38a3 ("Documentation: input: define
ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
provide this information.

In userspace it's thus impossible to determine whether a device is a
true pressure pad (pressure equals pressure) or a normal clickpad with
(pressure equals finger size).

Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
have support for userspace-controlled effects. Let's expand that
definition to include all haptic touchpads (pressure pads) since those
that do support FF effects can be identified by the presence of the
FF_HAPTIC bit.

This means:
- clickpad: INPUT_PROP_BUTTONPAD
- pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
- pressurepad with haptics:
  INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
Changes to v1: extra empty lines to render the lists as lists
Link to v1: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#u

Side-note: typo in my v1 comment, the HID usage ID that tells us whether
it's a clickpad or pressurepad is 0x59, not 0x55.

 Documentation/input/event-codes.rst | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git ./Documentation/input/event-codes.rst ../Documentation/input/event-codes.rst
index 1ead9bb8d9c6..bb4c68871e94 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -403,16 +403,27 @@ regular directional axes and accelerometer axes on the same event node.
 INPUT_PROP_HAPTIC_TOUCHPAD
 --------------------------
 
-The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
-- supports simple haptic auto and manual triggering
+The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that the device provides
+simulated haptic feedback (e.g. a vibrator motor situated below the surface)
+instead of physical haptic feedback (e.g. a hinge). This property is only set
+if the device:
+
 - can differentiate between at least 5 fingers
 - uses correct resolution for the X/Y (units and value)
-- reports correct force per touch, and correct units for them (newtons or grams)
 - follows the MT protocol type B
 
+If the simulated haptic feedback is controllable by userspace the device must:
+
+- support simple haptic auto and manual triggering, and
+- report correct force per touch, and correct units for them (newtons or grams), and
+- provide the EV_FF FF_HAPTIC force feedback effect.
+
 Summing up, such devices follow the MS spec for input devices in
-Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
-and report correct units for the pressure.
+Win8 and Win8.1, and in addition may support the Simple haptic controller HID
+table, and report correct units for the pressure.
+
+Where applicable, this property is set in addition to INPUT_PROP_BUTTONPAD, it
+does not replace that property.
 
 Guidelines
 ==========
-- 
2.51.0



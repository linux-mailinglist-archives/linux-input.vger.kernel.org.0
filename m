Return-Path: <linux-input+bounces-15902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57BC3AB53
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 12:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32171466D00
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 11:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889A231327E;
	Thu,  6 Nov 2025 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="FYEV5g/m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AHw05ijj"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D497D30CDBD;
	Thu,  6 Nov 2025 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429547; cv=none; b=XGKfqQWSd3uDteNjVmQZbeV2crf5J2OkzzNGMdabA4WJ6+HO6N6MrPFKpeBof3xnloRTVCK/q+yxPA/wJfEbGUMlA3DUgcXYr7f/r/EdKYp2LkBVIh+pSerNJ0aM1ncgVzWMAMnBtz45r3gW7Ns7uC2TJBM/xxEVahNS9IqR2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429547; c=relaxed/simple;
	bh=lRYu+qLZL4qifVykWfCOuRwuIpfbS/rl12XbWnvSfcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MRd5HK/gZxkSJ+Ko0sfzxUfElyX1yzN5udJF5GK4v8zwdu9uR+8HWbCnJCbeN69jJrYk4B81popixCfDK9ZxlkBuCraWKzB52BuIDzoNoiBN/xCcNVvM/AZIVzLvOOGOeXswow8wfBqxO+z5198Wx6mGscZh7mXsqutXQQbg2jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=FYEV5g/m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AHw05ijj; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C52FD14001EE;
	Thu,  6 Nov 2025 06:45:43 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 06 Nov 2025 06:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1762429543; x=1762515943; bh=5k3gaOYj30dDfSaXFYGpf
	fTJp8o5nXzOORcxkgidDlY=; b=FYEV5g/mCBf34duDLFuxYo/NshXE3UGd+cPhD
	SmZPp+opVG7AdZFSuRopcOKyUv+Jr8vJ6hJX5El2MWWchqsCBQ30bPlyFgZ+evOo
	GIFZ23+onrnQiiAK07vHOdoRf9Mufmw8E4sYgNWbOHiwMmLgZkQYQj19ChXkSoRA
	FoHSpprkId53nO1ASVaUnpMPmDV7NxdaLF4RzWqY36Z94DqRXFh+nMYknTVMJXTL
	NPhm0UzcGZ3w5K65agrQDmvN3kH6DeZ7d4c5edct6ddWlvRnY4aNdM8BIiCAFT/T
	tH3L1X8sIcC/+oNBIhTmUDu8ntD5H6HZt22heXaVxMR9OCJaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762429543; x=1762515943; bh=5k3gaOYj30dDfSaXFYGpffTJp8o5nXzOORc
	xkgidDlY=; b=AHw05ijjthcuUW/Y4mRXDtouinbqbTItCo49SlVfohlLZyiUJjY
	y6v+3d49rOfjqNZOCzvghhwx1kKkVC8MMD6J0ZWrSOrmz80sOwlOfV0dbcVRZ4Xd
	Jx3iYLnAHyMLU4jemlpehwU6KYB5/nyFXpezOhwg/Dbz9D6UJb3+la/HuG3opjOE
	tBhS+UDO0c9S0UqU/MT06jRglsHehn6TtmoSgPwkUQ6U/ykkUND3STpp1MGMezzj
	SWSHZTnRMY+uIdd9qgqTn2auBA+4iukxNYTGlgeLv3nAtg4IR4s1TsREOVAmC0Yp
	KZJ5Z8hwD8H7fY4+/zbxn3xn9BDbIU+xkXg==
X-ME-Sender: <xms:Z4oMaVWa0xMAqjcsih5lcDOdf2-FIInIc-YWZKnoXgbE_hhLCqqBSg>
    <xme:Z4oMadvlG7W19GzjpsSHdWLVFzNEg9kWNWPhEdx9vnbhX4AUqTtnlNz5HPtR5cs_9
    -nOFBZhRsUxait2dJaTTqxeWv-xK3c5fazyiQYCyiFQNE_3o7-7Vf0>
X-ME-Received: <xmr:Z4oMaQ6u4Ma1LlAcFCQWG_5yXMxoP88DIesLd6M6559-BLrSliaUWDF79AylIDuyxTdC_qx7pumk5fdvebleQuw7n_zKeGMvxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeiieelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Z4oMaYQuXXWMyE3RR1HRmjxZcuEw_9hrWPKjWnbbpCtbvdWwHX2Axg>
    <xmx:Z4oMabuHF4d0fJEPCPhYUt5yLllHH_S6Rgz7DWVC8NxG4w1tZFWJKg>
    <xmx:Z4oMaS9syFgBGPQLwhoachseBbNQnOgq0-Jqni4xqgON_F9M_4vM1Q>
    <xmx:Z4oMacxUxvQddZMNnLWqOQkRzZRBsHPGqmqQXsA33ez5qORd0ILNEw>
    <xmx:Z4oMaYp8_67n-CnA0Lou_ydctdKVaRzhXQJqorE7mQCEtaYnOjwgEfvs>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 06:45:39 -0500 (EST)
Date: Thu, 6 Nov 2025 21:45:34 +1000
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
Subject: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <20251106114534.GA405512@tassie>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030011735.GA969565@quokka>

And expand it to encompass all pressure pads.

Definition: "pressure pad" as used here as includes all touchpads that
use physical pressure to convert to click, without physical hinges. Also
called haptic touchpads in general parlance, Synaptics calls them
ForcePads.

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
have support for userspace-controlled effects. Let's expand and rename
that definition to include all pressure pad touchpads since those that
do support FF effects can be identified by the presence of the
FF_HAPTIC bit.

This means:
- clickpad: INPUT_PROP_BUTTONPAD
- pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD
- pressurepad with configurable haptics:
  INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD + FF_HAPTIC

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
ftr, I picked PRESSUREPAD over Dmitry's PRESSURE_TOUCHPAD suggestion
because it matches better with the existing BUTTONPAD.

Changes to v1: extra empty lines to render the lists as lists
Changes to v2: rename to PRESSUREPAD and rename it in the instances
  where it's used in the code

v1: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#u
v2: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#m9504de27b02d00a55d540fd9fec9aed3edd0133c

 Documentation/input/event-codes.rst    | 25 ++++++++++++++++++-------
 drivers/hid/hid-haptic.c               |  2 +-
 include/uapi/linux/input-event-codes.h |  2 +-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 1ead9bb8d9c6..4424cbff251f 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -400,19 +400,30 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
 All other axes retain their meaning. A device must not mix
 regular directional axes and accelerometer axes on the same event node.
 
-INPUT_PROP_HAPTIC_TOUCHPAD
---------------------------
+INPUT_PROP_PRESSUREPAD
+----------------------
+
+The INPUT_PROP_PRESSUREPAD property indicates that the device provides
+simulated haptic feedback (e.g. a vibrator motor situated below the surface)
+instead of physical haptic feedback (e.g. a hinge). This property is only set
+if the device:
 
-The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
-- supports simple haptic auto and manual triggering
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
diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index aa090684c1f2..fc8a9997f815 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -86,7 +86,7 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 	if (hi->application == HID_DG_TOUCHPAD) {
 		if (haptic->auto_trigger_report &&
 		    haptic->manual_trigger_report) {
-			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
+			__set_bit(INPUT_PROP_PRESSUREPAD, hi->input->propbit);
 			return 1;
 		}
 		return 0;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 8ba48590bd2c..d21172c6a266 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -27,7 +27,7 @@
 #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
 #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
 #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
-#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
+#define INPUT_PROP_PRESSUREPAD		0x07	/* pressure triggers clicks */
 
 #define INPUT_PROP_MAX			0x1f
 #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
-- 
2.51.1



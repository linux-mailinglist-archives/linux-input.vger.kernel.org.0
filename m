Return-Path: <linux-input+bounces-15794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A0C1E02C
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 02:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BA4D4E4D50
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 01:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC698262FF3;
	Thu, 30 Oct 2025 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="xG6fjdS2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2W30+3ay"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CE21ABA2;
	Thu, 30 Oct 2025 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761787240; cv=none; b=CjoApXcwePPYvnvPNcl9ZRi+bOF5aw0Q6df5afbKkXemiAZfyyBXFMJJCpWcWEok1BpKVtlPRblprGDuqLjRpuuFZS9mRVAjsqcSBJ9PxOPaqw8Kjk6bFh7mK19bIKjLgvzywfTRDsbi1vscyq3ZGdxQ4S/EYfHjJDtl3uTQeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761787240; c=relaxed/simple;
	bh=IZUvQItIFw+7ojqUZAKHyv65awA2j67TuA4ZUaLm7Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7DJdJ4RrTUBKQaweDULI/8v/OT/d3c/T4xYSPBwRdYMZs9ev/q1IZE1XAIAEzXR9afW4DKMESY90RqRE1be0ZHUQRs849aASyZlOCeXKKsncZjb4wavvKmcayuclZqcusoLnZxo53bGzapOihsdsertl2xsjxjAQj1pH1JMaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=xG6fjdS2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2W30+3ay; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E4759EC01B0;
	Wed, 29 Oct 2025 21:20:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 29 Oct 2025 21:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1761787236; x=1761873636; bh=H2NfKSrzMl9NPa0+a01rCs5uACkZAu6u
	1iWF0I2FcTk=; b=xG6fjdS2wAIPqwH4mKGMwFJLMPYUnp9Gme42H2j3CTI/K6bO
	pKyISly8ssZzNqFqdrXwDRSDnDRMxvHBHNiw7ndY5cNJ9+txPJ8yOv+UKu2WPhx5
	ODjnG70Poi+U1jPI22cOxT8DSWCfvP6zJM7KIXqMRaVAeeV+s+lOLI28+YNNOFq6
	g7Q2xes0xrpTbGUf5rfXDNp2cd5rk+mPzrPELlKYBoj8JKxX+uJ22+l2QH7Vknbt
	TXYbCJvT1zxMBHn6ntSOJRfXCDG2EuHphIvVeDngWfJYMwrustVMfnBJRtj2ZSKr
	bSJ0kKGH2ivd0Ldo8R83kAGQawms3SXiGwTjng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761787236; x=
	1761873636; bh=H2NfKSrzMl9NPa0+a01rCs5uACkZAu6u1iWF0I2FcTk=; b=2
	W30+3ayxTZN7BdKFHFIgnTXTzIqE0Pp2zykgjIc2zoycqdBhiM4VDADjevUKFD4F
	2x5OHM9iFqEEAJYimDVVv8u2GGcLnoqYzpaMj6EYcu6FX97jQt+jlblq5HbxCjp3
	XZhvf8Jqe8wLPFzICq/G2MkifXhNv8B27GxsGX0ZND6ykqjWFo/q9US82EyGMN82
	FT0z1T83kS4vnkQKo0nefD7iWihh9nyYZ6UIT4+VNKus5lUwYXobCqVkyWriY8gB
	wW79tbi94eHNEOeXQ7ACX8SjzWbC1t7kl8uLGkmiPbz2xtMtWEIULFmyM3WlGwVN
	Z3JHb7pAGAcwPvLvYKADA==
X-ME-Sender: <xms:ZL0Cafb-QFtfWJEGtmN503q4b-PgLtd5HxhnPLMQ_NAFLZrygMPM4w>
    <xme:ZL0CaWhkhMnM8BF-mhA7zaYjeAzV73D9_vjcbFNZchYJGXvUzhLXkyJDROcjE-ywG
    KnUSdgpZ0pn_e_-zKqxdlyTbT3nndk-uWorMCZ8uZNdAGGzwtUZqRY>
X-ME-Received: <xmr:ZL0CaRc-DUm1_fTNnZY7C8lDtxGQH6n0ZL4ypqhEiuUm_gQmuQAJWCkd0aFUDQu0yOCpZAvHWOY4o4ItgT47U388H9Piwuq5qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieehvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesthdtredttddtvdenucfhrhhomheprfgvthgvrhcujfhu
    thhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefhtddvgfeggeetkefgvedutdeuffehffeftddvfeeghfeutddt
    jeegteduvdetieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmihgtrhhoshhofh
    htrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtphhtth
    hopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhguvghnohhsvgesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughmihht
    rhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopegtohhrsggvth
    eslhifnhdrnhgvthdprhgtphhtthhopehrhigusggvrhhgsegsihhtmhgrthhhrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZL0CaVmYCoIjk4GHb8OQ1hnLpGCSn7gFpOQRcTOsra5thkzLt-_p-w>
    <xmx:ZL0CaWz1XgASEkCrVf2GIkqc_fKiQqXyoTGo8ano-94B8NpMCh8eCg>
    <xmx:ZL0CaYwm68VSR9ga79GWGbSnkPDWc2FZPyRWJIvuBuv7kX5bv-c7_g>
    <xmx:ZL0CaWU8uxM9xHtHfb_hqWpfqp63H1VSablZoFqSC3iJS0Ml2Wqb0A>
    <xmx:ZL0CaVYRRmgmMy6onPW3mvh8uiOAjiPI-p8I2-EjtDJK9Vte8J4ezCNn>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Oct 2025 21:20:32 -0400 (EDT)
Date: Thu, 30 Oct 2025 11:17:35 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Jonathan Denose <jdenose@google.com>
Subject: [PATCH] Documentation: input: expand INPUT_PROP_HAPTIC_TOUCHPAD to
 all pressure pads
Message-ID: <20251030011735.GA969565@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
---

Original patch series: https://lore.kernel.org/linux-input/20251024033045.GA48918@quokka/T/#m20ec992705f449f9d9758e0080622cfae1c90660
See my comment there: https://lore.kernel.org/linux-input/20251024033045.GA48918@quokka/T/#u

My motivation is that we need something to identify pressurepads that
do not expose actual haptic feedback configuration. Right now we're
adding quirks for each device in libinput but that doesn't scale and
HID defines Usage Page 0x0D Usage 0x55 [1] to tell us whether the form
factor is a pressurepad, we're just not using it (yet).

I don't think adding a separate INPUT_PROP_PRESSUREPAD is the right
thing to do - HAPTIC_TOUCHPAD is good enough since presence of the
FF_HAPTICS bit indicates that it is controllable.

[1] https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/touchpad-windows-precision-touchpad-collection#device-capabilities-feature-report


 Documentation/input/event-codes.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git ./Documentation/input/event-codes.rst ../Documentation/input/event-codes.rst
index 1ead9bb8d9c6..304d11297d3f 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -403,16 +403,25 @@ regular directional axes and accelerometer axes on the same event node.
 INPUT_PROP_HAPTIC_TOUCHPAD
 --------------------------
 
-The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
-- supports simple haptic auto and manual triggering
+The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that the device provides
+simulated haptic feedback (e.g. a vibrator motor situated below the surface)
+instead of physical haptic feedback (e.g. a hinge). This property is only set
+if the device:
 - can differentiate between at least 5 fingers
 - uses correct resolution for the X/Y (units and value)
-- reports correct force per touch, and correct units for them (newtons or grams)
 - follows the MT protocol type B
 
+If the simulated haptic feedback is controllable by userspace the device must:
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



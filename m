Return-Path: <linux-input+bounces-15690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350EC04446
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 05:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8AF3B9566
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 03:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0637270578;
	Fri, 24 Oct 2025 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="nx3aiPBG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IDRUQL3I"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468224F5E0;
	Fri, 24 Oct 2025 03:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761276825; cv=none; b=Qep4ObK7nbG6zJYPWDAdVEynjY+/fj4dgyksfyutA+nGKK2/lM+bIqFt125V9a8KFcOb6TTBD407Jm+Gldw683Kudij1EEyWcum7m3E7ooBr52aBkJ+0NRJuNOxr9n8Y2Mc0G3AXOG1uU4Me59T09EEiaU9en0b/3060uqG/U4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761276825; c=relaxed/simple;
	bh=sRuvlioDBWR5tiiyL0vKApMcmiSStmC55EJ+Rap/oUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSKNn9Id50yDq8xsPhtVgMEly1NZ2CMZV6gbpeIUbVh1gDdO6wLKBOomBbmSdxJ02mIOxg5K9oTyQyjO1lHoB06XLSV5x2sMMDZXexRnNL2U43LPRJElSlOq3TO3iuH3Ed87/LrzVutOddnkEWXF00dSt/JE9kkfL3EdrFElgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=nx3aiPBG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IDRUQL3I; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 24CE6EC020E;
	Thu, 23 Oct 2025 23:33:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 23 Oct 2025 23:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761276822; x=1761363222; bh=6Qk94gauP4
	S6c5TS85B+XqqLkzd0ro5T/4n/atTJLjM=; b=nx3aiPBGrPSQ/PiiPhX6q8lt6n
	9SGptk/5s0jwAbjuPbs69yBsnxF6a88GGz6xBC3/EDlal86wlF/ClNB8C7jkySkM
	Ba1Gg099qAt2ndTcCrF945/+FFLAq4gMdGk/aduO2tNTgXqq3+yu3Nn60Op10kxP
	McczkivT5U9H/w/8m8C2B9e+5nnZePC/cwdbUcxZ7tCVShKOXfwAwjJL8MSNbHXP
	6Li3Num3Xce5BGpuqBfz0yMjB/1xxKoOCRSlZE9MzOVJDzjd8ThJ+UExc+uMjvLc
	IsbKVVNo4fR2tD+NTdIXHXry8hzGQMStWTNkguQEGQglkSMwaoYkwu5LorZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761276822; x=1761363222; bh=6Qk94gauP4S6c5TS85B+XqqLkzd0ro5T/4n
	/atTJLjM=; b=IDRUQL3I5OcXnFn/0NzqP1oLDouv4AQ0C4qB6xa6BXa+RIbtSaM
	HOjR5LF5spf3hTexbiA0fmxNiusXNLilJmU2EybpF2PzIhq18DICpHLgtWGaMglJ
	n9wMxm8gRKMyWspkfYISbg1BiG6SQjGR8/9XqrOlDk1t40rwdJ7gVf/MdNIJ/P9b
	uPFhveqzKu7J1WhzYCnxGfZX2kV7G9rjEA7UI2VO+jsbEqwRJOlQqXjDWstk8rhv
	ED4QS9w+7IpA829Z7zdyle67u7LnLU8jwFKhQDh1q7dfd8khHfYPURwVej3lqQAY
	xQ+mMut+ns6Hn+lxoTK2UZylYV7HtgM8m/Q==
X-ME-Sender: <xms:lfP6aO9KSrRK9op2v0DUi1c_1LPrFK7OtO1ENhzacsdJeMdlALcERQ>
    <xme:lfP6aKl0LdD_glT5ikdcStJBb7sZe9Gznf8XF4lI4SAiDTq9W8MbzfJURIUse1eOn
    E83Uw89I12PVeFJS8KB24hDfFGR7EDFGj2TSwefoApG7BdpQQWxQDw>
X-ME-Received: <xmr:lfP6aBCdwWOfJ3tOVoVPBNgmhur-8HH8cF8aOcCSB0xc26F5gGnDyJWM9ob9r2CaRrtVEIUDAKP9bnQhIbMHaOZOe7reSNn8sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeffgefgtdegueetffdtkeefveeflefhudeifedvgffhgeei
    heethfeggfekleelfeenucffohhmrghinhepmhhitghrohhsohhfthdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhh
    uhhtthgvrhgvrhesfihhohdqthdrnhgvthdpnhgspghrtghpthhtohepuddupdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehjuggvnhhoshgvsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnth
    hishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhh
    ohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpd
    hrtghpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lfP6aLWqfdTtmlBIcCqKwt9t4qIUbGn10eCC6GqFj6zUw_BT4YpBpg>
    <xmx:lfP6aH-GDX420mv4VjrxzZqP1binp0D6NZ0lXSBbfV9zjf3etxijMw>
    <xmx:lfP6aFSbWiTl7YHFV63RX1cJa7DSGbPh844KPFHuCOHz6l-O7ZGKNA>
    <xmx:lfP6aEQxHDJu3kj0XDu0T6WN3vN4ubS6pvsbPuxOzk8ORaYAuBDywA>
    <xmx:lvP6aDUJkVZKToe-Lps70CkyCtf3taW8cU4p5h0RBCaeOV0Bb0m1mjWy>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Oct 2025 23:33:38 -0400 (EDT)
Date: Fri, 24 Oct 2025 13:30:45 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Message-ID: <20251024033045.GA48918@quokka>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:44PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  Documentation/input/event-codes.rst    | 14 ++++++++++++++
>  include/uapi/linux/input-event-codes.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..1ead9bb8d9c6451a81426665baab643f9e50216a 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -400,6 +400,20 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
>  All other axes retain their meaning. A device must not mix
>  regular directional axes and accelerometer axes on the same event node.
>  
> +INPUT_PROP_HAPTIC_TOUCHPAD
> +--------------------------
> +
> +The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
> +- supports simple haptic auto and manual triggering
> +- can differentiate between at least 5 fingers
> +- uses correct resolution for the X/Y (units and value)
> +- reports correct force per touch, and correct units for them (newtons or grams)
> +- follows the MT protocol type B
> +
> +Summing up, such devices follow the MS spec for input devices in
> +Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
> +and report correct units for the pressure.

I'm a bit late to the party here but I just had to deal with a related
bug and I'm wondering if you'd be open to loosening the definition of
INPUT_PROP_HAPTIC_TOUCHPAD to include touchpads that are *physically*
haptic touchpads but do not support userspace control of the
haptics (lack of driver support, usually).

We currently lack support for those "pressurepads" - in theory they
should report pressure resolution but the number of quirks we ship in
libinput indicates none or few of them do. Those devices *should*
report HID 0x0D usage 0x55 and identify them as pressurepads [1] because
otherwise Windows probably wouldn't work (unfortunately I don't have
access to any of those devices to verify).

By using this prop for all pressurepads including those not exposing
actual haptic effects the definition would become:

INPUT_PROP_HAPTIC_TOUCHPAD
--------------------------

The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
- can differentiate between at least 5 fingers
- uses correct resolution for the X/Y (units and value)
- follows the MT protocol type B
- may support simple haptic auto and manual triggering and if so:
  - reports correct force per touch, and correct units for them (newtons or grams)

And then we can hook up the 0x55 usage to set that property and leave it
up to the client to check if the FF_ bits are in place to verify it's a
haptic-haptic touchpad?

This would save us from needing a separate INPUT_PROP_PRESSUREPAD.

Cheers,
  Peter

[1] https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/touchpad-windows-precision-touchpad-collection#device-capabilities-feature-report


> +
>  Guidelines
>  ==========
>  
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 3b2524e4b667d1e7cc02ff5cb674e7c2ac069a66..efe8c36d4ee9a938ffb1b0dd0ddd0ec6a3fcb8fe 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -27,6 +27,7 @@
>  #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
>  #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
>  #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
> +#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
>  
>  #define INPUT_PROP_MAX			0x1f
>  #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
> 
> -- 
> 2.51.0.rc1.193.gad69d77794-goog
> 
> 


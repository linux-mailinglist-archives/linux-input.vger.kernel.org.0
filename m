Return-Path: <linux-input+bounces-16075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC0C56911
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 10:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 012E7341955
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF75329ACC6;
	Thu, 13 Nov 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="ZIkpxiap";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ujgcVu4Z"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C62BEC21;
	Thu, 13 Nov 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025629; cv=none; b=MunEek9KyWIRm7EmiBOomP1YVB3R7hN4aXoQSc6WhSXuyEZcnoiUhISmqbh9W8eqxnJcuMtThuJjBODSTW0rnrLThTJwKtmqNC3VoDqGVHU7cGOu3h908ovhoATN63H6ChsZa6QQUMHGa64xIIUTQ0cprCpacFMkH7CCo3BTaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025629; c=relaxed/simple;
	bh=IKPJtWPOVrtbjWkUsUsecXV+475rddzEqXYMf/5KyH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4caqNgHq0R5hJbAFl6l4zCHVmX9V/3/yHAb/b+PlTa0Q5V5AgOBH9KbfJv+ZwQ48rkcng+qwklf1gr1MZuAtfmZFEJiNll4oWmY5q+rEvlzUmz2TjElVaHJT26HdL45zQkClWTiSVAWva+I+HbitBsLd2TCFW6qlWV9rjHoNBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=ZIkpxiap; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ujgcVu4Z; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4CBA614001FD;
	Thu, 13 Nov 2025 04:20:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 13 Nov 2025 04:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1763025626; x=1763112026; bh=fBU/jd1zp8
	uUrKN1J++AetkLdR599qu1H3EmopO40zk=; b=ZIkpxiapOcU1yFyHD2k6nWfZ37
	prhmVv/aLftWSyq8YJCT3Gz2vjlKum+7ZLnklxcYOwuiBbPIcMPh5NeILvi57Ca7
	Qy9asSGhXMsFQVvE/IiXp4+Mia1xxosnM77Me2uaDY3U3CS9ODowCYQFko/1n5NN
	aeaPUyg9SIkZXQFbId/PAZJlgTnSSZjPsOlwv4WGUIYWzPoGcSSADfoFumh9qUZi
	w/m2DslluGaCfbGQfPqD8cfqk4pwPyVw3jA47px+8wkp44uMknppLmKoCu0qvrWA
	DnYDzNynUw1pxt4uwFh684IbS05KJafrgzmBFWr9rtgu9qEyoyPkFcrfxPdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763025626; x=1763112026; bh=fBU/jd1zp8uUrKN1J++AetkLdR599qu1H3E
	mopO40zk=; b=ujgcVu4Z7zNwRq3NKWo0F+TI1D2uIWO9Nzh5DgYnscSiFCOMZzJ
	DeC2t0amyJt9yoRlLMsXseEoChDmLmwzakInXeiOmmiE0LXFyv9cCbuwwyQjP3tD
	VcsxCSnGOrz0cqZNlKRir3QNF6g+FF8n9xe/fnZ070fvvt273Sg9zWDRVk0nMB00
	yjVZRBAT1EcaOH/4bBNsaVnoyOWssj1eRrcF1LtWWu2XlJSG3qPCYybjQt3oDCYp
	Fd17Q3KNf3twC+3J7PHqriPK6tBNwHeh/bcL1K9etx8v4KdZvaaA4qIgOHCXSxDl
	cH2+JoboQhxUNFfp9vOcJkhJyxdcgfhZAvw==
X-ME-Sender: <xms:2aIVaWsiNhSDAiENXL2CVTIbhxhzl5pxZaC0CB0pTJ_v2at4HMKmCw>
    <xme:2aIVaYIVR9DLk7acfMtiy6pgzLg4w8iSdvvIWJMuxvJu18ZVS6QIXdEicYhZZ6y4x
    C_oLgaZ3z3MmHIWV99xg87T13UIxTyKTGQpEJQIxxvCnLLfHnRx9AU>
X-ME-Received: <xmr:2aIVaVrXXJWVT7XtvjuYtCKvsfeWQHWhqm0ViNOFzemPwUNtI-l1oSYFH2niFBuMTtfm2huAsusi39CPkGR46MTJbfVBfHSTsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeiheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeetgfelgfdviedutddtffeggfegieehveeludduffegudeu
    teejteetfeffhefgleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdr
    tghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehjuggvnhhoshgvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjihhkohhssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtph
    htthhopehrhigusggvrhhgsegsihhtmhgrthhhrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2aIVabWAwDLDwvXLWbF1QRRRdJcArToDE8VsD5oQw3LI8PMHzf7Rzw>
    <xmx:2aIVaa247PPMx5j9rIJ-pSXuctU9jcSCRh2wG5yxJvk7ikMO_XTICA>
    <xmx:2aIVaSRXsv9Iy7ybVKylgipzHQfhc6tL6G6-jN0VC3im-9u9Q3LhZg>
    <xmx:2aIVaWT608WdeuJUIZtCN2X9IMRg4Nc0sYqAvS7_SdViPWLYvIdR3Q>
    <xmx:2qIVabr8ziQt9JL40KBuHs7T0--LK_tBaEHiuxhdp-aA07BzvjzKXTT9>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 04:20:21 -0500 (EST)
Date: Thu, 13 Nov 2025 19:20:16 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Denose <jdenose@google.com>,
	Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <20251113092016.GA1843303@quokka>
References: <20251030011735.GA969565@quokka>
 <20251106114534.GA405512@tassie>
 <c7popmowkdilnthufvne4rednntgae2cxqwdvmd3tkfeji24nl@yhpwili7qobt>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7popmowkdilnthufvne4rednntgae2cxqwdvmd3tkfeji24nl@yhpwili7qobt>

Dmitry - gentle ping?

Cheers,
  Peter

On Thu, Nov 06, 2025 at 03:32:56PM +0100, Benjamin Tissoires wrote:
> On Nov 06 2025, Peter Hutterer wrote:
> > And expand it to encompass all pressure pads.
> > 
> > Definition: "pressure pad" as used here as includes all touchpads that
> > use physical pressure to convert to click, without physical hinges. Also
> > called haptic touchpads in general parlance, Synaptics calls them
> > ForcePads.
> > 
> > Most (all?) pressure pads are currently advertised as
> > INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> > by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> > commit 20ccc8dd38a3 ("Documentation: input: define
> > ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> > provide this information.
> > 
> > In userspace it's thus impossible to determine whether a device is a
> > true pressure pad (pressure equals pressure) or a normal clickpad with
> > (pressure equals finger size).
> > 
> > Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> > INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> > have support for userspace-controlled effects. Let's expand and rename
> > that definition to include all pressure pad touchpads since those that
> > do support FF effects can be identified by the presence of the
> > FF_HAPTIC bit.
> > 
> > This means:
> > - clickpad: INPUT_PROP_BUTTONPAD
> > - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD
> > - pressurepad with configurable haptics:
> >   INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD + FF_HAPTIC
> > 
> > Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> 
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> 
> Unless Jiri has any problem with it, I guess this would be fine going
> through your tree Dmitry.
> 
> Cheers,
> Benjamin
> 
> 
> > ---
> > ftr, I picked PRESSUREPAD over Dmitry's PRESSURE_TOUCHPAD suggestion
> > because it matches better with the existing BUTTONPAD.
> > 
> > Changes to v1: extra empty lines to render the lists as lists
> > Changes to v2: rename to PRESSUREPAD and rename it in the instances
> >   where it's used in the code
> > 
> > v1: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#u
> > v2: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#m9504de27b02d00a55d540fd9fec9aed3edd0133c
> > 
> >  Documentation/input/event-codes.rst    | 25 ++++++++++++++++++-------
> >  drivers/hid/hid-haptic.c               |  2 +-
> >  include/uapi/linux/input-event-codes.h |  2 +-
> >  3 files changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> > index 1ead9bb8d9c6..4424cbff251f 100644
> > --- a/Documentation/input/event-codes.rst
> > +++ b/Documentation/input/event-codes.rst
> > @@ -400,19 +400,30 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
> >  All other axes retain their meaning. A device must not mix
> >  regular directional axes and accelerometer axes on the same event node.
> >  
> > -INPUT_PROP_HAPTIC_TOUCHPAD
> > ---------------------------
> > +INPUT_PROP_PRESSUREPAD
> > +----------------------
> > +
> > +The INPUT_PROP_PRESSUREPAD property indicates that the device provides
> > +simulated haptic feedback (e.g. a vibrator motor situated below the surface)
> > +instead of physical haptic feedback (e.g. a hinge). This property is only set
> > +if the device:
> >  
> > -The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
> > -- supports simple haptic auto and manual triggering
> >  - can differentiate between at least 5 fingers
> >  - uses correct resolution for the X/Y (units and value)
> > -- reports correct force per touch, and correct units for them (newtons or grams)
> >  - follows the MT protocol type B
> >  
> > +If the simulated haptic feedback is controllable by userspace the device must:
> > +
> > +- support simple haptic auto and manual triggering, and
> > +- report correct force per touch, and correct units for them (newtons or grams), and
> > +- provide the EV_FF FF_HAPTIC force feedback effect.
> > +
> >  Summing up, such devices follow the MS spec for input devices in
> > -Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
> > -and report correct units for the pressure.
> > +Win8 and Win8.1, and in addition may support the Simple haptic controller HID
> > +table, and report correct units for the pressure.
> > +
> > +Where applicable, this property is set in addition to INPUT_PROP_BUTTONPAD, it
> > +does not replace that property.
> >  
> >  Guidelines
> >  ==========
> > diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
> > index aa090684c1f2..fc8a9997f815 100644
> > --- a/drivers/hid/hid-haptic.c
> > +++ b/drivers/hid/hid-haptic.c
> > @@ -86,7 +86,7 @@ int hid_haptic_input_configured(struct hid_device *hdev,
> >  	if (hi->application == HID_DG_TOUCHPAD) {
> >  		if (haptic->auto_trigger_report &&
> >  		    haptic->manual_trigger_report) {
> > -			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
> > +			__set_bit(INPUT_PROP_PRESSUREPAD, hi->input->propbit);
> >  			return 1;
> >  		}
> >  		return 0;
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 8ba48590bd2c..d21172c6a266 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -27,7 +27,7 @@
> >  #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
> >  #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
> >  #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
> > -#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
> > +#define INPUT_PROP_PRESSUREPAD		0x07	/* pressure triggers clicks */
> >  
> >  #define INPUT_PROP_MAX			0x1f
> >  #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
> > -- 
> > 2.51.1
> > 


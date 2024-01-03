Return-Path: <linux-input+bounces-1090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD582391B
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 00:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D260B1F25402
	for <lists+linux-input@lfdr.de>; Wed,  3 Jan 2024 23:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE8F1EB2D;
	Wed,  3 Jan 2024 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="sbn1fpnt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="INgHdMdx"
X-Original-To: linux-input@vger.kernel.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E41EB31
	for <linux-input@vger.kernel.org>; Wed,  3 Jan 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2BE5F5C0267;
	Wed,  3 Jan 2024 18:22:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 03 Jan 2024 18:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1704324178;
	 x=1704410578; bh=5e0yDHlphGRe0wWkF4vEKyGZ3qlDszkK60xCTOJyll4=; b=
	sbn1fpntQ6AZ6gDdpF2mf0TEHFzCbUpFZi1/0nrQ7ZgJXrJP29IhX8FLZHJRVxMX
	1iNkHfSgINY7TmqQsZ2FtRHTq87pso5Eth8e6tuGHHyYirQj+M848/aDeF9XnoxT
	eePMGlR1wQIkuIun4CND1QfRNIuGrEi9/i/RwLquZ2nSgIyuCDl0N0t22g2TpYGn
	EN3sd48rBxEmw1NjJpoVYcAcvC1K7Gtql6EgjkVxoDo5JEpuw0uKIKTQTx3QG/fs
	wa6qMEgdwcxdEKRHycL/ci9YeMrixhwcUyr7t1H+EyrgauHcnTKoD8EelYiv1rIM
	hzH1ZOuej1evmlQMdUqMjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704324178; x=
	1704410578; bh=5e0yDHlphGRe0wWkF4vEKyGZ3qlDszkK60xCTOJyll4=; b=I
	NgHdMdxAbCJyfZv6PDqcmmfTkeCBD8GlPWViBO68MYstpC/U07K3IQr7UOqKoRU1
	mSiOvnMu/7a4t6gMJvJvBoXkjWVZU8V50pksPV5KQ6N000BG1w//7pWaebtWsZSu
	RLMcGAzvUBoCf8eLkRTjJqOxh7PxnOjt3fQjwfM4hCVnC4DC9OqumHgtsAXvuTgD
	yFvFicuEKy45DXiTCDcnkilOZq21TRgopU6Tv0QTw1rE2kYKs/LzgcxU8MZ+4bbI
	WULfb4MrhBN8KrF6aGUxEdBhubRVdRdGMADCbJ9XM8V8p2282n53yAXmVMtByXS1
	xmE/rN8bKS5lHyVBapj2Q==
X-ME-Sender: <xms:UeyVZaXfa0S7hfR93VZgJfMGxB0kPOwSSq003XioZN4FxGpCtxLb-A>
    <xme:UeyVZWmT7pY9hMYjmzr9GC68IphbwEYkEuqmqomMCX8TRMZeIxrx2WzYmhSWI_x7P
    jeN2aDiNPQfTUoLoBo>
X-ME-Received: <xmr:UeyVZeZxMYazy4AaIq5mI-jd29VirZPzzV4ICbjRwWZXMyOZHXvh1Ygw4QhvvQJVSUFz9SANtkbmB5NatkhzngPJsv5OAY5CwSEd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegiedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuggftrfgrthhtvghrnhepleeitdfhjeegkeegkeekleejjeegledvudekhfdt
    keegieeuvdffleeffedtffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:UeyVZRWPTUgYn1zxF_b9GqI9Kvo1ROtiI-U4GRPa9N5DQJzKMagLpQ>
    <xmx:UeyVZUmOMtG4vKFjUZAYNtrCiVicK5De8ZADL7C3EzKqPQoXbdyq8Q>
    <xmx:UeyVZWfHjniv-TsDOuc4AQYwc6apFKdbxi0KdfrzWw-ep5AGTw4pWw>
    <xmx:UuyVZSZ4VBmZkZLqZPeyl51cLXzy6rlvGJZQwy-5EWlOsCv6MI7PWQ>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 18:22:54 -0500 (EST)
Date: Thu, 4 Jan 2024 09:22:50 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	svv@google.com, biswarupp@google.com, contact@artur-rojek.eu
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID: <20240103232250.GB101733@quokka>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
 <ZYJJC-ID4SyHhuuA@google.com>
 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
 <SN6PR06MB53421C1C9CC9EA94CBB781C6A594A@SN6PR06MB5342.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR06MB53421C1C9CC9EA94CBB781C6A594A@SN6PR06MB5342.namprd06.prod.outlook.com>

On Fri, Dec 22, 2023 at 11:09:46AM -0600, Chris Morgan wrote:
> On Wed, Dec 20, 2023 at 02:39:14PM +0100, Paul Cercueil wrote:
> > Hi Dmitry,
> > 
> > Le mardi 19 décembre 2023 à 17:53 -0800, Dmitry Torokhov a écrit :
> > > Hi Paul,
> > > 
> > > On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> > > > Hi Peter,
> > > > 
> > > > Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a
> > > > écrit :
> > > > > On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > > 
> > > > > > Stop checking if the minimum abs value is greater than the
> > > > > > maximum
> > > > > > abs
> > > > > > value. When the axis is inverted this condition is allowed.
> > > > > > Without
> > > > > > relaxing this check, it is not possible to use uinput on
> > > > > > devices in
> > > > > > userspace with an inverted axis, such as the adc-joystick found
> > > > > > on
> > > > > > many handheld gaming devices.
> > > > > 
> > > > > As mentioned in the other thread [1] a fair bit of userspace
> > > > > relies
> > > > > on
> > > > > that general assumption so removing it will likely cause all
> > > > > sorts of
> > > > > issues.
> > > > 
> > > > There is some userspace that works with it though, so why restrict
> > > > it
> > > > artificially?
> > > > 
> > > > The fact that some other userspace code wouldn't work with it
> > > > sounds a
> > > > bit irrelevant. They just never encountered that min>max usage
> > > > before.
> > > > 
> > > > And removing this check won't cause all sort of issues, why would
> > > > it?
> > > > It's not like the current software actively probes min>max and
> > > > crash
> > > > badly if it doesn't return -EINVAL...
> > > 
> > > It will cause weird movements because calculations expect min be the
> > > minimum, and max the maximum, and not encode left/right or up/down.
> > > Putting this into adc joystick binding was a mistake.
> > 
> > I don't see why it was a mistake, it's only one of the ways to specify
> > that the axis is inverted. This information is between the firmware
> > (DT) and the kernel, that doesn't mean the information has to be
> > relayed as-is to the userspace.
> > 
> > Unlike what you wrote in your other answer, when talking about input
> > the kernel doesn't really normalize anything - it gives you the min/max
> > values, and the raw samples, not normalized samples (they don't get
> > translated to a pre-specified range, or even clamped).
> > 
> > I don't really like the idea of having the driver tamper with the
> > samples, but if the specification really is that max>min, then it would
> > be up to evdev/joydev (if the individual drivers are allowed min>max)
> > or adc-joystick (if they are not) to process the samples.
> > 
> > Cheers,
> > -Paul
> 
> Forgive me for such a naive question, but what would it take to get a
> bool of `inverted` added to the struct input_absinfo, and then an ioctl
> to get the inverted status? I'm honestly not sure of the ramifications
> of what this may do to userspace (good/bad/ugly?)

Perfectly valid question IMO :)

Unfortunately the struct is API and ABI, so it'll be a significant
effort. You need some negotiation with the kernel to know the size of
the struct (with our without that boolean) - that effectively requires a
new ioctl. Userspace will then need to handle both code paths (including
ifdefs) for the foreseeable future. And that's only the C layers, there
are plenty of other evdev consumers in python/rust/... that would all
need to adjust.

Assuming you can do all that, you then still have most of userspace that
doesn't know about this ioctl. And given how rare this situation seems
to be, it'll be quite a while until everything catches up.

Fixing it in the driver means userspace just works as-is. Which seems
like the better option ;)

Cheers,
  Peter


> From what I am seeing thus far it sounds like we should not be setting
> the values as inverted for now because it can cause problems. We can
> either fix this in the adc-joystick driver, or my honest preference is
> to just set the range as defined as min < max and add a comment stating
> that the axis is inverted. If we can't handle reversed values
> throughout the stack I don't see any reason to handle it special just
> for the adc-joystick driver.
> 
> Thank you,
> Chris
> 
> > 
> > > This is the definition of absinfo:
> > > 
> > > /**
> > >  * struct input_absinfo - used by EVIOCGABS/EVIOCSABS ioctls
> > >  * @value: latest reported value for the axis.
> > >  * @minimum: specifies minimum value for the axis.
> > >  * @maximum: specifies maximum value for the axis.
> > >  * @fuzz: specifies fuzz value that is used to filter noise from
> > >  *	the event stream.
> > >  * @flat: values that are within this value will be discarded by
> > >  *	joydev interface and reported as 0 instead.
> > >  * @resolution: specifies resolution for the values reported for
> > >  *	the axis.
> > >  *
> > >  * Note that input core does not clamp reported values to the
> > >  * [minimum, maximum] limits, such task is left to userspace.
> > > ...
> > >  */
> > > 
> > > (We should change wording of the last sentence to "... does not
> > > always
> > > clamp ..." since when we do inversion/swap we do clamp values.)
> > > 
> > > And note that the userspace that can handle swapped min and max will
> > > work fine if the kernel provides normalized data, but other software
> > > will/may not work.
> > > 
> > > Thanks.
> > > 
> > 


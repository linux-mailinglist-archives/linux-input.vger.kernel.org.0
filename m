Return-Path: <linux-input+bounces-876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3498194BD
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 00:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EE71F232AD
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 23:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62993D3A0;
	Tue, 19 Dec 2023 23:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="suLJfQvc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="5EiWeIc0"
X-Original-To: linux-input@vger.kernel.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FA40BE3;
	Tue, 19 Dec 2023 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 00D1F5C02F8;
	Tue, 19 Dec 2023 18:48:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 19 Dec 2023 18:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703029692; x=1703116092; bh=bP1eafqttP
	PNGlylO0OzZEzWhoaL7qGOFOnf0iTuGWU=; b=suLJfQvcAFskhGMav5L/2wDRav
	Dhq3pKjAlZsx6gpGiJWymdIklnUAmY9PkgaRlshybG4yPFhh8Vl3WPi7bz4SmyO6
	nIs2askpSfEn9UoTXo3HQrSy56GyxIiHfWEAbiUMO/AXsc8DS0Tl4G9iP6yqwYet
	z7h4o2UnyXw5OzcdxHdN5H0sVaAjXSgHxZyVN0uWkHNSvivhh6xFSkfQsJVM4mQX
	gbwYFJ3WaQZs+52oSxTVafZlUjcZkaHVpKlCR0452jMhbJQDOnzEs4pkN7qWMk7y
	38pFPROs60jUCxWfNw5mi0wIOXHxyJ/HGF1J5XqxKnhSQRh66cqe+9m31yFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703029692; x=1703116092; bh=bP1eafqttPPNGlylO0OzZEzWhoaL
	7qGOFOnf0iTuGWU=; b=5EiWeIc0C25YmtvGz5FlOrPAZXfX8zl2tlmXYR6Az8tw
	0eF+rXUtACI1PxhL5ZtZm1+j7OT77UVOFm7YCc26XgzXCmao4EUPQKjp8FCjx//4
	momYr2j+/w/w0UEIAFXQ5J6WuY2U+4CjQCWe4Dhp9UgjYpprCyzi0hiDLsl996lG
	uZkHwFAdem0R7tkryFgEkJli8Fx0PnNQxFn+s+itxYgtyuaY0KflkFD1ku1KM7zn
	wMhTkRrxzY6tHHg6McLNXGzyOKqcrd7oKeNPz/F7/As+C5sQBu0080vgM+9Xe7KD
	l99ygBOea4KgkjD6BB41cKUEfcLucLmmhAtpbi4Mkw==
X-ME-Sender: <xms:vCuCZcYzn51Sk2aLgHDoxlZh__7ILGnGHZUtwejDPCChcYkZwFcEBA>
    <xme:vCuCZXYLy9tdqGqME_GAegN49r_JtdWPKESfSmw0xgb7AjyqBYFZcuUNeAaAEBoWc
    x4zEubbx0chmnGsyKg>
X-ME-Received: <xmr:vCuCZW896N1OJ1k2c7UpsGZlLcoXVhB_1v6br0tZt1bwW2F78LWPzJ1oTRg7wVXPGMsESglSU1XzVTT0tSrMAB-kqKyQX82rLbCJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudffhfevheejffevgfeigfek
    hfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:vCuCZWpOS0yAjplB6LkwEI2sYX0ik5BAxFO-9YdF2QWMr1NTwEJEZw>
    <xmx:vCuCZXpjf5ZFBVm8n-TGqOBs9X6Rqn3c3hdnsyFAKULCnUv9GYLU0w>
    <xmx:vCuCZUST-4iFJhQsFjVpQaU3ytHZJuE59nh90-O8hXC58m4Eb9mkvQ>
    <xmx:vCuCZbdfbdb9F_AhCQuWwHPgP1fGgrWTI001kIjA5BwVmFeKqBdrqA>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Dec 2023 18:48:08 -0500 (EST)
Date: Wed, 20 Dec 2023 09:48:03 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
Message-ID: <20231219234803.GA3396969@quokka>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
 <ZYH97KVDO4lFsbmi@google.com>
 <ZYH-a3TCBuJ00GvG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYH-a3TCBuJ00GvG@google.com>

On Tue, Dec 19, 2023 at 12:34:51PM -0800, Dmitry Torokhov wrote:
> Sorry, meant to add Peter Hutterer to the conversation, but forgot
> before hitting send...

Thx for the CC, I only saw the other patch and had missed this one. 
 
> On Tue, Dec 19, 2023 at 12:32:44PM -0800, Dmitry Torokhov wrote:
> > On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> > > On 2023-12-15 03:40, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > uinput refuses to work with abs devices where the min value is greater
> > > > than the max value. uinput_validate_absinfo() returns -EINVAL if this
> > > > is the case and prevents using uinput on such a device. Since uinput
> > > > has worked this way since at least kernel 2.6 (or prior) I presume that
> > > > this is the correct way of doing things, and that this documentation
> > > > needs to be clarified that min must always be less than max.
> > > > 
> > > > uinput is used in my use case to bind together adc-joystick devices
> > > > with gpio-keys devices to create a single unified gamepad for
> > > > userspace.
> > > > 
> > > > Note that there are several boards that will need to be corrected,
> > > > all but a few of them I maintain. Submitting as an RFC for now to get
> > > > comments from the input team and the original author in case there is
> > > > something I am missing.
> > > > 
> > > > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > > > joystick")
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > index 6c244d66f8ce..8f5cdd5ef190 100644
> > > > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > @@ -73,8 +73,9 @@ patternProperties:
> > > >          description: >
> > > >            Minimum and maximum values produced by the axis.
> > > >            For an ABS_X axis this will be the left-most and right-most
> > > > -          inclination of the joystick. If min > max, it is left to
> > > > userspace to
> > > > -          treat the axis as inverted.
> > > > +          inclination of the joystick. The axis must always be
> > > > expressed as
> > > > +          min < max, if the axis is inverted it is left to userspace to
> > > > handle
> > > > +          the inversion.
> > > 
> > > Hi Chris,
> > > 
> > > Device Tree is supposed to depict the actual state of the hardware.
> > > I worded the adc-joytick's adc-range property specifically, so that it
> > > covers a case of GCW Zero hardware [1], which has a joystick,  where the
> > > ABS_X axis reports increasing values for the left-wards inclination of
> > > the joystick, and decreasing values for the right-wards inclination. You
> > > are saying that there are even more boards that need to be corrected -
> > > those are all situations, where DT depicts the actual behavior of the
> > > hardware.
> > > What you are trying to do is change hardware description, because of how
> > > a driver in an OS works. You should instead fix behavior of said driver,
> > > even if nobody stumbled upon that issue since 2.6 :) We fixed libSDL [2]
> > > for the same reason.
> > 
> > We have several places in the kernel (such as mousedev and joydev) where
> > we expect that max is greater or equal to min if they are specified. I
> > am sure that at least some userspace components also have this
> > assumption. In general, we expect min to be a minimum value reported and
> > max being maximum value reported, and orientation expressed via
> > different properties (see [1]).
> > 
> > Since we codified min > max as inversion for adc-joystick devices in the
> > bindings, I think we need to handle this *in that driver* and leave the
> > rest alone.
> > 
> > [1] Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

I quickly checked libevdev and libinput and neither of them have checks
for min < max but the base assumption is there. So we'll get
entertaining results if that stops being the case.

Cheers,
  Peter



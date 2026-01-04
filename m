Return-Path: <linux-input+bounces-16775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683BCF075D
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 01:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8823300462D
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 00:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB44E555;
	Sun,  4 Jan 2026 00:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b="aM0BCZzy"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D93A1E9D;
	Sun,  4 Jan 2026 00:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767488095; cv=none; b=qomGsr8QoP3paFZk5KeDppnfzJZWkHrp69tEZojAf5SeRgc+REhVKR/g236c+5AbaeR6/gk4uvwIkT7YR8IwQzcuXVDbZEMehl+ZFcb79fN7pLmSfWVfoFeZk+U7Jow+dih3EXxQl7XzH/5hJv8OwUigy6l3hEPq2Nn056FbRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767488095; c=relaxed/simple;
	bh=KP6swcSc8FHjf/nRzg5iYRqz/1hL6F0kt/QnoJQw9iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3kpgYI4kefmNn08VEoXSlMvgNWWM/c8LG9WkRv9KRSYlumEys9FxCI4RVnndxs1rvYIk94A4CkKzfMoL1VU4D41GlSxNDk1aZ5WIqmUb5eHIfbmy+a+dseaMkgbTwJHG876wj1iUUaSniVkBTsYWusS0dP0B8Rd8Q/vmiYr/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b=aM0BCZzy; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from altimeter-info (unknown [45.55.225.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id ABC9A47E398;
	Sun,  4 Jan 2026 00:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altimeter.info;
	s=default; t=1767487713;
	bh=ot0vBXc3pK7be2FGkC76DIp2fFrG0+Db4Kxu1U6Brbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM0BCZzyBJTOwBGYoPHi3XELb0BVdR8jCHVH15eYXRr3lYTNyF7Q0EHAFup2+iNRQ
	 7qO7o/AoRXaRgyhcWqY28C+aYSC4YOu/9uL5cbxzFxrNEv8q8sm6tGpXbPU7w7PRRH
	 dakwK0RnYtHVBy/EBg5geSUD/s0qm/IQL4iLC8U0=
Date: Sun, 4 Jan 2026 00:48:31 +0000
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: tomasz.pakula.oficjalny@gmail.com
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: input: Increase maximum number of joystick buttons
Message-ID: <20260104004831.GA5238@altimeter-info>
References: <20251220194100.GA12646@altimeter-info>
 <aa40f6010c721863c09673fc8801e0a382619d89.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa40f6010c721863c09673fc8801e0a382619d89.camel@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

On Sat, Jan 03, 2026 at 08:26:55PM +0100, tomasz.pakula.oficjalny@gmail.com wrote:
> On Sat, 2025-12-20 at 19:41 +0000, Ivan Gorinov wrote:
> > This patch increases the limit from 80 to 112 key codes.
> > 
> > If a joystick has 80 or fewer buttons, mapping stays the same.
> > 
> > If a joystick has more than 80 buttons:
> > 
> >   Map buttons [  0 ..  15 ] to key codes starting with BTN_JOYSTICK;
> >   Map buttons [ 16 ..  47 ] to key codes starting with KEY_MACRO1;
> >   Map buttons [ 48 .. 111 ] to key codes starting with BTN_TRIGGER_HAPPY.
> > 
> 
> As stated previously by Dmitry when I tried to increase the KEY_MAX for
> the same reason, the defined usages have their place and shouldn't be
> misused. I finally understood that and I have to say that this is just
> more confusing and a dirty hack, certainly used by some drivers because
> it still works with SDL and Wine (they only care about the usage index).
> 
> I'm working on a proper solution with a new event type that will only
> send button number (starting from 1 as does plain HID) and it's value.
> 
> This will support up to 65535 (u16) buttons and should be enough for
> years to come :D I'll make sure to CC you when I'll send RFC.

Thank you! I learned how to map more than 80 buttons by overriding function
hid_driver.input_mapping from your contribution to JacKeTUs/universal-pdiff
and used the same idea in my recent changes in the hid-winwing module.

Good luck in your work on new event type!
I will test your changes with my Orion2/TGRIP-18 combo.

Meanwhile, this patch could allow existing software (for example, X-Plane 12)
to work with more input devices without any changes in userspace.


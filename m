Return-Path: <linux-input+bounces-16591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E0CBF3A6
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 18:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CB8A301A713
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 17:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD0323A566;
	Mon, 15 Dec 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVbZZ5PW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107210957;
	Mon, 15 Dec 2025 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819204; cv=none; b=rhhoJOyrh6g1TXLsOS3unxLCtC3BQvJwZHbGm16D2N0KgvgSIBavA9sL4qaDeTBhlOSIqhr0w8RXJ1WnZpYMGSJXCGbiXlyRF+ByxP3hL0NGdYvfMNjl7rAcJ9ytMJ8NsTCnxihs1lBm7EFVVEkED8Om4DbjF9O3ilnqII2pDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819204; c=relaxed/simple;
	bh=9kYIAFVtWJoPyKXCgwsETLVlLdwwce9jIRCxXN4IA3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u8L7HIt6CsUtOLhMrMEc71anjDz0x4NXK3rcXNnEwAQemzCzVT7pYqOeN3N26er7IoauhBB2bBoDIRccvNMMTIUhzH5Yy3BnsGenPDo0Xxbg3PUdwA2Fz+FGU/dW0C6o41foGY9NyGxhiKni4KoQZyAI+STR0RaoCAm9kxzfzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVbZZ5PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542C7C4CEF5;
	Mon, 15 Dec 2025 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765819203;
	bh=9kYIAFVtWJoPyKXCgwsETLVlLdwwce9jIRCxXN4IA3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GVbZZ5PWYK5LqDbbUa0AsKFonjNT168wK7EVky+QQClxSb/VO+qcgGQb45MwMQ8I4
	 rZKO8fu6SmqpjPNJuxlhB5heapaUz5G/mXRu0yJhJTGn6v9dZXi209N9V7s9kNrVvr
	 ohwMykAlC1q1PGmL4/VlWuBU/nKUH/7iyvGOdDfCaTbTgs9d35VPFd4irlhqIRAe7E
	 HbNbv5LB40UsS/D15saxC1Gf14FPyGbm5iHv91KD8edFYkoqyID7zV/hC9zaCobpaa
	 Ni3aVsDbH0+2c2QeEQK0FKgFqXiTclfv621djo0HRZ3bA+DDCJi+V7L+wElrY0Ndsy
	 rO3KkfHDMuvfQ==
Date: Mon, 15 Dec 2025 18:20:00 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
cc: Peter Hutterer <peter.hutterer@who-t.net>, 
    Jonathan Denose <jdenose@google.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
    Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
In-Reply-To: <20251215165122.GB32290@strace.io>
Message-ID: <736q6nq1-0s4r-0q35-p2q0-p83n7o92p72p@xreary.bet>
References: <20251030011735.GA969565@quokka> <20251106114534.GA405512@tassie> <20251215165122.GB32290@strace.io>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Dec 2025, Dmitry V. Levin wrote:

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
> 
> When you rename UAPI constants, please don't forget to retain old names,
> otherwise there is a high chance you'll break userspace.
> This time you've broken the build of strace.

In general I'd agree, but in this particular case, both commits happened 
within the development window (6.18-rc1 vs 6.18-rc7).

"No breaking of userspace" is certainly a hard (and good) rule between 
actual existing version releases, but I hope we're not expected to adhere 
to it in between -rcs during a development cycle.

Thanks,

-- 
Jiri Kosina
SUSE Labs



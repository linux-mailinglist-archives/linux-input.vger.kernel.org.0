Return-Path: <linux-input+bounces-13349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E915AF6A6E
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 08:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B42168535
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 06:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BD5259CBA;
	Thu,  3 Jul 2025 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaUKnM7j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D023AB98;
	Thu,  3 Jul 2025 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524683; cv=none; b=auC+97fIofdPsyWtLsMod2P9hlWdsl/DTcp2FBXbAKkaTmthi03dmgD/9b9sErodHJETsGEboR+sFlbAEqaZo/i1nItnuhUrLs1REUqf4NwggHdRby1lQcl/AzeveIBCV/N+X3V5sOEsQ659eX4txYLBoFIJzkXQUmE3WfpiGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524683; c=relaxed/simple;
	bh=L5jQ9zeYaj7YPmIoXxXm8YnRN79bcNeUGtGQcfVUsWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PEzaKk5qjU3WPt6k/E3FoQXdQVTTt7fnGUst3k7gvW17s8y+cYDc6mtChy5wSDlB4ZroE/XwHwiFOel6t0Fj+5AFY0BrUWCu6ken6GS4VHQwkgT0gUD0lSnn+u1GpsdJXu8fpKVL8GabdQioVNyTt2wnPkL848Teqw0JQ7HjFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaUKnM7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6349CC4CEEB;
	Thu,  3 Jul 2025 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751524682;
	bh=L5jQ9zeYaj7YPmIoXxXm8YnRN79bcNeUGtGQcfVUsWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UaUKnM7jjsmjRbzyR5jEbz1DW2hood6+AYD72VxmcjKeDVGcAJAOrEs8eLpjpm4sq
	 qyFQAcvjqMmuKA4JB098wbUvhwrTJ9jiJUkMSDrJyvi/qRM6YGeFV601htkdHReZNR
	 9lbmNDYPZ77Vgrr+5f/dZLmCX+lXqVjQuUFSKSlWZDZOeaSXS8cYsUkO+UjP7HBW4o
	 hqOw8gDYYcohK58RjMXm1nsIBkyLjkyPm0yFD7u85z2b6gVM474fw0MyzCvflSHmtd
	 QnTfDzWWQ6mjImhVb0QdIfcNLhvt0AEzftky/r4VJHT9Hltgt/jKbPb+CPBIqC0/HO
	 EcXuL2HPhgmSg==
Date: Thu, 3 Jul 2025 08:37:59 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, 
    linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
    Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
    Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <benno.lossin@proton.me>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
In-Reply-To: <aGD9OIZ_xE6h3199@pollux>
Message-ID: <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com> <20250629045031.92358-4-sergeantsagara@protonmail.com> <aGD9OIZ_xE6h3199@pollux>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 29 Jun 2025, Danilo Krummrich wrote:

> (Cc: +Jiri)

Thanks.

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c3f7fbd0d67a..487750d9fd1e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10686,6 +10686,13 @@ F:	include/uapi/linux/hid*
> >  F:	samples/hid/
> >  F:	tools/testing/selftests/hid/
> >  
> > +HID CORE LAYER [RUST]
> > +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
> > +L:	linux-input@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> > +F:	rust/kernel/hid.rs
> 
> I assume this is agreed with the HID CORE LAYER maintainers?
> 
> There are multiple possible options, for instance:
> 
>   1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
>      Optionally, the author can be added as another maintainer or reviewer.
> 
>   2) Add a separate MAINTAINERS entry; patches still go through the same
>      subsystem tree.
> 
>   3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
>      tree (e.g. because the subsystem maintainers don't want to deal with it).

I can't speak for Benjamin, but as far as I am concerned, I'd personally 
prefer option (3).

-- 
Jiri Kosina
SUSE Labs



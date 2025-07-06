Return-Path: <linux-input+bounces-13392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A122CAFA2CD
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 05:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 025413B4CBB
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 03:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A286282EE;
	Sun,  6 Jul 2025 03:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xosBv5Ej"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E1125DF
	for <linux-input@vger.kernel.org>; Sun,  6 Jul 2025 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751771036; cv=none; b=hwNqedUGhDGekpcVTddITQASH7vYz5Unu4P7k0CjQHcvoaCZzmdIbNTDy8PxofZBWF56qMd7+2n7oaHo+hUhSqSOJy83ILEVGY34mVNc7X59n12vDoZgbo/OpDrZsdb16HYnFsCpSor6Xf/WPFejCXBodxerOY849XFNYA9WR1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751771036; c=relaxed/simple;
	bh=ALjpGFXWNIhlCT+suPuMkDBykJol/ftI/bue5KrQITc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTTLNCx9JS4C6Ua2hKoMnGxHY/eDr3laXdzBNAhzw/0YJRibuLeYBhJ9y3OdpG2s9dWnUtSEnewGsUMhUflXRoPKwjENSpYEMlrhnH93HD5h+EpYm2eG/StwPlge4b2PTyIWrYlHLaZlQhZ0UTrF2TAc6lYjb1u3Ak+9noajzZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=xosBv5Ej; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751771026; x=1752030226;
	bh=ALjpGFXWNIhlCT+suPuMkDBykJol/ftI/bue5KrQITc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xosBv5EjCeYzuzIT1cPtxx6x8qd5hOTaAhjgkVAElD7GkU7Z9G2ZtcU8NKKPc4RmN
	 KC3IykpzxY5J/uhJr32f3bvIxJ1ogzbRIZ7P11vUwp6cQp3vi96pZVzSFf4DD9CK6y
	 Hlgmf2UJsRy4L8rfWIKkTEykLJ3rgoQMNuhUSm6orJvRUD3sPm+bjr5S+6ZCqdTyK2
	 kwvaNdtvG1pFCuFriDdtNxFIeJkUnn7a4ooJr9fih0rz9wcKVWGfRZsyUNV6Y9m5Xo
	 TClNPeT9jtzV/l4SllJ/UBb/uEavlbuVKcJoWdMC44nt0o+4QQgrUHsWY2lMwlft1z
	 jgtsVKULHEieQ==
Date: Sun, 06 Jul 2025 03:03:29 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
Message-ID: <87y0t281hi.fsf@protonmail.com>
In-Reply-To: <CANiq72=+UUFVemSGHvzkX5FoOv-U5YRDKQkbKjYwqEfex-ey6w@mail.gmail.com>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com> <20250629045031.92358-4-sergeantsagara@protonmail.com> <aGD9OIZ_xE6h3199@pollux> <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet> <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4> <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org> <87frfbksam.fsf@protonmail.com> <CANiq72=+UUFVemSGHvzkX5FoOv-U5YRDKQkbKjYwqEfex-ey6w@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: de4c091f4f8b2a1ae3cf244d19e3d0fdb0ef2afd
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 05 Jul, 2025 12:41:02 +0200 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
> On Sat, Jul 5, 2025 at 9:31=E2=80=AFAM Rahul Rameshbabu
> <sergeantsagara@protonmail.com> wrote:
>>
>> From what I can tell,
>
> I think Benjamin wants to keep an eye on things but may not have much
> time to take care of patches and so on.
>
> So it sounds like having a separate `MAINTAINERS` subentry under them
> is best, with you applying patches and then sending PRs to them.
>
> That way, they remain in control, they can coordinate any changes that
> involve both the C and the Rust side if any, and so on; while they
> don't need to handle directly Rust patches themselves, fixing issues
> with the Rust side, etc., thus removing work from their side; i.e. you
> would be doing that since you want to drive and use those Rust
> abstractions.
>
> That arrangement is great and what other subsystems have done (most of
> the entries with "... [RUST]"). It also helps more people
> involved/trained in the overall subsystem too (should they want more
> reviewers/maintainers), and also allows you to become a maintainer
> yourself, learning to send PRs, etc. (which you may welcome -- if you
> already took patches, sent PRs etc., then please excuse me! I only did
> a quick search so I may have missed it.)

Thanks Miguel. I would really enjoy the opportunity. Like you noticed, I
do not have this experience on the mailing list. I also want to give
Benjamin and Jiri time to consider these options. Let me get my v2
patches sent out in the meantime.

Thanks,
Rahul Rameshbabu

>
> We try to reserve the global Rust tree fallback for cases where there
> is really no other way, e.g. when a key subsystem doesn't want
> anything to do with Rust at all and thus would block many others
> otherwise.
>
> Thanks!
>
> Cheers,
> Miguel



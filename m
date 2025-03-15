Return-Path: <linux-input+bounces-10858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B459A632E6
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 00:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E4DA3B1B42
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 23:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7391819AD86;
	Sat, 15 Mar 2025 23:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wQ57sbG5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E0199935
	for <linux-input@vger.kernel.org>; Sat, 15 Mar 2025 23:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742080077; cv=none; b=ASAj1SBa4zRmPdoOndTVeu5gMmrcUlPpt9bvu4oIMhknO0holC5GM80L+EFIXKE0UBJfiZj2i1zGZej3eclP6rl9ep54GLbFqn+g60xvpZ4lg/yg7foQVdSdgChmNcktTuzPOapr+tK4XZBe3UjpXurf3+0I41RXQXia/12OGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742080077; c=relaxed/simple;
	bh=1MzmgdITQ4w4FO7Uemo0WSDZnXnbfyMIm6W8uzBT4Vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwyFRQ9r1FL+wOWqpRc14rxMSDIMykaZJmudqtN8SoGW1N0r5ciXixP4RKhy9JGAJf3wLHsAOZGekZQePlkuHCuOYbFseGbTsQ+9d8yav5OmCn0ttD7U+r2wA24PT+yWNMlAh/srMhFiIlmH8Z8swYXlTlftsAx58Hx9OBstXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wQ57sbG5; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1742080073; x=1742339273;
	bh=TijwBr6V5VNMUYReFcqNhHWnkhDeChPquiPiCcW2nVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=wQ57sbG5Z87dQmhS0W/fnZVQBKGKL+4Mob7mWPOTQQFJJDOb064pBi1XFiP4C5efP
	 P2d5rbGhpHUNr/6BKL8Z1IYLqkUJItWy97K71fSQMAmDV5JXGlLG47VwKVe/+VvDsq
	 tj0fxX+MIndsM/ivJVVRgGa9DnTcn8gvhJW6iO086ZausteORit4nN5CSsEmfQHUoc
	 04qQB6Zt8Szp5PYdQagA3T7AiKTl5f6Z435QlZ5D/xHmxfA2S4aZBp4ZGX/qlJPaJ1
	 8C3Gtzb8eKO30yzPbX4/HsuVjnui5TAlt/xFSehWken6eXVl5WUE9CcA2DX1g9WxD6
	 iz0TWt/L2USPw==
Date: Sat, 15 Mar 2025 23:07:50 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <87zfhlhozn.fsf@protonmail.com>
In-Reply-To: <f6rizzlygznuebh22psrdkzfki7jfjzfaamuolobvpbgxoxjoi@gfu2eyzrm5wl>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com> <f6rizzlygznuebh22psrdkzfki7jfjzfaamuolobvpbgxoxjoi@gfu2eyzrm5wl>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 704b0505bec48ce1339e1a2cf068581e382f0f79
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Mar, 2025 17:31:53 +0100 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote:
> Hi,
>
> [quick reply because I am completely under the water for the next 2
> weeks]
>
> On Mar 13 2025, Rahul Rameshbabu wrote:
>> Hello,
>>
>> I am a hobbyist developer who has been working on a project to create a =
new Rust
>> HID device driver and the needed core abstractions for writing more HID =
device
>> drivers in Rust. My goal is to support the USB Monitor Control Class nee=
ded for
>> functionality such as backlight control for monitors like the Apple Stud=
io
>> Display and Apple Pro Display XDR. A new backlight API will be required =
to
>> support multiple backlight instances and will be mapped per DRM connecto=
r. The
>> current backlight API is designed around the assumption of only a single
>> internal panel being present. I am currently working on making this new =
API for
>> DRM in parallel to my work on the HID side of the stack for supporting t=
hese
>> displays.
>
> Thanks a lot for this work, though I wonder if your goal is not too big,
> too far from the HID point of view. HID is simple, and there is only a
> few bindings that you would need to be able to make "simple" HID
> drivers.
>
> My assumption would be to introduce the binding with a functional but
> small driver (like one that just changes the report descriptor, or does
> a sime raw event processing). Then we can look at integrating with the
> DRM interface.
>
> Though it's up to you to decide how you want to play ;)
>

Thanks for the suggestion, Benjamin! I think its a great suggestion for
getting the Rust abstractions for HID cleaned up and integrated before
taking on this more herculian challenge. I think it would be ideal to
maybe do the following?

1. Focus on the core Rust HID abstractions first to get something merged
   for supporting "simple" HID drivers.
2. Build a reference driver to validate the abstrations support "simple"
   HID devices.
  - https://rust-for-linux.com/rust-reference-drivers
3. After getting the first two steps worked out, continue pursuing
   monitor control as a Rust driver and work on the needed changes for
   DRM connector backlight control API.

Luckily, it seems to me that parts of 3 can be done in parallel to 1 and
2. However, the advantage of this is that if the Rust HID abstration can
support "simple" HID drivers initially, it has a path to get merged and
iterated upon for supporting more complex drivers.

You mention this in the third patch in this series, but it would
probably be good to find a simple device that requires a report fixup or
some processing in .raw_event or .event callback.

Making a reference driver for the Glorious PC Gaming Race mice seems
like a good start. My only concern is the lack of complexity in the C
driver not needing a .remove callback implementation. I wanted to have
an example where architecting what device removal with Rust semantics
would look like. I'll get into more details where you bring this up in
third patch in this series.

Thanks for the feedback,
Rahul Rameshbabu

>>
>>   https://binary-eater.github.io/tags/usb-monitor-control/
>>
>> Julius Zint had attempted to do so a year ago with a C HID driver but wa=
s gated
>> by the lack of an appropriate backlight API for external displays. I ask=
ed him
>> for permission to do the work need in Rust and plan to accredit him for =
the HID
>> report handling for backlight in the USB Monitor Control Class standard.
>>
>>   https://lore.kernel.org/lkml/f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redh=
at.com/
>>
>> I was hoping to get initial feedback on this work to make sure I am on t=
he right
>> path for making a Rust HID abstraction that would be acceptable upstream=
. The
>> patches compile with WERROR being disabled. This is necessary since Rust=
 treats
>> missing documentation comments as warnings (which is a good thing). I al=
so need
>> to go in and add more SAFETY comments.
>
> K, I'll give you my opinion in the patches as the HID co-maintainer. I
> do have a very little rust experience, but this is my first in kernel,
> so I hope the more experience rust people here will chime in as well.
>
> Cheers,
> Benjamin
>
>>
>> Thanks,
>> Rahul Rameshbabu
>>
>> Rahul Rameshbabu (3):
>>   rust: core abstractions for HID drivers
>>   rust: hid: USB Monitor Control Class driver
>>   rust: hid: demo the core abstractions for probe and remove
>>
>>  drivers/hid/Kconfig                |  16 ++
>>  drivers/hid/Makefile               |   1 +
>>  drivers/hid/hid_monitor_control.rs |  42 +++++
>>  rust/bindings/bindings_helper.h    |   1 +
>>  rust/kernel/hid.rs                 | 245 +++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs                 |   2 +
>>  6 files changed, 307 insertions(+)
>>  create mode 100644 drivers/hid/hid_monitor_control.rs
>>  create mode 100644 rust/kernel/hid.rs
>>
>> --
>> 2.47.2
>>
>>




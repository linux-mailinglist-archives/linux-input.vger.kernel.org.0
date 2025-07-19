Return-Path: <linux-input+bounces-13597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AFB0B2AA
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 00:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC9A7A426C
	for <lists+linux-input@lfdr.de>; Sat, 19 Jul 2025 22:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C05286D76;
	Sat, 19 Jul 2025 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Yvtn5EZ9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B92288EA;
	Sat, 19 Jul 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752965195; cv=none; b=H+lGR7bOJTZG7+InOqU+qEncziQBwzLfZO5QuxtD5By4pPdKaj8Jg8072rkbQ11lc/t30w5TPZJlAGFV8D0kx2ENrnMlCsCoFBhsLMgV7cQAhjA6t+0GkSW99lHjf3+11ymcVepPntOgLGoa0MCzra4QFB8Wph8Vqgr3bSnDtnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752965195; c=relaxed/simple;
	bh=kffTkW850VF5wGh6V7wd3o7vd5InBDrvMPVk+VWKD/Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/YDt6OwB+8qGUxHLV2iYn5zFbTKpLYXLl5zgjgrlYX3CZsh91ltW1jnvbCJYhOxsSapwZNzDFRSPbEBYHrmwnsKI/AABX75a/5+2bc49VFj/aW3oJGqeWRzoMwdkj0pa7QQcfSVb6uLM1qHoIq+BQ62blLpo4UjNGdTSnDewRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Yvtn5EZ9; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752965182; x=1753224382;
	bh=PtTdGXf4R6zktuL5D6QEHfNFozpK+VJyJk6OsGvtqvw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yvtn5EZ9KLHE5TB6++QOqXMU71UGJvzCxbmmdjci+J+Jr/PFLQeOBJc2ecRzdzISx
	 bYMG3hJcJo6WnXa6lltjyJewult+tD/YsRlFrotQxXF0POMKYtjowv3eF7xd4YBORf
	 f2L9CR/7P8eigUoKcoNXCRfpXU+NWU0RRAATbBh2dn85ANE4Acnb8sOS/2rAGVv5SS
	 8bAmdzo8YCG7ysdHVRMpv5sMJHfrc/Zy6wj7oLYu+iWya2i6Wcegmcoret0S5vpJDn
	 cqTD8WvXz62549f61RGU8b5WZ3C3xb4CqV6INuob7vJO1svfgIXEKkUPxRtPWXj/A2
	 06SCPVHOnWajg==
Date: Sat, 19 Jul 2025 22:46:18 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Subject: Re: [PATCH v2 3/4] rust: core abstractions for HID drivers
Message-ID: <871pqb7qa4.fsf@protonmail.com>
In-Reply-To: <DBCPYJW9852M.2KDHMO6QS6YPY@kernel.org>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-10-sergeantsagara@protonmail.com> <DBCPYJW9852M.2KDHMO6QS6YPY@kernel.org>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 6cfca77322ca16b823db94f9275e78c63f54a7f0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Jul, 2025 17:04:07 +0200 "Danilo Krummrich" <dakr@kernel.org> wr=
ote:
> On Sun Jul 13, 2025 at 11:12 PM CEST, Rahul Rameshbabu wrote:
>> +// SAFETY: Instances of `Device` are always reference-counted.
>> +unsafe impl crate::types::AlwaysRefCounted for Device {
>> +    fn inc_ref(&self) {
>> +        // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>> +        unsafe { bindings::kref_get(&mut ((*self.as_raw()).ref_)) }
>
> I'm confused, what's the lifecycle of a struct hid_device? It embedds a s=
truct
> device, so it also inherits its reference count. Additionally it also has=
 a
> struct kref. Can you elaborate please?
>
> I don't know what the struct kref is for, but I'm pretty sure you want to=
 manage
> the reference count of the embedded struct device here.
>

Hi Danilo,

The hid subsystem uses a separate ref counter from the one maintained by
the embedded struct device. hid_device_release is assigned to the
embedded struct device's release method and makes use of this separate
reference (in drivers/hid/hid-core.c).

drivers/hid/hid-debug.c makes use of the same reference in a similar
manner to what I do here in hid_debug_events_release and
hid_debug_events_open.

Basically, the hid subsystem has a separate reference counter on top of
the one embedded in the kobject of struct device;

I decided to follow the same pattern used in the core C HID subsystem.
This pattern is found in hid-core + hid_debug.

However, thank you for bringing this up since I think that you are right
that it would be better to increment the reference count for the
underlying device rather than use this separate external reference
count.

It might even make sense to refactor core C HID to remove this separate
kref and have hid_debug increase the reference count of the underlying
struct device's kobject.

Right now, we can have the following situation in the hid subsystem.

1. struct device's kobject decrements to 0
2. struct device's release callback is called
3. This invokes hid_device_ref and decrements struct hid_device's ref
4. hid_debug is in use, so the ref has not gone to 0 yet
5. When hid_debug is ready to tear down the instance, hiddev_free will
   get called

The above creates a weird situation where the HID device can still be
in-use even though the underlying device instance has reached a
reference count of 0.

I will first start with fixing this in my Rust code, but I will take a
look at cleaning this up in the core HID subsystem as well.

>> +    }
>> +
>> +    unsafe fn dec_ref(obj: NonNull<Self>) {
>> +        // SAFETY: The safety requirements guarantee that the refcount =
is non-zero.
>> +        unsafe {
>> +            bindings::kref_put(
>> +                &mut ((*obj.cast::<bindings::hid_device>().as_ptr()).re=
f_),
>
> I think you want &raw mut instead.
>
>> +                Some(bindings::hiddev_free),
>> +            )
>> +        }
>> +    }
>> +}
>> +
>> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<=
Ctx> {
>> +    fn as_ref(&self) -> &device::Device<Ctx> {
>> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is =
a pointer to a valid
>> +        // `struct hid_device`.
>> +        let dev =3D unsafe { addr_of_mut!((*self.as_raw()).dev) };
>
> You also use &raw mut meanwhile.
>
>> +
>> +        // SAFETY: `dev` points to a valid `struct device`.
>> +        unsafe { device::Device::as_ref(dev) }
>> +    }
>> +}

https://doc.rust-lang.org/std/primitive.pointer.html#3-create-it-using-raw

Yes, I want &raw mut in the places you mentioned. Thanks :)

Thanks,
Rahul Rameshbabu



Return-Path: <linux-input+bounces-13550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8DB06248
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 17:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1873A7391
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 15:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7B21FDA9E;
	Tue, 15 Jul 2025 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6mpcnpU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63331DF244;
	Tue, 15 Jul 2025 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591852; cv=none; b=YKbrTbIQh3VMCDTkM6o3n1vZX8oVcDuyL94ntXD8CaOd053h4WX+t1tKpX8BhQnUzvrYaVqKzWu+XhkAGInNzQHzqsXIjQJEgtth8oLeIUXbGwiv55EtEiRheXPNM6qlOGRBi8LQGp/LQqNPxlTN5yf8KkUvPXrR0YR8Qq4fIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591852; c=relaxed/simple;
	bh=aAreeY7ue7odmfTN9APRw/KRypV/I5/p3R9EKMXFQPA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=aKRHLxaAwGcXPqojl8m0mJy2J0ZB8m/BPe+btf3hDp/z7Wkt5exRtmkJVtyTKqyTYjB6J5XWhWvVm49uRYAEk8/O+1Q2wFclciedaEbG+1c5MVsY27bFmbOQ0siFYtnILZyqQ7PNae7iB5KJLAaDXWs9r08bdSl7qZNO/PoRL+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6mpcnpU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608D3C4CEE3;
	Tue, 15 Jul 2025 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752591852;
	bh=aAreeY7ue7odmfTN9APRw/KRypV/I5/p3R9EKMXFQPA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=a6mpcnpURyLp67IkgKp7Uo9Q4mbZWaW+CCX/jgmpobvSkfgU6uFuwV5tZI8xGLIa5
	 jyXmbVqVg+T9yGhvjQrKOdv4Ll1wBBm768/FXN9KxVFauVyLbp1+Qo779yxIdOwvh9
	 O+Ba0LUy3WfCRTGJahUf7z5ELhAS4fPDSsn4ykevwxX9ri/WnqdoND0fGgJhucYuxx
	 poGIhhU70tSRSVAc+q+fgZOckrrqd8hcuCxdBlrWjMC+CGfTX+KYRbAUFEad88U1uT
	 M9SFTLcPG2CyBxjFGihypm1fP+c5wk49sO9t0L4hO11TDGHzV8ZhBWmQ34Y96BFK/K
	 fvxX5Py9Lb6yQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 17:04:07 +0200
Message-Id: <DBCPYJW9852M.2KDHMO6QS6YPY@kernel.org>
To: "Rahul Rameshbabu" <sergeantsagara@protonmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/4] rust: core abstractions for HID drivers
Cc: <rust-for-linux@vger.kernel.org>, <linux-input@vger.kernel.org>, "Jiri
 Kosina" <jikos@kernel.org>, <a.hindborg@kernel.org>,
 <alex.gaynor@gmail.com>, <aliceryhl@google.com>, <benno.lossin@proton.me>,
 "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <db48x@db48x.net>,
 <gary@garyguo.net>, <ojeda@kernel.org>, <tmgross@umich.edu>,
 <peter.hutterer@who-t.net>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
 <20250713211012.101476-10-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-10-sergeantsagara@protonmail.com>

On Sun Jul 13, 2025 at 11:12 PM CEST, Rahul Rameshbabu wrote:
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> +        unsafe { bindings::kref_get(&mut ((*self.as_raw()).ref_)) }

I'm confused, what's the lifecycle of a struct hid_device? It embedds a str=
uct
device, so it also inherits its reference count. Additionally it also has a
struct kref. Can you elaborate please?

I don't know what the struct kref is for, but I'm pretty sure you want to m=
anage
the reference count of the embedded struct device here.

> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe {
> +            bindings::kref_put(
> +                &mut ((*obj.cast::<bindings::hid_device>().as_ptr()).ref=
_),

I think you want &raw mut instead.

> +                Some(bindings::hiddev_free),
> +            )
> +        }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<C=
tx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct hid_device`.
> +        let dev =3D unsafe { addr_of_mut!((*self.as_raw()).dev) };

You also use &raw mut meanwhile.

> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::as_ref(dev) }
> +    }
> +}


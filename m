Return-Path: <linux-input+bounces-13165-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14BAECBCA
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 10:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47D13B6D77
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 08:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B899E1DB375;
	Sun, 29 Jun 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz2Sm556"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16B186295;
	Sun, 29 Jun 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186750; cv=none; b=c7lez39nOmVvaUyTxXfx/ff6FwxSZ+aRzsDilNxTefLVLEeGYsQIvlKB0UfW4Hu1V4oxYQvW64tlLwQa57rbiygA+v5VEK5UEmw482wStDbB/Dq4MAQHIIVikSBpIIE6Tc5m3Bfumi5tSyct0O9qfAsl/d7Hi/aOP5B7ra8g9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186750; c=relaxed/simple;
	bh=ifkzegaEl+rpbcfbrHRJAuy7Rpg3JT7F3ccEstajbvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU9XuQmaKpruEeidigyf6CZ0cZ4yOB4TfcNJ0G/6BiFu/vxJfSBQBPXPILq4tcKHIeTkZDPvDMX29glTcV/YPgt9yepmIVPLgihemEBBjCXAr32Kijlf2C9Gd0GmzehsbiTWBJzP7wArE0novWsaJQ/t7CfVoTV5s+zlSBNgXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz2Sm556; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8AFC4CEEB;
	Sun, 29 Jun 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751186750;
	bh=ifkzegaEl+rpbcfbrHRJAuy7Rpg3JT7F3ccEstajbvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kz2Sm556ba/zR6eiR7MSxfnreZWJ37l2ZKRZnnkwSgwLom3GY2QBz+CPAwMpg2TnW
	 GhHBf55dfSraqrnoRvhyPg36W8t8TBQI8e8AXzlDsBoPlg1EOTdQwbUD2P8TXjct9A
	 S3V64a/dJRG1b7mkeaOdrCMqXyLL7MCHEygiMFveMi/KUtfWpCQjrnY/GD5KTsUMTB
	 HBXRqTU4L0RWxtsE9ByTuiK3CJAWhSC+MGoUWBsE+sOPSFZainrU7dv1zkSNVyJjk5
	 t1kYvPpdkORs+swno9eLemyHsLvTMEynZs6FtT/1DIzW3K9VLmCq6RaIPfOiU+X2qY
	 zKXV8EvTt4kGg==
Date: Sun, 29 Jun 2025 10:45:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Brooks <db48x@db48x.net>, Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
Message-ID: <aGD9OIZ_xE6h3199@pollux>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-4-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629045031.92358-4-sergeantsagara@protonmail.com>

(Cc: +Jiri)

On Sun, Jun 29, 2025 at 04:51:15AM +0000, Rahul Rameshbabu wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67a..487750d9fd1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10686,6 +10686,13 @@ F:	include/uapi/linux/hid*
>  F:	samples/hid/
>  F:	tools/testing/selftests/hid/
>  
> +HID CORE LAYER [RUST]
> +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> +F:	rust/kernel/hid.rs

I assume this is agreed with the HID CORE LAYER maintainers?

There are multiple possible options, for instance:

  1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
     Optionally, the author can be added as another maintainer or reviewer.

  2) Add a separate MAINTAINERS entry; patches still go through the same
     subsystem tree.

  3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
     tree (e.g. because the subsystem maintainers don't want to deal with it).

I usually recommend (1), but that's of course up to you and the HID maintainers.

Here it seems you want to go with option (2). Given that I recommend to add the
HID maintainers as reviewers (if they like) to the new MAINTAINERS entry, so
they can easily follow on what's going on.

> +/// The HID driver trait.
> +///
> +/// # Example
> +///
> +///```
> +/// use kernel::hid;
> +///
> +/// const USB_VENDOR_ID_VALVE: u32 = 0x28de;
> +/// const USB_DEVICE_ID_STEAM_DECK: u32 = 0x1205;

I think we should make the existing constants from drivers/hid/hid-ids.h
available, rather than defining them again.

<snip>

> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by the driver.
> +    // TODO: Use `associated_type_defaults` once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static = ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const ID_TABLE: IdTable<Self::IdInfo>;
> +
> +    /// Called before report descriptor parsing. Can be used to mutate the
> +    /// report descriptor before the core HID logic processes the descriptor.
> +    /// Useful for problematic report descriptors that prevent HID devices from
> +    /// functioning correctly.
> +    ///
> +    /// Optional to implement.
> +    fn report_fixup<'a, 'b: 'a>(_hdev: &Device, _rdesc: &'b mut [u8]) -> &'a [u8] {

report_fixup() is a bus device callback and seems to be synchronized against
other bus device callbacks, hence the device argument should be
&Device<device::Core>.

> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +}
> +
> +/// An adapter for the registration of HID drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::hid_driver;
> +
> +    unsafe fn register(
> +        hdrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        // SAFETY: It's safe to set the fields of `struct hid_driver` on initialization.
> +        let raw_hdrv = unsafe { &mut *hdrv.get() };

I don't think you can guarantee that all fields of `hdrv` are properly
initialized to create this mutable reference. I think you should do what PCI and
platform does instead.

> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn report_fixup_callback(
> +        hdev: *mut bindings::hid_device,
> +        buf: *mut u8,
> +        size: *mut kernel::ffi::c_uint,
> +    ) -> *const u8 {
> +        // SAFETY: The HID subsystem only ever calls the report_fixup callback
> +        // with a valid pointer to a `struct hid_device`.
> +        //
> +        // INVARIANT: `hdev` is valid for the duration of
> +        // `report_fixup_callback()`.
> +        let hdev = unsafe { &*hdev.cast::<Device>() };

::<Device<device::Core>

> +
> +        // SAFETY: The HID subsystem only ever calls the report_fixup callback
> +        // with a valid pointer to a `kernel::ffi::c_uint`.
> +        //
> +        // INVARIANT: `size` is valid for the duration of
> +        // `report_fixup_callback()`.
> +        let buf_len: usize = match unsafe { *size }.try_into() {
> +            Ok(len) => len,
> +            Err(e) => {
> +                pr_err!(
> +                    "Cannot fix report description due to length conversion failure: {}!\n",
> +                    e
> +                );

You have a valid device at this point, please use it to print with dev_err!().

> +
> +                return buf;
> +            }
> +        };
> +
> +        // Build a mutable Rust slice from buf and size
> +        //
> +        // SAFETY: The HID subsystem only ever calls the report_fixup callback
> +        // with a valid pointer to a `u8` buffer.
> +        //
> +        // INVARIANT: `buf` is valid for the duration of
> +        // `report_fixup_callback()`.
> +        let rdesc_slice = unsafe { core::slice::from_raw_parts_mut(buf, buf_len) };
> +        let rdesc_slice = T::report_fixup(hdev, rdesc_slice);
> +
> +        match rdesc_slice.len().try_into() {
> +            // SAFETY: The HID subsystem only ever calls the report_fixup
> +            // callback with a valid pointer to a `kernel::ffi::c_uint`.
> +            //
> +            // INVARIANT: `size` is valid for the duration of
> +            // `report_fixup_callback()`.
> +            Ok(len) => unsafe { *size = len },
> +            Err(e) => {
> +                pr_err!("Fixed report description will not be used due to {}!\n", e);

Same here.

> +
> +                return buf;
> +            }
> +        }
> +
> +        rdesc_slice.as_ptr()
> +    }
> +}

You also need to call the macros that generate the device context Deref
hierarchy and ARef<Device> conversion for you, i.e.

	// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
	// argument.
	kernel::impl_device_context_deref!(unsafe { Device });
	kernel::impl_device_context_into_aref!(Device);

You probably don't need that latter, given that the only bus callback you
implement is report_fixup() and you don't implement AlwaysRefCounted for Device
yet.


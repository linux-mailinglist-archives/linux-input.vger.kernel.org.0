Return-Path: <linux-input+bounces-14799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25095B7DB09
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FD5C4E0747
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861FE30BB9F;
	Wed, 17 Sep 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qisvuo3S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1B2DA769;
	Wed, 17 Sep 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103477; cv=none; b=MIqN4/HHm2gBvqVOvdC8GtFyV+qWwDDnwWiCiIOiDSw9HN134XtCKF/Zxh+iKGi0cX3OiX207bzpDtN6dU9ftSiauCaOkqmAI19Krd3vqauTB44/HVjPSXNJQN8HnMvrWNMf4KBPzCNakN7M/+5uaCtNG2HCNTDd4Ou0jvQDVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103477; c=relaxed/simple;
	bh=msxAulJ/HILGusITqa34f0E+/ArWlIMP4J/LfOJwJKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRbQ6A6C5X3mjNLqUiqP38hH7Rh71CCS+an8gpyZDm9FIBV8VIr+VlPkZIRjH4/X8a98r66yP0tZlLBRm+ZpmL2lWb+dKIA4W7SETW+eJhm0st84b7jX2O1bob4UZfFwjnYccNeB0hgMwcnfdOXeZRQzD5WAczHniHnFWrhwW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qisvuo3S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CB0C4CEF0;
	Wed, 17 Sep 2025 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758103477;
	bh=msxAulJ/HILGusITqa34f0E+/ArWlIMP4J/LfOJwJKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qisvuo3SU0Ey8paVCOHismPqj7lT5racpsSVGMx8gGQVdsPxqWmcTQDFpKfmycScg
	 CeNutTa38A5lzpEUEm2DkW7ThEwxshNJbcEJU31330wo4iqL8Hq2nAhVGYidU8IFbI
	 XZhHf4x1Vz5qkzQDem+M8CJ+neTpysXBrWA7YW66TCgMpZZOC5aR+gWNSfgfPWydPa
	 +oII2WUi3hv4Qa8BV3Q265jUuJDBfe0A3dLfEzwgREnK/qJVN/Mwcj3RoV+7PIzvMv
	 zWlmgwdmkK22LhYtKps9cxtoKRFc3qVB99tuWiL1jgSmoQXWlERkfZpASyA09k88uT
	 USmnYJQID84lg==
Date: Wed, 17 Sep 2025 12:04:30 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, 
	peter.hutterer@who-t.net
Subject: Re: [PATCH v3 RESEND RESEND 2/3] rust: core abstractions for HID
 drivers
Message-ID: <wjfjzjc626n55zvhksiyldobwubr2imbvfavqej333lvnka2wn@r4zfcjqtanvu>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com>
 <20250913161222.3889-3-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250913161222.3889-3-sergeantsagara@protonmail.com>

On Sep 13 2025, Rahul Rameshbabu wrote:
> These abstractions enable the development of HID drivers in Rust by binding
> with the HID core C API. They provide Rust types that map to the
> equivalents in C. In this initial draft, only hid_device and hid_device_id
> are provided direct Rust type equivalents. hid_driver is specially wrapped
> with a custom Driver type. The module_hid_driver! macro provides analogous
> functionality to its C equivalent. Only the .report_fixup callback is
> binded to Rust so far.
> 
> Future work for these abstractions would include more bindings for common
> HID-related types, such as hid_field, hid_report_enum, and hid_report as
> well as more bus callbacks. Providing Rust equivalents to useful core HID
> functions will also be necessary for HID driver development in Rust.
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
> 
> Notes:
>     Some points I did not address from the last review cycle:
>     
>         * I did not look into autogenerating all the getter functions for various
>           fields exported from the binded C structures.
>           - I would be interested in hearing opinions from folks actively involved
>             with Rust for Linux on this topic.
>     
>     Changelog:
>     
>         v2->v3:
>           * Implemented AlwaysRefCounted trait using embedded struct device's
>             reference counts instead of the separate reference counter in struct
>             hid_device
>           * Used &raw mut as appropriate
>           * Binded include/linux/device.h for get_device and put_device
>           * Cleaned up various comment related formatting
>           * Minified dev_err! format string
>           * Updated Group enum to be repr(u16)
>           * Implemented From<u16> trait for Group
>           * Added TODO comment when const_trait_impl stabilizes
>           * Made group getter functions return a Group variant instead of a raw
>             number
>           * Made sure example code builds
>         v1->v2:
>           * Binded drivers/hid/hid-ids.h for use in Rust drivers
>           * Remove pre-emptive referencing of a C HID driver instance before
>             it is fully initialized in the driver registration path
>           * Moved static getters to generic Device trait implementation, so
>             they can be used by all device::DeviceContext
>           * Use core macros for supporting DeviceContext transitions
>           * Implemented the AlwaysRefCounted and AsRef traits
>           * Make use for dev_err! as appropriate
>         RFC->v1:
>           * Use Danilo's core infrastructure
>           * Account for HID device groups
>           * Remove probe and remove callbacks
>           * Implement report_fixup support
>           * Properly comment code including SAFETY comments
> 
>  MAINTAINERS                     |   9 +
>  drivers/hid/Kconfig             |   8 +
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/hid.rs              | 503 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 525 insertions(+)
>  create mode 100644 rust/kernel/hid.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd810da5261b..6c60765f2aaa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10686,6 +10686,15 @@ F:	include/uapi/linux/hid*
>  F:	samples/hid/
>  F:	tools/testing/selftests/hid/
>  
> +HID CORE LAYER [RUST]
> +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +R:	Benjamin Tissoires <bentiss@kernel.org>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git rust

FWIW, we (HID maintainers) are still undecided on how to handle that,
and so it's a little bit postponed for now

> +F:	drivers/hid/*.rs

Could you instead make it really independant by relying on
drivers/hid/rust instead?
We already have drivers/hid/bpf for HID-BPF related stuff, so it doesn't
seem to be that much of an issue to have a separate rust dir.

This should allow for a cleaner separation without tinkering in Makefile
or Kconfig if the HID rust tree is handled separately.

Cheers,
Benjamin

> +F:	rust/kernel/hid.rs
> +
>  HID LOGITECH DRIVERS
>  R:	Filipe Laíns <lains@riseup.net>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 43859fc75747..922e76e18af2 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -744,6 +744,14 @@ config HID_MEGAWORLD_FF
>  	Say Y here if you have a Mega World based game controller and want
>  	to have force feedback support for it.
>  
> +config RUST_HID_ABSTRACTIONS
> +	bool "Rust HID abstractions support"
> +	depends on RUST
> +	depends on HID=y
> +	help
> +	  Adds support needed for HID drivers written in Rust. It provides a
> +	  wrapper around the C hid core.
> +
>  config HID_REDRAGON
>  	tristate "Redragon keyboards"
>  	default !EXPERT
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 8cbb660e2ec2..7145fb1cdff1 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -45,6 +45,7 @@
>  #include <linux/cpufreq.h>
>  #include <linux/cpumask.h>
>  #include <linux/cred.h>
> +#include <linux/device.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/errname.h>
> @@ -52,6 +53,8 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/hid.h>
> +#include "../../drivers/hid/hid-ids.h"
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
> new file mode 100644
> index 000000000000..a93804af8b78
> --- /dev/null
> +++ b/rust/kernel/hid.rs
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +
> +//! Abstractions for the HID interface.
> +//!
> +//! C header: [`include/linux/hid.h`](srctree/include/linux/hid.h)
> +
> +use crate::{device, device_id::RawDeviceId, driver, error::*, prelude::*, types::Opaque};
> +use core::{
> +    marker::PhantomData,
> +    ptr::{addr_of_mut, NonNull},
> +};
> +
> +/// Indicates the item is static read-only.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_CONSTANT: u8 = bindings::HID_MAIN_ITEM_CONSTANT as u8;
> +
> +/// Indicates the item represents data from a physical control.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_VARIABLE: u8 = bindings::HID_MAIN_ITEM_VARIABLE as u8;
> +
> +/// Indicates the item should be treated as a relative change from the previous
> +/// report.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_RELATIVE: u8 = bindings::HID_MAIN_ITEM_RELATIVE as u8;
> +
> +/// Indicates the item should wrap around when reaching the extreme high or
> +/// extreme low values.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_WRAP: u8 = bindings::HID_MAIN_ITEM_WRAP as u8;
> +
> +/// Indicates the item should wrap around when reaching the extreme high or
> +/// extreme low values.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_NONLINEAR: u8 = bindings::HID_MAIN_ITEM_NONLINEAR as u8;
> +
> +/// Indicates whether the control has a preferred state it will physically
> +/// return to without user intervention.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_NO_PREFERRED: u8 = bindings::HID_MAIN_ITEM_NO_PREFERRED as u8;
> +
> +/// Indicates whether the control has a physical state where it will not send
> +/// any reports.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_NULL_STATE: u8 = bindings::HID_MAIN_ITEM_NULL_STATE as u8;
> +
> +/// Indicates whether the control requires host system logic to change state.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_VOLATILE: u8 = bindings::HID_MAIN_ITEM_VOLATILE as u8;
> +
> +/// Indicates whether the item is fixed size or a variable buffer of bytes.
> +///
> +/// Refer to [Device Class Definition for HID 1.11]
> +/// Section 6.2.2.5 Input, Output, and Feature Items.
> +///
> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/default/files/hid1_11.pdf
> +pub const MAIN_ITEM_BUFFERED_BYTE: u8 = bindings::HID_MAIN_ITEM_BUFFERED_BYTE as u8;
> +
> +/// HID device groups are intended to help categories HID devices based on a set
> +/// of common quirks and logic that they will require to function correctly.
> +#[repr(u16)]
> +pub enum Group {
> +    /// Used to match a device against any group when probing.
> +    Any = bindings::HID_GROUP_ANY as u16,
> +
> +    /// Indicates a generic device that should need no custom logic from the
> +    /// core HID stack.
> +    Generic = bindings::HID_GROUP_GENERIC as u16,
> +
> +    /// Maps multitouch devices to hid-multitouch instead of hid-generic.
> +    Multitouch = bindings::HID_GROUP_MULTITOUCH as u16,
> +
> +    /// Used for autodetecing and mapping of HID sensor hubs to
> +    /// hid-sensor-hub.
> +    SensorHub = bindings::HID_GROUP_SENSOR_HUB as u16,
> +
> +    /// Used for autodetecing and mapping Win 8 multitouch devices to set the
> +    /// needed quirks.
> +    MultitouchWin8 = bindings::HID_GROUP_MULTITOUCH_WIN_8 as u16,
> +
> +    // Vendor-specific device groups.
> +    /// Used to distinguish Synpatics touchscreens from other products. The
> +    /// touchscreens will be handled by hid-multitouch instead, while everything
> +    /// else will be managed by hid-rmi.
> +    RMI = bindings::HID_GROUP_RMI as u16,
> +
> +    /// Used for hid-core handling to automatically identify Wacom devices and
> +    /// have them probed by hid-wacom.
> +    Wacom = bindings::HID_GROUP_WACOM as u16,
> +
> +    /// Used by logitech-djreceiver and logitech-djdevice to autodetect if
> +    /// devices paied to the DJ receivers are DJ devices and handle them with
> +    /// the device driver.
> +    LogitechDJDevice = bindings::HID_GROUP_LOGITECH_DJ_DEVICE as u16,
> +
> +    /// Since the Valve Steam Controller only has vendor-specific usages,
> +    /// prevent hid-generic from parsing its reports since there would be
> +    /// nothing hid-generic could do for the device.
> +    Steam = bindings::HID_GROUP_STEAM as u16,
> +
> +    /// Used to differentiate 27 Mhz frequency Logitech DJ devices from other
> +    /// Logitech DJ devices.
> +    Logitech27MHzDevice = bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE as u16,
> +
> +    /// Used for autodetecting and mapping Vivaldi devices to hid-vivaldi.
> +    Vivaldi = bindings::HID_GROUP_VIVALDI as u16,
> +}
> +
> +// TODO: use `const_trait_impl` once stabilized:
> +//
> +// ```
> +// impl const From<Group> for u16 {
> +//     /// [`Group`] variants are represented by [`u16`] values.
> +//     fn from(value: Group) -> Self {
> +//         value as Self
> +//     }
> +// }
> +// ```
> +impl Group {
> +    /// Internal function used to convert [`Group`] variants into [`u16`].
> +    const fn into(self) -> u16 {
> +        self as u16
> +    }
> +}
> +
> +impl From<u16> for Group {
> +    /// [`u16`] values can be safely converted to [`Group`] variants.
> +    fn from(value: u16) -> Self {
> +        match value.into() {
> +            bindings::HID_GROUP_GENERIC => Group::Generic,
> +            bindings::HID_GROUP_MULTITOUCH => Group::Multitouch,
> +            bindings::HID_GROUP_SENSOR_HUB => Group::SensorHub,
> +            bindings::HID_GROUP_MULTITOUCH_WIN_8 => Group::MultitouchWin8,
> +            bindings::HID_GROUP_RMI => Group::RMI,
> +            bindings::HID_GROUP_WACOM => Group::Wacom,
> +            bindings::HID_GROUP_LOGITECH_DJ_DEVICE => Group::LogitechDJDevice,
> +            bindings::HID_GROUP_STEAM => Group::Steam,
> +            bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE => Group::Logitech27MHzDevice,
> +            bindings::HID_GROUP_VIVALDI => Group::Vivaldi,
> +            _ => Group::Any,
> +        }
> +    }
> +}
> +
> +/// The HID device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct hid_device`.
> +/// The implementation abstracts the usage of an already existing C `struct
> +/// hid_device` within Rust code that we get passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`Device`] instance represents a valid `struct hid_device` created by the
> +/// C portion of the kernel.
> +#[repr(transparent)]
> +pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> +    Opaque<bindings::hid_device>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> Device<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::hid_device {
> +        self.0.get()
> +    }
> +
> +    /// Returns the HID transport bus ID.
> +    pub fn bus(&self) -> u16 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_device`
> +        unsafe { *self.as_raw() }.bus
> +    }
> +
> +    /// Returns the HID report group.
> +    pub fn group(&self) -> Group {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_device`
> +        unsafe { *self.as_raw() }.group.into()
> +    }
> +
> +    /// Returns the HID vendor ID.
> +    pub fn vendor(&self) -> u32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_device`
> +        unsafe { *self.as_raw() }.vendor
> +    }
> +
> +    /// Returns the HID product ID.
> +    pub fn product(&self) -> u32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_device`
> +        unsafe { *self.as_raw() }.product
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> +        unsafe { bindings::get_device(&raw mut (*self.as_raw()).dev) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +        unsafe { bindings::put_device(&raw mut (*obj.cast::<bindings::hid_device>().as_ptr()).dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct hid_device`.
> +        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::as_ref(dev) }
> +    }
> +}
> +
> +/// Abstraction for the HID device ID structure `struct hid_device_id`.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::hid_device_id);
> +
> +impl DeviceId {
> +    /// Equivalent to C's `HID_USB_DEVICE` macro.
> +    ///
> +    /// Create a new `hid::DeviceId` from a group, vendor ID, and device ID
> +    /// number.
> +    pub const fn new_usb(group: Group, vendor: u32, product: u32) -> Self {
> +        Self(bindings::hid_device_id {
> +            bus: 0x3, // BUS_USB
> +            group: group.into(),
> +            vendor,
> +            product,
> +            driver_data: 0,
> +        })
> +    }
> +
> +    /// Returns the HID transport bus ID.
> +    pub fn bus(&self) -> u16 {
> +        self.0.bus
> +    }
> +
> +    /// Returns the HID report group.
> +    pub fn group(&self) -> Group {
> +        self.0.group.into()
> +    }
> +
> +    /// Returns the HID vendor ID.
> +    pub fn vendor(&self) -> u32 {
> +        self.0.vendor
> +    }
> +
> +    /// Returns the HID product ID.
> +    pub fn product(&self) -> u32 {
> +        self.0.product
> +    }
> +}
> +
> +// SAFETY:
> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `hid_device_id` and does not add
> +//   additional invariants, so it's safe to transmute to `RawType`.
> +// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::hid_device_id;
> +
> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::hid_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data
> +    }
> +}
> +
> +/// [`IdTable`] type for HID.
> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// Create a HID [`IdTable`] with its alias for modpost.
> +#[macro_export]
> +macro_rules! hid_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::hid::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > = $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("hid", $module_table_name, $table_name);
> +    };
> +}
> +
> +/// The HID driver trait.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{bindings, device, hid};
> +///
> +/// struct MyDriver;
> +///
> +/// kernel::hid_device_table!(
> +///     HID_TABLE,
> +///     MODULE_HID_TABLE,
> +///     <MyDriver as hid::Driver>::IdInfo,
> +///     [(
> +///         hid::DeviceId::new_usb(
> +///             hid::Group::Steam,
> +///             bindings::USB_VENDOR_ID_VALVE,
> +///             bindings::USB_DEVICE_ID_STEAM_DECK,
> +///         ),
> +///         (),
> +///     )]
> +/// );
> +///
> +/// #[vtable]
> +/// impl hid::Driver for MyDriver {
> +///     type IdInfo = ();
> +///     const ID_TABLE: hid::IdTable<Self::IdInfo> = &HID_TABLE;
> +///
> +///     /// This function is optional to implement.
> +///     fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device<device::Core>, rdesc: &'b mut [u8]) -> &'a [u8] {
> +///         // Perform some report descriptor fixup.
> +///         rdesc
> +///     }
> +/// }
> +/// ```
> +/// Drivers must implement this trait in order to get a HID driver registered.
> +/// Please refer to the `Adapter` documentation for an example.
> +#[vtable]
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
> +    fn report_fixup<'a, 'b: 'a>(_hdev: &Device<device::Core>, _rdesc: &'b mut [u8]) -> &'a [u8] {
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
> +        unsafe {
> +            (*hdrv.get()).name = name.as_char_ptr();
> +            (*hdrv.get()).id_table = T::ID_TABLE.as_ptr();
> +            (*hdrv.get()).report_fixup = if T::HAS_REPORT_FIXUP {
> +                Some(Self::report_fixup_callback)
> +            } else {
> +                None
> +            };
> +        }
> +
> +        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
> +        to_result(unsafe {
> +            bindings::__hid_register_driver(hdrv.get(), module.0, name.as_char_ptr())
> +        })
> +    }
> +
> +    unsafe fn unregister(hdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
> +        unsafe { bindings::hid_unregister_driver(hdrv.get()) }
> +    }
> +}
> +
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
> +        let hdev = unsafe { &*hdev.cast::<Device<device::Core>>() };
> +
> +        // SAFETY: The HID subsystem only ever calls the report_fixup callback
> +        // with a valid pointer to a `kernel::ffi::c_uint`.
> +        //
> +        // INVARIANT: `size` is valid for the duration of
> +        // `report_fixup_callback()`.
> +        let buf_len: usize = match unsafe { *size }.try_into() {
> +            Ok(len) => len,
> +            Err(e) => {
> +                dev_err!(
> +                    hdev.as_ref(),
> +                    "Cannot fix report description due to {}!\n",
> +                    e
> +                );
> +
> +                return buf;
> +            }
> +        };
> +
> +        // Build a mutable Rust slice from `buf` and `size`.
> +        //
> +        // SAFETY: The HID subsystem only ever calls the `report_fixup callback`
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
> +                dev_err!(
> +                    hdev.as_ref(),
> +                    "Fixed report description will not be used due to {}!\n",
> +                    e
> +                );
> +
> +                return buf;
> +            }
> +        }
> +
> +        rdesc_slice.as_ptr()
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single HID driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// kernel::module_hid_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     authors: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_hid_driver {
> +    ($($f:tt)*) => {
> +        $crate::module_driver!(<T>, $crate::hid::Adapter<T>, { $($f)* });
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e88bc4b27d6e..44c107f20174 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -80,6 +80,8 @@
>  pub mod firmware;
>  pub mod fmt;
>  pub mod fs;
> +#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
> +pub mod hid;
>  pub mod init;
>  pub mod io;
>  pub mod ioctl;
> -- 
> 2.47.2
> 
> 


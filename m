Return-Path: <linux-input+bounces-14804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5FB7CD3E
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB723A41ED
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 12:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DC732BC1B;
	Wed, 17 Sep 2025 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="KzZm60fN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AF32BC0C
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110925; cv=none; b=sH4G+cIitLAtqxUPDLnbmVxmh9V/rs/kwKoskCPCxf62e+Oo/VRRGXW96cX3QaQw8yodkVoj31T8dTz3+tH3oUl3Q0HGb6JNg5DGrUEt+mIiVBilJcZkUSKgf4AW0bHRwHcJuKnWzitmxg4X3Saq/yaPCEYHUBmuH0kop9P+Sy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110925; c=relaxed/simple;
	bh=535L7YKcKU6rQTDARlL923g9qoZ1jGWxJtYl2A0wXzg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uR6LDPJzMsXnJIRBDy2yGbpSX5LA7lDZWozTAJEBp470F958sOghRTJ0K7pni7a1dwhnE/fe4oun+lHJZRdfy5HZgUuPBe+MPmEd24HYOdfXaSN0vzYOMUfA8VjSDcYdgUBWXm/NZB11rMFn/c9SQAp17s32IW0M7lofd+qnVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=KzZm60fN; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758110918; x=1758370118;
	bh=M0GHI6/eNUcqlJHg3JpLjGYacvQy6AUErbY3hv6KNHI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KzZm60fNWXzzJQGWWGdIlOUTcmNe0Vgs26cgCLTtZrKHqmx8tNnaT/bDUqghSAcZI
	 HO2hjvrM1Lukvwzvwes9QLS+OyTUlRN9RNKAa7OTC+XWamS9Q1pkpkJ5i6PH+e4ssU
	 7GzvEx8fT7xuA2PL7/Wt1c9n9tOVBpSQmx7i+cVjcAeGajpJzAxaQXXZxBtTMpFa3S
	 8kl4FEnymfWPS9zJc39jgIwKgKls8mFWELLltiel9tr19yBY/BOxUEdFpb4fYgx7EV
	 +V2AYUZ7WkMJi6tfky5MM3/7EXBPpX9zZgsQB4DRcetIwnNGHlskgxJDdD35LBp5an
	 +srv2PZgTHrZg==
Date: Wed, 17 Sep 2025 12:08:33 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Subject: Re: [PATCH v3 RESEND RESEND 2/3] rust: core abstractions for HID drivers
Message-ID: <87ms6tjn7n.fsf@protonmail.com>
In-Reply-To: <wjfjzjc626n55zvhksiyldobwubr2imbvfavqej333lvnka2wn@r4zfcjqtanvu>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com> <20250913161222.3889-3-sergeantsagara@protonmail.com> <wjfjzjc626n55zvhksiyldobwubr2imbvfavqej333lvnka2wn@r4zfcjqtanvu>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 90ebe386a194a7a0d4886862dfc37495c90263b3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Sep, 2025 12:04:30 +0200 "Benjamin Tissoires" <bentiss@kernel.or=
g> wrote:
> On Sep 13 2025, Rahul Rameshbabu wrote:
>> These abstractions enable the development of HID drivers in Rust by bind=
ing
>> with the HID core C API. They provide Rust types that map to the
>> equivalents in C. In this initial draft, only hid_device and hid_device_=
id
>> are provided direct Rust type equivalents. hid_driver is specially wrapp=
ed
>> with a custom Driver type. The module_hid_driver! macro provides analogo=
us
>> functionality to its C equivalent. Only the .report_fixup callback is
>> binded to Rust so far.
>>
>> Future work for these abstractions would include more bindings for commo=
n
>> HID-related types, such as hid_field, hid_report_enum, and hid_report as
>> well as more bus callbacks. Providing Rust equivalents to useful core HI=
D
>> functions will also be necessary for HID driver development in Rust.
>>
>> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> ---
>>
>> Notes:
>>     Some points I did not address from the last review cycle:
>>
>>         * I did not look into autogenerating all the getter functions fo=
r various
>>           fields exported from the binded C structures.
>>           - I would be interested in hearing opinions from folks activel=
y involved
>>             with Rust for Linux on this topic.
>>
>>     Changelog:
>>
>>         v2->v3:
>>           * Implemented AlwaysRefCounted trait using embedded struct dev=
ice's
>>             reference counts instead of the separate reference counter i=
n struct
>>             hid_device
>>           * Used &raw mut as appropriate
>>           * Binded include/linux/device.h for get_device and put_device
>>           * Cleaned up various comment related formatting
>>           * Minified dev_err! format string
>>           * Updated Group enum to be repr(u16)
>>           * Implemented From<u16> trait for Group
>>           * Added TODO comment when const_trait_impl stabilizes
>>           * Made group getter functions return a Group variant instead o=
f a raw
>>             number
>>           * Made sure example code builds
>>         v1->v2:
>>           * Binded drivers/hid/hid-ids.h for use in Rust drivers
>>           * Remove pre-emptive referencing of a C HID driver instance be=
fore
>>             it is fully initialized in the driver registration path
>>           * Moved static getters to generic Device trait implementation,=
 so
>>             they can be used by all device::DeviceContext
>>           * Use core macros for supporting DeviceContext transitions
>>           * Implemented the AlwaysRefCounted and AsRef traits
>>           * Make use for dev_err! as appropriate
>>         RFC->v1:
>>           * Use Danilo's core infrastructure
>>           * Account for HID device groups
>>           * Remove probe and remove callbacks
>>           * Implement report_fixup support
>>           * Properly comment code including SAFETY comments
>>
>>  MAINTAINERS                     |   9 +
>>  drivers/hid/Kconfig             |   8 +
>>  rust/bindings/bindings_helper.h |   3 +
>>  rust/kernel/hid.rs              | 503 ++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs              |   2 +
>>  5 files changed, 525 insertions(+)
>>  create mode 100644 rust/kernel/hid.rs
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index dd810da5261b..6c60765f2aaa 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10686,6 +10686,15 @@ F:=09include/uapi/linux/hid*
>>  F:=09samples/hid/
>>  F:=09tools/testing/selftests/hid/
>>
>> +HID CORE LAYER [RUST]
>> +M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> +R:=09Benjamin Tissoires <bentiss@kernel.org>
>> +L:=09linux-input@vger.kernel.org
>> +S:=09Maintained
>> +T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git rust
>
> FWIW, we (HID maintainers) are still undecided on how to handle that,
> and so it's a little bit postponed for now

Sure, understandable. I am going to send v4 without updating the
MAINTAINERS file, so we are aligned that this is still up for
discussion. My only concern is that I have been holding off patches for
a more complex HID driver in Rust. I am wondering if it would be good to
send out those changes as a separate series that builds on top of this
one while this discussion occurs. Ideally, I do not want to end up in
the situation where I'll have to maintain too many patches out of tree
long term (6+ months). I think starting out of tree and documenting this
on the rust-for-linux project page might be viable. Maybe some input on
the rust-for-linux side would help.

>
>> +F:=09drivers/hid/*.rs
>
> Could you instead make it really independant by relying on
> drivers/hid/rust instead?
> We already have drivers/hid/bpf for HID-BPF related stuff, so it doesn't
> seem to be that much of an issue to have a separate rust dir.
>
> This should allow for a cleaner separation without tinkering in Makefile
> or Kconfig if the HID rust tree is handled separately.

Yeah, having the drivers live in drivers/hid/rust should not be a
problem. Let me send out a v4 to handle this as well as another minor
cleanup in the reference driver I implemented (using hex integer
constants instead of decimal).

>
> Cheers,
> Benjamin
>
>> +F:=09rust/kernel/hid.rs
>> +
>>  HID LOGITECH DRIVERS
>>  R:=09Filipe La=C3=ADns <lains@riseup.net>
>>  L:=09linux-input@vger.kernel.org
>> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
>> index 43859fc75747..922e76e18af2 100644
>> --- a/drivers/hid/Kconfig
>> +++ b/drivers/hid/Kconfig
>> @@ -744,6 +744,14 @@ config HID_MEGAWORLD_FF
>>  =09Say Y here if you have a Mega World based game controller and want
>>  =09to have force feedback support for it.
>>
>> +config RUST_HID_ABSTRACTIONS
>> +=09bool "Rust HID abstractions support"
>> +=09depends on RUST
>> +=09depends on HID=3Dy
>> +=09help
>> +=09  Adds support needed for HID drivers written in Rust. It provides a
>> +=09  wrapper around the C hid core.
>> +
>>  config HID_REDRAGON
>>  =09tristate "Redragon keyboards"
>>  =09default !EXPERT
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index 8cbb660e2ec2..7145fb1cdff1 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -45,6 +45,7 @@
>>  #include <linux/cpufreq.h>
>>  #include <linux/cpumask.h>
>>  #include <linux/cred.h>
>> +#include <linux/device.h>
>>  #include <linux/device/faux.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/errname.h>
>> @@ -52,6 +53,8 @@
>>  #include <linux/file.h>
>>  #include <linux/firmware.h>
>>  #include <linux/fs.h>
>> +#include <linux/hid.h>
>> +#include "../../drivers/hid/hid-ids.h"
>>  #include <linux/jiffies.h>
>>  #include <linux/jump_label.h>
>>  #include <linux/mdio.h>
>> diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
>> new file mode 100644
>> index 000000000000..a93804af8b78
>> --- /dev/null
>> +++ b/rust/kernel/hid.rs
>> @@ -0,0 +1,503 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> +
>> +//! Abstractions for the HID interface.
>> +//!
>> +//! C header: [`include/linux/hid.h`](srctree/include/linux/hid.h)
>> +
>> +use crate::{device, device_id::RawDeviceId, driver, error::*, prelude::=
*, types::Opaque};
>> +use core::{
>> +    marker::PhantomData,
>> +    ptr::{addr_of_mut, NonNull},
>> +};
>> +
>> +/// Indicates the item is static read-only.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_CONSTANT: u8 =3D bindings::HID_MAIN_ITEM_CONSTANT a=
s u8;
>> +
>> +/// Indicates the item represents data from a physical control.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_VARIABLE: u8 =3D bindings::HID_MAIN_ITEM_VARIABLE a=
s u8;
>> +
>> +/// Indicates the item should be treated as a relative change from the =
previous
>> +/// report.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_RELATIVE: u8 =3D bindings::HID_MAIN_ITEM_RELATIVE a=
s u8;
>> +
>> +/// Indicates the item should wrap around when reaching the extreme hig=
h or
>> +/// extreme low values.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_WRAP: u8 =3D bindings::HID_MAIN_ITEM_WRAP as u8;
>> +
>> +/// Indicates the item should wrap around when reaching the extreme hig=
h or
>> +/// extreme low values.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_NONLINEAR: u8 =3D bindings::HID_MAIN_ITEM_NONLINEAR=
 as u8;
>> +
>> +/// Indicates whether the control has a preferred state it will physica=
lly
>> +/// return to without user intervention.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_NO_PREFERRED: u8 =3D bindings::HID_MAIN_ITEM_NO_PRE=
FERRED as u8;
>> +
>> +/// Indicates whether the control has a physical state where it will no=
t send
>> +/// any reports.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_NULL_STATE: u8 =3D bindings::HID_MAIN_ITEM_NULL_STA=
TE as u8;
>> +
>> +/// Indicates whether the control requires host system logic to change =
state.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_VOLATILE: u8 =3D bindings::HID_MAIN_ITEM_VOLATILE a=
s u8;
>> +
>> +/// Indicates whether the item is fixed size or a variable buffer of by=
tes.
>> +///
>> +/// Refer to [Device Class Definition for HID 1.11]
>> +/// Section 6.2.2.5 Input, Output, and Feature Items.
>> +///
>> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/d=
efault/files/hid1_11.pdf
>> +pub const MAIN_ITEM_BUFFERED_BYTE: u8 =3D bindings::HID_MAIN_ITEM_BUFFE=
RED_BYTE as u8;
>> +
>> +/// HID device groups are intended to help categories HID devices based=
 on a set
>> +/// of common quirks and logic that they will require to function corre=
ctly.
>> +#[repr(u16)]
>> +pub enum Group {
>> +    /// Used to match a device against any group when probing.
>> +    Any =3D bindings::HID_GROUP_ANY as u16,
>> +
>> +    /// Indicates a generic device that should need no custom logic fro=
m the
>> +    /// core HID stack.
>> +    Generic =3D bindings::HID_GROUP_GENERIC as u16,
>> +
>> +    /// Maps multitouch devices to hid-multitouch instead of hid-generi=
c.
>> +    Multitouch =3D bindings::HID_GROUP_MULTITOUCH as u16,
>> +
>> +    /// Used for autodetecing and mapping of HID sensor hubs to
>> +    /// hid-sensor-hub.
>> +    SensorHub =3D bindings::HID_GROUP_SENSOR_HUB as u16,
>> +
>> +    /// Used for autodetecing and mapping Win 8 multitouch devices to s=
et the
>> +    /// needed quirks.
>> +    MultitouchWin8 =3D bindings::HID_GROUP_MULTITOUCH_WIN_8 as u16,
>> +
>> +    // Vendor-specific device groups.
>> +    /// Used to distinguish Synpatics touchscreens from other products.=
 The
>> +    /// touchscreens will be handled by hid-multitouch instead, while e=
verything
>> +    /// else will be managed by hid-rmi.
>> +    RMI =3D bindings::HID_GROUP_RMI as u16,
>> +
>> +    /// Used for hid-core handling to automatically identify Wacom devi=
ces and
>> +    /// have them probed by hid-wacom.
>> +    Wacom =3D bindings::HID_GROUP_WACOM as u16,
>> +
>> +    /// Used by logitech-djreceiver and logitech-djdevice to autodetect=
 if
>> +    /// devices paied to the DJ receivers are DJ devices and handle the=
m with
>> +    /// the device driver.
>> +    LogitechDJDevice =3D bindings::HID_GROUP_LOGITECH_DJ_DEVICE as u16,
>> +
>> +    /// Since the Valve Steam Controller only has vendor-specific usage=
s,
>> +    /// prevent hid-generic from parsing its reports since there would =
be
>> +    /// nothing hid-generic could do for the device.
>> +    Steam =3D bindings::HID_GROUP_STEAM as u16,
>> +
>> +    /// Used to differentiate 27 Mhz frequency Logitech DJ devices from=
 other
>> +    /// Logitech DJ devices.
>> +    Logitech27MHzDevice =3D bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE a=
s u16,
>> +
>> +    /// Used for autodetecting and mapping Vivaldi devices to hid-vival=
di.
>> +    Vivaldi =3D bindings::HID_GROUP_VIVALDI as u16,
>> +}
>> +
>> +// TODO: use `const_trait_impl` once stabilized:
>> +//
>> +// ```
>> +// impl const From<Group> for u16 {
>> +//     /// [`Group`] variants are represented by [`u16`] values.
>> +//     fn from(value: Group) -> Self {
>> +//         value as Self
>> +//     }
>> +// }
>> +// ```
>> +impl Group {
>> +    /// Internal function used to convert [`Group`] variants into [`u16=
`].
>> +    const fn into(self) -> u16 {
>> +        self as u16
>> +    }
>> +}
>> +
>> +impl From<u16> for Group {
>> +    /// [`u16`] values can be safely converted to [`Group`] variants.
>> +    fn from(value: u16) -> Self {
>> +        match value.into() {
>> +            bindings::HID_GROUP_GENERIC =3D> Group::Generic,
>> +            bindings::HID_GROUP_MULTITOUCH =3D> Group::Multitouch,
>> +            bindings::HID_GROUP_SENSOR_HUB =3D> Group::SensorHub,
>> +            bindings::HID_GROUP_MULTITOUCH_WIN_8 =3D> Group::Multitouch=
Win8,
>> +            bindings::HID_GROUP_RMI =3D> Group::RMI,
>> +            bindings::HID_GROUP_WACOM =3D> Group::Wacom,
>> +            bindings::HID_GROUP_LOGITECH_DJ_DEVICE =3D> Group::Logitech=
DJDevice,
>> +            bindings::HID_GROUP_STEAM =3D> Group::Steam,
>> +            bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE =3D> Group::Logit=
ech27MHzDevice,
>> +            bindings::HID_GROUP_VIVALDI =3D> Group::Vivaldi,
>> +            _ =3D> Group::Any,
>> +        }
>> +    }
>> +}
>> +
>> +/// The HID device representation.
>> +///
>> +/// This structure represents the Rust abstraction for a C `struct hid_=
device`.
>> +/// The implementation abstracts the usage of an already existing C `st=
ruct
>> +/// hid_device` within Rust code that we get passed from the C side.
>> +///
>> +/// # Invariants
>> +///
>> +/// A [`Device`] instance represents a valid `struct hid_device` create=
d by the
>> +/// C portion of the kernel.
>> +#[repr(transparent)]
>> +pub struct Device<Ctx: device::DeviceContext =3D device::Normal>(
>> +    Opaque<bindings::hid_device>,
>> +    PhantomData<Ctx>,
>> +);
>> +
>> +impl<Ctx: device::DeviceContext> Device<Ctx> {
>> +    fn as_raw(&self) -> *mut bindings::hid_device {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Returns the HID transport bus ID.
>> +    pub fn bus(&self) -> u16 {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.bus
>> +    }
>> +
>> +    /// Returns the HID report group.
>> +    pub fn group(&self) -> Group {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.group.into()
>> +    }
>> +
>> +    /// Returns the HID vendor ID.
>> +    pub fn vendor(&self) -> u32 {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.vendor
>> +    }
>> +
>> +    /// Returns the HID product ID.
>> +    pub fn product(&self) -> u32 {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.product
>> +    }
>> +}
>> +
>> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't dep=
end on `Device`'s generic
>> +// argument.
>> +kernel::impl_device_context_deref!(unsafe { Device });
>> +kernel::impl_device_context_into_aref!(Device);
>> +
>> +// SAFETY: Instances of `Device` are always reference-counted.
>> +unsafe impl crate::types::AlwaysRefCounted for Device {
>> +    fn inc_ref(&self) {
>> +        // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>> +        unsafe { bindings::get_device(&raw mut (*self.as_raw()).dev) };
>> +    }
>> +
>> +    unsafe fn dec_ref(obj: NonNull<Self>) {
>> +        // SAFETY: The safety requirements guarantee that the refcount =
is non-zero.
>> +        unsafe { bindings::put_device(&raw mut (*obj.cast::<bindings::h=
id_device>().as_ptr()).dev) }
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
>> +
>> +        // SAFETY: `dev` points to a valid `struct device`.
>> +        unsafe { device::Device::as_ref(dev) }
>> +    }
>> +}
>> +
>> +/// Abstraction for the HID device ID structure `struct hid_device_id`.
>> +#[repr(transparent)]
>> +#[derive(Clone, Copy)]
>> +pub struct DeviceId(bindings::hid_device_id);
>> +
>> +impl DeviceId {
>> +    /// Equivalent to C's `HID_USB_DEVICE` macro.
>> +    ///
>> +    /// Create a new `hid::DeviceId` from a group, vendor ID, and devic=
e ID
>> +    /// number.
>> +    pub const fn new_usb(group: Group, vendor: u32, product: u32) -> Se=
lf {
>> +        Self(bindings::hid_device_id {
>> +            bus: 0x3, // BUS_USB
>> +            group: group.into(),
>> +            vendor,
>> +            product,
>> +            driver_data: 0,
>> +        })
>> +    }
>> +
>> +    /// Returns the HID transport bus ID.
>> +    pub fn bus(&self) -> u16 {
>> +        self.0.bus
>> +    }
>> +
>> +    /// Returns the HID report group.
>> +    pub fn group(&self) -> Group {
>> +        self.0.group.into()
>> +    }
>> +
>> +    /// Returns the HID vendor ID.
>> +    pub fn vendor(&self) -> u32 {
>> +        self.0.vendor
>> +    }
>> +
>> +    /// Returns the HID product ID.
>> +    pub fn product(&self) -> u32 {
>> +        self.0.product
>> +    }
>> +}
>> +
>> +// SAFETY:
>> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `hid_device_id` a=
nd does not add
>> +//   additional invariants, so it's safe to transmute to `RawType`.
>> +// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
>> +unsafe impl RawDeviceId for DeviceId {
>> +    type RawType =3D bindings::hid_device_id;
>> +
>> +    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings:=
:hid_device_id, driver_data);
>> +
>> +    fn index(&self) -> usize {
>> +        self.0.driver_data
>> +    }
>> +}
>> +
>> +/// [`IdTable`] type for HID.
>> +pub type IdTable<T> =3D &'static dyn kernel::device_id::IdTable<DeviceI=
d, T>;
>> +
>> +/// Create a HID [`IdTable`] with its alias for modpost.
>> +#[macro_export]
>> +macro_rules! hid_device_table {
>> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $t=
able_data: expr) =3D> {
>> +        const $table_name: $crate::device_id::IdArray<
>> +            $crate::hid::DeviceId,
>> +            $id_info_type,
>> +            { $table_data.len() },
>> +        > =3D $crate::device_id::IdArray::new($table_data);
>> +
>> +        $crate::module_device_table!("hid", $module_table_name, $table_=
name);
>> +    };
>> +}
>> +
>> +/// The HID driver trait.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// use kernel::{bindings, device, hid};
>> +///
>> +/// struct MyDriver;
>> +///
>> +/// kernel::hid_device_table!(
>> +///     HID_TABLE,
>> +///     MODULE_HID_TABLE,
>> +///     <MyDriver as hid::Driver>::IdInfo,
>> +///     [(
>> +///         hid::DeviceId::new_usb(
>> +///             hid::Group::Steam,
>> +///             bindings::USB_VENDOR_ID_VALVE,
>> +///             bindings::USB_DEVICE_ID_STEAM_DECK,
>> +///         ),
>> +///         (),
>> +///     )]
>> +/// );
>> +///
>> +/// #[vtable]
>> +/// impl hid::Driver for MyDriver {
>> +///     type IdInfo =3D ();
>> +///     const ID_TABLE: hid::IdTable<Self::IdInfo> =3D &HID_TABLE;
>> +///
>> +///     /// This function is optional to implement.
>> +///     fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device<device::Core>, =
rdesc: &'b mut [u8]) -> &'a [u8] {
>> +///         // Perform some report descriptor fixup.
>> +///         rdesc
>> +///     }
>> +/// }
>> +/// ```
>> +/// Drivers must implement this trait in order to get a HID driver regi=
stered.
>> +/// Please refer to the `Adapter` documentation for an example.
>> +#[vtable]
>> +pub trait Driver: Send {
>> +    /// The type holding information about each device id supported by =
the driver.
>> +    // TODO: Use `associated_type_defaults` once stabilized:
>> +    //
>> +    // ```
>> +    // type IdInfo: 'static =3D ();
>> +    // ```
>> +    type IdInfo: 'static;
>> +
>> +    /// The table of device ids supported by the driver.
>> +    const ID_TABLE: IdTable<Self::IdInfo>;
>> +
>> +    /// Called before report descriptor parsing. Can be used to mutate =
the
>> +    /// report descriptor before the core HID logic processes the descr=
iptor.
>> +    /// Useful for problematic report descriptors that prevent HID devi=
ces from
>> +    /// functioning correctly.
>> +    ///
>> +    /// Optional to implement.
>> +    fn report_fixup<'a, 'b: 'a>(_hdev: &Device<device::Core>, _rdesc: &=
'b mut [u8]) -> &'a [u8] {
>> +        build_error!(VTABLE_DEFAULT_ERROR)
>> +    }
>> +}
>> +
>> +/// An adapter for the registration of HID drivers.
>> +pub struct Adapter<T: Driver>(T);
>> +
>> +// SAFETY: A call to `unregister` for a given instance of `RegType` is =
guaranteed to be valid if
>> +// a preceding call to `register` has been successful.
>> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T>=
 {
>> +    type RegType =3D bindings::hid_driver;
>> +
>> +    unsafe fn register(
>> +        hdrv: &Opaque<Self::RegType>,
>> +        name: &'static CStr,
>> +        module: &'static ThisModule,
>> +    ) -> Result {
>> +        // SAFETY: It's safe to set the fields of `struct hid_driver` o=
n initialization.
>> +        unsafe {
>> +            (*hdrv.get()).name =3D name.as_char_ptr();
>> +            (*hdrv.get()).id_table =3D T::ID_TABLE.as_ptr();
>> +            (*hdrv.get()).report_fixup =3D if T::HAS_REPORT_FIXUP {
>> +                Some(Self::report_fixup_callback)
>> +            } else {
>> +                None
>> +            };
>> +        }
>> +
>> +        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
>> +        to_result(unsafe {
>> +            bindings::__hid_register_driver(hdrv.get(), module.0, name.=
as_char_ptr())
>> +        })
>> +    }
>> +
>> +    unsafe fn unregister(hdrv: &Opaque<Self::RegType>) {
>> +        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
>> +        unsafe { bindings::hid_unregister_driver(hdrv.get()) }
>> +    }
>> +}
>> +
>> +impl<T: Driver + 'static> Adapter<T> {
>> +    extern "C" fn report_fixup_callback(
>> +        hdev: *mut bindings::hid_device,
>> +        buf: *mut u8,
>> +        size: *mut kernel::ffi::c_uint,
>> +    ) -> *const u8 {
>> +        // SAFETY: The HID subsystem only ever calls the report_fixup c=
allback
>> +        // with a valid pointer to a `struct hid_device`.
>> +        //
>> +        // INVARIANT: `hdev` is valid for the duration of
>> +        // `report_fixup_callback()`.
>> +        let hdev =3D unsafe { &*hdev.cast::<Device<device::Core>>() };
>> +
>> +        // SAFETY: The HID subsystem only ever calls the report_fixup c=
allback
>> +        // with a valid pointer to a `kernel::ffi::c_uint`.
>> +        //
>> +        // INVARIANT: `size` is valid for the duration of
>> +        // `report_fixup_callback()`.
>> +        let buf_len: usize =3D match unsafe { *size }.try_into() {
>> +            Ok(len) =3D> len,
>> +            Err(e) =3D> {
>> +                dev_err!(
>> +                    hdev.as_ref(),
>> +                    "Cannot fix report description due to {}!\n",
>> +                    e
>> +                );
>> +
>> +                return buf;
>> +            }
>> +        };
>> +
>> +        // Build a mutable Rust slice from `buf` and `size`.
>> +        //
>> +        // SAFETY: The HID subsystem only ever calls the `report_fixup =
callback`
>> +        // with a valid pointer to a `u8` buffer.
>> +        //
>> +        // INVARIANT: `buf` is valid for the duration of
>> +        // `report_fixup_callback()`.
>> +        let rdesc_slice =3D unsafe { core::slice::from_raw_parts_mut(bu=
f, buf_len) };
>> +        let rdesc_slice =3D T::report_fixup(hdev, rdesc_slice);
>> +
>> +        match rdesc_slice.len().try_into() {
>> +            // SAFETY: The HID subsystem only ever calls the report_fix=
up
>> +            // callback with a valid pointer to a `kernel::ffi::c_uint`=
.
>> +            //
>> +            // INVARIANT: `size` is valid for the duration of
>> +            // `report_fixup_callback()`.
>> +            Ok(len) =3D> unsafe { *size =3D len },
>> +            Err(e) =3D> {
>> +                dev_err!(
>> +                    hdev.as_ref(),
>> +                    "Fixed report description will not be used due to {=
}!\n",
>> +                    e
>> +                );
>> +
>> +                return buf;
>> +            }
>> +        }
>> +
>> +        rdesc_slice.as_ptr()
>> +    }
>> +}
>> +
>> +/// Declares a kernel module that exposes a single HID driver.
>> +///
>> +/// # Examples
>> +///
>> +/// ```ignore
>> +/// kernel::module_hid_driver! {
>> +///     type: MyDriver,
>> +///     name: "Module name",
>> +///     authors: ["Author name"],
>> +///     description: "Description",
>> +///     license: "GPL",
>> +/// }
>> +/// ```
>> +#[macro_export]
>> +macro_rules! module_hid_driver {
>> +    ($($f:tt)*) =3D> {
>> +        $crate::module_driver!(<T>, $crate::hid::Adapter<T>, { $($f)* }=
);
>> +    };
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index e88bc4b27d6e..44c107f20174 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -80,6 +80,8 @@
>>  pub mod firmware;
>>  pub mod fmt;
>>  pub mod fs;
>> +#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
>> +pub mod hid;
>>  pub mod init;
>>  pub mod io;
>>  pub mod ioctl;
>> --
>> 2.47.2
>>
>>



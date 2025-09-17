Return-Path: <linux-input+bounces-14823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E3AB82331
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 00:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 774AF48897A
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 22:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D728A311946;
	Wed, 17 Sep 2025 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Qc73yjXc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3F30F930;
	Wed, 17 Sep 2025 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758149655; cv=none; b=NrRnfB41sbstV3JFfNDZuvGfD17THwsYgu3j5tJSZBlH+j7LgkVsc3wGjlpxBGPJx9M4B5817d4hPkJeoWuzZuaAdFwlYxM9W+9zfu5q/twSp2WWHAURDutAmIr+IPrWWOLJ08y6lNOv/CQt8ybOyZu/yLKuBh/Vte//IXVZHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758149655; c=relaxed/simple;
	bh=X6BLMUVSTVoPFj3K9ETMswsR2+nNvZcR9KJW8Ennl48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+R9UwxTxQc3BxC30QSufM5kBaDQnriEHrQ46g08r/H2JpzmsY6AhjisD9wSTfCxxPnwmayUib9+GTcbSRQtUZD98hAUSTggtN59ozbAIkt/ZMG0i6amrNpW/o9O2vd8de+yfERqnrs6+uP2mUQpKwjPM/T+Wbb3dwE23YomAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Qc73yjXc; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758149643; x=1758408843;
	bh=e1rC3AAdlL7j2HuzeQQW8sbC/df+L8rjBfA99trFUkM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Qc73yjXcRFYXI8ydTrvf3A3ZJi5bwENYfL57if9IJoL9NGKon+HFOhhRLBQdYXl/C
	 g3ClbVhVsguOCIjZauL6ywMrRCRjDX8j/EPndqcP7+tNDSIecgATGR5rmQV+sZG6Oq
	 jJ0dv+wt6TSNj8aiC3PIe1mb8eBy2zQ3hhsHmpxVqzyddnEk7gdaIqiM1QgEIafvYF
	 qq49vtfgltlLqEdJh+vm6uavMm4XOM0u9Fbp/vTN8/NkwyAFFOT6rZJu51Y68HSFsE
	 QGyOwa72t2YY4X2aQh7Jqfg1+yZsfslF872t71Uo8GkQ40irJPYoOPnc0NOrghQkei
	 aLsq/U6RhPZaQ==
Date: Wed, 17 Sep 2025 22:53:56 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v4 1/2] rust: core abstractions for HID drivers
Message-ID: <20250917225341.4572-2-sergeantsagara@protonmail.com>
In-Reply-To: <20250917225341.4572-1-sergeantsagara@protonmail.com>
References: <20250917225341.4572-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 0f53f5975de70ae369163842aee25bd43e5b9e87
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These abstractions enable the development of HID drivers in Rust by binding
with the HID core C API. They provide Rust types that map to the
equivalents in C. In this initial draft, only hid_device and hid_device_id
are provided direct Rust type equivalents. hid_driver is specially wrapped
with a custom Driver type. The module_hid_driver! macro provides analogous
functionality to its C equivalent. Only the .report_fixup callback is
binded to Rust so far.

Future work for these abstractions would include more bindings for common
HID-related types, such as hid_field, hid_report_enum, and hid_report as
well as more bus callbacks. Providing Rust equivalents to useful core HID
functions will also be necessary for HID driver development in Rust.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---

Notes:
    Changelog:
   =20
        v3->v4:
          * Removed specifying tree in MAINTAINERS file since that is up fo=
r
            debate
          * Minor rebase cleanup
          * Moved driver logic under drivers/hid/rust
        v2->v3:
          * Implemented AlwaysRefCounted trait using embedded struct device=
's
            reference counts instead of the separate reference counter in s=
truct
            hid_device
          * Used &raw mut as appropriate
          * Binded include/linux/device.h for get_device and put_device
          * Cleaned up various comment related formatting
          * Minified dev_err! format string
          * Updated Group enum to be repr(u16)
          * Implemented From<u16> trait for Group
          * Added TODO comment when const_trait_impl stabilizes
          * Made group getter functions return a Group variant instead of a=
 raw
            number
          * Made sure example code builds
        v1->v2:
          * Binded drivers/hid/hid-ids.h for use in Rust drivers
          * Remove pre-emptive referencing of a C HID driver instance befor=
e
            it is fully initialized in the driver registration path
          * Moved static getters to generic Device trait implementation, so
            they can be used by all device::DeviceContext
          * Use core macros for supporting DeviceContext transitions
          * Implemented the AlwaysRefCounted and AsRef traits
          * Make use for dev_err! as appropriate
        RFC->v1:
          * Use Danilo's core infrastructure
          * Account for HID device groups
          * Remove probe and remove callbacks
          * Implement report_fixup support
          * Properly comment code including SAFETY comments

 MAINTAINERS                     |   8 +
 drivers/hid/Kconfig             |   2 +
 drivers/hid/rust/Kconfig        |  12 +
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/hid.rs              | 497 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 524 insertions(+)
 create mode 100644 drivers/hid/rust/Kconfig
 create mode 100644 rust/kernel/hid.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..dc597bfe1a54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10850,6 +10850,14 @@ F:=09include/uapi/linux/hid*
 F:=09samples/hid/
 F:=09tools/testing/selftests/hid/
=20
+HID CORE LAYER [RUST]
+M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
+R:=09Benjamin Tissoires <bentiss@kernel.org>
+L:=09linux-input@vger.kernel.org
+S:=09Maintained
+F:=09drivers/hid/rust/*.rs
+F:=09rust/kernel/hid.rs
+
 HID LOGITECH DRIVERS
 R:=09Filipe La=C3=ADns <lains@riseup.net>
 L:=09linux-input@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 79997553d8f9..073771d95966 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1420,6 +1420,8 @@ endmenu
=20
 source "drivers/hid/bpf/Kconfig"
=20
+source "drivers/hid/rust/Kconfig"
+
 source "drivers/hid/i2c-hid/Kconfig"
=20
 source "drivers/hid/intel-ish-hid/Kconfig"
diff --git a/drivers/hid/rust/Kconfig b/drivers/hid/rust/Kconfig
new file mode 100644
index 000000000000..d3247651829e
--- /dev/null
+++ b/drivers/hid/rust/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Rust HID support"
+
+config RUST_HID_ABSTRACTIONS
+=09bool "Rust HID abstractions support"
+=09depends on RUST
+=09depends on HID=3Dy
+=09help
+=09  Adds support needed for HID drivers written in Rust. It provides a
+=09  wrapper around the C hid core.
+
+endmenu # Rust HID support
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 4ad9add117ea..773468788d98 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -46,6 +46,7 @@
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/device.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
@@ -53,6 +54,8 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/hid.h>
+#include "../../drivers/hid/hid-ids.h"
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
new file mode 100644
index 000000000000..588483bf7204
--- /dev/null
+++ b/rust/kernel/hid.rs
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+//! Abstractions for the HID interface.
+//!
+//! C header: [`include/linux/hid.h`](srctree/include/linux/hid.h)
+
+use crate::{device, device_id::RawDeviceId, driver, error::*, prelude::*, =
types::Opaque};
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of_mut, NonNull},
+};
+
+/// Indicates the item is static read-only.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_CONSTANT: u8 =3D bindings::HID_MAIN_ITEM_CONSTANT as u=
8;
+
+/// Indicates the item represents data from a physical control.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_VARIABLE: u8 =3D bindings::HID_MAIN_ITEM_VARIABLE as u=
8;
+
+/// Indicates the item should be treated as a relative change from the pre=
vious
+/// report.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_RELATIVE: u8 =3D bindings::HID_MAIN_ITEM_RELATIVE as u=
8;
+
+/// Indicates the item should wrap around when reaching the extreme high o=
r
+/// extreme low values.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_WRAP: u8 =3D bindings::HID_MAIN_ITEM_WRAP as u8;
+
+/// Indicates the item should wrap around when reaching the extreme high o=
r
+/// extreme low values.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_NONLINEAR: u8 =3D bindings::HID_MAIN_ITEM_NONLINEAR as=
 u8;
+
+/// Indicates whether the control has a preferred state it will physically
+/// return to without user intervention.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_NO_PREFERRED: u8 =3D bindings::HID_MAIN_ITEM_NO_PREFER=
RED as u8;
+
+/// Indicates whether the control has a physical state where it will not s=
end
+/// any reports.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_NULL_STATE: u8 =3D bindings::HID_MAIN_ITEM_NULL_STATE =
as u8;
+
+/// Indicates whether the control requires host system logic to change sta=
te.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_VOLATILE: u8 =3D bindings::HID_MAIN_ITEM_VOLATILE as u=
8;
+
+/// Indicates whether the item is fixed size or a variable buffer of bytes=
.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_BUFFERED_BYTE: u8 =3D bindings::HID_MAIN_ITEM_BUFFERED=
_BYTE as u8;
+
+/// HID device groups are intended to help categories HID devices based on=
 a set
+/// of common quirks and logic that they will require to function correctl=
y.
+#[repr(u16)]
+pub enum Group {
+    /// Used to match a device against any group when probing.
+    Any =3D bindings::HID_GROUP_ANY as u16,
+
+    /// Indicates a generic device that should need no custom logic from t=
he
+    /// core HID stack.
+    Generic =3D bindings::HID_GROUP_GENERIC as u16,
+
+    /// Maps multitouch devices to hid-multitouch instead of hid-generic.
+    Multitouch =3D bindings::HID_GROUP_MULTITOUCH as u16,
+
+    /// Used for autodetecing and mapping of HID sensor hubs to
+    /// hid-sensor-hub.
+    SensorHub =3D bindings::HID_GROUP_SENSOR_HUB as u16,
+
+    /// Used for autodetecing and mapping Win 8 multitouch devices to set =
the
+    /// needed quirks.
+    MultitouchWin8 =3D bindings::HID_GROUP_MULTITOUCH_WIN_8 as u16,
+
+    // Vendor-specific device groups.
+    /// Used to distinguish Synpatics touchscreens from other products. Th=
e
+    /// touchscreens will be handled by hid-multitouch instead, while ever=
ything
+    /// else will be managed by hid-rmi.
+    RMI =3D bindings::HID_GROUP_RMI as u16,
+
+    /// Used for hid-core handling to automatically identify Wacom devices=
 and
+    /// have them probed by hid-wacom.
+    Wacom =3D bindings::HID_GROUP_WACOM as u16,
+
+    /// Used by logitech-djreceiver and logitech-djdevice to autodetect if
+    /// devices paied to the DJ receivers are DJ devices and handle them w=
ith
+    /// the device driver.
+    LogitechDJDevice =3D bindings::HID_GROUP_LOGITECH_DJ_DEVICE as u16,
+
+    /// Since the Valve Steam Controller only has vendor-specific usages,
+    /// prevent hid-generic from parsing its reports since there would be
+    /// nothing hid-generic could do for the device.
+    Steam =3D bindings::HID_GROUP_STEAM as u16,
+
+    /// Used to differentiate 27 Mhz frequency Logitech DJ devices from ot=
her
+    /// Logitech DJ devices.
+    Logitech27MHzDevice =3D bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE as u=
16,
+
+    /// Used for autodetecting and mapping Vivaldi devices to hid-vivaldi.
+    Vivaldi =3D bindings::HID_GROUP_VIVALDI as u16,
+}
+
+// TODO: use `const_trait_impl` once stabilized:
+//
+// ```
+// impl const From<Group> for u16 {
+//     /// [`Group`] variants are represented by [`u16`] values.
+//     fn from(value: Group) -> Self {
+//         value as Self
+//     }
+// }
+// ```
+impl Group {
+    /// Internal function used to convert [`Group`] variants into [`u16`].
+    const fn into(self) -> u16 {
+        self as u16
+    }
+}
+
+impl From<u16> for Group {
+    /// [`u16`] values can be safely converted to [`Group`] variants.
+    fn from(value: u16) -> Self {
+        match value.into() {
+            bindings::HID_GROUP_GENERIC =3D> Group::Generic,
+            bindings::HID_GROUP_MULTITOUCH =3D> Group::Multitouch,
+            bindings::HID_GROUP_SENSOR_HUB =3D> Group::SensorHub,
+            bindings::HID_GROUP_MULTITOUCH_WIN_8 =3D> Group::MultitouchWin=
8,
+            bindings::HID_GROUP_RMI =3D> Group::RMI,
+            bindings::HID_GROUP_WACOM =3D> Group::Wacom,
+            bindings::HID_GROUP_LOGITECH_DJ_DEVICE =3D> Group::LogitechDJD=
evice,
+            bindings::HID_GROUP_STEAM =3D> Group::Steam,
+            bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE =3D> Group::Logitech=
27MHzDevice,
+            bindings::HID_GROUP_VIVALDI =3D> Group::Vivaldi,
+            _ =3D> Group::Any,
+        }
+    }
+}
+
+/// The HID device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct hid_dev=
ice`.
+/// The implementation abstracts the usage of an already existing C `struc=
t
+/// hid_device` within Rust code that we get passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct hid_device` created b=
y the
+/// C portion of the kernel.
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext =3D device::Normal>(
+    Opaque<bindings::hid_device>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    fn as_raw(&self) -> *mut bindings::hid_device {
+        self.0.get()
+    }
+
+    /// Returns the HID transport bus ID.
+    pub fn bus(&self) -> u16 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_devic=
e`
+        unsafe { *self.as_raw() }.bus
+    }
+
+    /// Returns the HID report group.
+    pub fn group(&self) -> Group {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_devic=
e`
+        unsafe { *self.as_raw() }.group.into()
+    }
+
+    /// Returns the HID vendor ID.
+    pub fn vendor(&self) -> u32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_devic=
e`
+        unsafe { *self.as_raw() }.vendor
+    }
+
+    /// Returns the HID product ID.
+    pub fn product(&self) -> u32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_devic=
e`
+        unsafe { *self.as_raw() }.product
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend=
 on `Device`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { Device });
+kernel::impl_device_context_into_aref!(Device);
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the=
 refcount is non-zero.
+        unsafe { bindings::get_device(&raw mut (*self.as_raw()).dev) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is =
non-zero.
+        unsafe { bindings::put_device(&raw mut (*obj.cast::<bindings::hid_=
device>().as_ptr()).dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx=
> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a p=
ointer to a valid
+        // `struct hid_device`.
+        let dev =3D unsafe { addr_of_mut!((*self.as_raw()).dev) };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+/// Abstraction for the HID device ID structure `struct hid_device_id`.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::hid_device_id);
+
+impl DeviceId {
+    /// Equivalent to C's `HID_USB_DEVICE` macro.
+    ///
+    /// Create a new `hid::DeviceId` from a group, vendor ID, and device I=
D
+    /// number.
+    pub const fn new_usb(group: Group, vendor: u32, product: u32) -> Self =
{
+        Self(bindings::hid_device_id {
+            bus: 0x3, // BUS_USB
+            group: group.into(),
+            vendor,
+            product,
+            driver_data: 0,
+        })
+    }
+
+    /// Returns the HID transport bus ID.
+    pub fn bus(&self) -> u16 {
+        self.0.bus
+    }
+
+    /// Returns the HID report group.
+    pub fn group(&self) -> Group {
+        self.0.group.into()
+    }
+
+    /// Returns the HID vendor ID.
+    pub fn vendor(&self) -> u32 {
+        self.0.vendor
+    }
+
+    /// Returns the HID product ID.
+    pub fn product(&self) -> u32 {
+        self.0.product
+    }
+}
+
+// SAFETY:
+// * `DeviceId` is a `#[repr(transparent)` wrapper of `hid_device_id` and =
does not add
+//   additional invariants, so it's safe to transmute to `RawType`.
+// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType =3D bindings::hid_device_id;
+}
+
+/// [`IdTable`] type for HID.
+pub type IdTable<T> =3D &'static dyn kernel::device_id::IdTable<DeviceId, =
T>;
+
+/// Create a HID [`IdTable`] with its alias for modpost.
+#[macro_export]
+macro_rules! hid_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $tabl=
e_data: expr) =3D> {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::hid::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > =3D $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("hid", $module_table_name, $table_nam=
e);
+    };
+}
+
+/// The HID driver trait.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{bindings, device, hid};
+///
+/// struct MyDriver;
+///
+/// kernel::hid_device_table!(
+///     HID_TABLE,
+///     MODULE_HID_TABLE,
+///     <MyDriver as hid::Driver>::IdInfo,
+///     [(
+///         hid::DeviceId::new_usb(
+///             hid::Group::Steam,
+///             bindings::USB_VENDOR_ID_VALVE,
+///             bindings::USB_DEVICE_ID_STEAM_DECK,
+///         ),
+///         (),
+///     )]
+/// );
+///
+/// #[vtable]
+/// impl hid::Driver for MyDriver {
+///     type IdInfo =3D ();
+///     const ID_TABLE: hid::IdTable<Self::IdInfo> =3D &HID_TABLE;
+///
+///     /// This function is optional to implement.
+///     fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device<device::Core>, rde=
sc: &'b mut [u8]) -> &'a [u8] {
+///         // Perform some report descriptor fixup.
+///         rdesc
+///     }
+/// }
+/// ```
+/// Drivers must implement this trait in order to get a HID driver registe=
red.
+/// Please refer to the `Adapter` documentation for an example.
+#[vtable]
+pub trait Driver: Send {
+    /// The type holding information about each device id supported by the=
 driver.
+    // TODO: Use `associated_type_defaults` once stabilized:
+    //
+    // ```
+    // type IdInfo: 'static =3D ();
+    // ```
+    type IdInfo: 'static;
+
+    /// The table of device ids supported by the driver.
+    const ID_TABLE: IdTable<Self::IdInfo>;
+
+    /// Called before report descriptor parsing. Can be used to mutate the
+    /// report descriptor before the core HID logic processes the descript=
or.
+    /// Useful for problematic report descriptors that prevent HID devices=
 from
+    /// functioning correctly.
+    ///
+    /// Optional to implement.
+    fn report_fixup<'a, 'b: 'a>(_hdev: &Device<device::Core>, _rdesc: &'b =
mut [u8]) -> &'a [u8] {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
+
+/// An adapter for the registration of HID drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is gua=
ranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType =3D bindings::hid_driver;
+
+    unsafe fn register(
+        hdrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        // SAFETY: It's safe to set the fields of `struct hid_driver` on i=
nitialization.
+        unsafe {
+            (*hdrv.get()).name =3D name.as_char_ptr();
+            (*hdrv.get()).id_table =3D T::ID_TABLE.as_ptr();
+            (*hdrv.get()).report_fixup =3D if T::HAS_REPORT_FIXUP {
+                Some(Self::report_fixup_callback)
+            } else {
+                None
+            };
+        }
+
+        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
+        to_result(unsafe {
+            bindings::__hid_register_driver(hdrv.get(), module.0, name.as_=
char_ptr())
+        })
+    }
+
+    unsafe fn unregister(hdrv: &Opaque<Self::RegType>) {
+        // SAFETY: `hdrv` is guaranteed to be a valid `RegType`
+        unsafe { bindings::hid_unregister_driver(hdrv.get()) }
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn report_fixup_callback(
+        hdev: *mut bindings::hid_device,
+        buf: *mut u8,
+        size: *mut kernel::ffi::c_uint,
+    ) -> *const u8 {
+        // SAFETY: The HID subsystem only ever calls the report_fixup call=
back
+        // with a valid pointer to a `struct hid_device`.
+        //
+        // INVARIANT: `hdev` is valid for the duration of
+        // `report_fixup_callback()`.
+        let hdev =3D unsafe { &*hdev.cast::<Device<device::Core>>() };
+
+        // SAFETY: The HID subsystem only ever calls the report_fixup call=
back
+        // with a valid pointer to a `kernel::ffi::c_uint`.
+        //
+        // INVARIANT: `size` is valid for the duration of
+        // `report_fixup_callback()`.
+        let buf_len: usize =3D match unsafe { *size }.try_into() {
+            Ok(len) =3D> len,
+            Err(e) =3D> {
+                dev_err!(
+                    hdev.as_ref(),
+                    "Cannot fix report description due to {}!\n",
+                    e
+                );
+
+                return buf;
+            }
+        };
+
+        // Build a mutable Rust slice from `buf` and `size`.
+        //
+        // SAFETY: The HID subsystem only ever calls the `report_fixup cal=
lback`
+        // with a valid pointer to a `u8` buffer.
+        //
+        // INVARIANT: `buf` is valid for the duration of
+        // `report_fixup_callback()`.
+        let rdesc_slice =3D unsafe { core::slice::from_raw_parts_mut(buf, =
buf_len) };
+        let rdesc_slice =3D T::report_fixup(hdev, rdesc_slice);
+
+        match rdesc_slice.len().try_into() {
+            // SAFETY: The HID subsystem only ever calls the report_fixup
+            // callback with a valid pointer to a `kernel::ffi::c_uint`.
+            //
+            // INVARIANT: `size` is valid for the duration of
+            // `report_fixup_callback()`.
+            Ok(len) =3D> unsafe { *size =3D len },
+            Err(e) =3D> {
+                dev_err!(
+                    hdev.as_ref(),
+                    "Fixed report description will not be used due to {}!\=
n",
+                    e
+                );
+
+                return buf;
+            }
+        }
+
+        rdesc_slice.as_ptr()
+    }
+}
+
+/// Declares a kernel module that exposes a single HID driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_hid_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_hid_driver {
+    ($($f:tt)*) =3D> {
+        $crate::module_driver!(<T>, $crate::hid::Adapter<T>, { $($f)* });
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 733f4d4e9bae..1e50912e81f6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -89,6 +89,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
+pub mod hid;
 pub mod init;
 pub mod io;
 pub mod ioctl;
--=20
2.51.0




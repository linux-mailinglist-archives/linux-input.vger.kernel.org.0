Return-Path: <linux-input+bounces-13508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3865B032FD
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B840E189546C
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAA21D63E6;
	Sun, 13 Jul 2025 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="K+mL8JAM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAC1C6FF5
	for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441160; cv=none; b=aRG5I6jlXYsI3mjYNAk7Vg4H/wsDXvheUhuJfCJoBCI2mk1QZ/QDy7ZKMe5D2hfGv9xyjTJt54E1cxBLgz5MJjo7AC5HDDY+2fg0vENlYau5P71fVaNx0R6/+NtOFC5FrRVUDD6keJFRH9Q455VqZUXl4fBez58K7rF0o4y7MSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441160; c=relaxed/simple;
	bh=a3MlaaToiE/g0BfgkhPggOJe30quh9kEUMHSvzbpRgg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8Cf/aS9cBrawUxJX2iCc/LHIvZq3xRzFkQfWgaGbx393fi5Mki+xvLUaSeGsNwJEcnmbS8JHf4N3x9IRpv5cFUROp3c/PD8k+5zCDN8xIId26DrBUPA71pzWc59dbgcnUsTMcHgLHABm5jAo4UlsZP9kYHY9OQ3UCZg/gDq9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=K+mL8JAM; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752441155; x=1752700355;
	bh=dTD9sQ6/UZ26ueSi6UGZcwodv4Ivi2nOfO6CYmZEdhU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K+mL8JAMfMrsnCPBDywwBo2j/kyW3/FB+xDnNG5kxuM1PNkjGnEa4+9cWHsg9GaI3
	 eZe1OkDR9Ich9+3aA3x63fV4kTPGnFX1QU5ACquX1g/7P2W93dftyvOJ4N6Z2Z+nij
	 affzIJlNV2U8zpVB+5fHL1rO7ylWUr+ekaKUIXipJ4w/3NuDLZVAdUb5YTqc40QgV4
	 oTZ6d3SGca/sxPPTtufIlOyzF7aBU9f3Db2ti1EHCmfVduYicQWSdntRsRQlqdiD2w
	 sNpjDWl+lBqEmXGxsR0BtZHkLELoxu+beyf2FVi+7XEzru/8nKagkpmcYdPb+tQG/2
	 4yusM7/0ExafA==
Date: Sun, 13 Jul 2025 21:12:33 +0000
To: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2 3/4] rust: core abstractions for HID drivers
Message-ID: <20250713211012.101476-10-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-4-sergeantsagara@protonmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 5591e1295bd163adff092975a6edd61e1b0ce476
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These abstractions enable the development of HID drivers in Rust by binding=
 with
the HID core C API. They provide Rust types that map to the equivalents in =
C. In
this initial draft, only hid_device and hid_device_id are provided direct R=
ust
type equivalents. hid_driver is specially wrapped with a custom Driver type=
. The
module_hid_driver! macro provides analogous functionality to its C equivale=
nt.
Only the .report_fixup callback is binded to Rust so far.

Future work for these abstractions would include more bindings for common
HID-related types, such as hid_field, hid_report_enum, and hid_report as we=
ll as
more bus callbacks. Providing Rust equivalents to useful core HID functions=
 will
also be necessary for HID driver development in Rust.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---

Notes:
    Notes:
   =20
        Some points I did not address from the last review cycle:
   =20
          * Enabling CONFIG_HID=3Dm with the Rust bindings
            - This is a limitation due to the Makefile rules that currently=
 exist,
              compiling all the Rust bindings into kernel.o, which gets lin=
ked into the
              core kernel image.
              From rust/Makefile
                $(obj)/kernel.o: private rustc_target_flags =3D --extern ff=
i --extern pin_init \
                    --extern build_error --extern macros --extern bindings =
--extern uapi
                $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o =
$(obj)/pin_init.o \
                    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.=
o FORCE
                  +$(call if_changed_rule,rustc_library)
   =20
                ifdef CONFIG_JUMP_LABEL
                $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch=
_asm.rs
                endif
            - I would be happy to work on support for module-level bindings=
, but this is
              not a problem unique only to the Rust HID binding work.
          * I did not look into autogenerating all the getter functions for=
 various
            fields exported from the binded C structures.
            - I would be interested in hearing opinions from folks actively=
 involved
              with Rust for Linux on this topic.
   =20
        Changelog:
   =20
          RFC->v1:
            * Use Danilo's core infrastructure
            * Account for HID device groups
            * Remove probe and remove callbacks
            * Implement report_fixup support
            * Properly comment code including SAFETY comments
          v1->v2:
            * Binded drivers/hid/hid-ids.h for use in Rust drivers
            * Remove pre-emptive referencing of a C HID driver instance bef=
ore
              it is fully initialized in the driver registration path
            * Moved static getters to generic Device trait implementation, =
so
              they can be used by all device::DeviceContext
            * Use core macros for supporting DeviceContext transitions
            * Implemented the AlwaysRefCounted and AsRef traits
            * Make use for dev_err! as appropriate

 MAINTAINERS                     |   8 +
 drivers/hid/Kconfig             |   8 +
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/hid.rs              | 458 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 478 insertions(+)
 create mode 100644 rust/kernel/hid.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67a..eebc810432c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10686,6 +10686,14 @@ F:=09include/uapi/linux/hid*
 F:=09samples/hid/
 F:=09tools/testing/selftests/hid/
=20
+HID CORE LAYER [RUST]
+M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
+R:=09Benjamin Tissoires <bentiss@kernel.org>
+L:=09rust-for-linux@vger.kernel.org
+S:=09Maintained
+T:=09git https://github.com/Rust-for-Linux/linux.git hid-next
+F:=09rust/kernel/hid.rs
+
 HID LOGITECH DRIVERS
 R:=09Filipe La=C3=ADns <lains@riseup.net>
 L:=09linux-input@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 43859fc75747..5c8839ddc999 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -744,6 +744,14 @@ config HID_MEGAWORLD_FF
 =09Say Y here if you have a Mega World based game controller and want
 =09to have force feedback support for it.
=20
+config RUST_HID_ABSTRACTIONS
+=09bool "Rust HID abstractions support"
+=09depends on RUST
+=09depends on HID=3Dy
+=09help
+=09Adds support needed for HID drivers written in Rust. It provides a
+=09wrapper around the C hid core.
+
 config HID_REDRAGON
 =09tristate "Redragon keyboards"
 =09default !EXPERT
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 41a98d5b6521..0beb334fa64f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,8 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/hid.h>
+#include "../../drivers/hid/hid-ids.h"
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/kref.h>
diff --git a/rust/kernel/hid.rs b/rust/kernel/hid.rs
new file mode 100644
index 000000000000..dabf7dce615f
--- /dev/null
+++ b/rust/kernel/hid.rs
@@ -0,0 +1,458 @@
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
+/// Indicates the item represents data from a physical control.
+///
+/// Refer to [Device Class Definition for HID 1.11]
+/// Section 6.2.2.5 Input, Output, and Feature Items.
+///
+/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/defa=
ult/files/hid1_11.pdf
+pub const MAIN_ITEM_VARIABLE: u8 =3D bindings::HID_MAIN_ITEM_VARIABLE as u=
8;
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
+pub enum Group {
+    /// Indicates a generic device that should need no custom logic from t=
he
+    /// core HID stack.
+    Generic =3D bindings::HID_GROUP_GENERIC as isize,
+    /// Maps multitouch devices to hid-multitouch instead of hid-generic.
+    Multitouch =3D bindings::HID_GROUP_MULTITOUCH as isize,
+    /// Used for autodetecing and mapping of HID sensor hubs to
+    /// hid-sensor-hub.
+    SensorHub =3D bindings::HID_GROUP_SENSOR_HUB as isize,
+    /// Used for autodetecing and mapping Win 8 multitouch devices to set =
the
+    /// needed quirks.
+    MultitouchWin8 =3D bindings::HID_GROUP_MULTITOUCH_WIN_8 as isize,
+
+    /// Used to distinguish Synpatics touchscreens from other products. Th=
e
+    /// touchscreens will be handled by hid-multitouch instead, while ever=
ything
+    /// else will be managed by hid-rmi.
+    RMI =3D bindings::HID_GROUP_RMI as isize,
+    /// Used for hid-core handling to automatically identify Wacom devices=
 and
+    /// have them probed by hid-wacom.
+    Wacom =3D bindings::HID_GROUP_WACOM as isize,
+    /// Used by logitech-djreceiver and logitech-djdevice to autodetect if
+    /// devices paied to the DJ receivers are DJ devices and handle them w=
ith
+    /// the device driver.
+    LogitechDJDevice =3D bindings::HID_GROUP_LOGITECH_DJ_DEVICE as isize,
+    /// Since the Valve Steam Controller only has vendor-specific usages,
+    /// prevent hid-generic from parsing its reports since there would be
+    /// nothing hid-generic could do for the device.
+    Steam =3D bindings::HID_GROUP_STEAM as isize,
+    /// Used to differentiate 27 Mhz frequency Logitech DJ devices from ot=
her
+    /// Logitech DJ devices.
+    Logitech27MHzDevice =3D bindings::HID_GROUP_LOGITECH_27MHZ_DEVICE as i=
size,
+    /// Used for autodetecting and mapping Vivaldi devices to hid-vivaldi.
+    Vivaldi =3D bindings::HID_GROUP_VIVALDI as isize,
+}
+
+impl Group {
+    /// Internal function used to convert Group variants into u16
+    const fn into(self) -> u16 {
+        // variants assigned constants that can be represented as u16
+        self as u16
+    }
+}
+
+/// The HID device representation.
+///
+/// This structure represents the Rust abstraction for a C `struct hid_dev=
ice`. The implementation
+/// abstracts the usage of an already existing C `struct hid_device` withi=
n Rust code that we get
+/// passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct hid_device` created b=
y the C portion of the kernel.
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
+    pub fn group(&self) -> u16 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_devic=
e`
+        unsafe { *self.as_raw() }.group
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
+        unsafe { bindings::kref_get(&mut ((*self.as_raw()).ref_)) }
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is =
non-zero.
+        unsafe {
+            bindings::kref_put(
+                &mut ((*obj.cast::<bindings::hid_device>().as_ptr()).ref_)=
,
+                Some(bindings::hiddev_free),
+            )
+        }
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
+        unsafe { device::Device::as_ref(dev) }
+    }
+}
+
+/// Abstraction for the HID device ID structure ([`struct hid_device_id`])=
.
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
+            bus: 0x3, /* BUS_USB */
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
+    pub fn group(&self) -> u16 {
+        self.0.group
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
+
+    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::hi=
d_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data
+    }
+}
+
+/// IdTable type for HID
+pub type IdTable<T> =3D &'static dyn kernel::device_id::IdTable<DeviceId, =
T>;
+
+/// Create a HID `IdTable` with its alias for modpost.
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
+/// # Example
+///
+///```
+/// use kernel::{bindings, hid};
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
+///         // Perform some report descriptor fixup
+///         rdesc
+///     }
+/// }
+///```
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
+                    "Cannot fix report description due to length conversio=
n failure: {}!\n",
+                    e
+                );
+
+                return buf;
+            }
+        };
+
+        // Build a mutable Rust slice from buf and size
+        //
+        // SAFETY: The HID subsystem only ever calls the report_fixup call=
back
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
+/// # Example
+///
+///```ignore
+/// kernel::module_hid_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL",
+/// }
+///```
+#[macro_export]
+macro_rules! module_hid_driver {
+    ($($f:tt)*) =3D> {
+        $crate::module_driver!(<T>, $crate::hid::Adapter<T>, { $($f)* });
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..a50f7d099e8a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -78,6 +78,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[cfg(CONFIG_RUST_HID_ABSTRACTIONS)]
+pub mod hid;
 pub mod init;
 pub mod io;
 pub mod ioctl;
--=20
2.47.2




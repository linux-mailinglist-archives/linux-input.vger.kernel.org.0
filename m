Return-Path: <linux-input+bounces-14824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FAB82334
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 00:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDCCB488AC7
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 22:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAC830DEBF;
	Wed, 17 Sep 2025 22:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FcHzQ7J6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793433112A1;
	Wed, 17 Sep 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758149661; cv=none; b=ZaYs/sfJsBx9CbJ4TzseGYfH0BSMIKbF2blJTT6Wbra4qfFafcDzeBjD9SdT9GsM3/njHamXNItbwxJAq6LTT1me3n6sawi/5I12Xfo32Q8NYVnMjGvhLd6JfuZEW007N4ZbSZ8Gdkh+gyRB4P0nz4Jz+FcamSlEwYCZtYzfx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758149661; c=relaxed/simple;
	bh=aSjwOOLtLhOM/2Y46WJ45YC0vNqQ+RbCR3PqbdskXB4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBEhtA0keHtFOKqVO4ocyc/W4zJ/Pp9h9HIzanASJDGwZS9z+KZbC51IuuixHNYwjKCzUDPvCAFowycSKSsdjE5Vvh/4fKQiVxC2qu2wGlCJMvuilezJLRGXU2g6stfHdmlHQXYoLBQEITwqnAHejcBXlcFquPRqSvd/FSO5KSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FcHzQ7J6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758149651; x=1758408851;
	bh=n2MaSEsyjKFvpNdLWQLJFmc8quLJdsGAEkd5xAmzcmk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FcHzQ7J6GwXKvN9GuwCW1PqJ5ZO469PSIztWHL3JCqa7aLlhApIL1DUWNeLp+vpKo
	 /q30v2jGZoOH7iAfqFR8eBEoyjzI18bJPOzPND4zQFinAKB+DC0SMab09ZSxtv46co
	 sNUBYA0Fi0fd6tSRIXPiHbg1crI6kXVtzO10dqHeAEXLt7FxgX7QKwetMeKq/7JB6b
	 c88nnPub39aLojrhi7Zu55p71YlJDxHf6mCkzTGPKWOjCyb9q3+oNokA0Wjz79j4Y+
	 4nvRg/yPV2WkNjytvXrzxXJUbsrBp/8Ft9jC67/swNx1UIic+SMDSKn5i/ZYDmvda7
	 Syn5lwtOO04cg==
Date: Wed, 17 Sep 2025 22:54:05 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v4 2/2] rust: hid: Glorious PC Gaming Race Model O and O- mice reference driver
Message-ID: <20250917225341.4572-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250917225341.4572-1-sergeantsagara@protonmail.com>
References: <20250917225341.4572-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 47d9bb2e405e47b444aa7262a7a5c47aec884eb9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Demonstrate how to perform a report fixup from a Rust HID driver. The mice
specify the const flag incorrectly in the consumer input report descriptor,
which leads to inputs being ignored. Correctly patch the report descriptor
for the Model O and O- mice.

Portions of the HID report post-fixup:
device 0:0
...
0x81, 0x06,                    //  Input (Data,Var,Rel)               84
...
0x81, 0x06,                    //  Input (Data,Var,Rel)               112
...
0x81, 0x06,                    //  Input (Data,Var,Rel)               140

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
          * Use hex instead of decimal for the report descriptor comparison=
s
        v2->v3:
          * Fixed docstring formatting
          * Updated MAINTAINERS file based on v1 and v2 discussion
        v1->v2:
          * Use vendor id and device id from drivers/hid/hid-ids.h bindings
          * Make use for dev_err! as appropriate

 MAINTAINERS                           |  6 +++
 drivers/hid/hid-glorious.c            |  2 +
 drivers/hid/hid_glorious_rust.rs      | 60 +++++++++++++++++++++++++++
 drivers/hid/rust/Kconfig              | 16 +++++++
 drivers/hid/rust/Makefile             |  6 +++
 drivers/hid/rust/hid_glorious_rust.rs | 60 +++++++++++++++++++++++++++
 6 files changed, 150 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 drivers/hid/rust/Makefile
 create mode 100644 drivers/hid/rust/hid_glorious_rust.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index dc597bfe1a54..ad2f071efbaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10362,6 +10362,12 @@ L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 F:=09drivers/platform/x86/gigabyte-wmi.c
=20
+GLORIOUS RUST DRIVER [RUST]
+M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
+L:=09linux-input@vger.kernel.org
+S:=09Maintained
+F:=09drivers/hid/rust/hid_glorious_rust.rs
+
 GNSS SUBSYSTEM
 M:=09Johan Hovold <johan@kernel.org>
 S:=09Maintained
diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index 5bbd81248053..d7362852c20f 100644
--- a/drivers/hid/hid-glorious.c
+++ b/drivers/hid/hid-glorious.c
@@ -76,8 +76,10 @@ static int glorious_probe(struct hid_device *hdev,
 }
=20
 static const struct hid_device_id glorious_devices[] =3D {
+#if !IS_ENABLED(CONFIG_HID_GLORIOUS_RUST)
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 =09=09USB_DEVICE_ID_GLORIOUS_MODEL_O) },
+#endif
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
 =09=09USB_DEVICE_ID_GLORIOUS_MODEL_D) },
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
diff --git a/drivers/hid/hid_glorious_rust.rs b/drivers/hid/hid_glorious_ru=
st.rs
new file mode 100644
index 000000000000..8cffc1c605dd
--- /dev/null
+++ b/drivers/hid/hid_glorious_rust.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+//! Rust reference HID driver for Glorious Model O and O- mice.
+
+use kernel::{self, bindings, device, hid, prelude::*};
+
+struct GloriousRust;
+
+kernel::hid_device_table!(
+    HID_TABLE,
+    MODULE_HID_TABLE,
+    <GloriousRust as hid::Driver>::IdInfo,
+    [(
+        hid::DeviceId::new_usb(
+            hid::Group::Generic,
+            bindings::USB_VENDOR_ID_SINOWEALTH,
+            bindings::USB_DEVICE_ID_GLORIOUS_MODEL_O,
+        ),
+        (),
+    )]
+);
+
+#[vtable]
+impl hid::Driver for GloriousRust {
+    type IdInfo =3D ();
+    const ID_TABLE: hid::IdTable<Self::IdInfo> =3D &HID_TABLE;
+
+    /// Fix the Glorious Model O and O- consumer input report descriptor t=
o use
+    /// the variable and relative flag, while clearing the const flag.
+    ///
+    /// Without this fixup, inputs from the mice will be ignored.
+    fn report_fixup<'a, 'b: 'a>(hdev: &hid::Device<device::Core>, rdesc: &=
'b mut [u8]) -> &'a [u8] {
+        if rdesc.len() =3D=3D 213
+            && (rdesc[84] =3D=3D 129 && rdesc[85] =3D=3D 3)
+            && (rdesc[112] =3D=3D 129 && rdesc[113] =3D=3D 3)
+            && (rdesc[140] =3D=3D 129 && rdesc[141] =3D=3D 3)
+        {
+            dev_info!(
+                hdev.as_ref(),
+                "patching Glorious Model O consumer control report descrip=
tor\n"
+            );
+
+            rdesc[85] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATIV=
E;
+            rdesc[113] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATI=
VE;
+            rdesc[141] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATI=
VE;
+        }
+
+        rdesc
+    }
+}
+
+kernel::module_hid_driver! {
+    type: GloriousRust,
+    name: "GloriousRust",
+    authors: ["Rahul Rameshbabu <sergeantsagara@protonmail.com>"],
+    description: "Rust reference HID driver for Glorious Model O and O- mi=
ce",
+    license: "GPL",
+}
diff --git a/drivers/hid/rust/Kconfig b/drivers/hid/rust/Kconfig
index d3247651829e..d7a1bf26bed0 100644
--- a/drivers/hid/rust/Kconfig
+++ b/drivers/hid/rust/Kconfig
@@ -9,4 +9,20 @@ config RUST_HID_ABSTRACTIONS
 =09  Adds support needed for HID drivers written in Rust. It provides a
 =09  wrapper around the C hid core.
=20
+if RUST_HID_ABSTRACTIONS
+
+menu "Special HID drivers"
+
+config HID_GLORIOUS_RUST
+=09tristate "Glorious O and O- mice Rust reference driver"
+=09depends on USB_HID
+=09depends on RUST_HID_ABSTRACTIONS
+=09help
+=09  Support for Glorious PC Gaming Race O and O- mice
+=09  in Rust.
+
+endmenu # Special HID drivers
+
+endif # RUST_HID_ABSTRACTIONS
+
 endmenu # Rust HID support
diff --git a/drivers/hid/rust/Makefile b/drivers/hid/rust/Makefile
new file mode 100644
index 000000000000..6676030a2f87
--- /dev/null
+++ b/drivers/hid/rust/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for Rust HID support
+#
+
+obj-$(CONFIG_HID_GLORIOUS_RUST)=09+=3D hid_glorious_rust.o
diff --git a/drivers/hid/rust/hid_glorious_rust.rs b/drivers/hid/rust/hid_g=
lorious_rust.rs
new file mode 100644
index 000000000000..dfc3f2323b60
--- /dev/null
+++ b/drivers/hid/rust/hid_glorious_rust.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+//! Rust reference HID driver for Glorious Model O and O- mice.
+
+use kernel::{self, bindings, device, hid, prelude::*};
+
+struct GloriousRust;
+
+kernel::hid_device_table!(
+    HID_TABLE,
+    MODULE_HID_TABLE,
+    <GloriousRust as hid::Driver>::IdInfo,
+    [(
+        hid::DeviceId::new_usb(
+            hid::Group::Generic,
+            bindings::USB_VENDOR_ID_SINOWEALTH,
+            bindings::USB_DEVICE_ID_GLORIOUS_MODEL_O,
+        ),
+        (),
+    )]
+);
+
+#[vtable]
+impl hid::Driver for GloriousRust {
+    type IdInfo =3D ();
+    const ID_TABLE: hid::IdTable<Self::IdInfo> =3D &HID_TABLE;
+
+    /// Fix the Glorious Model O and O- consumer input report descriptor t=
o use
+    /// the variable and relative flag, while clearing the const flag.
+    ///
+    /// Without this fixup, inputs from the mice will be ignored.
+    fn report_fixup<'a, 'b: 'a>(hdev: &hid::Device<device::Core>, rdesc: &=
'b mut [u8]) -> &'a [u8] {
+        if rdesc.len() =3D=3D 213
+            && (rdesc[84] =3D=3D 0x81 && rdesc[85] =3D=3D 0x3)
+            && (rdesc[112] =3D=3D 0x81 && rdesc[113] =3D=3D 0x3)
+            && (rdesc[140] =3D=3D 0x81 && rdesc[141] =3D=3D 0x3)
+        {
+            dev_info!(
+                hdev.as_ref(),
+                "patching Glorious Model O consumer control report descrip=
tor\n"
+            );
+
+            rdesc[85] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATIV=
E;
+            rdesc[113] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATI=
VE;
+            rdesc[141] =3D hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATI=
VE;
+        }
+
+        rdesc
+    }
+}
+
+kernel::module_hid_driver! {
+    type: GloriousRust,
+    name: "GloriousRust",
+    authors: ["Rahul Rameshbabu <sergeantsagara@protonmail.com>"],
+    description: "Rust reference HID driver for Glorious Model O and O- mi=
ce",
+    license: "GPL",
+}
--=20
2.51.0




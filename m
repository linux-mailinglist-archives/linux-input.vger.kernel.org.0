Return-Path: <linux-input+bounces-13509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A297CB032FE
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 925E61645B2
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158571DDC1B;
	Sun, 13 Jul 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="PPINCzrn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449171D5CC6
	for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441185; cv=none; b=ZB7BBsNtAEql7/Q1Y6yRDn1ZeUKabNbWyr5pxzGjikqS5nxy7elxgBJJWNLTFfUnlQ+PsvgQaCmd3iPo2oiflv1O0yy0U9WHr6V4e5Rju0xRWVPX6hORbPzVrRz9QYis853dza7zCzByutfI04qhcd9ZKKEJAhyu5IrUOlk/Ou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441185; c=relaxed/simple;
	bh=vJWklknAN5bG6mYcYIflRXdbSGwSRIWMJqNumEoAYbg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9YemMU5VcTxluhC6eDnweh3glvPGNC89ubog+xWWyJPKMnfibzp/8uukyOjwOBtB8O4iQkdM/HLW49vY8MYC0Albg6nZQ7FkW5t72skFAjuHcp8WoFnCHcsfQegCCIFgm6qV3wtth0nb/PUbE8YX6tvcj+3fnXg7uRjk7inU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=PPINCzrn; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752441181; x=1752700381;
	bh=MzQZ2xYPcu0dAEMj2HtpDGIWGoR1dRmkNntfzT/IyQo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PPINCzrnTYr8Hl8KNMcV8LEUqNr9QEubGJPuaTvOkopecuvRlKLs8XYyM39r1SafK
	 85kUEK7Cs5e9ItqbHEAw2M/9dkwmQVhRrOrJ0InZv41kW1XgiB9aaM3XlZ4HxEmBHT
	 M5invRdjLqcywWUAhHkLCdu+Dz7nGpUojWwGwfIHqYIQ9tuXT7PVBMGYLyhDcitLGH
	 XiQQIsZV9uDLkb39nTZgpyFWGr7miaSmElPsHepNMRRVmTsIHa2wWqO+nz0m/zXP+r
	 7KwbqX01N9tggizEi31N0/ZBFKViztNYrnMhkfrdDvquGEnHl3w8cAI9vX3Hd25x9i
	 xfrTKzQZoYfOQ==
Date: Sun, 13 Jul 2025 21:12:57 +0000
To: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2 4/4] rust: hid: Glorious Gaming PC Race Model O and O- mice reference driver
Message-ID: <20250713211012.101476-12-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-4-sergeantsagara@protonmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 6fb618a21eeffe940733de3e44895556d41ee5ec
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
which leads to inputs being ignored. Correctly patch the report descriptor =
for
the Model O and O- mice.

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
        v1->v2:
          * Use vendor id and device id from drivers/hid/hid-ids.h bindings
          * Make use for dev_err! as appropriate

 MAINTAINERS                      |  7 ++++
 drivers/hid/Kconfig              |  8 +++++
 drivers/hid/Makefile             |  1 +
 drivers/hid/hid-glorious.c       |  2 ++
 drivers/hid/hid_glorious_rust.rs | 59 ++++++++++++++++++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index eebc810432c5..9a77078eaae8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10200,6 +10200,13 @@ L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 F:=09drivers/platform/x86/gigabyte-wmi.c
=20
+GLORIOUS RUST DRIVER [RUST]
+M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
+L:=09rust-for-linux@vger.kernel.org
+S:=09Maintained
+T:=09git https://github.com/Rust-for-Linux/linux.git hid-next
+F:=09drivers/hid/hid_glorious_rust.rs
+
 GNSS SUBSYSTEM
 M:=09Johan Hovold <johan@kernel.org>
 S:=09Maintained
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 5c8839ddc999..3592a4de113f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -406,6 +406,14 @@ config HID_GLORIOUS
 =09  Support for Glorious PC Gaming Race mice such as
 =09  the Glorious Model O, O- and D.
=20
+config HID_GLORIOUS_RUST
+=09tristate "Glorious O and O- mice Rust reference driver"
+=09depends on USB_HID
+=09depends on RUST_HID_ABSTRACTIONS
+=09help
+=09  Support for Glorious PC Gaming Race O and O- mice
+=09  in Rust
+
 config HID_HOLTEK
 =09tristate "Holtek HID devices"
 =09depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedbd84..bd86b3db5d88 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_HID_FT260)=09=09+=3D hid-ft260.o
 obj-$(CONFIG_HID_GEMBIRD)=09+=3D hid-gembird.o
 obj-$(CONFIG_HID_GFRM)=09=09+=3D hid-gfrm.o
 obj-$(CONFIG_HID_GLORIOUS)  +=3D hid-glorious.o
+obj-$(CONFIG_HID_GLORIOUS_RUST)=09+=3D hid_glorious_rust.o
 obj-$(CONFIG_HID_VIVALDI_COMMON) +=3D hid-vivaldi-common.o
 obj-$(CONFIG_HID_GOODIX_SPI)=09+=3D hid-goodix-spi.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)=09+=3D hid-google-hammer.o
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
index 000000000000..833e069ff446
--- /dev/null
+++ b/drivers/hid/hid_glorious_rust.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+//! Rust reference HID driver for Glorious Model O and O- mice
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
+    /// Glorious Model O and O- specify the const flag in the consumer inp=
ut
+    /// report descriptor, which leads to inputs being ignored. Fix this b=
y
+    /// patching the descriptor.
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
--=20
2.47.2




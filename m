Return-Path: <linux-input+bounces-14684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E7B5622D
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 18:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B584A5804A2
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 16:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0B2EFD8C;
	Sat, 13 Sep 2025 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="B2w/guqy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A12C21F0
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757780012; cv=none; b=JY17Kiy2nlKC0cLl0WUBgIRI70Iw+okNFl93EkA2A5yuudpXnHqJPWewrR/+4j1wmikVCEDYg2L8+mBEKnbtqXDlR1DFaUnTg0OwjArTim4haffvbcJwslg2jaeG5mQljnvhkI91x0FU4pFZHMXLO2Cve4jv/OKnp6YYpisb3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757780012; c=relaxed/simple;
	bh=JntV3RGjz1Jbe0FoUMzE5n20T/KBYLOoC0wvMbE0SQA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYAqDqxGDFUmSTqqSBwSiDy53HIV8qn4MtiWalcV6Xyyl7IBPrSG0iKVT4vixzTiQERmGCMhomf13zSeZiz4SxMiSFXMH5gr/rMb6oREnO7uhClBX9luJjbKTDpxQLEPSDlMnGupNYUJqVIO4MKVxLfdlDhb+X5H3XFMEGDilC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B2w/guqy; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757780006; x=1758039206;
	bh=xrSdxGPnLC2CBHkZSGp5i4YD6BUUlFfg9BJWTFd34G0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B2w/guqyZMC6xUP+BKyjLDpk67JpDc+IlepJRNMOeCGaEzRj4MkAIl21YxeoTH925
	 ZRCLa4znlAlva9dZC46nsIC17Qw2LtV16BfdfowgUsIh+B7+ik75w55pDYMZzvCN+G
	 0v8tqpT2KoRwlF28+bT/xR2ygXDBOtkQ4UvycBAm2dVVz7VX1XLU6UMO+CzqFg6vle
	 wETlvuR27lrhk5B+hz/eNBUAnF/gmZF2lS2qr+TR9mzy4x0cnEWlocFQczg9YA/zRv
	 l8V6zI1Xx/DR8/fuQS+8Wcpt0J3Gl+fEOHCXGsAQ0u5R8oUsmx58FqHd/W0+BtnE7u
	 JxIl0mRTm/DpA==
Date: Sat, 13 Sep 2025 16:13:18 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v3 RESEND RESEND 3/3] rust: hid: Glorious PC Gaming Race Model O and O- mice reference driver
Message-ID: <20250913161222.3889-4-sergeantsagara@protonmail.com>
In-Reply-To: <20250913161222.3889-1-sergeantsagara@protonmail.com>
References: <20250913161222.3889-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: c6c36e8696197aa0100d1fb66ca71fba0352e3f2
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
        v2->v3:
          * Fixed docstring formatting
          * Updated MAINTAINERS file based on v1 and v2 discussion
        v1->v2:
          * Use vendor id and device id from drivers/hid/hid-ids.h bindings
          * Make use for dev_err! as appropriate

 MAINTAINERS                      |  7 ++++
 drivers/hid/Kconfig              |  8 +++++
 drivers/hid/Makefile             |  1 +
 drivers/hid/hid-glorious.c       |  2 ++
 drivers/hid/hid_glorious_rust.rs | 60 ++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c60765f2aaa..eee9a33914ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10200,6 +10200,13 @@ L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 F:=09drivers/platform/x86/gigabyte-wmi.c
=20
+GLORIOUS RUST DRIVER [RUST]
+M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
+L:=09linux-input@vger.kernel.org
+S:=09Maintained
+T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git rust
+F:=09drivers/hid/hid_glorious_rust.rs
+
 GNSS SUBSYSTEM
 M:=09Johan Hovold <johan@kernel.org>
 S:=09Maintained
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 922e76e18af2..b8ef750fb8b6 100644
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
+=09  in Rust.
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
--=20
2.47.2




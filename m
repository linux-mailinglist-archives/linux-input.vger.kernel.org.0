Return-Path: <linux-input+bounces-13162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB40AECB50
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 06:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9EA01897AB1
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 04:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C531CEAC2;
	Sun, 29 Jun 2025 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="yi08TCEo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D01A3177
	for <linux-input@vger.kernel.org>; Sun, 29 Jun 2025 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172691; cv=none; b=o2wnEyY8cSaZ4szJHogR1yYzX8spqHi7YiCNeVVRFpkXhajwnIS1/NGT5QHcnDbvh2b8M2X4dQIMKq99xqsrUIbSuVjYjnVYYqPK1+OaBHeeZlqC6aIPTM4LA9I5yqRKjBMEDsax8Zl9HhM5k8Mf1MPXaAFANNq1dOKaXjKWYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172691; c=relaxed/simple;
	bh=r6pgP2YT+KhXzWLOpxGrAff5pQBkeiifKotZ6v9FyKY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxPqef8zTYAhULBomvLv2EvC8ysBBpH1MIQWo7AKCkvPQ/aE2MYUjuQeKtBxwjGO3Htnd6B1RzHBcFSw8zUPcTQELbGWPm5F81m775tVNSWpuB+JNZprnW/uFmg06BqRKqr02uv2PyVf2kkTjIfak1rIRVYTj2o7zZQpMQDZue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=yi08TCEo; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751172688; x=1751431888;
	bh=PiQatA7X6ZWFE//uz+K0wZYykkmhBpibhI7byXsdOk4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=yi08TCEoIjlIsDWaUaeWN4nC/4NIIgq1tnl5yL9tQwJY+/ZUIivHAlerDdGrDwZwa
	 385FQgAHHN6tmryQ1rq/rqg+QJ397JSIjjf/FMeiLHSQv6qCPmsa60VEyqRnEBO2qZ
	 NXzO8xAC33PZmpN92axTXhsQCgbFZdvtjEq+qGgN1MXIYII+Tk3A8CIkq9+lyUoFfl
	 KoVuyfwE9djflR2BdQUtsiSX3Mlm7cqQ+9vorUZNSHJSx/59yINba6XfOtOwt5Zo4o
	 iLq7V4DW5SuQqBSHw6phhezqtWLXh+7h7OIMNvW5yaR4AVJruCFPMZaPx422jthd7p
	 MlNsxqMW9dS/Q==
Date: Sun, 29 Jun 2025 04:51:22 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Brooks <db48x@db48x.net>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v1 3/3] rust: hid: Glorious Gaming PC Race Model O and O- mice reference driver
Message-ID: <20250629045031.92358-5-sergeantsagara@protonmail.com>
In-Reply-To: <20250629045031.92358-2-sergeantsagara@protonmail.com>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: e80b2092eed47ffae2d60967a6719db6aa5c5a86
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
 MAINTAINERS                      |  7 ++++
 drivers/hid/Kconfig              |  8 +++++
 drivers/hid/Makefile             |  1 +
 drivers/hid/hid-glorious.c       |  2 ++
 drivers/hid/hid_glorious_rust.rs | 62 ++++++++++++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 487750d9fd1e..80849f76c6c3 100644
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
+T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
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
index 000000000000..de602ae33b2d
--- /dev/null
+++ b/drivers/hid/hid_glorious_rust.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
+
+//! Rust reference HID driver for Glorious Model O and O- mice
+
+use kernel::{self, hid, prelude::*};
+
+const USB_VENDOR_ID_SINOWEALTH: u32 =3D 0x258a;
+const USB_DEVICE_ID_GLORIOUS_MODEL_O: u32 =3D 0x0036;
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
+            USB_VENDOR_ID_SINOWEALTH,
+            USB_DEVICE_ID_GLORIOUS_MODEL_O,
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
+    fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device, rdesc: &'b mut [u8]) =
-> &'a [u8] {
+        if rdesc.len() =3D=3D 213
+            && rdesc[84] =3D=3D 129
+            && rdesc[112] =3D=3D 129
+            && rdesc[140] =3D=3D 129
+            && rdesc[85] =3D=3D 3
+            && rdesc[113] =3D=3D 3
+            && rdesc[141] =3D=3D 3
+        {
+            pr_info!("patching Glorious Model O consumer control report de=
scriptor\n");
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
2.49.0




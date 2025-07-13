Return-Path: <linux-input+bounces-13507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E074B032FC
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7344F3B1D29
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DAE1C6FF5;
	Sun, 13 Jul 2025 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="oj5ici3M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5071D5CC6
	for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441144; cv=none; b=TdvhYOA8zWRX1oH/oRPu7IJFeydR7WHU0uQb2NItXq9MIvA3Ds3bNfkJ+rUI/t0iosUlZcnC+SLfGONVBBklY4ixgW7tmDJYAx9zSqR0TTvjWqNbeIaS8B1EN4P3OqTsk2/+oHTctnZK6dzAzEpcfNoIxkIyxT95ETqmuNWyxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441144; c=relaxed/simple;
	bh=9RV4UY06IQidSMPQ8OakSQDrP4DcWqbWPh5K0GmAejs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M86bng6JcEhFbg2Tj+e6rRCkKpXxnavNgLfxW/llJyI+0wKONEi+2IdOLUsiOMXsGdPENLbpLWVm0DmNqLzvfd4saEno5ZR7jjd8vgfyfaZRHDRRHDKOp1oxXRnIOoIkoPmHjiThGoIeDgroou77D2jOt34Sk+qCvkOSlt6R33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=oj5ici3M; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752441132; x=1752700332;
	bh=Fw+/zoS18E/UKcAMuTUMEckULECmCnbmDigMClcj44c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oj5ici3MJKqxhKQYsDsm45pU5jNiMJFveFuO0dWrrKRbAcojPtoUlysAwx3sGqSB5
	 qxEM5iS37TDHWCcuebx4EoSrMwExpOcmlQJr43EbCEbYC1VZbtbPRoMc7lQp/E/yqR
	 0F6zTKIDosI6o9tapXUN31pu43xWLpqVKTJ6TAQ51P1FCEKDC3KkwGP5EQzVhtbeRY
	 iFC/2E+tnrT2eoX79LUxKo2YMKtfie3wMTGvhBIldZ69emA764BYSl7jbnA3DVlyIA
	 UeBeMPNgpC0ng//mJUNjeC9Cn9X2vwMgFU/4Ai5+3S9Z4Wtpy7CC4xok/suNAJAljy
	 fyKbdMijS/IxQ==
Date: Sun, 13 Jul 2025 21:12:06 +0000
To: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v2 2/4] rust: add kref bindings
Message-ID: <20250713211012.101476-8-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-4-sergeantsagara@protonmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 66ba00293196be0a1f9fa899abb475cb1985e0f3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce kref bindings for use in the Rust HID abstractions. Needed for
implementing the AlwaysRefCounted trait for kernel::hid::Device. Add rust
helpers for binding the kref_get and kref_put static inline C functions.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/kref.c             | 13 +++++++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 rust/helpers/kref.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 8cbb660e2ec2..41a98d5b6521 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -54,6 +54,7 @@
 #include <linux/fs.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
+#include <linux/kref.h>
 #include <linux/mdio.h>
 #include <linux/miscdevice.h>
 #include <linux/of_device.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index b15b3cddad4e..7f5403d6c51c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "fs.c"
 #include "io.c"
 #include "jump_label.c"
+#include "kref.c"
 #include "kunit.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/kref.c b/rust/helpers/kref.c
new file mode 100644
index 000000000000..25eeb0a724ac
--- /dev/null
+++ b/rust/helpers/kref.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kref.h>
+
+void rust_helper_kref_get(struct kref *kref)
+{
+=09kref_get(kref);
+}
+
+void rust_helper_kref_put(struct kref *kref, void (*release)(struct kref *=
kref))
+{
+=09kref_put(kref, release);
+}
--=20
2.47.2




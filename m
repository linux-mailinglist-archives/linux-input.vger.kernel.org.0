Return-Path: <linux-input+bounces-14822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486CFB8231F
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 00:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5874488832
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 22:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0A330F803;
	Wed, 17 Sep 2025 22:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gJS0AlDu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5030C0ED
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758149645; cv=none; b=hOs4kX1so/qLBeksuJF1dPbA7mmjjdFt3re86edBlsMRNk/+BXX1rhSBvjjsl4/9hEPojBDGYzBiOIgvSBfnBNQvlo8Rl1Sn6ePKQcWsupIu0pMb4+zn8+w2O+9e2jvFGyPG1ngjf2kIzY+F7+TYtpz+3hedC/cHXjGSdmGC2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758149645; c=relaxed/simple;
	bh=9+UVCe8WmKGioJeaplfY53Xsed6BsgXW5/+2Oh90GM4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jJk1PqiKePLb9X+BOJX8UMlaDHF8GeVtR+PkANJSR86jx6jo8yF5AzL5QWCRXJDknjQDkqKLTCts0tHpaG4dCD9J0RicQZXhHNKXUn3n3RbIjR60mlcPH7ILqJ0dXaj97tswlvV5n2BpASFTiz1CBcNLtXOKnz5YwHpK+Hf6bVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gJS0AlDu; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758149634; x=1758408834;
	bh=Q5qspVNMpGUU2rhqy5PZwY/xTyF1BTlCFiE44W6OA/s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gJS0AlDu2FoIRjt0GneK57JwdDA9zWH5vOjD/w85QJI2uEjvqFeR3M8jjjTng9Rke
	 ivdBoEKbKJmTrSvyS9XWbcdPIdchRNRm8B/nQYMbFoU7bGZDotQaMzKrj2OhVP+5Sv
	 cRweDAsgqDN/7m5LtAGMJ5m1qNYuU4998mhHzEUf4qbHvrqI1YKd7Mj93HpKmOPCkY
	 WKGvv1JnWU1PGLYpR+LKWyJ3odOFduyAgQVVrlb3+tKI2ll7us66HyVdiDAPc6bzU1
	 jK3l6/QlVapqA+Rer0wlfIJyQn5K9eAOXO6QlziG3N0wExvoAGB9PBQLrhyDx8gg5X
	 kV2guZRNWWRZQ==
Date: Wed, 17 Sep 2025 22:53:50 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v4 0/2] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250917225341.4572-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: d35ade03161af96fc0b4b9812fe140c177dc2f37
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I wanted to thank Benjamin for his response on the previous v3 RESEND.
Greatly appreciated. I have gone ahead with some minor logistically changes
in the series, based on his response. I have dropped the C patch since he
also took that patch into the hid tree in v3.

Link: https://lore.kernel.org/rust-for-linux/wjfjzjc626n55zvhksiyldobwubr2i=
mbvfavqej333lvnka2wn@r4zfcjqtanvu/
Link: https://lore.kernel.org/rust-for-linux/175810473311.3076338.143091013=
39951114135.b4-ty@kernel.org/

Rahul Rameshbabu (2):
  rust: core abstractions for HID drivers
  rust: hid: Glorious PC Gaming Race Model O and O- mice reference
    driver

 MAINTAINERS                           |  14 +
 drivers/hid/Kconfig                   |   2 +
 drivers/hid/hid-glorious.c            |   2 +
 drivers/hid/hid_glorious_rust.rs      |  60 ++++
 drivers/hid/rust/Kconfig              |  28 ++
 drivers/hid/rust/Makefile             |   6 +
 drivers/hid/rust/hid_glorious_rust.rs |  60 ++++
 rust/bindings/bindings_helper.h       |   3 +
 rust/kernel/hid.rs                    | 497 ++++++++++++++++++++++++++
 rust/kernel/lib.rs                    |   2 +
 10 files changed, 674 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 drivers/hid/rust/Kconfig
 create mode 100644 drivers/hid/rust/Makefile
 create mode 100644 drivers/hid/rust/hid_glorious_rust.rs
 create mode 100644 rust/kernel/hid.rs


base-commit: 657403637f7d343352efb29b53d9f92dcf86aebb
--=20
2.51.0




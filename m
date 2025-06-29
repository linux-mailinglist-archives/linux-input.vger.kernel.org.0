Return-Path: <linux-input+bounces-13159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D112AECB4D
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 06:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C20C2174FEE
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 04:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB2175D53;
	Sun, 29 Jun 2025 04:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="N3I57VYY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13621799F;
	Sun, 29 Jun 2025 04:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172676; cv=none; b=XYfSCKR+oSLjPKirxdjIxUn0cQk13RZa+5DGpn0Hl2IEz9go+/d45uAkVn4808k3/eiWjZ1gMPTmCM4K1x7SxuEAQrjc0cK9shKf4ZyKVI6S0SpfytkyJKwoZhhBsxnfqPzRXFdk0scY7o+YSEhMSiaPngrTG93BJg4FrpeHg9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172676; c=relaxed/simple;
	bh=j7Uad8Avd4MYdO8OQIni0b2GRibIuW6gYfmLhFNt6zk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HnyPJfMA7hvxYz1gmj9PM/4jFmfJm+OypnEuMNXxGw39MQEGv8LJ4z+xdkmybS8omVbscXv0w2D7TmBDNkCfAsWvlahzp0KW+WBC8nvCZjA+x5btiwiORxWF4kAKH9V5boUc7oclG4fGE4VMWnfNcEXMf+3J5IExeVFc9aUzf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=N3I57VYY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751172666; x=1751431866;
	bh=zj5a3HYnFx9FXj+X3W0RR4pMHS348eDgXvvoGkKuOeg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N3I57VYYlhtJM+41M/UTU5papIzq/UaIqU07o8bfZQWXfffFpFsmuwTDWPMXQcvWO
	 zT4eSBpUMX964hb+pYo1JMooGSuZD1jWw+RbtlhHEdiGbuY+lhaMOWxiEwNoA32Ae8
	 EJFiE5A7Up7Dt48qSO7lxA+JMeV268cy32VD6jnE2Vnr+ylIt4ksIeEnnlXHCeHR0K
	 wTiswu2S5BajfncvMyLmYYuj45pAWiLrUQYb25I9/0NPDJ3aOPP2gGPG2hkfwdV+7N
	 vHstxDVId+naMPoWKdD3TmxptJYHA6vIZDZHNARnADtwjaQyZLKx3Q566tQf3LbIfz
	 tvDO+vECRX5oQ==
Date: Sun, 29 Jun 2025 04:51:01 +0000
To: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Brooks <db48x@db48x.net>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v1 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250629045031.92358-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: cb1b663a24b21b3230210bd5a327d4007628ecdc
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello again,

I have come back with a revision of my HID binding work based on feedback f=
rom
the maintainers and the community. Going with Benjamin Tissoires's feedback=
, I
have opted to implement support for a much simpler HID device as a starting
point for this work. I have gone ahead with making a Rust reference driver =
for
the Glorious PC Gaming Race Model O and O- mice. I chose these devices beca=
use
they were easily accessible for my development work. I have gone ahead with
naming this driver the "Glorious Rust" driver. My binding work now adopts t=
he
core infrastructure Danilo Krummrich has provided for the Rust for Linux
community.

I have decided to move this series out of RFC status, since I feel the
implemented code is in a stable state. It could be used for other drivers a=
s-is
with the caveat that those drivers are only performing report fixups. Hopef=
ully,
a HID-BPF solution can be taken for production report fixup purposes. In
reality, I will need to bring more of the HID subsystem functionality to Ru=
st to
promote implementations of more complex drivers, such as the USB Monitor Co=
ntrol
driver I am planning to implement (as expressed in my RFC series). I am hop=
ing
to do a better job of documenting my progress involving this work on my blo=
g
while I am working on each iteration/addition for anyone interested in foll=
owing
along outside my mailing list posts.

Thanks,
Rahul Rameshbabu

Link: https://lore.kernel.org/rust-for-linux/20250313160220.6410-2-sergeant=
sagara@protonmail.com/
Link: https://binary-eater.github.io/tags/usb-monitor-control/

Rahul Rameshbabu (3):
  HID: core: Change hid_driver to use a const char* for name
  rust: core abstractions for HID drivers
  rust: hid: Glorious Gaming PC Race Model O and O- mice reference
    driver

 MAINTAINERS                      |  14 +
 drivers/hid/Kconfig              |  16 ++
 drivers/hid/Makefile             |   1 +
 drivers/hid/hid-glorious.c       |   2 +
 drivers/hid/hid_glorious_rust.rs |  62 +++++
 include/linux/hid.h              |   2 +-
 rust/bindings/bindings_helper.h  |   1 +
 rust/kernel/hid.rs               | 421 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   2 +
 9 files changed, 520 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 rust/kernel/hid.rs


base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984
--=20
2.49.0




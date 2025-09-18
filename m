Return-Path: <linux-input+bounces-14838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC93B83442
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 09:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1213B77B5
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506232DA753;
	Thu, 18 Sep 2025 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XlBglBRF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DA23BCF0
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179327; cv=none; b=ZdF5H/YiUUAgpyGA3RKObVf73kg22JNneovp4fV6N/Vit92eTAhFM7qUfG7dbsgoEHL0/8dVN5Z+X/IWFDeGfeh8NSvQmM1p2w91XWgqzCZMmZ51gC0nq8+wuqdCJ1Hy6STiDHVEsI7OsXMMZxDiIaNJiTHc3X8SoZv+Uz6FZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179327; c=relaxed/simple;
	bh=2Fq72gcZ7a03LjbxYRbcM9QBgxuKhj6eC6DiaxDA8hY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ih68WK0GWFMyLdaIBvLZ+VYknSznNGzwkfhCZo5NRDxgyQNn7oVOYazGzCvmPvdmI6HEYfOwFx9K9bseBUP0M7UwpbQFLYTRQ0INtJyHHf9j0csgkAYbkVxFJX90lxvUejcRhVoSXnUeK6jLy+OaTGve9ZmDw5qHFBfhEFchlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XlBglBRF; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758179316; x=1758438516;
	bh=G18Lwbk4LeVocyoPjOlUgmWjaKT4pQvEdGV2DKNp9MU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XlBglBRFcRSDdCkK21Y14twJhmv1Ihq+KUewWSo3gVwNCda3SPrFnTqJGkg5sjfUx
	 K8d2kf7Kc/PTEjUT00qyAxNZkXIwIhaZv/jy880H+5aVCDasDPsd7LA9pVyupCHCJr
	 +64WyRmHm9UduI0SGEQnm4HthWRpXya/STku7iga8j2mvGyx4c67hSD1VuycKKF1U7
	 +1YPFSXN7v4UsPGG/iFPhTWrnpc558b5M7GxHJK8+9waaWzMYKxftulewzRPyoX6li
	 7KJNn2Yl4QupMSnC3MRopoZ4HvTEdthImMGdN7mhqKpHxaj9WhEOkgJVGHuZKDMhtd
	 sL7E4FVJOlR0g==
Date: Thu, 18 Sep 2025 07:08:30 +0000
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benjamin.tissoires@redhat.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, jikos@kernel.org, ojeda@kernel.org, peter.hutterer@who-t.net, tmgross@umich.edu, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [PATCH v5 0/2] Initial work for Rust abstraction for HID device driver development
Message-ID: <20250918070824.70822-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: a62392e7296436a68d693ede3507a9fb03c13dbb
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Haa.... My v4 had a build system bug, so I never properly test
GloriousRust. I did not implement the RawDeviceIdIndex trait in v4. My v5
should properly exercise the reference driver.

I wanted to thank Benjamin for his response on the previous v3 RESEND.
Greatly appreciated. I have gone ahead with some minor logistical changes
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
 drivers/hid/Makefile                  |   2 +
 drivers/hid/hid-glorious.c            |   2 +
 drivers/hid/hid_glorious_rust.rs      |  60 +++
 drivers/hid/rust/Kconfig              |  28 ++
 drivers/hid/rust/Makefile             |   6 +
 drivers/hid/rust/hid_glorious_rust.rs |  60 +++
 rust/bindings/bindings_helper.h       |   3 +
 rust/kernel/hid.rs                    | 513 ++++++++++++++++++++++++++
 rust/kernel/lib.rs                    |   2 +
 11 files changed, 692 insertions(+)
 create mode 100644 drivers/hid/hid_glorious_rust.rs
 create mode 100644 drivers/hid/rust/Kconfig
 create mode 100644 drivers/hid/rust/Makefile
 create mode 100644 drivers/hid/rust/hid_glorious_rust.rs
 create mode 100644 rust/kernel/hid.rs


base-commit: 657403637f7d343352efb29b53d9f92dcf86aebb
--=20
2.51.0




Return-Path: <linux-input+bounces-13602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB7B0B6D2
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 18:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C52B3B5D38
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 16:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD644CE08;
	Sun, 20 Jul 2025 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FRZlLUUF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1572F50
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027347; cv=none; b=UqjNFSPJkDqFeA0bXTwcAwjbZLqJmec0z576GxuvSB0PhdNZu3FiRTAqmk7Qfh6o9Q2CBzLolqDmFZB5vOD30BTiXdgGCQ8vRgedCmO2V5/MUCQ67SQRIg+NCkTAXI2ZYr/cNi5bxcpa2wMAV9MBzfhDtv2myqmHhKpw5xqudrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027347; c=relaxed/simple;
	bh=HB9pDR8JI4+/diTAM8GEEV0X3ihX1xzW4EbRPjb/Edc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1oWxQL3QshXrItOuwSDVxR4xPKUFE+4L0JiyPJAgBgF+J8hOyDDr1zOKnMKObHQybkLehcvUH3Oe3mc7rhIIYHsrZ/z/mI3j9SHWzX8JP0BEm5uWQafwDcSHhwHQ41cZzRx1S+CgixgsKf7rH0UVXEvzLr2PZfHh09vpyY7y5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FRZlLUUF; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753027336; x=1753286536;
	bh=N88QyOCKp7DRd9CiDd/l6a6ni7EP6FK5/x7Gi+gNymo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FRZlLUUFo5G8dKeKfjddlh9UYUY2U/OoPCtfJNDdCl0iwN30y7FBvl83Wn9dHjWoP
	 /Bb+HYNBCaHoZgGIo9HIr7qH/eaGi3Hs0DhY38fdNtMutf/H6DlCci7tMVuC+u7dxa
	 92i6gUUmtDJIVq5pqS0fjCnhezNJ20/MGLPa5PCRYIBdeQL3wTuIIXuoPzRjvw98Ob
	 uDkPdH8OVrLvC+YG/IHIyLyFk7wOT27pPJ28jNrH58cMhZVO8+B0wcSaA7POjeBTPA
	 mHFw9xtQxzIblOSzrp0Vr1Q3HSoEPkdgmE2WLEk8yqXVD56oNG845kh9lWTva/Aipb
	 86zbTmQLsZz4w==
Date: Sun, 20 Jul 2025 16:02:09 +0000
To: rust-for-linux@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Subject: Re: [PATCH v2 2/4] rust: add kref bindings
Message-ID: <87tt36sveu.fsf@protonmail.com>
In-Reply-To: <20250713211012.101476-8-sergeantsagara@protonmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-8-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 46f5bb3ddce3804498b42fb3db004cbf41401080
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Jul, 2025 21:12:06 +0000 "Rahul Rameshbabu" <sergeantsagara@prot=
onmail.com> wrote:
> Introduce kref bindings for use in the Rust HID abstractions. Needed for
> implementing the AlwaysRefCounted trait for kernel::hid::Device. Add rust
> helpers for binding the kref_get and kref_put static inline C functions.
>
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/helpers.c          |  1 +
>  rust/helpers/kref.c             | 13 +++++++++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 rust/helpers/kref.c
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 8cbb660e2ec2..41a98d5b6521 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -54,6 +54,7 @@
>  #include <linux/fs.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
> +#include <linux/kref.h>
>  #include <linux/mdio.h>
>  #include <linux/miscdevice.h>
>  #include <linux/of_device.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index b15b3cddad4e..7f5403d6c51c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -25,6 +25,7 @@
>  #include "fs.c"
>  #include "io.c"
>  #include "jump_label.c"
> +#include "kref.c"
>  #include "kunit.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/kref.c b/rust/helpers/kref.c
> new file mode 100644
> index 000000000000..25eeb0a724ac
> --- /dev/null
> +++ b/rust/helpers/kref.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kref.h>
> +
> +void rust_helper_kref_get(struct kref *kref)
> +{
> +=09kref_get(kref);
> +}
> +
> +void rust_helper_kref_put(struct kref *kref, void (*release)(struct kref=
 *kref))
> +{
> +=09kref_put(kref, release);
> +}

I am about to send out my v3, and this patch will no longer be needed.
Would it make sense to send this out separately? I can also just keep it
stashed away till someone needs it.

Thanks,
Rahul Rameshbabu



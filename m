Return-Path: <linux-input+bounces-13511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C04B03326
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B701897542
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 21:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB711E8326;
	Sun, 13 Jul 2025 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmrOTz1D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC578F6F;
	Sun, 13 Jul 2025 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752443874; cv=none; b=D3KkspnmGTtPAlgTodA6hjmG7Id6yf9seFqGAV8tynKBgTFrD/SpoY8Bv+EfHg7Lst1XabQTs/9qpmN9G1pVQWKNjNfYpdbhbnwTCXk3Ir4K/vUt8WfJVxNpNkgJg7AdCXwQipljj43B2Zv9WoCYZX9sUVYU8nnzeXaAtiGS3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752443874; c=relaxed/simple;
	bh=lDRqU6f06BaZ9jmYu1CbrDWmXzBoduB/sksqiyAzlKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wmc8xFbvo1dgZwkGqwxB02/teMTbbEY9OJENvwEI71MqBhFyjs/3r20IEAp+n7Oce9ZGryk2UvGvQVpxrmGZKZurmFXb9sN4MsCUxOFAdJbsxBhCHKedDNXwj+qkCQ2PZFKWHYWdA9p6P7vtgi7/QSL+fl0o3JOOPHqO/n12EWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmrOTz1D; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313336f8438so710478a91.0;
        Sun, 13 Jul 2025 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752443872; x=1753048672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh1C06puKPupQR1LGzr2XC8HPwC+Lv1HHbJ8emXJGmg=;
        b=PmrOTz1D9sxS+XIYYu1iZqu0tleT5DLB2ht+uvRNPXkS5/OH5Hyg98F8iC06JIUGkb
         7MgzUasKVv6PTaqj4b+/OY45wOkUba5HgVDDT6Op7v9EW6hYkMEZC7+7KKt2HyFXoNoO
         WHvnZxQRJeIjW+wobNPUGdLZb3AGCudqTXToEtrrX6RW9USYTfdMvUlHF4ihZgOGpX5e
         n5t+do+qnvHJ5wAW+5ZUk0rVU3jBLkZyBjduGovMhqXqIAocXdox0C+65MX9Abrf0tBS
         Dxp0fr4Z2P0JOYSynCd7DcUi2P08Qqfn7r9gSJPfMH3zI/KUOK1Oqc8aZzK+DlRDAd4B
         j2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752443872; x=1753048672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh1C06puKPupQR1LGzr2XC8HPwC+Lv1HHbJ8emXJGmg=;
        b=W5KcXJFQ8tRY6RVUe19A2pupyYDCHYNC96AmFwaMA5TAPugLzrcCGqOsdj3PamZa50
         LtPvNNOOkhcBsSfBy/E1z1LUBcstfhkgs+iRHwEv+KLCbDpxuYJA/iWa9S1nWQS7RrT7
         BUK0iJTYZL7aSESpXcsdRUBDwTmG9+iIPwI6fiIQu0n5Mw62xtyn8mXuMTbjtLGaiiSh
         /Tt7MNdFpQc7ASF7lyPghQITweY1lLRnn+buwLXvVQC1jh2wbL63FN2m6rODJP0h/oGQ
         NMQU0hS+WYhapBqu+QTxKzHmcCBMeICkhd7wedojuF0AtB2TkERrztKT3wFHfT5unaj6
         Z5/w==
X-Forwarded-Encrypted: i=1; AJvYcCUkvZNu4bzHN7yTWzTWx/0PYcU+V4zTSr13NvjhWjeKcOAtClyg/OXVF0UMLammYQNIOC9QapyWvxhIWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlMRDmpL2czwh+U9wDjMwTO3lqeSnr2nP6YnsFIwzCL5IFSft
	1V5L7GRisFcZfDSnXU1XqGYyQN4/4neBX2Zhg8oq0mDFi7E0fVa3qplteq3+51/3IKt7JQ5YisO
	bx2b+o8ykVlBrTYJ2TqCsrPmPFIC0RFY=
X-Gm-Gg: ASbGnctFLvRvYD8LJw5PqVLjz41p8LJ/FA6LJyobjjqkYQ3DQQCQJGv6YsoJm0/cc1N
	iItDofcf5IXXOStcSMO5tdzQhA4DayDDoREuLpftCDKiq43Td8xshr7wvHevHg8F6B/r8UGz/OQ
	T59xEK4tc7sb5sZ/JGQaCH/7UV4tNm2EWde1Jx5PRVHD9W6PX1wUc5zHoiaHaSnkpruvNUmPNdN
	WJbAcSOyLFrqQm5WFk=
X-Google-Smtp-Source: AGHT+IHZYHb1cX2bmM0L3V9MlhZfwpz9LXvUG2rRBz8jFLNkjvyry5Sz+XIrFZYfSooF1V3ZoTG7Zca0C+6/70+JqcA=
X-Received: by 2002:a17:90a:d407:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-31c4f50b1edmr5653719a91.4.1752443871698; Sun, 13 Jul 2025
 14:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-10-sergeantsagara@protonmail.com>
In-Reply-To: <20250713211012.101476-10-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Jul 2025 23:57:38 +0200
X-Gm-Features: Ac12FXyBDq7DLHPAzU217KoAP0HVtTVuFZj2cXfiGeiH31bP63duZmJonytqHkk
Message-ID: <CANiq72m1itFYJgtyG02qnW1qyZU9UEo6OSLfzkXGesXNggxyBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: core abstractions for HID drivers
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, 
	ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rahul,

Some mostly doc-related comments below...

On Sun, Jul 13, 2025 at 11:12=E2=80=AFPM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
>         Some points I did not address from the last review cycle:
>
>           * Enabling CONFIG_HID=3Dm with the Rust bindings
>             - This is a limitation due to the Makefile rules that current=
ly exist,
>               compiling all the Rust bindings into kernel.o, which gets l=
inked into the
>               core kernel image.
>             - I would be happy to work on support for module-level bindin=
gs, but this is
>               not a problem unique only to the Rust HID binding work.

I am working on supporting that, so for the moment your approach is fine.

> +L:     rust-for-linux@vger.kernel.org
> +T:     git https://github.com/Rust-for-Linux/linux.git hid-next

Hmm... I think we discussed going through HID, no? Or did something change?

> +/// [Device Class Definition for HID 1.11]: https://www.usb.org/sites/de=
fault/files/hid1_11.pdf
> +pub const MAIN_ITEM_CONSTANT: u8 =3D bindings::HID_MAIN_ITEM_CONSTANT as=
 u8;
> +/// Indicates the item represents data from a physical control.

Please add new-lines between items.

> +    Generic =3D bindings::HID_GROUP_GENERIC as isize,
> +    /// Maps multitouch devices to hid-multitouch instead of hid-generic=
.

Same between `enum` variants.

> +    /// Internal function used to convert Group variants into u16

[`Group`]
[`u16`]

> +    const fn into(self) -> u16 {

Could the `enum` be `repr(u16)` directly?

Are those `as isize` for a reason?

> +        // variants assigned constants that can be represented as u16

Please format consistently comments as well.

> +    /// Returns the HID report group.
> +    pub fn group(&self) -> u16 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_dev=
ice`
> +        unsafe { *self.as_raw() }.group
> +    }

Do you need to expose the group as a raw integer?

Also, are these used currently?

> +/// Abstraction for the HID device ID structure ([`struct hid_device_id`=
]).

This intra-doc pointing is probably broken -- we don't have yet
automatic support to link to C ones yet (please check `make .....
rustdoc`).

> +            bus: 0x3, /* BUS_USB */

Please use `//` for comments unless there is a reason that wouldn't
work (e.g. to comment out within code).

> +/// IdTable type for HID

[`IdTable`]

Period at the end.

(I see others elsewhere are like this, so that is probably you had it
like this -- they should be fixed too)

> +/// # Example

Please use the plural even if there is one example.

> +///         // Perform some report descriptor fixup

Period at the end.

> +///```

Missing space (several).

> +                    "Cannot fix report description due to length convers=
ion failure: {}!\n",

This could probably be a bit shorter using {e}

> +        // Build a mutable Rust slice from buf and size

Markdown.

> +        // SAFETY: The HID subsystem only ever calls the report_fixup ca=
llback

Markdown (several).

> +///     fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device<device::Core>, r=
desc: &'b mut [u8]) -> &'a [u8] {

The example does not build -- please see how to test them here:

    https://docs.kernel.org/rust/testing.html#kunit-tests-are-documentation=
-tests

Thanks!

Cheers,
Miguel


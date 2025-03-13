Return-Path: <linux-input+bounces-10790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E5A5FEC4
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 19:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65DC417EB05
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 18:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CD21DC9AF;
	Thu, 13 Mar 2025 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DmnWTjLG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB415B0EF;
	Thu, 13 Mar 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741889103; cv=none; b=lIOj9iKU+c5D8cKRoae600CaOqA9GjiqrmRouKs/W5ulPF5XF00lw3i8AQl7JYHEsh7j48cEophxElmDk/qILhKuB6dfIMJm40kI+HxBG/Ln9hclbMisIn+YWs0rssr995pt53KM+sv/MaLbSgiN3R1OsUibcyjsvbeHNofsQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741889103; c=relaxed/simple;
	bh=viGHo9ETpG/2DHpXss2Awi+GjkBOpxh1L3SAnyML+kM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjQ2BxGbTfzT1aiIhnHOK3escl2yKMZVJlg2yW9w+WIzWsIOFSZqI6Y4ydSFjWu6QOpJFXNfRxjtGHBjbij5o0o7i1AViLLqPqGEJ1AijNWbKgM7KvbtrguVDmbjEVxr2AOBVcOgFhKRDO4MXDR11gttp2JoZjPqtLFM4WMPpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DmnWTjLG; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741889098; x=1742148298;
	bh=9b03ylqnCWBlZqF6+aU54k6mZhdi9vmbjM7AV8/K78g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DmnWTjLG1qtcBMXLMjHOST55G3FQ8b+VId9W82uRiF1LHBZII7ZOv5t2IsQyBlwlC
	 f7onev26XCGLCtLhhW6tFO0JwVG7fihCF2MzvD8+ijbGXRdK/vPqUSCKnfdE85l6dR
	 cI0wrNbC7VIDQHryO4fF1JJI6cb0Yejk4LAr3BjT1IKxrd43fnFrR778LZHnweW/z8
	 MGubxSfNlw/fjPLi2mhL+ykRz/dUXwqH5xo5j8a1ysrSuTjArW67AgX4l5//wYPmVn
	 DxjbCMRIADSaeAIliXlR2kSrT+5Cv0tdpzkDEZjbDDddAK57XVyGp6DMjjrLGnUCPd
	 JTxskY6uEQ3gA==
Date: Thu, 13 Mar 2025 18:04:54 +0000
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 0/3] Initial work for Rust abstraction for HID device driver development
Message-ID: <D8FC5C8BR1Q4.16X95BO48L6WF@proton.me>
In-Reply-To: <20250313160220.6410-2-sergeantsagara@protonmail.com>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: bd99d68b154b7741299e49349e3cb3b15723c133
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 13, 2025 at 5:02 PM CET, Rahul Rameshbabu wrote:
> Hello,
>
> I am a hobbyist developer who has been working on a project to create a n=
ew Rust
> HID device driver and the needed core abstractions for writing more HID d=
evice
> drivers in Rust. My goal is to support the USB Monitor Control Class need=
ed for
> functionality such as backlight control for monitors like the Apple Studi=
o
> Display and Apple Pro Display XDR. A new backlight API will be required t=
o
> support multiple backlight instances and will be mapped per DRM connector=
. The
> current backlight API is designed around the assumption of only a single
> internal panel being present. I am currently working on making this new A=
PI for
> DRM in parallel to my work on the HID side of the stack for supporting th=
ese
> displays.
>
>   https://binary-eater.github.io/tags/usb-monitor-control/
>
> Julius Zint had attempted to do so a year ago with a C HID driver but was=
 gated
> by the lack of an appropriate backlight API for external displays. I aske=
d him
> for permission to do the work need in Rust and plan to accredit him for t=
he HID
> report handling for backlight in the USB Monitor Control Class standard.
>
>   https://lore.kernel.org/lkml/f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redha=
t.com/
>
> I was hoping to get initial feedback on this work to make sure I am on th=
e right
> path for making a Rust HID abstraction that would be acceptable upstream.=
 The
> patches compile with WERROR being disabled. This is necessary since Rust =
treats
> missing documentation comments as warnings (which is a good thing). I als=
o need
> to go in and add more SAFETY comments.
>
> Thanks,
> Rahul Rameshbabu
>
> Rahul Rameshbabu (3):
>   rust: core abstractions for HID drivers
>   rust: hid: USB Monitor Control Class driver
>   rust: hid: demo the core abstractions for probe and remove
>
>  drivers/hid/Kconfig                |  16 ++
>  drivers/hid/Makefile               |   1 +
>  drivers/hid/hid_monitor_control.rs |  42 +++++
>  rust/bindings/bindings_helper.h    |   1 +
>  rust/kernel/hid.rs                 | 245 +++++++++++++++++++++++++++++
>  rust/kernel/lib.rs                 |   2 +
>  6 files changed, 307 insertions(+)
>  create mode 100644 drivers/hid/hid_monitor_control.rs
>  create mode 100644 rust/kernel/hid.rs

I have taken a very quick look and haven't seen any big problems,
there are some minor things, but not worth mentioning for an RFC.

---
Cheers,
Benno



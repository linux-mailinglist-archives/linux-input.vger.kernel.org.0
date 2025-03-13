Return-Path: <linux-input+bounces-10791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF747A6010B
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 20:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0F13BAC98
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 19:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8161F1303;
	Thu, 13 Mar 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPJgOpe9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FF61F0E44;
	Thu, 13 Mar 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741893929; cv=none; b=Z1IaYOCzdgDx8ZuuzD1ow2itLvSBSNKfjUCq5K7LG369DqsXkEgiFJf087DhUZSwaGfKEu9JpDU4b6MT5o55dqunTMDjBLi8+WU1hGYMk8xyysEtqYZDqzxUc7cgTWuNu4HeJabzwJYrL8GqQ4JfkCgGHtlXNXrAXiE1kiF3Mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741893929; c=relaxed/simple;
	bh=yxiAMWFPSVAofz831CA+K4Hh79wA9YHNplBeSyna3TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMJLntX9mj6WMqgb6UCORWkABJPS9lsx7TJKQHciCy+56CSZltykU8GBO0XjDQeH7LRng7cHS1XPAhlppy+N0lKc50usuafYzDDwCs/Q/2DtQrrif9TnzNtDQkMR8/h53g6VkZUoMCxAKbI3mKlCTa1ovJFKC0zdMbje0SORyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPJgOpe9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12817C4CEDD;
	Thu, 13 Mar 2025 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741893929;
	bh=yxiAMWFPSVAofz831CA+K4Hh79wA9YHNplBeSyna3TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPJgOpe93pLPceyqMGiheFfbp+8h9RCPRT1sy0A6eTFck7MJM8YVW/dm47Vt7LJ7D
	 o61fnfxLahhuA2lQ6XEn1+/j+htEcIE6ogBd+oFTra2i3a3yVMV04qU5uF0a27F+8c
	 QYe0CwLtEiUzZk3CTt6GxYHpnF0x7AR0DFtyELubR45UH2l9jAStPp0gTCZYzZX9w5
	 2h8UeX2LA/gLbbw9GGqtHbp2rILwgOR6ahamIxjJC/X5j8GNJo48izljnAjRV6fVJ+
	 ocxCAbtlieMNXdUGuHLawvqLOEN7Z02MYk0s06+znzM7IbdJSTpB5APzJVkiVC3KEz
	 xO0hpFWh2Z0zQ==
Date: Thu, 13 Mar 2025 20:25:23 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH RFC 1/3] rust: core abstractions for HID drivers
Message-ID: <Z9MxI0u2yCfSzTvD@cassiopeiae>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-4-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313160220.6410-4-sergeantsagara@protonmail.com>

On Thu, Mar 13, 2025 at 04:03:35PM +0000, Rahul Rameshbabu wrote:
> These abstractions enable the development of HID drivers in Rust by binding
> with the HID core C API. They provide Rust types that map to the
> equivalents in C. In this initial draft, only hid_device and hid_device_id
> are provided direct Rust type equivalents. hid_driver is specially wrapped
> with a custom Driver type. The module_hid_driver! macro provides analogous
> functionality to its C equivalent.
> 
> Future work for these abstractions would include more bindings for common
> HID-related types, such as hid_field, hid_report_enum, and hid_report.
> Providing Rust equivalents to useful core HID functions will also be
> necessary for HID driver development in Rust.
> 
> Some concerns with this initial draft
>   - The need for a DeviceId and DeviceIdShallow type.
>     + DeviceIdShallow is used to guarantee the safety requirement for the
>       Sync trait.
>   - The create_hid_driver call in the module_hid_driver! macro does not use
>     Pin semantics for passing the ID_TABLE. I could not get Pin semantics
>     to work in a const fn. I get a feeling this might be safe but need help
>     reviewing this.

For a lot of things in this patch we have common infrastructure, please see
rust/kernel/{device.rs, driver.rs, device_id.rs}. I think you should make use of
the common infrastructure that solves the corresponding problems already.

It provides generic infrastructure for handling device IDs, a generalized
Registration type, based on InPlaceModule with a common module_driver!
implementation for busses to implement their corresponding module macro, etc.

There are two busses upstream, which are based on this infrastructure:
rust/kernel/{pci.rs, platform.rs}.

There is a patch series that improves soundness of those two bus abstractions
[1], which should be taken into consideration too. Even though your
implementation isn't prone to the addressed issue, it would be good to align
things accordingly.

There is a third bus abstraction (auxiliary) on the mailing list [2], which
already implements the mentioned improvements, which you can use as canonical
example too.

[1] https://lore.kernel.org/rust-for-linux/20250313021550.133041-1-dakr@kernel.org/
[2] https://lore.kernel.org/rust-for-linux/20250313022454.147118-1-dakr@kernel.org/

> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  drivers/hid/Kconfig             |   8 ++
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/hid.rs              | 245 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  4 files changed, 256 insertions(+)
>  create mode 100644 rust/kernel/hid.rs


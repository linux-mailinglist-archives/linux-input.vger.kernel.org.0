Return-Path: <linux-input+bounces-13166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B3AECBEB
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 11:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075761895B2B
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 09:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFCA1E376E;
	Sun, 29 Jun 2025 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlNZTMsO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA881ACA;
	Sun, 29 Jun 2025 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751188980; cv=none; b=VNsfkbMZa3mAVt6uUyg2cH9834n9XJ+wz1l1uyVKdqZ3Eql/+7s/ib9JrVX0ehjSq2F0kmsHCgiSWkLkG7C11hIzLp5eX5pRyhDzqysMgZ/YmGeLWXPszmXCtgXLGdwYohiCpH3raUyo4HK1IyOCANrkSM55gMPdxR9r17xbbm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751188980; c=relaxed/simple;
	bh=Njb3fwy0Bu5ps4Sk1pdRgG4rIqqg+bghfFOmUCWieXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjEvnn/4+ebzqesertuQAYV4JC0yR6f/5aQlHpXQuEic4fhwKZHrIVSC2IldKAHdWFwOyF3u/CesqrSFxcePRmIGJmM905bV43I8DAcDZQ0UCOtJk6iuHSXBbtTHlk7eOJPoPa0BZsUHxqcbep5DlXBSoKTyUVe04AlWUzWyZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlNZTMsO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06FDC4CEEB;
	Sun, 29 Jun 2025 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751188979;
	bh=Njb3fwy0Bu5ps4Sk1pdRgG4rIqqg+bghfFOmUCWieXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlNZTMsOlVMnMveJjPdgYOniMGeOqEO9oZGEtQQy0e0eD4voKT+vi68C6ruT/mG9j
	 YzoL9LYExfj+PLS3+wWLVE7iDIg1y/GCV52FnuRTAm67GQ6AjXh5ebXpa3whRsGbVX
	 gDo1zLDY/Q+MdZaHobdvAuybBtbztGqwOK+6aIFe1iQQzwHmCZWmWN3v8In5VeoHXE
	 Vijo4nswkIKNmOc68PVOGXNyMxu8bvQi96ltoZbp4o+jF1RDcxaQVOs0Cumkat1xHO
	 Pqb7MtqlVWIi95+QbfKItIZlxHPPibPVsDUkw5eLXaKVwqPYhxhgYwWCIJ9VkIzmIk
	 CBr1RCWTZYuNw==
Date: Sun, 29 Jun 2025 11:22:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 3/3] rust: hid: Glorious Gaming PC Race Model O and O-
 mice reference driver
Message-ID: <aGEF7unkkg7hZAgU@pollux>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-5-sergeantsagara@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629045031.92358-5-sergeantsagara@protonmail.com>

On Sun, Jun 29, 2025 at 04:51:22AM +0000, Rahul Rameshbabu wrote:
> +const USB_VENDOR_ID_SINOWEALTH: u32 = 0x258a;
> +const USB_DEVICE_ID_GLORIOUS_MODEL_O: u32 = 0x0036;

As mentioned in the other patch, I think we shouldn't duplicate them, but use
the ones from drivers/hid/hid-ids.h.

> +struct GloriousRust;
> +
> +kernel::hid_device_table!(
> +    HID_TABLE,
> +    MODULE_HID_TABLE,
> +    <GloriousRust as hid::Driver>::IdInfo,
> +    [(
> +        hid::DeviceId::new_usb(
> +            hid::Group::Generic,
> +            USB_VENDOR_ID_SINOWEALTH,
> +            USB_DEVICE_ID_GLORIOUS_MODEL_O,
> +        ),
> +        (),
> +    )]
> +);
> +
> +#[vtable]
> +impl hid::Driver for GloriousRust {
> +    type IdInfo = ();
> +    const ID_TABLE: hid::IdTable<Self::IdInfo> = &HID_TABLE;
> +
> +    /// Glorious Model O and O- specify the const flag in the consumer input
> +    /// report descriptor, which leads to inputs being ignored. Fix this by
> +    /// patching the descriptor.
> +    fn report_fixup<'a, 'b: 'a>(_hdev: &hid::Device, rdesc: &'b mut [u8]) -> &'a [u8] {
> +        if rdesc.len() == 213
> +            && rdesc[84] == 129
> +            && rdesc[112] == 129
> +            && rdesc[140] == 129
> +            && rdesc[85] == 3
> +            && rdesc[113] == 3
> +            && rdesc[141] == 3
> +        {
> +            pr_info!("patching Glorious Model O consumer control report descriptor\n");

Please use dev_dbg!() instead.

> +
> +            rdesc[85] = hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATIVE;
> +            rdesc[113] = hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATIVE;
> +            rdesc[141] = hid::MAIN_ITEM_VARIABLE | hid::MAIN_ITEM_RELATIVE;
> +        }
> +
> +        rdesc
> +    }
> +}
> +
> +kernel::module_hid_driver! {
> +    type: GloriousRust,
> +    name: "GloriousRust",
> +    authors: ["Rahul Rameshbabu <sergeantsagara@protonmail.com>"],
> +    description: "Rust reference HID driver for Glorious Model O and O- mice",
> +    license: "GPL",
> +}
> -- 
> 2.49.0
> 
> 


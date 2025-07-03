Return-Path: <linux-input+bounces-13362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDBAF709A
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 12:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D8E53B7087
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C787D2E2671;
	Thu,  3 Jul 2025 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="FUblvFzV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jb/1y9bp"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A6293C52;
	Thu,  3 Jul 2025 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539136; cv=none; b=pHS21aExQXmvm5udPqtj8/atwfjBKSFzpD3BeGiuowm1vOsgvV4o/gm7rc82+9oVdMCyaNAXhNWPJwgT9dXx1VGW5ePaAl+kpNamKnlye+5Ti5LOgZj8KhvAuOx6VparGxHHclPhCkyrzWCDmczPeMpNDjzjOQHBa/qFYb+9NGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539136; c=relaxed/simple;
	bh=BGen47jhAS+7DNLL1eo/KdMiAmGvFWxtsCR6aedawyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1sOvuyg6EtNl6jmi9nAX7j3CRo5MDRKj1k+7Tbb3tEzs4V610n71VU5UQljcW9dkH/X6Fqt0U8LhecHpNDmMgvANFEXWaVtti/zAmm+/iFHLuFcDTb9Tb80R1mHyKnd9EYzxurnOdvFm5PNMXkjkVLE3/Zgwyf+zymzDesJ3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=FUblvFzV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jb/1y9bp; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 850AF1D002B3;
	Thu,  3 Jul 2025 06:38:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 03 Jul 2025 06:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1751539132; x=1751625532; bh=LDV8TwqDyA
	oZIAQja0tU8c6qSNHBhsZEeabLyMaqTGc=; b=FUblvFzV90JX1eselFuIEmiJXM
	FTfhx2ACazKn4Osc9qyMxzaoo2DZwhXz8UvNh1UWUaXuWM7H3sEWq5f102te1dLo
	B0k4NX8eqYkspRx+P7jSBQCXyVG0drakvwRWjbFA2YYGCnuRcseNByXhXYr6jyQe
	AAPy7S7NC7WAb/qVp4djOtpzeNbU+XYgpTucU7/znGjwkD+B5nOl5R3BjD+7KDad
	GeKIi1q2mE7piZvz+ghWv/CHcMlmnKKn3HFS3iuSbZM0+K7DofBO/ET1if98vLPB
	GkPnu078IUQRaB73js7/aSKfkG6bvJrZJ+tOEeLA2pDYbx24pMQDitiC8Xug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751539132; x=1751625532; bh=LDV8TwqDyAoZIAQja0tU8c6qSNHBhsZEeab
	LyMaqTGc=; b=Jb/1y9bpvdKO8jD1NlmdNsEWS1BX2dsZvFFrvrZkT+ZvNdieoUG
	o4a/EwZgUyItwSzoKnmtyjbbJ6ehYJ4LIpEn6MvXD3/9Gs+xnMtPcGGUaxCSYDqN
	5k0kK/1tlyNCcz2ULLpbI4O/0akel/jpvjkpxpsJuBiL50rZv2ng4Vz9b7EH5Rr/
	EUImvLT+hcGFecUMgPLWqb/dI1FSID9F5DquywchN3rUtLe+u4jmIN0HzPnnaK09
	uqYMVqRopPen7wpWCIwL+DaqAxQT4m3SAdD1GbQQDn5jmobLkZfBh63FHSqoc/ml
	AoJmoc148ADByduhqHD2JNVPvfCim3gbYqQ==
X-ME-Sender: <xms:u11maCobzSzHhVfwZZSavpsBZ2EQ_UlCSI36NpHZWZfwBLmUFfo9Vw>
    <xme:u11maAppahhemFmpyGsKFZHw2k97wo3EnKE7T3-IoVonwh11PkduwpdQz1497CIP9
    IZDh9gHxmCQrOT8FsQ>
X-ME-Received: <xmr:u11maHMNRni7mPNB_9Hl7F6V8dWdUO0fG2XO3vNp4Yv08NkXRtv1HVabWcnqAG96FEy79ua95aeQg3YV0Pbe3jMcXT2A1KaCEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucfj
    uhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvtheqne
    cuggftrfgrthhtvghrnheptefglefgvdeiuddttdffgefggeeiheevleduudffgeduueet
    jeetteefffehgfelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgv
    rhgvrhesfihhohdqthdrnhgvthdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehsvghrghgvrghnthhsrghgrghrrgesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgv
    gidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnh
    hgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
    pdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:u11maB540IoCDLxpjdIgwxiHbNNgjsUi42XeW-xVmyvp__Toleblrw>
    <xmx:u11maB7dmWI6uMgnNLRBQV4IM0tj15D6q2ejRPvklnjw4jHbmWP_yQ>
    <xmx:u11maBi2upSfXHcM_hCLv1Pxwk8n106ivBWA6bNxh9QzVT4l37ytSw>
    <xmx:u11maL6p1jODOYiK_8gh3ui2DvnsBhtxRQ5tsUCCoLtnzN8VBksQdQ>
    <xmx:vF1maDVCPjATQJizQJ3n-a_YDamnglTkHY6_BxUn0UvVK63-TEnWeWco>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 06:38:47 -0400 (EDT)
Date: Thu, 3 Jul 2025 20:36:19 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
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
	Danilo Krummrich <dakr@kernel.org>, Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 3/3] rust: hid: Glorious Gaming PC Race Model O and O-
 mice reference driver
Message-ID: <20250703103619.GA1972569@quokka>
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
> Demonstrate how to perform a report fixup from a Rust HID driver. The mice
> specify the const flag incorrectly in the consumer input report descriptor,
> which leads to inputs being ignored. Correctly patch the report descriptor for
> the Model O and O- mice.
> 
> Portions of the HID report post-fixup:
> device 0:0
> ...
> 0x81, 0x06,                    //  Input (Data,Var,Rel)               84
> ...
> 0x81, 0x06,                    //  Input (Data,Var,Rel)               112
> ...
> 0x81, 0x06,                    //  Input (Data,Var,Rel)               140
> 
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  MAINTAINERS                      |  7 ++++
>  drivers/hid/Kconfig              |  8 +++++
>  drivers/hid/Makefile             |  1 +
>  drivers/hid/hid-glorious.c       |  2 ++
>  drivers/hid/hid_glorious_rust.rs | 62 ++++++++++++++++++++++++++++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 drivers/hid/hid_glorious_rust.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 487750d9fd1e..80849f76c6c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10200,6 +10200,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/gigabyte-wmi.c
>  
> +GLORIOUS RUST DRIVER [RUST]
> +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> +F:	drivers/hid/hid_glorious_rust.rs
> +
>  GNSS SUBSYSTEM
>  M:	Johan Hovold <johan@kernel.org>
>  S:	Maintained
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 5c8839ddc999..3592a4de113f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -406,6 +406,14 @@ config HID_GLORIOUS
>  	  Support for Glorious PC Gaming Race mice such as
>  	  the Glorious Model O, O- and D.
>  
> +config HID_GLORIOUS_RUST
> +	tristate "Glorious O and O- mice Rust reference driver"
> +	depends on USB_HID
> +	depends on RUST_HID_ABSTRACTIONS
> +	help
> +	  Support for Glorious PC Gaming Race O and O- mice
> +	  in Rust
> +
>  config HID_HOLTEK
>  	tristate "Holtek HID devices"
>  	depends on USB_HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 10ae5dedbd84..bd86b3db5d88 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_HID_FT260)		+= hid-ft260.o
>  obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
>  obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
>  obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
> +obj-$(CONFIG_HID_GLORIOUS_RUST)	+= hid_glorious_rust.o
>  obj-$(CONFIG_HID_VIVALDI_COMMON) += hid-vivaldi-common.o
>  obj-$(CONFIG_HID_GOODIX_SPI)	+= hid-goodix-spi.o
>  obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
> diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
> index 5bbd81248053..d7362852c20f 100644
> --- a/drivers/hid/hid-glorious.c
> +++ b/drivers/hid/hid-glorious.c
> @@ -76,8 +76,10 @@ static int glorious_probe(struct hid_device *hdev,
>  }
>  
>  static const struct hid_device_id glorious_devices[] = {
> +#if !IS_ENABLED(CONFIG_HID_GLORIOUS_RUST)
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
>  		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
> +#endif
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_SINOWEALTH,
>  		USB_DEVICE_ID_GLORIOUS_MODEL_D) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_LAVIEW,
> diff --git a/drivers/hid/hid_glorious_rust.rs b/drivers/hid/hid_glorious_rust.rs
> new file mode 100644
> index 000000000000..de602ae33b2d
> --- /dev/null
> +++ b/drivers/hid/hid_glorious_rust.rs
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +
> +//! Rust reference HID driver for Glorious Model O and O- mice
> +
> +use kernel::{self, hid, prelude::*};
> +
> +const USB_VENDOR_ID_SINOWEALTH: u32 = 0x258a;
> +const USB_DEVICE_ID_GLORIOUS_MODEL_O: u32 = 0x0036;
> +
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

fwiw, all tools that I've used in the past print hex for the hid
report descriptor items (including the excerpt in your commit message)
so IMO using hex here would be more useful.

Also at least in my head the items are logical groups, so this comparison
should arguably be:

> +            && (rdesc[84] == 129 && rdesc[85] == 3)

with extra () to hopefully stop rustfmt from breaking it up.

(pls ignore me if your approach is already a common pattern in the kernel)

Cheers,
  Peter

> +        {
> +            pr_info!("patching Glorious Model O consumer control report descriptor\n");
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
> 


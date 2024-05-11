Return-Path: <linux-input+bounces-3683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DFA8C31FE
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 17:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02E61F21797
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 15:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8FD5579F;
	Sat, 11 May 2024 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOQJlBLk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69E1E526;
	Sat, 11 May 2024 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715439754; cv=none; b=e7LkEEJ0wcJSg0laD0ZmwFYAlLfEoU6Bkx5D6ytqKI10QWKay0rHY9ZfI3QRRTyr67EZ/14Oyixq/LuYHq3HgzuKJiIqaAWWtSXbS+ZExpvB5nMFfMR/Pvu7e1YJNII3t4qkhG5Jpe7H3dekyD6vfDY1eQzPP7qk2K2WUa/Fcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715439754; c=relaxed/simple;
	bh=MZAWv/ScyEBJVD21IicPp5L10HCN0chmKIi6qdoF9E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/FqEOB2h9+y2JbrfE++4TC5aeN6EWiTWUSWNvAJD7/cQk3TdjfVoGPVROkABlS0El6R9Hu6mxHMaMjY/MH32af3HL0vUhJOxwJOMaaUaJWp/325UCNsZtqch/qGVPpUSAEMAEqxMWxeH0+ZPhOuG7NN/Vp4gFvNcZMipkISiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOQJlBLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCBCC2BBFC;
	Sat, 11 May 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715439754;
	bh=MZAWv/ScyEBJVD21IicPp5L10HCN0chmKIi6qdoF9E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOQJlBLkU83hwtxIzoRrpInNyQTz0MO/2OhNMD2dLwkHCxFfjmMQ5NiQmctLMLTWk
	 Il6ktAJwEbqlKLiSm3cUHjNhMTy/XdqXbtUMFW2Umkx9EpwkBrkN+EVdeW+O6qXEAq
	 vqK6X61CaKrd2Z3hruLVZy4nU+9MyLljT7j4Qc5Zy/4i4FhOcEXXyNBpkJiZ5vMLON
	 vAjOzytqc+LdsIBpL9Hcd+ORNqxpTDuUe0y596Dd9TKtRNuuGwQtEkfB3LVFOmCp+n
	 PlpZuRVhpeVaCcWF5ta1lHDGzebwXWHQ5graYzlNckH2mcii1gkgJPNWDb5/Tg14hg
	 OaHIGXKF2hJQQ==
Date: Sat, 11 May 2024 16:02:25 +0100
From: Simon Horman <horms@kernel.org>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
	netdev@vger.kernel.org, richardcochran@gmail.com,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	zackr@vmware.com, linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com, timothym@vmware.com, akaher@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, kirill.shutemov@linux.intel.com,
	Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240511150225.GK2347895@kernel.org>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-4-alexey.makhalov@broadcom.com>

On Mon, May 06, 2024 at 02:53:00PM -0700, Alexey Makhalov wrote:
> Introduce vmware_hypercall family of functions. It is a common
> implementation to be used by the VMware guest code and virtual
> device drivers in architecture independent manner.
> 
> The API consists of vmware_hypercallX and vmware_hypercall_hb_{out,in}
> set of functions by analogy with KVM hypercall API. Architecture
> specific implementation is hidden inside.
> 
> It will simplify future enhancements in VMware hypercalls such
> as SEV-ES and TDX related changes without needs to modify a
> caller in device drivers code.
> 
> Current implementation extends an idea from commit bac7b4e84323
> ("x86/vmware: Update platform detection code for VMCALL/VMMCALL
> hypercalls") to have a slow, but safe path in VMWARE_HYPERCALL
> earlier during the boot when alternatives are not yet applied.
> This logic was inherited from VMWARE_CMD from the commit mentioned
> above. Default alternative code was optimized by size to reduce
> excessive nop alignment once alternatives are applied. Total
> default code size is 26 bytes, in worse case (3 bytes alternative)
> remaining 23 bytes will be aligned by only 3 long NOP instructions.
> 
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Reviewed-by: Nadav Amit <nadav.amit@gmail.com>
> Reviewed-by: Jeff Sipek <jsipek@vmware.com>

...

> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h

...

> +static inline
> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> +				uint32_t *out1, uint32_t *out2)

nit: u32 is preferred over uint32_t.
     Likewise elsewhere in this patch-set.
...

>  /*
> - * The high bandwidth in call. The low word of edx is presumed to have the
> - * HB bit set.
> + * High bandwidth calls are not supported on encrypted memory guests.
> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
> + * low bandwidth hypercall it memory encryption is set.
> + * This assumption simplifies HB hypercall impementation to just I/O port

nit: implementation

     checkpatch.pl --codespell is your friend

> + * based approach without alternative patching.
>   */

...


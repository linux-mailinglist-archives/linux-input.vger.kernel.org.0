Return-Path: <linux-input+bounces-3544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAC8BDF37
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 11:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9D9DB2556A
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F53714E2E0;
	Tue,  7 May 2024 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="blWi628G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBA149C6F;
	Tue,  7 May 2024 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075974; cv=none; b=EXUXfdiuS2Z2flixL2flN81jYppcWUnWXUE2t/oNwvcSWNCiRJb3gNQt/qwRIke3e7IYVIIiWf/C0TLPfvHQ6gmALAxb1ayotkiJcdLeNDhQnt4a8owwv0yWQBos3rOFxWWuWn6iJVwYxqeumuRDDpjsqJYt5PpqOYamUyQK30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075974; c=relaxed/simple;
	bh=LiSUAt9SnSmyfKULGCpk6O/gbOcV7Jv1Bv1kQR1ZWj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfNYvYPkmbvhcPlNGxV6jNf21/iW+ho3ODsVOoGEhhxk/l2QbYrhz7r6YHBk27jUxSvKTwGhbyUHqXg91h6RYgUGH4qecSWZsnuZ3WDc3Rx835cevU/mOCQfUysiPNE/ka5a1SdXDagos6a1i8cRE97IVMt7gODLSWWPjf31+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=blWi628G; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 527D540E0249;
	Tue,  7 May 2024 09:59:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1KZiywlRO9NV; Tue,  7 May 2024 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1715075966; bh=AmlHvKNbxyX5EjqLxHkwYjWvOPYtcywQG0Y+RGazmq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blWi628GjWIDphbG4jdI2jEDN+IbBtP/gJYfExptDWnnFUrirEy+1/i3ACpbfLGeI
	 k4Xp6qwOqZoqJDA5Tk6ZjmMcwl1oKeHDY/AkhRfXnfN7ZBGLqh6tXmgtFZH+7jcYKg
	 eY9J1GaHJN3L2bJ1FFd+AkmOKXjHlTjAWa13Y7Sh11wXgazefG/xrup4pq4omjjnlc
	 U309XL4JCNKHJfslwsHE8XNfbn4JR5uWp1Fqz3KvKbPb2giUqobXpuxU06qJGjszFg
	 Kp+XrPCyU7T6oL+n7NVV0EM7uuRhgBYC/MSVKhHjIga7Itcz1QriTgjaoOjIMqNXZR
	 Rh8x2jXrXjtft7qHVPeB6eOgbtmISV6RP3rkoCAKReZcqIb7SRQiwOdTFFYf4PIplz
	 bl0g74xtP/pbjkI4mR0FGfsfIwQD3J+IdsqP+ZY7uzgoc2c5OhS/cSz2gnzxWwYNbQ
	 59v5E9XKmI49Wxl/wCOvWmPNMmjFLczW9FxgFcAZIuRKKIY9LWtz6xi9yh15R79i2q
	 RFUv9Yn1wmF7rUtDR/YcGIzFBsPdWh+WYS3AkjVtAeF1dBQREZoicvBJ7Odo4x+mSh
	 y3nv9i+T/ZVq9hTIZ/QdHGsYZs1Zf3D/FNmKP702fe1rtxpX5zUQhIa2z09o3nd84O
	 5iXQtqNNXWP8JEAgHb86o4vs=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA69240E024D;
	Tue,  7 May 2024 09:58:58 +0000 (UTC)
Date: Tue, 7 May 2024 11:58:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
	tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
	richardcochran@gmail.com, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, zackr@vmware.com,
	linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
	timothym@vmware.com, akaher@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org,
	kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>,
	Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240507095852.GVZjn7XM0VMXzBfKsd@fat_crate.local>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-4-alexey.makhalov@broadcom.com>

On Mon, May 06, 2024 at 02:53:00PM -0700, Alexey Makhalov wrote:
> +#define VMWARE_HYPERCALL						\
> +	ALTERNATIVE_3("cmpb $"						\
> +			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
> +			", %[mode]\n\t"					\
> +		      "jg 2f\n\t"					\
> +		      "je 1f\n\t"					\
> +		      "movw %[port], %%dx\n\t"				\
> +		      "inl (%%dx), %%eax\n\t"				\
> +		      "jmp 3f\n\t"					\
> +		      "1: vmmcall\n\t"					\
> +		      "jmp 3f\n\t"					\
> +		      "2: vmcall\n\t"					\
> +		      "3:\n\t",						\
> +		      "movw %[port], %%dx\n\t"				\
> +		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\

That's a bunch of insns and their size would inadvertently go into the final
image.

What you should try to do is something like this:

ALTERNATIVE_3("jmp .Lend_legacy_call", "", X86_FEATURE_HYPERVISOR,
	      "vmcall; jmp .Lend_legacy_call", X86_FEATURE_VMCALL,
	      "vmmcall; jmp .Lend_legacy_call", X86_FEATURE_VMW_VMMCALL)

		/* bunch of conditional branches and INs and V*MCALLs, etc go here */

		.Lend_legacy_call:

so that you don't have these 26 bytes, as you say, of alternatives to patch but
only the JMPs and the VM*CALLs.

See for an example the macros in arch/x86/entry/calling.h which simply jump
over the code when not needed.

Also, you could restructure the alternative differently so that that bunch of
insns call is completely out-of-line because all current machines support
VM*CALL so you won't even need to patch. You only get to patch when running on
some old rust and there you can just as well go completely out-of-line.

Something along those lines, anyway.

> - * The high bandwidth in call. The low word of edx is presumed to have the
> - * HB bit set.
> + * High bandwidth calls are not supported on encrypted memory guests.
> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
> + * low bandwidth hypercall it memory encryption is set.

s/it/if/

> -#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
> -	__asm__("inl (%%dx), %%eax" :					\
> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
> -		"c"(VMWARE_CMD_##cmd),					\
> -		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
> -		"memory")
> -
> -#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
> -	__asm__("vmcall" :						\
> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
> -		"c"(VMWARE_CMD_##cmd),					\
> -		"d"(0), "b"(UINT_MAX) :					\
> -		"memory")
> -
> -#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
> -	__asm__("vmmcall" :						\
> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
> -		"c"(VMWARE_CMD_##cmd),					\
> -		"d"(0), "b"(UINT_MAX) :					\
> -		"memory")
> -
> -#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
> -	switch (vmware_hypercall_mode) {			\
> -	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
> -		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
> -		break;						\
> -	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
> -		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
> -		break;						\
> -	default:						\
> -		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
> -		break;						\
> -	}							\
> -	} while (0)

You're kidding, right?

You went to all that trouble in patch 1 to move those to the header only to
*remove* them here?

You do realize that that is a unnecessary churn for no good reason, right?

So that set needs to be restructured differently.

* first patch introduces those new API calls.

* follow-on patches convert the callers to the new API

* last patch removes the old API.

Ok?

And when you redo them, make sure you drop all Reviewed-by tags because the new
versions are not reviewed anymore.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


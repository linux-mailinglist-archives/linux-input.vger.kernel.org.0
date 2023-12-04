Return-Path: <linux-input+bounces-435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E7803046
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993981C20A22
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E48111BB;
	Mon,  4 Dec 2023 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IHlc3+pQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53ED85;
	Mon,  4 Dec 2023 02:31:39 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 60CC940E0195;
	Mon,  4 Dec 2023 10:31:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JkAX1BXYqfe7; Mon,  4 Dec 2023 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701685894; bh=JlJq5zS3lHAPGTbSmGS581PTHmx0BGgwAt0K5fikRj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHlc3+pQPRsWumauBriELHM1PVsTlZKzGdtztikxm/nE7dbC5ss2ux9db6Tyi/WTS
	 1jtGQXTFNukQrWcL5r4QKye/dQnxU9EFgIvPPyA20ucQgbNxCDUP3s7OE1RpZ3+mVe
	 7juTvyWuQA76T2zWoqI0Q7m/pAk9HQz/2j1OtX9uRj9/5BjI/O7DQovGC7VIO/KrLS
	 VkFaRuDidEMNKvaanAQ4TWbr5MUuG24nUyA5/hAq6bRLFkzN8QDEjDnjkYoX7eCxCr
	 m+TKU1dnLBUzRB4t6RRS8YH6xz9VPQ+7HzXmMR3nMvLCs3bGguXjtKLaZA9JrXZaf6
	 fzlJCWcCqFMXFC7OozD5O7pfd7vc1+0L9Skg42JeMf0/s4O4NSPa5biQo39E3tjoyw
	 i3WocaN3XfAlkSOZLEMU16GJ7BOMyfA2FcOjLjyAbTea374PGT5LNl6aHzXTLoj1El
	 hyk0HcTOHnbdFW8+NSaRUA3Cnl5AZqNQ/yy8xYYR/bzK4kOcctb+zjNo2Ppeesx4AV
	 2r7LwGxc3DtnaNTqJTn6kTa5dcfsLwvu/vOGZmdBLEUbxzWUFA0S0sNhvXzRkjEItg
	 fa5xnIStH22epTJqA+HDXO1hk9UgoF3Ax1cQs1leQyG+8dWMnCA0MWIxFF2yDnX/JQ
	 6XPnmKVqEb7IqgvbUe/8dbbc=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E605740E014B;
	Mon,  4 Dec 2023 10:31:06 +0000 (UTC)
Date: Mon, 4 Dec 2023 11:31:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <amakhalov@vmware.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
	netdev@vger.kernel.org, richardcochran@gmail.com,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	zackr@vmware.com, linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com, namit@vmware.com, timothym@vmware.com,
	akaher@vmware.com, jsipek@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <20231204103100.GYZW2qZE9tbGMtuVgY@fat_crate.local>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-7-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-7-amakhalov@vmware.com>

On Fri, Dec 01, 2023 at 03:24:52PM -0800, Alexey Makhalov wrote:
> +#ifdef CONFIG_INTEL_TDX_GUEST
> +/* __tdx_hypercall() is not exported. So, export the wrapper */
> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
> +{
> +	__tdx_hypercall(args);
> +}
> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);

Uuuh, lovely. I'd like to see what the TDX folks think about this
export first.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


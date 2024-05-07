Return-Path: <linux-input+bounces-3543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED178BDDDC
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 11:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7A81C21259
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE7B14D6E6;
	Tue,  7 May 2024 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Dqbd9DaC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F914D2BF;
	Tue,  7 May 2024 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715073311; cv=none; b=aq4fm5ZZ88NyXcvLlQZ39R3CyR/3mset49BlwxS4fHx4QWT9cE6TaiuedK/wQeWjdeR74HK++YnhVftZNKLCsg00Oeo4P1UkF0cJpkG6LWu+NI4sJw53NY/lkzP0QnjNxHnAu2gRqCGOBHvl7ku75PeQwD9+6Dz4V/h935WUId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715073311; c=relaxed/simple;
	bh=p2Sw5egmhJ8iO8j3y++LQsz5uCOkVobYnG2RRGBZZ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1TVgjHSOpX9yM2slxv6ApVISTcSEkRjEj/+WfMxdw2uDzN+HQbKqME4TZ59Qe7u2L2owIdrf/4n0Pgm2SL1drhXEepQnyjg9mt7F6uNmffZs8CFQdPTQA97CnnSePc8ut7PEoR4n9D4rqluH+Tjd4OxQ4Q377EPnOX8wvpnlOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Dqbd9DaC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5B0DF40E024C;
	Tue,  7 May 2024 09:15:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t-Ir9M_E86JN; Tue,  7 May 2024 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1715073296; bh=hA/EMMoeb0yie87OtKrLxzw3vDjsbX8N+BD3HDiz4bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dqbd9DaChjaUs6Gf5ijBOtLj75ALUwFjP33YhDNe96oth7dWvkwSAEYC6w6/7goFD
	 rF3sHKacblkoCoAaw6E4bRh3zB+G4kCZz2QRn44ov6MB23bLu6TqDs8OhiBMpFM9R8
	 Tj6zCtBBQvudwFAgI3aqf2cZwmsCXLPds2SHZ4BG1jM4M01Gu+iid4/l3HDXXImTBx
	 DaXGgVxur9yr4aq4+EqVrAkRD0wJ9foGFlKI1QpGnyT96/cRqGdHK+Nkns/sSW3EAt
	 8hlAB886/1B5el3/zg+9MNf7KFK8o7v+ELDYRiIkLGGF5quh5mwvpgeFhgg87u8MFL
	 ibZuTFuEUuIXPhmi3tzmJbxBX2O3reR7H9KHSqMIS8EQ8/XlMTe3QdoQSwxjvsSG/7
	 NzriVHS6gNn1dad88kcY/bvtdRBAqCkPXaKaac5PnYYlFifKw7yjclffpi4vRBZx5t
	 /6mo3hw1y2IE/5s3v7fgK0ts97gSdfiTveDHo+40CnpQRPdGfNcU9wivREWdmbRJb1
	 9qCYczwdKUNfw1OqL8AhCa33w6OE2cOtJpiAkXA0kP5OkrBqJGTJx/inq43sk/WRKo
	 VxIym094m9x2zxhcJciuWm7sQy1cB12gsVF6jEAnmOnAI/tWEqSflNX7C88meKZuzw
	 eF3nqOHBWbG+ACJ+MBC682cU=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0A3C340E0249;
	Tue,  7 May 2024 09:14:30 +0000 (UTC)
Date: Tue, 7 May 2024 11:14:24 +0200
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
	kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v9 1/8] x86/vmware: Move common macros to vmware.h
Message-ID: <20240507091424.GUZjnw8ErpQT6XJLVM@fat_crate.local>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-2-alexey.makhalov@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-2-alexey.makhalov@broadcom.com>

On Mon, May 06, 2024 at 02:52:58PM -0700, Alexey Makhalov wrote:
> +#define VMWARE_HYPERVISOR_PORT		0x5658
> +#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
> +					 VMWARE_HYPERVISOR_HB)

You can't help yourself not sneaking in any changes which are not code
movement, can ya?

The purpose of a sole code movement patch is to ease the review. Not to
have to look at the code movement *and* some *additional* changes which
you've done in-flight. Just because you felt like it. But which is nasty
to review.

Maybe you'll understand that better when you get to review someone
else's patch which does crap like that.

Make sure you remember that in the future, when sending patches.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


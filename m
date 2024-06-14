Return-Path: <linux-input+bounces-4368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE99092D3
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 21:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D3A28A266
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 19:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961D81A38CC;
	Fri, 14 Jun 2024 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GMMByZxo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8841A01C5;
	Fri, 14 Jun 2024 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718392237; cv=none; b=T1gFQ/4GPcz363WmXM23aWE9Pnvd1OkeELjr3j2LY+s29qnrMvzJ8mRkqe8dgA1SncOF2zR0g7401Yi1D9zFGvVtnYESy1iK6IqsfkYnM6stFiOWH8LZj60gcT2DudfFofhegWOA2RbFHc8EGZIubBRvTCJFCRzGeR1TklPQhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718392237; c=relaxed/simple;
	bh=/McNpSiwC81uTiinpfWk+KdIlSVxE/p1HFilAYM2544=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwxSKIV3S1B9gyTMBSdmUQITl7VcTmKtJ39Vj8+9dAxtClJzeL4AtsrGVwVuAlW2csTYfu+6WzEcnx/CbTi1ugpNqzYTHjBMxyvbavtd621Rf/HfWjoQsWRUawpR41icwG0cd+MYqPxzLSsQHy4l/MKdswFi5lruxm6+zeD5bow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GMMByZxo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 48A8B40E019F;
	Fri, 14 Jun 2024 19:10:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id B5wNnYZxtOcc; Fri, 14 Jun 2024 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1718392229; bh=YHoeX2aqNxFOwawwQ+u5gyShZuN1d3XKK09wgoJEq6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMMByZxogyqO6iERv7yE9B7Z+yBq6IlzYQqdEj+amC/+SOkkItb2DuZlWjCQQ1A6s
	 4j1l3t+xWiBaOYtb1Al3DKaXwLYbfyEbq6vBOtibH3OjF/V7yrzolInVRgYc6AMYy1
	 BPfOWGzHMmCGjmKpE0fwq2kvxt7ITrQ/CDLbpRlMGaITjvpc+cooDPh4hjbqbMARrc
	 T4DqEw1jIwN+zP3q3iz6jK8lSCUkBVd4JFPnoznFFEx6V6rgfTNHC1Ya6hHOUYGerP
	 Q57jaD74y8ePgm4lOTLR9TCHMjDaPmM9uRYgNmLuU2eqAARF8vX616Ujz3wAGfTyLK
	 E5TZmCp7aCUmazqXGtQAwE+0xxALHZCoDv6pF+a2uN51Q4JxwqAoDfQkYnKnmIFS9l
	 JbITCJLj6U7tSyrhVqRPatVQdvVLoBchGuxljqYuJp/zNW1N/n4Tyl8JZ69yyB8x6X
	 y7ExtB5sc/1Hloa/p/JGAzXdGa1U1IPFlhzn+MEU+X3B9NhLEA+LwX3NZkWNOD9Tgx
	 8jPMEICeHzymu5qZSHKHGkpJgHRXvfor9d6MR4pvbBpgpuLFWoDj0Aug+D84BzZaRp
	 WveoTopHFukaDU9dgrasYcIpVsvYEHREkHgYfbe7KMFFdmpwiyvBPlihqjieXCpD+g
	 kAdmvYhHy+8dVwGMXIAmsTHo=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6B90C40E00C9;
	Fri, 14 Jun 2024 19:10:02 +0000 (UTC)
Date: Fri, 14 Jun 2024 21:09:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, hpa@zytor.com,
	dave.hansen@linux.intel.com, mingo@redhat.com, tglx@linutronix.de,
	x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	zackr@vmware.com, linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com, timothym@vmware.com, akaher@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org,
	kirill.shutemov@linux.intel.com,
	Tim Merrifield <tim.merrifield@broadcom.com>
Subject: Re: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
Message-ID: <20240614190956.GFZmyVhLGeyLjwvA6X@fat_crate.local>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
 <20240613191650.9913-9-alexey.makhalov@broadcom.com>
 <844ef200-aabe-4497-85c9-44fc46c9133a@intel.com>
 <20240614161404.GCZmxsTNLSoYTqoRoj@fat_crate.local>
 <74f8300b-3520-4824-81e3-71464e3da3b6@intel.com>
 <1750e44f-f9a9-4c2a-afb3-f1ae8237ccb0@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1750e44f-f9a9-4c2a-afb3-f1ae8237ccb0@broadcom.com>

On Fri, Jun 14, 2024 at 11:32:16AM -0700, Alexey Makhalov wrote:
> 
> 
> On 6/14/24 9:19 AM, Dave Hansen wrote:
> > On 6/14/24 09:14, Borislav Petkov wrote:
> > > On Fri, Jun 14, 2024 at 09:03:22AM -0700, Dave Hansen wrote:
> > ...
> > > > You need to zero out all of 'args' somehow.
> > > 
> > > You mean like this:
> > > 
> > > 	struct tdx_module_args args = {};
> > > 
> > > ?
> > 
> > Yes, or do all the assignments with the initializer.  We seem to do it
> > both ways, so whatever works.
> 
> Thanks Dave for pointing that out. I missed that at v7.

Ok, I'll fold this struct initialization oneliner into the last patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


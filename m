Return-Path: <linux-input+bounces-3797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BD8CD2D5
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 14:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D75F284D1B
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF49E14A605;
	Thu, 23 May 2024 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNlP+wZc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA514A0A7;
	Thu, 23 May 2024 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716468763; cv=none; b=ZnKYFtghVe3ECEHlIZCSE+fFq9EfeKIpJFLhIUJnErCJwuJ48IZmDoWHQR96XysIoMrJGixrgsi1RzEQgoHMSzQbmrbRqSm5VmB75Qq5zkSCOvBoB6Wu67eg8nS9eocHhWZBV3QUhu2jvF8l+uEcXH4+sV0KGfAOxGv8woSXZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716468763; c=relaxed/simple;
	bh=Ov/eNwLh6BA6kwXNxjQ7wAB32sy+biR+igd64TMYcKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=elniYKlqfChHEpuucotuOtPH75JEThBXsf4IblkrQMym0R4KDXgHsOx7rQXch9YrVhXq9ueB/HV4gtm6NVbJqIAH8E/Dgb8PyJwT9aj/jzV4BXuPTfbpI596fgsu3pHMpfhAeEvGNM8DJRZ/BzAHG2wfgTHJiF7SSZUvcY7D/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNlP+wZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B82C4AF08;
	Thu, 23 May 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468763;
	bh=Ov/eNwLh6BA6kwXNxjQ7wAB32sy+biR+igd64TMYcKU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cNlP+wZcnCn9mrC6KpXYEy4bYbB28Rhe03birPWNkEGZflvi5Iczsz3MmrtLwIfWA
	 z/oJ/1KV1bHPo4INIid6VCuAPCh5eun68WfG6WUNSr5W7vZmdJgChreV23y/oJVO7E
	 HrvQdSV2aDkr31+o6kkl2juhfqji6l2TRM4ustIgZ0eBTBWNyEs1NlTVgBMlpRadOs
	 uC5yVH2jlU4W6PjBa+vRsRqnmlgD7KRvHS1xYYClxYs/PIESZ2LReivBaDHegXB+ND
	 fD6BEvW4q1yV9+uJJHglUK1+Gxl5Mbhw0jbn64+4O3Oj4fD+cxYXesmP1yLJP8tpA8
	 I8YeB5Mj3nYHQ==
Date: Thu, 23 May 2024 13:52:35 +0100
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
	Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>,
	Joe Perches <joe@perches.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240523125235.GA907834@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683225e0-1cd3-4dea-bb68-086d46b233e8@broadcom.com>

[ resending as I mangled the previous attempt , sorry ]

+ Joe Perches

On Wed, May 22, 2024 at 04:39:57PM -0700, Alexey Makhalov wrote:
> Hi Simon, apologize for long delay
> 
> On 5/11/24 8:02 AM, Simon Horman wrote:
> > > diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
> > 
> > ...
> > 
> > > +static inline
> > > +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> > > +				uint32_t *out1, uint32_t *out2)
> > 
> > nit: u32 is preferred over uint32_t.
> >       Likewise elsewhere in this patch-set.
> Good to know. Can you please shed a light on the reason?
> I still see bunch of stdint style uint32_t in arch/x86.

Perhaps there is a document on this that I should know about.
But AFAIK, u32 and so on are Linux kernel types,
while uint32_t are C99-standard types.

Joe, are you able to shed any further light on this?

...


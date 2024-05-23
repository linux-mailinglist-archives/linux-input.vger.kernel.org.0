Return-Path: <linux-input+bounces-3796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7F8CD2D2
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 14:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6EC31F234F3
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E685A14B082;
	Thu, 23 May 2024 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwjod96j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16CC14B07B;
	Thu, 23 May 2024 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716468662; cv=none; b=cg4bGN58HyioD4qOH6RCp3Arm6y/2HP6QrWJAC7xQng2qz/UuG54wsGsBuk1u70LCT3FxGlDpyWkk9bJCfPY4jiqGeEBAbsFlA5X7DdPEJc8Ch5PjqbU7YnuC2iEBK7DVqI0SKFoBcKBhH94WN1dpmpwvlot6yiNG7otedhuNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716468662; c=relaxed/simple;
	bh=SE/AcBnibbHXcnZ3edG7LB2eAeI51NeMqnEBvDf6bKI=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lF2ZAsfTiWMOabX9+3oK2Zm5Ytz+ZvhmJaG0mI5m31lBRJJMY9U/fl1lJ5+TsMnKTo/oUS0dgZwBiJQ89KMoNIlwKVOFANGI34bzGTXcxIRjBLhrdWlepNyaznSIs6SifYIvyzxHEwdGdsg5KWrZUXVVn4C1xdqUl0+9SQWb8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwjod96j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3862C2BD10;
	Thu, 23 May 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468662;
	bh=SE/AcBnibbHXcnZ3edG7LB2eAeI51NeMqnEBvDf6bKI=;
	h=Date:From:To:Cc:From;
	b=pwjod96jVg2xfUFRbx1AaDAhg/huX+Go3KIY3xoGIES2JihxdndxYdDOOaT6dTa+Y
	 /hyEiwsOnDAqhXATBfo9rHljyfVeazHPUHeOJbhFo4i3tLT//g/I7A8HFhWj8Aa9no
	 eD3M+WDVzJzF7nNnFoDEtr71XfoJNU7l6U6Yl/ExLIgXltUngo9rXpH9OEMeZbf68W
	 Ouxzf5qcD88qlLWvgvqGRkAenpfDLvLiGsB1F2tvgPiYKCnfvG44xM0gKESlxII5S6
	 517Ij8Cm9z/urcfd8gViiw2UhGug/eztfiPExUnCCqk6RzlVxk1zTCDssZ28UNBcEG
	 MEAAlhgearz6w==
Date: Thu, 23 May 2024 13:50:54 +0100
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
Message-ID: <20240523125054.GL883722@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Bcc: 
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Reply-To: 
In-Reply-To: <683225e0-1cd3-4dea-bb68-086d46b233e8@broadcom.com>

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


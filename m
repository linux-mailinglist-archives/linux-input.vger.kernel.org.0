Return-Path: <linux-input+bounces-4336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8A90661F
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 10:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50A9F1F21CDC
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 08:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600A113CAB8;
	Thu, 13 Jun 2024 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f/V7kgni"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4813A3F4;
	Thu, 13 Jun 2024 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265856; cv=none; b=Bjknf+Gw0nX/Esfrf2NVnMqAUUtxeK4iyiF5s5AoMF2dhXGJqtiNbbijOBQIt3buM+Ery3GANF9ZEZpF2ehHmYRUtx+l70KSeOvuPu7HS3MM8W5VmywyvifxG4ouLXT6XKArgriF0+pWY08Pnop3bnlOJb0S84dbgS16Q9GjpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265856; c=relaxed/simple;
	bh=IdG4D2c8cFs3v1ttE/xT9pEvTorNWoMLU1M7kAVEwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf1mXuZdADOD0Q445kYMXgLuwrouIrIfUrL/1kD50CQMhR392lQD8QSRZni9JVJnSzdwk50lp3iYg6acmUNLBMBF/dhioETUhm0SwH9yz325PavrbtexK/4frT/vbiCSUWan1Vkgx25We97JFs+2/O/wVqF3Q+cInPj7F7dj6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f/V7kgni; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3393040E0176;
	Thu, 13 Jun 2024 08:04:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h8uzvgyUn1Zb; Thu, 13 Jun 2024 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1718265849; bh=CXGamu8jKIXOAZLQQMPeCyqZUI6y95bTPViTuHGstrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/V7kgni8MqGhgjd1en6uOEtdwzlwB8Q2ophMmCKYH0x0BIGKhGrf/U4tDU9Z+r+E
	 GFxFwsCFd2CbJH/BbvPS8WZdwaguKOG4tIAsK8qhJ3VGp2xYore3f+/v/Nr8NHd10J
	 CcH5j9ouqky30cO9L4BjtaNSLT+i0+5nmHw65zm5kgj5Xjcn8aHAadAFy99Hyu37pt
	 /o6us2VJ1Pj89anyKx9T2oT0x3gdYWab14MxsnCgCQBxNo7DFpfM6o4uKhEt/PpCs6
	 krh3bqaLuyoVyYn9PI6aUMm+VCmPu/fnQJ8acvH418iRp6fcsshmpfOarlpb15Ipea
	 KYtRwriJfgWFy2MGOSzhozF9cN/v4vMUwodLQ3++rdBOdhVbO29ZqVrjT8h7vNTbkf
	 GgrldhecCOfOR+1Z7LvEunSZBbdxu4kvABVAHSlegdY98TsPKc/xAdNeJKSDrJGLbq
	 A0DfJJhxhbfzS/v0mvPbqwHxdj7fBST5Da98BEDg0Xi2BDehXtFDIQuUSmmBXH0YTC
	 D/R6ZlcnBKeN1TXRKe/2ZXkKn7eLsmVmX3Jhh04A+tyEQLOc3ZQOwBCFnZuR7jNMB3
	 yCY2zCE6SPnQ7fdp3OHyaBEH7Do63qUZc0gjRzJwC8PLe9HmsE1jXBkP/fYk3oMRae
	 Jvme4X2fj40CBrvKXHkfzjgM=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B125E40E00C9;
	Thu, 13 Jun 2024 08:03:43 +0000 (UTC)
Date: Thu, 13 Jun 2024 10:03:35 +0200
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
	kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v11 1/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240613080335.GBZmqn12gqzWlNZHGH@fat_crate.local>
References: <3d6ec46c-53c2-4a13-90ff-eb419863c1d5@broadcom.com>
 <20240606232334.41384-1-alexey.makhalov@broadcom.com>
 <d366491d-2f5b-478c-8968-b0a3a298827c@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d366491d-2f5b-478c-8968-b0a3a298827c@broadcom.com>

On Wed, Jun 12, 2024 at 03:11:54PM -0700, Alexey Makhalov wrote:
> Borislav, please review v11 implementation of 1/8 based on your proposal.
> I'm waiting for your feedback before sending full v11 patchset.

Sorry about that - -ETOOMUCHEMAIL. :-(

Yeah, that patch looks all good and regular now, and at a quick glance you know
what's what. I think that's definitely better than what you started with. :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


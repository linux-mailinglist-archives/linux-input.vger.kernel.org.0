Return-Path: <linux-input+bounces-7036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52C98EAF0
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 09:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B74B1C21AD3
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 07:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529E1126C09;
	Thu,  3 Oct 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6mdUDXT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453F53363;
	Thu,  3 Oct 2024 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942373; cv=none; b=OoA1v1c3pG092cDBbKK7daLsAyY+/Lzm0xBeFpkQ+F7A3pCsvGE2bYtg4uHJzs3pwyfOpaU4VWMEFkXOnDtSlsVbXUmZfOddIAhAcSSMNMRfF6ricmdRC0TYULKKtB2O125JfWHDGPf63JFBgnVIJ1a0SXyaWRD65i1w08+33co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942373; c=relaxed/simple;
	bh=u3bNdgpJwaXpOuU+BR68/X+PxfKFgX2pTYi7L9TKK/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ2LK+9dyW+f/ACa/uc3sLk/0OKjpdnuXaUCPabcoOY9lTogz4NBaCYl/Rt3LOaGVsh+DHIpeGUvwwhc9ZEtCFrWiWDAoB3XfEmaw9FQYExGxyiahuLdLMH2U+QSzm8S0hyM9Nn0kBAi8AFaeMkuVEGwA3jaPIEpIYn9EqhIpNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6mdUDXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC58C4CEC7;
	Thu,  3 Oct 2024 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942372;
	bh=u3bNdgpJwaXpOuU+BR68/X+PxfKFgX2pTYi7L9TKK/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6mdUDXT9e8IqbzYfELf5HN2/SVc0ysG1Q9mV0aeT/+gi0V05qrYZ2vgG3XGlWUlN
	 RGQsCzBFGyZiZjO1fhbeFPJkhPobwQIFf1nzCipamc/8T5qh26IssOyNMk1uGvFfw3
	 oRKqpPzrBOXg28AAASckTrGv4Dpckxon0BApSzrqGMQzd2Ort8iFg00NuUQCvfGnWe
	 c8opI30xybgTK60diIdFMknz6BLI/YQV2mGDF29QUumHKufS2lCSzsnvOFv92ks0u6
	 PAkeZFMLVHjyxrA8C1cpbtoceBJX6ttaAEGbfHwZD9C5Yq05yC8N/7RwtVgP1+6NRD
	 hCiwev3Org7kw==
Date: Thu, 3 Oct 2024 08:59:27 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241003075927.GI7504@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>

On Wed, 02 Oct 2024, Werner Sembach wrote:

> Hi,
> 
> Am 02.10.24 um 14:52 schrieb Lee Jones:
> > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > 
> > > Hi,
> > > first revision integrating Armins feedback.
> > > 
> > > Stuff I did not yet change and did not comment on previously:
> > > - Still have to ask Christoffer why the mutex is required
> > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > 
> > > Let me know if my reasoning is flawed
> > Use `git format-patch`'s --annotate and --compose next time please.
> > 
> I did but --compose does not automatically insert the subject line, that's
> why i copied it but forgot to change it to 0/1
> 
> Sorry for the flawed subject line

And the missing diff-stat?

-- 
Lee Jones [李琼斯]


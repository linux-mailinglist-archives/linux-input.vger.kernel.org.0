Return-Path: <linux-input+bounces-7152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AD199496E
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 14:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF160284BBB
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548371DE3D4;
	Tue,  8 Oct 2024 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaQ0xXWz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A1A1DE2AE
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390151; cv=none; b=DkmLuaQve6r3aLGOxCZ95ECIf5fHLfe5W+wtEJ8EdoPbqw6+2u0VaRVW9G6qm+9PhYNKwoGagGlUofLg9MrPxM7rTd6VBp50xu2lGedZlsTaS7rB/WDjj01dq5FpvcTipuU2oWkL+iI779cAWnDqVHxhFUrdPAm+rBnprHXBVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390151; c=relaxed/simple;
	bh=viZM2nd7aATnm6GpI5ussl3mi6C4xUVRc7YQeVI69dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThWFH717mjW8Z9XxNkzT5kfxX+B5QmjbIeOHVMBoGfn6SQDaTMJ318LL4Aa2Nkkl0HbH6uqDxiYBN+kAYILekFC8Uwkfr+hcUr9JZZ0iywzhTs+QmhoDa2dNI3r5qvTsMozPeiJnl79V3RAk4JqJUrEY3ITtZ0lMzAjcYLFdvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaQ0xXWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA10C4CECD;
	Tue,  8 Oct 2024 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728390151;
	bh=viZM2nd7aATnm6GpI5ussl3mi6C4xUVRc7YQeVI69dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaQ0xXWz3/EI4dMeUWChUQsfu08rzqqnWdc8D5JcbPPWhQen3bWkTna4NSzVEuQtV
	 wPejBzqXRVgWecl7zK79SstgYTateoojhUGIuCU4kLhmkuI0eH8uXcd2TTx9eo0gac
	 FbC6kS+lS0qNZqClwbiKxpAY4qyngewualHQzjV7LKcMacHYrW2eEjyfEn9AFu8lXI
	 NWk05drZ3D+NruiSyNTSQtzJUSQiSUygKJ98dYxSViYJCETxpdZ8xU4uN2fZhnSOea
	 bwWBe/72ClG1AvUP2RR5WhL2J6BHQvgtxH4viztUqJ0lgLVA34WUaUJfax2qZ4GLh3
	 3x32L/xUICkng==
Date: Tue, 8 Oct 2024 14:22:26 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>, 
	benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v3 RESEND] HID: logitech-dj: Add support for a new
 lightspeed receiver iteration
Message-ID: <3em7iqlhus7wl65svj72yqaj3fuwhngifsx2omp36t3drfrlrn@px6pri2xj6em>
References: <20240627224242.193873-1-mavchatz@protonmail.com>
 <nycvar.YFH.7.76.2410081200050.20286@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2410081200050.20286@cbobk.fhfr.pm>

On Oct 08 2024, Jiri Kosina wrote:
> On Thu, 27 Jun 2024, Mavroudis Chatzilazaridis wrote:
> 
> > The lightspeed receiver for the Pro X Superlight uses 13 byte mouse reports
> > without a report id. The workaround for such cases has been adjusted to
> > handle these larger packets.
> > 
> > The device now reports the status of its battery in wireless mode and
> > libratbag now recognizes the device and it can be configured with Piper.
> > 
> > This receiver has new descriptors, which have been added. The mouse
> > descriptor has 5 extra vendor defined bytes at the end, while the keyboard
> > one has a different report layout and minimums/maximums. As such, mice
> > with key press macros and keyboards that use this receiver misbehave
> > without them.
> > 
> > Fixes: 9d1bd9346241 (HID: logitech-dj: Add support for a new lightspeed receiver iteration)
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218172
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218094
> > Link: https://lore.kernel.org/r/CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm_jjVpWKgFQ@mail.gmail.com/
> > Link: https://lore.kernel.org/r/6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com/
> > Co-developed-by: Filipe Laíns <lains@riseup.net>
> > Signed-off-by: Filipe Laíns <lains@riseup.net>
> > Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> 
> Given the regressions this caused in the previous attempt ... Benjamin, 
> would it be possible to get some sort of extensive targetted testing in 
> your CI, please?
> 

I wish it were that simple. I currently have a unifying receiver
connected to the CI and checks that the driver brings it up. However, I
do not have a full receiver emulation, meaning that I can not do full
extensive testing :(
That's one of the reasons why I hate so much that driver now, because
everything can fall apart so easily :(

Cheers,
Benjamin


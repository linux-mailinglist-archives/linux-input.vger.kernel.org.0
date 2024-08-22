Return-Path: <linux-input+bounces-5741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B395B45F
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 13:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE66282F78
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 11:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5D21C9424;
	Thu, 22 Aug 2024 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIMzc0OL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E396E1C93C9;
	Thu, 22 Aug 2024 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327844; cv=none; b=RpSZl0PcI3tz0ldCnaoj/iHGd3SXqgy2+QNAT91DuwcqsQFhYYgP4U3F+w/m7zGVWZ7cEBDux60+mcYDN5BkTmVtXdOppgB8e1AGLkTMM9ptZX2G65R5rp7Jly2uXtTtaiIxiq0OnDnN7nCImCSx7H5F8kt4bMJq7e3mDNexP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327844; c=relaxed/simple;
	bh=VElb2Qz/eI+LBiQfx0tJ7SZXVYDEbkmfxSrb8TLhlDE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Gm/x+Q/XrxhKvn112YTnzdzbbPZfnyy6nxYvDLKtK57LzrluvZP+IGzRFx3HyZ1MRn6QZU+dDJb6shjGX1i59g370GrjWMmf4tWPOyzbRQ7qCnhnalLwgjqxLbod27V7O+Jc/+wuIv5sEEevB6rmvnIFVCVQZ98Vlx5E6shQ8yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIMzc0OL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664E4C4AF0B;
	Thu, 22 Aug 2024 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724327843;
	bh=VElb2Qz/eI+LBiQfx0tJ7SZXVYDEbkmfxSrb8TLhlDE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VIMzc0OLHqoRjD9RGMhNRukWiJ3Xbyjnt+Bw9/S1/XiOgjIQfAxxQW+7wHr2gMVcJ
	 4jg4s2WFgq7BXlOQxKgDKHhllAt3Hl5RYoBvZdozSx/yG9fyXczYHL/6Slxy4FdXnD
	 5ohBL/DR17aFKOPBKMCVBc8UBPLrlLpN9XcmaK65oxk/1n9+/xa5TUWs+0kY7HxQr6
	 ttaCdup0mUuf4Bcnjmddc+fKN0lWjjZfnpydpnmZlOZCPhJyEJoVjUY/MKwB1H4QmX
	 9RgdZ8fTvNhanbDFubxyiODSASMetT7g9FRUfwbXaAXTttV6gAFfdbGa8tjAz02vUn
	 OtAcSeZhVKpXQ==
Date: Thu, 22 Aug 2024 13:57:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart <stuart.a.hayhurst@gmail.com>
cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    Markus Elfring <Markus.Elfring@web.de>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
In-Reply-To: <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2408221355360.12664@cbobk.fhfr.pm>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com> <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de> <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com> <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
 <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com> <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de> <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr> <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Aug 2024, Stuart wrote:

> > If I recollect correctly, there may be an alignment issue and just using
> > the stack is not enough to guaranty what is needed.
> 
> I can't find any reference to issues with it, I'm not sure what I saw before.
> Also, it seems like the hid-asus driver is using it:
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hid/hid-asus.c#L391

You can't do DMA from stack; see section "What memory is DMA'able?" of 
Documentation/core-api/dma-api-howto.rst

-- 
Jiri Kosina
SUSE Labs



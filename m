Return-Path: <linux-input+bounces-16526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243ECB2E23
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08AED302A941
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 12:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EB9319601;
	Wed, 10 Dec 2025 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agunRaHl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D1285074;
	Wed, 10 Dec 2025 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765369543; cv=none; b=WzxPFOBOxKTb1AIrjZMQnYDXKDpPp1QuLsVneKs+YRStlMxHwgTNqFf64ctjkXX5QvP9INOiw4GgjhvuKsP0qDqMGRtVAs537ICZ+6kATpUc1hTy4irTqOnJA76jD6qO29dtt8c8QElMZy0BfDnMYbHE7eb079Y32pER1CejUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765369543; c=relaxed/simple;
	bh=kg7rv6+yVUAMfvaHiJYZ/8ESn241AKJrqTsZ+i1IDEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aer+RChqg3rSLlp4DxN9Th4nH5XR7uKJfEFlApuLNo9c69vSdekCdNAg2BSIchCBjFVdC6iwJcnzo94zxwHvstd40A8k6pPJ0MBa5W3zHyhm6Q/S0l5GBtIuA5kh7N86UH2lpRp7eVVjPid7eI1Xoo7Yd3oDrAg33CRDMMrIXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agunRaHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98EEC4CEF1;
	Wed, 10 Dec 2025 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765369543;
	bh=kg7rv6+yVUAMfvaHiJYZ/8ESn241AKJrqTsZ+i1IDEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agunRaHlMKPh9waGbLj+f9lqH5I1Az4WV3IqK5oP/M1o51c0qPcc6Eu6zFH64Jg7T
	 oD1QAQKuwnUOX9ji0C+6IMyuFLYXp2Ck4jLdk7LvvQQQluhgcNDgjq/wPfZ7P2bqA3
	 Z9S1nhJ4tFE48WTUBH30kzqThmo+ZpLb3mCiZeZqyCEmFrRCtvbGxBSoQssOFxyCUA
	 pL6WnGLwbi6MZBEW5or40ntygSAYN2uk8mdAtWBKDnGZLNogQuKm5daGUF97eafGo/
	 wuIfn4ibTwHnwqOVg2cWmZ8xWo6yrsUp9/5rGv1uULHrOe4zo+xbp7zCtOpdVj1D59
	 SjZIvJxX/IVrg==
Date: Wed, 10 Dec 2025 21:25:38 +0900
From: Mike Rapoport <rppt@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Minseong Kim <ii4gsp@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] input: synaptics_i2c - cancel delayed work before
 freeing device
Message-ID: <aTlmwhOF3zB1UkrI@kernel.org>
References: <20251210032027.11700-1-ii4gsp@gmail.com>
 <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>

Hi,

On Tue, Dec 09, 2025 at 08:40:54PM -0800, Dmitry Torokhov wrote:
> Hi Minseong,
> 
> On Wed, Dec 10, 2025 at 12:20:27PM +0900, Minseong Kim wrote:
> > synaptics_i2c_irq() schedules touch->dwork via mod_delayed_work().
> > The delayed work performs I2C transactions and may still be running
> > (or get queued) when the device is removed.
> > 
> > synaptics_i2c_remove() currently frees 'touch' without canceling
> > touch->dwork. If removal happens while the work is pending/running,
> > the work handler may dereference freed memory, leading to a potential
> > use-after-free.
> > 
> > Cancel the delayed work synchronously before unregistering/freeing
> > the device.
> > 
> > Fixes: eef3e4cab72e Input: add driver for Synaptics I2C touchpad
> > Reported-by: Minseong Kim <ii4gsp@gmail.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
> > ---
> >  drivers/input/mouse/synaptics_i2c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
> > index a0d707e47d93..fe30bf9aea3a 100644
> > --- a/drivers/input/mouse/synaptics_i2c.c
> > +++ b/drivers/input/mouse/synaptics_i2c.c
> > @@ -593,6 +593,8 @@ static void synaptics_i2c_remove(struct i2c_client *client)
> >  	if (!polling_req)
> >  		free_irq(client->irq, touch);
> >  
> > +	cancel_delayed_work_sync(&touch->dwork);
> > +
> 
> The call to cancel_delayed_work_sync() happens in the close() handler
> for the device. I see that in resume we restart the polling without
> checking if the device is opened, so if we want to fix it we should add
> the checks there.
> 
> However support for the PXA board using in the device with this touch
> controller (eXeda) was removed a while ago. Mike, you're one of the
> authors, any objections to simply removing the driver? 
 
No objections from my side.

> Thanks.
> 
> -- 
> Dmitry

-- 
Sincerely yours,
Mike.


Return-Path: <linux-input+bounces-6433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F4975A38
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 20:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48FB6B23473
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 18:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E581B3F3D;
	Wed, 11 Sep 2024 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvkhIGqz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6781B1509;
	Wed, 11 Sep 2024 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078858; cv=none; b=q3XffI319s79qkZGmOxNrv8ifXxpYIqg/iIzVxc5rvGNw1+whfd7J+E/Cem1GPJT4tfaemYZcwdn3t2XQZv8XtQvgUSoW0YUQoSs6b45ZAHXcRzCCmLdPuDy1pdvg05FvF6C2wQT1DRdOp1yw/Oc+tm5az5VGmDr3FcvS9bJtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078858; c=relaxed/simple;
	bh=U30uv7p7nuSQzeQzkIZzyrlb21RxZwIqgiZV1WNe7eU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ly0w+eRtnzF5a0VFt9/UWsN24jXUxya5+7adO6i0LPTLeBcsFdMkWmoRipnNni5VT5a+7CrwO4BSRfJFrwqq4cSKU8bfoTOSYi8c9XIEzt7Zb3s/F/5zWVxkKfJTOSR+D2gK2bNuzncDeoZY6xvAXOFDLPDHLBSYyCAEhvlVKww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvkhIGqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B214C4CEC0;
	Wed, 11 Sep 2024 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078858;
	bh=U30uv7p7nuSQzeQzkIZzyrlb21RxZwIqgiZV1WNe7eU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bvkhIGqzb0exb8V9vdM+Pc6CrieYCFaibdoeXzCOXs/lh0eDb3ZJZdo7FcVsLlPUq
	 41Hi4w6Dm4PVgSBZ9GHB9lbOz+fiGuWXbobEQTftNE+VO5OULaykqKfiKtAwZoktlq
	 HF0Y5Tg2H8capiTIB8BC4lHfkaFA5GdURS5IOeo8jZhbMq+rh/aKlHZWAh0oztUl2Q
	 UIDHCgL/8UhxkLsrFr5jRLgpZbP3FMBE1q/+ZoBxEi14923rIrvGKFt4XzQW5SQTcd
	 5BcJn7oXv+mF2zgwDmO4BcMUDspsGEnl8hMN/gmElUtREtZjC2jucn6xrTgGfid98f
	 OECwoumJ2B1lg==
Date: Wed, 11 Sep 2024 20:20:55 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: ". Benjamin Tissoires" <bentiss@kernel.org>, 
    Douglas Anderson <dianders@chromium.org>, 
    Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: ensure various commands do not interfere
 with each other
In-Reply-To: <ZuHe2zkSbwyr5syK@google.com>
Message-ID: <nycvar.YFH.7.76.2409112019460.31206@cbobk.fhfr.pm>
References: <Zt9clAu04BinzIcd@google.com> <nycvar.YFH.7.76.2409111526450.31206@cbobk.fhfr.pm> <ZuHe2zkSbwyr5syK@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Sep 2024, Dmitry Torokhov wrote:

> > > i2c-hid uses 2 shared buffers: command and "raw" input buffer for
> > > sending requests to peripherals and read data from peripherals when
> > > executing variety of commands. Such commands include reading of HID
> > > registers, requesting particular power mode, getting and setting
> > > reports and so on. Because all such requests use the same 2 buffers
> > > they should not execute simultaneously.
> > > 
> > > Fix this by introducing "cmd_lock" mutex and acquire it whenever
> > > we needs to access ihid->cmdbuf or idid->rawbuf.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Thanks for the fix, Dmitry. Out of curiosity, did you find it by code 
> > inspection, or have you actually seen it happening for real, making the 
> > driver misbehave?
> 
> No, I have not observed this issue in the wild, that is why I di dnot
> tag it explicitly for stable. 

Thanks. I was asking whether I should rush it in still for 6.11, or 
whether waiting for 6.12 merge window is sufficient.

So I will send it to Linus for 6.12, but I still think tagging for stable 
should probably be done.

> It came about when I was reviewing Goodix HID SPI driver, noticed that 
> it was using a shared buffer, asked to and locking, and realized that 
> I2C HID needed the same. And just got around to sending out the fix...
> 
> As far as I can see USB HID driver does not need it - it does not share
> URBs but rather allocates new one for each request (via
> usb_control_msg()).

Indeed, USB HID is fine in that respect.

Thanks a lot,

-- 
Jiri Kosina
SUSE Labs



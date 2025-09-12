Return-Path: <linux-input+bounces-14651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5962B550BC
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B267C5C7D
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075C0311C15;
	Fri, 12 Sep 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYfiG/Jp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A13101AE
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686501; cv=none; b=Czr9tscXQNQpANtT62KEedU4K3Xak0w/s991JKfARWzvnRZ4SKRjoyITqzfTOif++1haDGoHdSkfIKBqQd/xfAR3Jwn8ufrYqCy7iX7eBHRU+YzWBO3+ulEk9dZk0e9iwJyjyXSmzyCCsp4bCd+K5uOQKrhH3YKMLQiItZEHPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686501; c=relaxed/simple;
	bh=8WM7gGhXTz14AJnmz5FdasWGsN0IYWc2b/t0nMvO13g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tPOlrHheKs0xKGUuVqPhKg8qGgOt7grI2R/NK7vbIFwqj/3e6kW3Iq04s8FO3drUjmc1SAvNbNdPUPQ0jbrjnVkzbjUfot/QiB4V7nWNWTAZFwfghM8BXQR1ZkWi3F/PsX72OFAlwT6oB3xoMMDw+45ZvRqxJed/yaYQi7pZd7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYfiG/Jp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04D6C4CEF9;
	Fri, 12 Sep 2025 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686501;
	bh=8WM7gGhXTz14AJnmz5FdasWGsN0IYWc2b/t0nMvO13g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rYfiG/JpGKO1kx5bI2eISQp98HzrBaPjPH+QIkrluW3e5fziiPCm+/7BujMsR/fti
	 l7ZzR82s4ohX7I3VGLoDkfwE79lT9jdUcHgEbrEu6hn3rjmG2easP7aGGWrMXyCZ6n
	 9kgOV32zgWLXpH7xqoLNUDX8xZvcFbxbcRsBcYTGFDqgg7ORLr1BkyqWzDSD6HFUFO
	 q+AA/lCSB8wF8xF5530PlT77fJ3lG7vDq/UoFdvIBWzrsUnozML6Eo1k/jwh31B+pJ
	 oiOqzBizpWXynX9MGUo9BNkTvCOZF2LZJgFHyOjFPXAHkaWnh9KKdb5YkeikxS3145
	 mReQgYBPD6MNA==
Date: Fri, 12 Sep 2025 16:14:58 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: brandon <brandon@emergence.ltd>
cc: vi <vi@endrift.com>, linux-input <linux-input@vger.kernel.org>
Subject: Re: Adding Kernel xpad support for Flydigi Apex 5
In-Reply-To: <75r4880n-on78-7010-2q64-so6pp5qsos82@xreary.bet>
Message-ID: <r856p96o-850o-47sn-rsps-04n94875o975@xreary.bet>
References: <198f7064b23.1194b1b9d477339.120973386817363979@emergence.ltd> <75r4880n-on78-7010-2q64-so6pp5qsos82@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Sep 2025, Jiri Kosina wrote:

> On Fri, 29 Aug 2025, brandon wrote:
> 
> > Hello,
> > 
> > This adds support for the Flydigi Apex 5 controller to the xpad kernel module. This has been tested as part of: https://github.com/paroj/xpad/pull/328
> > 
> > This patch is very small and simple, it simply white lists the controller so it can be used. The trigger and stick mappings are none standard, but SDL has the correct mappings already shipped so it's not a problem in Steam or games I've tried.
> > 
> > Here is the patch:
> > 
> > --- linux/drivers/input/joystick/xpad.c.orig 2025-08-29 18:20:56.157442704 +0100
> > +++ linux/drivers/input/joystick/xpad.c 2025-08-29 18:19:29.539174760 +0100
> > @@ -422,6 +422,7 @@ static const struct xpad_device {
> > { 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
> > { 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
> > { 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
> > +	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX },
> > { 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
> > { 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
> > { 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
> > @@ -578,6 +579,7 @@ static const struct usb_device_id xpad_t
> > XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
> > XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
> > XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
> > +	XPAD_XBOXONE_VENDOR(0x37d7),		/* Flydigi Controllers */
> > XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
> > { }
> > };
> 
> Thanks for the patch.
> 
> It's however whitespace-damaged, and also is missing a signoff. Could you 
> please fix that and resubmit, so that I could merge it?

(sorry, it's not me who should be merging it, but Dmitry Torokhov as an 
input maintainer -- please CC him as well on the next iteration)

-- 
Jiri Kosina
SUSE Labs



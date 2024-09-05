Return-Path: <linux-input+bounces-6243-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6696D2AF
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804BD1C2204D
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4C9196D98;
	Thu,  5 Sep 2024 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifiJyozK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9678F66
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526923; cv=none; b=DlLwMvwBkXDi8rxYFH7bI4E0CI6Cucge3FKhxklXPCwAnerRhK8qoF/P+EWPOIv7zO7lruXGyJGzt/ejMdgRzadj89SI0t0B8GMKPIbqbK7+MwTU17uAh2JSsWDsurCYEgCpxcXuiWedLh/XID9SUAeGECqKRM+HfjU57HdR4ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526923; c=relaxed/simple;
	bh=bH2mI7Ap5CczcC+J831N881N8PwZ7e/jVP/vQQYqdjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5F84UJaRslW9gsZ/WkaFJuo8ykP0QzuvX3BNWgTp+kh16bu/4NYAhXwxYoEwGoJsrEQ0DAsk/oknEq/IteJMfyDBBaKsKF5iG+/LWK+dZ3GYrh5aeaHzw24/Hb6NHoJBSNDj0lmVf0n/IsGetTz51SyRu7Fck0DncakPsey7ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifiJyozK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9083C4CEC4;
	Thu,  5 Sep 2024 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725526923;
	bh=bH2mI7Ap5CczcC+J831N881N8PwZ7e/jVP/vQQYqdjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifiJyozKnmS1OfMVHeV9q1Mbim69ulpQuab0G/aPYIuG9OGRFwdEtEQAclbiy6deK
	 NwmRdZN9nmoyd6wYrcpVeth8MXS3sE2J4xwlg03WOxXZWDuOMeJujd8/bHkGDdP99x
	 9x4guT6opihg7k4QOK5gLCkqc2x8unmEUbNV2W2VjXRd8cUlJGHkZ129BxcvYdV1Uh
	 Cr93fJ78NDtgW6WDEW8LXddxQ66cKz91r2uwq+pBsWesP1YeqdMPDDZLwaRfugz2rF
	 v4GXwloj6qHtawlGHPc8CecE85qsj0oz1mUBhGc/4ExAm9OYaI6wiSNVtW6agXGdYx
	 JO5HbH5NmLi7g==
Date: Thu, 5 Sep 2024 11:01:58 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: "Gerecke, Jason" <killertofu@gmail.com>, linux-input@vger.kernel.org, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ping Cheng <pinglinux@gmail.com>, "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
	Erin Skomra <skomra@gmail.com>, Joshua Dickens <Joshua@joshua-dickens.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>, Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [RFC PATCH] HID: wacom: Stop mangling tool IDs
Message-ID: <73s746uhpe7d6dazdve43s7s63t46dr5a2dtwh5json6wywrdi@soh7iqmzgtuj>
References: <20240903182633.870892-1-jason.gerecke@wacom.com>
 <nycvar.YFH.7.76.2409051045470.31206@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2409051045470.31206@cbobk.fhfr.pm>

On Sep 05 2024, Jiri Kosina wrote:
> On Tue, 3 Sep 2024, Gerecke, Jason wrote:
> 
> > From: Jason Gerecke <jason.gerecke@wacom.com>
> > 
> > In ancient times, an off-by-one-nybble error resulted in the Wacom
> > driver sending "mangled" tool IDs to userspace. This mangling behavior
> > was later enshrined into a function so that devices using the then-new
> > generic codepath could share the same broken behavior. The mangled IDs
> > have not historically been a major problem for userspace since few
> > applications care about the exact numeric value of the IDs. As long as
> > the IDs were unique it didn't much matter. Some programs (cross-
> > platform and remote-desktop applications in particular) /do/ rely on
> > the IDs being correct, however.
> > 
> > This patch rids the driver of the mangling behavior.
> > 
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
> > References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
> > ---
> > I'd like to get the opinion of the kernel maintainers on making a
> > change like this at some point in the future. There are _very_ few
> > userspace uses of these IDs (primarily: drivers, compositors, and
> > tablet control panels) and my plan is to update those bits and then
> > give some time for the changes to roll out to users before re-
> > submitting this for real. I don't expect any kind of breakage since
> > we'll be taking our time with the rollout and userspace needs to
> > have handling for "unknown" IDs anyway (since Wacom periodically
> > releases new pens).
> 
> As you are in control of the whole ecosystem anyway (because it's Wacom 
> specific), I don't see it as particularly problematic.
> 

Yeah, same here. And that change doesn't impact the basic functionality
of the styluses: they'll still be handled properly as pointers, but only
the configuration panel IIUC. Peter mentioned about some slight
differences in libinput which shouldn't impact the users as well IIRC.

Anyway, that's an OK from me too.

Cheers,
Benjamin


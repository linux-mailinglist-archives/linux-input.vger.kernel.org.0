Return-Path: <linux-input+bounces-7217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDC997037
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FC11C22603
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EA11A38C2;
	Wed,  9 Oct 2024 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fmzfqk5e"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991A1A255A;
	Wed,  9 Oct 2024 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488092; cv=none; b=CJ0pBSGSrdXoriYjvf8sahOHWBpnI3UGofipFXHtzSkslh6NdpVcZX+tVMRoNL1wJ4m+yiINCzwqqrr7U1cLCUxNlM8M2l2YnYFaf1wYS6sdQLCii3Q6CACJfLSxATEKY2BVTIa0DdmK75KguZ77CXn7lOd9CDQkaQ16mJ49e8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488092; c=relaxed/simple;
	bh=4PNzgfGogduGWQPu+MHgim+P8zX6H6O5QWyC5G289Ho=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GXxmpdHsuPkE6U/cv4UrCztVwhkSrtjGo2yCnsP7Y/xww8voY49nljnrkHq5IFmhPZWA2bhRWPwcvfCHaPPEuNbyvYLSyQVvgOZs6PUzXB8SjrCNz9hZxl8x2+Zs/jSydfCUjHVJoB0Toq+ZYyMTgckqaHge6rdRracuUtZ6K70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fmzfqk5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD8FC4CECE;
	Wed,  9 Oct 2024 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728488092;
	bh=4PNzgfGogduGWQPu+MHgim+P8zX6H6O5QWyC5G289Ho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fmzfqk5e101K7Llaiaf85bSK+T4tMqa8R8Y1FN8tSUWXVAN3s5htDgb6dicZahs09
	 6S+4tU2+8Zn6oM2Qp3qu2MGI1w7HWmfHdh8UqeGxLw1snuHPejQTu+l3ZYyi/q5LEL
	 CGJJ5IAoKi3ZWCgrjnrpiTuBVpHEa08Nkx5yb2k4mciElAJgEjvRQzjrQTMSsbP4on
	 QfAOXqFOB4oZdJGKOUs47MmTW04TnGpupMLP+U1CdPtSN+9T5R2ikEF/2Cfij5PeCK
	 OLWfDt7TGszKAQk3k5V1rkglPOog8s2b+9eEm8egw7fS7Ac15Z/EE4CW/zlJBd6/wl
	 vX7QpfqzBnnMg==
Date: Wed, 9 Oct 2024 17:34:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
cc: Basavaraj Natikar <bnatikar@amd.com>, 
    Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-input@vger.kernel.org, 
    Chris Hixon <linux-kernel-bugs@hixontech.com>, Skyler <skpu@pm.me>, 
    Richard <hobbes1069@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
In-Reply-To: <5b352033-2738-4804-86f8-d99b7701d655@leemhuis.info>
Message-ID: <nycvar.YFH.7.76.2410091734010.20286@cbobk.fhfr.pm>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com> <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info> <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw> <79320190-8461-4a92-bde2-29a3988a6782@leemhuis.info>
 <2214cdc6-2384-dc6a-f77c-fbbe53d979a1@amd.com> <5b352033-2738-4804-86f8-d99b7701d655@leemhuis.info>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Linux regression tracking (Thorsten Leemhuis) wrote:

> >>> PS: sorry, I know this is a long standing issue, but I'd rather not
> >>> paper over a bigger issue :/
> >
> >> Yeah, me to!
> >>
> >> There was a new patch in bugzilla and people tested it (see
> >> https://bugzilla.kernel.org/show_bug.cgi?id=219331 for details) , but
> >> nothing has happened now for 48 hours, so please allow me to ask:
> >>
> >> Basavaraj Natikar, is there any hope that a proper fix will emerge soon?
> > 
> > Yes , please find link for the fix as mentioned in bugid.
> > 
> > https://lore.kernel.org/all/20241009144757.3577625-1-
> > Basavaraj.Natikar@amd.com/
> 
> Great, many thx!
> 
> Nitpicking: still no stable tag though. :-/ And ideally Richard and
> Skyler would get a "Reported-by" as well.

I don't care all that much about stable tag, but if there are more 
Reported-by:s, I like to give credit where it's due, and I don't think 
rebasing for-6.12/upstream-fixes because of that would break anybody.

So please feel free to send additional tags, and I'll rewrite it.

-- 
Jiri Kosina
SUSE Labs



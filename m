Return-Path: <linux-input+bounces-6775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D69878F4
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 20:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C32D9B2699A
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 18:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5B515F308;
	Thu, 26 Sep 2024 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+HIgG9Q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669013D889;
	Thu, 26 Sep 2024 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727374297; cv=none; b=k8xbI2h36Ze1hgu98wZcHKKPbW8hYsncHuBxh35FGgm7HQB8HrQUD7XOtq/xXurNCI5wjsv1xoSetbU+h5A21Nv2YwPBAc9VBlc0opP/bwRlAw8INfgBFMR7RjZxvbMCb8nt/vRvLMRvuFl79rQqMvMA+gEA+HFD6JKp2SGE92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727374297; c=relaxed/simple;
	bh=56mzS41ce5/9+IUEXD+XVGSW4V+p6gXfuozlaZk9EHA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K3aKYEqTtoCgtKEjX+d6xik8vLBVPvFzP1VYEgz/2aIOGqHu8GGjt5tor3/Y1VtQtDcuXvgNOtKMY8ksrwm2XVk9mkctTMaExGkGE1NjZA7nK1QU0vrT8XUQwJV5kkkHB7Y+dngnoYv1Q16zmg2Q2Uhjo+h5FLrw4JjJ5O/SiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+HIgG9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8894EC4CEC5;
	Thu, 26 Sep 2024 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727374297;
	bh=56mzS41ce5/9+IUEXD+XVGSW4V+p6gXfuozlaZk9EHA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k+HIgG9Qa0Js8se64sSEDRTVXfWAaGsFccLLDAutjuscC/+5Z7Z/62y7bHexBCgDh
	 SB3wcRdE3yapuwAH/uMUeR/oGJt/tnwwDYy6YdcEVEE61jDZDG5kYDtADL0TX7MYML
	 vohhLGr3l640oa6DJDYogDw4bxr420CfPgZW93FkuO1ec8HroIHp8VSGRg4up7E3Gf
	 kjp90cba8zRUhtUFQe8WrMCycGPIm7tJoCIaHQhJEW3sj6FOLk5k28ZAc3nn0KyWUu
	 9uScWewce/j3ShmjOcH2DuaJ/PrqnGvC8XtYTfn+Z5xn+JJj6vgmcVme1Soh8ZYW3K
	 IN3deguGAwolQ==
Date: Thu, 26 Sep 2024 20:11:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>
cc: "airlied@gmail.com" <airlied@gmail.com>, 
    "tzimmermann@suse.de" <tzimmermann@suse.de>, 
    "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
    "mripard@kernel.org" <mripard@kernel.org>, 
    "daniel@ffwll.ch" <daniel@ffwll.ch>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB0217799EF124DAB1EB9941ACB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409262009240.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com> <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM> <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm> <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm> <MA0P287MB0217799EF124DAB1EB9941ACB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Sep 2024, Aditya Garg wrote:

> >> It has been more than a month since I've sent this patch set and I
> >> haven't got a clear yes or not for the same. I understand maintainers
> >> are busy people, but I'd really appreciate if I get some response for
> >> this series of patches from the HID and DRM maintainers.
> > 
> > Just to reiterate -- I am waiting for Ack from the DRM people and will
> > then take it through hid.git.
> 
> So I should assume the HID portion is fit to be merged now?

hid-appletb-* I have gone through, and it looks all good to me.

Benjamin, could you please explicitly provide your Ack for the multitouch 
changes?

-- 
Jiri Kosina
SUSE Labs



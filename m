Return-Path: <linux-input+bounces-5271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D5944A0B
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 13:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F491F29A2F
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 11:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8998183CA7;
	Thu,  1 Aug 2024 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqFMV6Tz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA1183CC7;
	Thu,  1 Aug 2024 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510459; cv=none; b=HJt0leyYWQynjfpnGh5JqDAHYchTsX43JH04Se8awdmU/cGQl/GN8aiQzbQndKEs7vr6kmi/ME6B+cz+tAPFN3fCO8fDPIFNHGAvtrgYYaYvUUZHhyU86KQ8J7D+MosGSVFr+7QpF6BkG8OMk1DYEagFZyPrKJb17/qzaw8ikaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510459; c=relaxed/simple;
	bh=nrXRn6jo3q8qJ+8iBWQWvu/KEr3WFZfgkq++HuYZ+gg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=If3zlgCfqlLRbDWIHBnKD1BxMG5TS7kLSXdhCbw0gfmwk7OtjqNYCgFMiYk2YqAq9S2nIA6AAnhkOICAAHYiGfy1Ji9aSO+xkrHnOowTQWt3T2ocBOvCS8B8KFp0iasyc8TwRADaGLYvXuOhhXNFyRAP9pfpY30SW1AY07gk3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqFMV6Tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABFFC4AF0A;
	Thu,  1 Aug 2024 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722510459;
	bh=nrXRn6jo3q8qJ+8iBWQWvu/KEr3WFZfgkq++HuYZ+gg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TqFMV6TziDZEp/jyXZpcLcKKrNs+p9CBazrZHPMTzQ+kCE5H3fxILjKIExtJZOYeb
	 rdig2Ke9qujtGBlJ2DcpBHPBNZovGHElIMYEpSg5swC2Va580MpTdcDvzDlvS4Hob1
	 rhS49bz10AFiTrJfhVNfk7WhV658ePC5XCVbHkrqs6jZGGlTO9zdhMrefQPAOhahlj
	 DiFggen8Iye1lBGTXZunySNa4UgXP5hefMDNHAsoZUUa1ZHySWX3WqKIo96ZVIadDX
	 PBtrwy4RgByzf7UxKTUHArKkthgMcmu487Xv7MnChPjcC6jWfdvs/Q5En2vZzjCAiL
	 0d1s/64dkSK5Q==
Date: Thu, 1 Aug 2024 13:07:37 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, Erin Skomra <skomra@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] HID: wacom: Defer calculation of resolution until
 resolution_code is known
In-Reply-To: <20240730155159.3156-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2408011305530.12664@cbobk.fhfr.pm>
References: <20240730155159.3156-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Jason,

this doesn't really look like a patch series, but rather a collection of 
independent, assorted fixes and improvements, right?

From my POV, patches 1, 2 and 3 seem like 6.11-rc material to me, while 4 
and 5 seem to be 6.12 merge window material. Do you agree?

Thanks,

-- 
Jiri Kosina
SUSE Labs



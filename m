Return-Path: <linux-input+bounces-5459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B494C791
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 02:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F049D1F24486
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 00:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2502F41;
	Fri,  9 Aug 2024 00:24:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32492564;
	Fri,  9 Aug 2024 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723163092; cv=none; b=bX39cMNrV3miePoqLrMvL191wuCn85n9JvtO0g1DXVu5Hz/d3uGK37FIf/XoPdhrZeefZ5VLZ8amJOXwd69nTEjo7fjEUprvglC1jIgkR3sAVykQM+lJg6sUhU3dRJQjNs3v6Jm1sIoadcgF1N3UCHluatIFd41dJ4pTwbxc0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723163092; c=relaxed/simple;
	bh=3ZyK0T3h/dUloSRJsbXXbwDIQIwL/sU/BbqWN1JN/do=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EyexFSLza1jdlHBemqxGFebRQWCZg7EaRXRlEY9s2F8X0IgjMgaTgDOOdjDtdmu0FAedSp1zaIH7IEYNVyS5ZfmRl49uUyQm56f3ZKrodFDwkxsNYztz47nLBiH5vSoTFaJRLeuAHwRQ4MSbXsi/IXIqsDWpERbWRzLzv8NsfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5ECFE92009C; Fri,  9 Aug 2024 02:24:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 57D6092009B;
	Fri,  9 Aug 2024 01:24:42 +0100 (BST)
Date: Fri, 9 Aug 2024 01:24:42 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
In-Reply-To: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
Message-ID: <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Aug 2024, Dmitry Torokhov wrote:

> I am wondering if it is not the time to retire bus mice drivers since
> they have been out of favor for close to 30 years, as well as 3 drivers
> for portables from late '90s to early 2000.

 Are these drivers broken, e.g. fail to compile or crash the system?  
Otherwise what's the gain from removal?

  Maciej


Return-Path: <linux-input+bounces-5371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEA8948946
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4383283AA8
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 06:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78C215B0FA;
	Tue,  6 Aug 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTDggQoT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF68F77;
	Tue,  6 Aug 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722925037; cv=none; b=QLEBiFPY/MR6ph0K41VMhoO1FvmGEELCP6FIMTkyw9zFtBEsojBotJwjhEvCuFWoGwXnZRJNATr1yvPpPQdNkl4yxCqywsNePoCjwYuBuzuYKEXsyfYstHgvVYnSMgN0Iv1g+0g6VbFVYVok4fQgNaLsFgmKKqvXdBVbZpOX9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722925037; c=relaxed/simple;
	bh=HfTCrH2lDkdFXkI95t8YmUh4k7srmpGxsq9SFLd9CyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JldFfsVqJNGcsLVnl4/UpbRsp+9eQREwzY8ri3NljmvCooEVkqjthlpxmWLA8CYYaLRc/nB0AcCyz8iWuPAoNhI8GOWagaeNEFhXPa3JkmeLqu9AswKYCX0eDk4P/cE/++DP62fkNIY61KXf5lefM4CcwIEcRdqc6bqpk6Zgzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTDggQoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF12C32786;
	Tue,  6 Aug 2024 06:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722925037;
	bh=HfTCrH2lDkdFXkI95t8YmUh4k7srmpGxsq9SFLd9CyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UTDggQoT/583LvKkTZINx9k3A/hQEaGmkChk2l1rztkgpg3tSQB+jtiC7myZxG/U4
	 lHiH2hrPY+FxdO1Es3K2DQphzowzxEVFNp6QazVfQJmheG+yB1yI+l1BIpq1SxpxPl
	 xFF+4wBycmkqfDl2w95fpXt7/zn+bInSKX1lECDVWugyk6QTiHIfEWIrVRBEO20JQ4
	 RogvzLLN4u3kPiyEpI0onAtUKoUJ4EBHrSPHTooe8DYLRnYtq3/dQJOzSXCyBruHt2
	 cXKxa3eIlZpgVMjBq9cwFrkWeiLmvXgbY6ezSmQDAVpETq4z9ROrEDKBYdY8omAFQS
	 Gc7fd6GJOtxrg==
Date: Tue, 6 Aug 2024 08:17:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Luke Jones <luke@ljones.dev>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid-asus: add ROG Ally X prod ID to quirk list
In-Reply-To: <e8a37c76-6922-459d-b4a2-688ee6287512@app.fastmail.com>
Message-ID: <nycvar.YFH.7.76.2408060815230.12664@cbobk.fhfr.pm>
References: <20240724223125.44914-1-luke@ljones.dev> <nycvar.YFH.7.76.2408021251150.12664@cbobk.fhfr.pm> <e8a37c76-6922-459d-b4a2-688ee6287512@app.fastmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Aug 2024, Luke Jones wrote:

> > I've applied the patch, but got a conflict here, because I don't see 
> > USB_DEVICE_ID_ASUSTEK_ROG_AZOTH_KEYBOARD in my tree, nor in Linus' tree.
> > What tree was this patch generated against?
> 
> Apologies. I have a large tree of work for various asus devices. What 
> you see should have been dropped but it looks like a git-rebase didn't 
> go well.
> 
> Do you need me to regenerate it?

No worries, I've fixed the conflict by hand, I was just wondering where 
this is coming from.

Thanks,

-- 
Jiri Kosina
SUSE Labs



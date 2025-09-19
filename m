Return-Path: <linux-input+bounces-14932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D173AB8A4E3
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 17:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 086CEB61350
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 15:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EA831BC80;
	Fri, 19 Sep 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVSzdPLp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCF31B83F
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295835; cv=none; b=Z0dlWkngS7JvsaKiHAyXjcw4BKMxlfkDAyu3zR9wrRxBVWpmbN268BIPkYv/BpaTziY540iMdkN1k3yk4/iWhotA8wgMftHTZEubV6OAd05aQrgf2GyU9+GzzdAgrz1Mqg1YHMg0GAA1rr7FAuvzO6obT+tKnLYzcWmyol6jK9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295835; c=relaxed/simple;
	bh=wm/fDnvxmrxbmc7D1Suk5dUoeM3pCf3caAtFNZyrH8A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Pd9P4Fph+zdKhVZrkHM8RCTLWIOMe9MvbzW2nlliFSNMAw2x6wlzRBnTRAIBZzbODpY1y0OG5toh14IbxxwnhVfNZBYn8kHdUauTxllbQ+9FnIWEjbjFP/mXC4C2z7qGqJCqN30Goy1uj/VrU7u25Ll2f9p/P91XY4ZybMSx+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVSzdPLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306B1C4CEF0;
	Fri, 19 Sep 2025 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758295835;
	bh=wm/fDnvxmrxbmc7D1Suk5dUoeM3pCf3caAtFNZyrH8A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EVSzdPLpsX3zyzWt9Coefnrds595fKRvPXNAvnmegQKkmp0+LrqPpDYkKrHe31l7Z
	 NJIGdG2QJCtVGiOHLFOm+wA3iX6plOlrWZW2n0wCM6bwB0O/+AE5QV1FaxU+eaZoWl
	 xZP86pGlWJYVmTzj9i/MGDo6T2K4sDyuyLGvU+eWso3OFprIy1S3HLw4eg+1PJZ3wc
	 G+01+P4hq1lsOxJi9d7/M30wl+ZYIB3rxcPZ1HYBzGytCtT5GIlF+jjYHf+gbaOB3e
	 saukEfeNchad0QerEb1vnS349eHcLu4zqs1VEloKOfKQCciWWb1MF/Ie5uxlRjBZeH
	 RegXICJLDBwIA==
Date: Fri, 19 Sep 2025 17:30:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    Matthew Schwartz <matthew.schwartz@linux.dev>, 
    Prakruthi SP <Prakruthi.SP@amd.com>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: Re: [PATCH] HID: amd_sfh: Add sync across amd sfh work functions
In-Reply-To: <20250918123202.1076393-1-Basavaraj.Natikar@amd.com>
Message-ID: <38q44q50-rs57-s930-072q-qp98848243qr@xreary.bet>
References: <20250918123202.1076393-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Sep 2025, Basavaraj Natikar wrote:

> The process of the report is delegated across different work functions.
> Hence, add a sync mechanism to protect SFH work data across functions.
> 
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Closes: https://lore.kernel.org/all/a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev/
> Tested-by: Prakruthi SP <Prakruthi.SP@amd.com>
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs



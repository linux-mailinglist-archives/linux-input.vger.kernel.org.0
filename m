Return-Path: <linux-input+bounces-11977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428CA9A9F2
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D6C1B6755B
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0477221260;
	Thu, 24 Apr 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhCIFdtU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A0C19F40B;
	Thu, 24 Apr 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490033; cv=none; b=JZroSnj1OFPOoTkCjas/BaXewkT2CUr/6jF0z5X6aXhSv14I9ZlW3xjaHWP4+Ru6lOK79FM/6PSBcQ+IXjoxnSoyhPgAEfXvFo/G/xTvOFq7TMB+5nyninq96TMjQMvClMn0s91f334AaqdIFp05+VwwqK8SbtX43/EEY68+PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490033; c=relaxed/simple;
	bh=ylaAx5opMqeYfZu8A3uF5GKQeSacubIL0auxBuPWB6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pR4dUrdiE05M3QnBEpIcnOxiO6+0EfbRLdjsKNU3YYtgNUae/Db3xde1AjjAclH88eTS+fMEtcGeGov9P1PNJO7UCvhN9oALDU+GdaQwCjeXQ1WB7VUo0/pZ3wmldVodTnI/tUEiA6t167eqbeEouCg9uA1ovx2ciT75CaeofIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhCIFdtU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C4FC4CEE3;
	Thu, 24 Apr 2025 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490033;
	bh=ylaAx5opMqeYfZu8A3uF5GKQeSacubIL0auxBuPWB6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EhCIFdtU7jNAQUHpDaFUxKGyRNriMMhll95pMRxe35sSQtNMAilhnGFqvSjtxwrO6
	 CeNPawdeAvPIFkvjgmlwoGEfVAqWo4SwsnLwVquWPSWtYXDVVcW+PBmVzLR7qccizi
	 of9x26uhtGyFBaJc3T74K1IdxtGRYyOwTt+tZ9WC4Ff8P71jcRN560VV+o1YN71hT9
	 +/sDjcoNi7YX6b3bR4K1LnGlPF1WAcfuo5WkLHvXQdMjB2XglaTdXaRuLDeJPZZNVk
	 pSyqy297yUOZmXYw2e63v16/3fHEzhyV/AGqfKrNyQNBeOfrD/VZmBnDmT+GCnzO2i
	 thdBzJbFUdzZw==
Date: Thu, 24 Apr 2025 12:20:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: appletb-kbd: Use secs_to_jiffies() instead of
 msecs_to_jiffies()
In-Reply-To: <20250407082930.742229-2-thorsten.blum@linux.dev>
Message-ID: <4675r5rp-s218-8r10-q1q3-rosr80p36969@xreary.bet>
References: <20250407082930.742229-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Thorsten Blum wrote:

> Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
> the module params 'appletb_tb_idle_timeout' and 'appletb_tb_dim_timeout'
> to milliseconds. secs_to_jiffies() expands to simpler code and reduces
> the size of 'hid-appletb-kbd.ko'.
> 
> Reformat the code to silence multiple checkpatch warnings.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs



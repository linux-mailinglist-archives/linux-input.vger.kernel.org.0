Return-Path: <linux-input+bounces-3509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE38BD6B3
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C991C215D5
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265F615CD40;
	Mon,  6 May 2024 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GztjFMhK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39DD15B54C;
	Mon,  6 May 2024 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029895; cv=none; b=sjofXgCh6egm+f9HPLA9okuWDGQUJ3qdHP8SRxcHuGTHxLp6oKT8UG5XaHFxqZyAgXPqWDh+8YnlBLUM0oSFTxFTGMarv488sbjNGrPlEhAgqrdEZeMAys6FZkcMsYOFZwKh/yx647vOdSFXNC/GdC8sS8bV3p227/fzRPxJ9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029895; c=relaxed/simple;
	bh=2F30VOhpKtoSecgFN5EBa2MmwVehY2mntE4Tq74HgCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MkqQNJ6JDzaB6ybcXKEY22PR2V1qzM6H5qGUVlM3kLZMJrIVQsPDkNxo5hH5kYLQZeoXQG7tn7MMWhaCDvMwd0bO2Ti0O1lRMBePkT3BIish1Jz71yfAwGJTL2/8KFmZSad3iz43JvxzjJ8Wl4vj68WesXX3QMDPPS170neLohI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GztjFMhK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AA4C116B1;
	Mon,  6 May 2024 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715029894;
	bh=2F30VOhpKtoSecgFN5EBa2MmwVehY2mntE4Tq74HgCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GztjFMhK5ZLQpOYmKLLe8TTvcu8pKGtcRy5azKef8jVMb2w7BlZWuMjfd3KtVSb9q
	 v5b9dGMd0ejveBtQm5toPu+IA2ig6GBVzp0Kos9ecGdkhAyuRI3yfTwK/eO/Sq3NKR
	 YJ2/gT+BdU+m+XkdDcyugVyRJEvCWsIhnMVjrddJA9N56GF7Z0I32i/hH0ek7fSvkY
	 HCKNFjffj9E0wCSS4fZfv/Ea3EAiQAZI67wikNA7HE4oTDuhHjTnt93RkGW4vLQSCs
	 V7yBbdeqBaP0z3ihVoJRbNo+daLLa2nAYoUC5/eH0OaPSWzZiLRqTZwquF23LAo5wE
	 /FjozgRAeoo8A==
Date: Mon, 6 May 2024 23:11:31 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Chen Ni <nichen@iscas.ac.cn>, bentiss@kernel.org, even.xu@intel.com, 
    lixu.zhang@intel.com, kai.heng.feng@canonical.com, hongyan.song@intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add check for
 pci_alloc_irq_vectors
In-Reply-To: <95fadbf4772d575bff777ddb738cb6c25b85b779.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2405062311100.16865@cbobk.fhfr.pm>
References: <20240429085422.2434036-1-nichen@iscas.ac.cn> <95fadbf4772d575bff777ddb738cb6c25b85b779.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 May 2024, srinivas pandruvada wrote:

> On Mon, 2024-04-29 at 16:54 +0800, Chen Ni wrote:
> > Add check for the return value of pci_alloc_irq_vectors() and return
> > the error if it fails in order to catch the error.
> > 
> You can write as
> "
> Add a check for the return value of pci_alloc_irq_vectors() and return
> error if it fails.
> "

Srinivas,

my understanding is that with the changelog rewroding this patch has your 
Ack?

Thanks,

-- 
Jiri Kosina
SUSE Labs



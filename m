Return-Path: <linux-input+bounces-4480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D889690F868
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 23:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0882528178F
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 21:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8E67C6EB;
	Wed, 19 Jun 2024 21:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRandiG8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D51433B9;
	Wed, 19 Jun 2024 21:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831976; cv=none; b=lgB8yOGzDXQ8FdtyXqLw7MeBYiM/wMhzBndw9OhcyuCm6KHwvJVY7Cqm0c4LIraKjg3BYYNxgbidzSKzqWnvKUm4wwdFLyEPyRjXPU09J00BBSEVgpKyDNqVshFFFqVNVapZ2l7LFUDFsbOhFI/3+NYW/C/4SCxAr5Ew8hCp42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831976; c=relaxed/simple;
	bh=qwRGe/3vIIbZX46zaw1Lsm/QSA6NT3UmhxNJaDfGBpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQSeEo3FtAuaL23Pu+VE5NagyMh4zSZ+gdw06yZK9EZbZER0AXrY2TqcQ5vfdSY/nmg5VNJgMawC29ChGIfDL9SMkL24fgVXWpztOFxx28cq+rt0UnMfbdUV6+vLMPUPEIyIjYIBxF6ldqg31F4NMMLa50govMkceaXv/L4RKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRandiG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A85FC2BBFC;
	Wed, 19 Jun 2024 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718831975;
	bh=qwRGe/3vIIbZX46zaw1Lsm/QSA6NT3UmhxNJaDfGBpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRandiG8gmW4RC66fwYU0LuNySG3UrLqTasrgfHyYZigKUfJk5IuLEhvtwQqVCWr1
	 QfgT043fRR4zbn8X9FswU5p3IEy7NfP83eWfBFlyV60D+1Zn6TxY9AL6ArkHipMyXM
	 K5be+IBX5ZoEkZsmF6utZWdthgvIS0ui/v4A3jKJ75cvsDZVLpMoQTJfbApBGwkqav
	 7COHX6m20B6AVU5hLzUx927xN0/uWqFsPcfQOTnvy8DHF1CWkuSv8DsjcD2i1ff4vn
	 qEPBZ3oGtg2IwEtVtwUawd8yXjChyiNyvFgK8xmNapjXiq77EfqK+EdbSe+5kc4ICK
	 utGcpr5r7A3Gg==
Date: Wed, 19 Jun 2024 14:19:34 -0700
From: Kees Cook <kees@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: ims-pcu - annotate struct ims_pcu_flash_fmt
 with __counted_by
Message-ID: <202406191419.D9E591195@keescook>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
 <20240619-ims-pcu-counted_by-v1-1-3ee0ead2e57d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-ims-pcu-counted_by-v1-1-3ee0ead2e57d@gmail.com>

On Wed, Jun 19, 2024 at 11:13:21PM +0200, Javier Carrasco wrote:
> Use the __counted_by compiler attribute for the data[] flexible array
> member to improve the results of array bound sanitizers.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks good to me. Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook


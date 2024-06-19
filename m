Return-Path: <linux-input+bounces-4481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946290F86A
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 23:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23122281701
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 21:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A237C6EB;
	Wed, 19 Jun 2024 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjE+hB/C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8478C6D;
	Wed, 19 Jun 2024 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718831982; cv=none; b=Tonh1574a1BtsiZy9MOMPVPAjtbqmUjD3pcCIoAFUrT0+XjZm9h6AVIFDOltnX7cB3FDLZfKodWPDgqI9hX6iSlRH6tg0TPGvM/lsBrLfqXHqHWbLbRKcIWu9ftY1eTRWdNUgkIC9k9P9Uf5Q5on4Gj5BQ8dSnPh08C19oMmq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718831982; c=relaxed/simple;
	bh=NeGgpAbPIkWFyc7hDkBigZZUhVVPD3bV6GKzVvhvzGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvTnQm4+O3z3Lrw9cCAh1ruRfNTh/ioewXx1GtFiDMPW8FcBXWVeObAjG8BpP4NBaPdBqvTdC96vni8EaPLff353kKafPQWXWGJyCzyYIm+RRdqLp6N2CigKs3SG/yemaVbtMVfY/CpJghKNUqyReljAY2VmIdFj3rT9qzy06Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjE+hB/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C2BC2BBFC;
	Wed, 19 Jun 2024 21:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718831982;
	bh=NeGgpAbPIkWFyc7hDkBigZZUhVVPD3bV6GKzVvhvzGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjE+hB/Cr1pDQ3w2SeytHvQYiB1hSl/iZPoec6irwQgUgCw2gz7wxobvg+vB7cL++
	 XUwC0AvTj5vTLzj0Y4GcawhBY3CVdPQ4U0+SCOgE+7T5k/qx0QbdoAspUk7shoEC4B
	 AxdCqPYNzg0YRGQ7Em8imFujaT3Nz9KvREV3ZhH/3dvIkshlC3+y5ZXYr/UnIxozjX
	 zvREd+j80qmGJDKJy/Ttk9Sef8IL8yG1fKl+w+q7/hkLC2ZTY6Ryz78W+yzNJzaqyV
	 KCwu28Xgf7prImARRJQveGRz3p7/bkthrd/Rv7VtMwW2gJwDJYDTbb4TtzzuDIMNR4
	 Jhnfz6BwQgpjA==
Date: Wed, 19 Jun 2024 14:19:41 -0700
From: Kees Cook <kees@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ims-pcu - drop repeated "input" in error
 message
Message-ID: <202406191419.8B454C7A48@keescook>
References: <20240619-ims-pcu-counted_by-v1-0-3ee0ead2e57d@gmail.com>
 <20240619-ims-pcu-counted_by-v1-2-3ee0ead2e57d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-ims-pcu-counted_by-v1-2-3ee0ead2e57d@gmail.com>

On Wed, Jun 19, 2024 at 11:13:22PM +0200, Javier Carrasco wrote:
> This case of the common error message upon failure of
> input_allocate_device() repeats the word "input".
> 
> Drop one "input" from the error message.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook


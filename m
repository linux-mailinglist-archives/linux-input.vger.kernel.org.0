Return-Path: <linux-input+bounces-6829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16792988A05
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 20:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7EB6281D3F
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 18:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5E91C0DDC;
	Fri, 27 Sep 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiOjYNZh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4917ADF0;
	Fri, 27 Sep 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727461179; cv=none; b=iuKs3dyoG2wQlZSEjBqL+czJpRz6Bnmiods9GFduoWG5dhx+ufqsLt2DxVavwJUqyZ1fVGJbgXGm94TgBSxK4s6OdyXhpdlVFqV8bsNSJAFF8qeM/1tHimlxjl9CIEdRyCtyvUsr8dbsgxqqqCmpqk4AWrfjQko5TLd8pZ3MlkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727461179; c=relaxed/simple;
	bh=xuH1d2vaPlz5jT4/9KGPhuQeCHrYLk+LwemcXt+ZUxE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UKK+VlrND4XneBvmpKFIweHlYhXaqMne0GsUltK4K1zcCbxGukARI8eB3LMMO+8UNIWkbeYlTDjPGXEzKGm8wGBob6vVyX6zGQX4hY6yJ2YMc5WZJ6jXq5E9xMwMszYTdIQNgQ63UkbJfrM7nly/iipmPFdsWTcEEy2DV4FrohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiOjYNZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDC9C4CEC4;
	Fri, 27 Sep 2024 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727461179;
	bh=xuH1d2vaPlz5jT4/9KGPhuQeCHrYLk+LwemcXt+ZUxE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GiOjYNZhIhUq5SE58LOU5zWywjg3kAlYS3JFr0Zzj0WH+COi7HFm8gOGKFvRjOxaQ
	 Ufo3E2876Pbv5n2qAVhqQ9iJilJZALONxcY31KQO1GeFqODXzxYNLSbX1wXqCj9Get
	 HEWaolU1iAtcbhQYsu5t2ziQcdALBOUnaCEypBeCyl7EzbumHZYWdjsI426piT9sWW
	 ThlqD+4hGX4cSbAvTe6xrThdaO9pJSL3YFtwNocUb4exQEmGbeR11qJtZB6a5ZWHUy
	 wJWCNSApw9vfbBLsuVwvC+bSqBqM16LjWTOO0N5SW3ouDBjSK7gmIPqJqyfrZ7Owbj
	 ezWg6aWGutOBg==
Date: Fri, 27 Sep 2024 20:19:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: kernel test robot <lkp@intel.com>, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca, 
    vsankar@lenovo.com
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw events.
In-Reply-To: <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2409272018370.31206@cbobk.fhfr.pm>
References: <20240917100432.10887-1-vishnuocv@gmail.com> <202409211318.ZsE7JGOi-lkp@intel.com> <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Vishnu Sankar wrote:

> Sorry for the inconvenience.
> The base I used was the Master branch.
> 
> Should I resubmit this patch again with the base as linus/master next-2024xxxx?

Please ideally base your patches on:

- topic branch in hid.git for the particular driver you are touching (in 
  this case it'd be called hid.git#for-6.13/lenovo)

- hid.git#master if a topic branch for your particular driver doesn't 
  exist in hid.git

Thanks,

-- 
Jiri Kosina
SUSE Labs



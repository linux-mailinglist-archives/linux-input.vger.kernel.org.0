Return-Path: <linux-input+bounces-4603-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAC915667
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 20:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E34285A3B
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 18:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B74F19F48B;
	Mon, 24 Jun 2024 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHM+4FSQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6131A00E1;
	Mon, 24 Jun 2024 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253272; cv=none; b=UtFIVzJpeDmxoIxK2W+wccz0S+ipJ29jR7w2iXThhxQ1tMxsI4+wN3d7FcbZ2xTMg2nEK2MiMnhFXGHzATjl11IVEnLvYMNqonxAjvdDFaA+hHA1DRzHswceISljopyt/sZZQ3YAMYaMJ43GDuBYp/bKpkzs32wIvFEPjz15I0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253272; c=relaxed/simple;
	bh=09AADDag4LI27YU4Ve+VnoSz7BYMdXf7ag8W+KFQ150=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjIKJELM046+QXURVJOtGj97/O5RXFybp5/7uvLKJDKGh3JEWSlCk71nqhYcnpCzQGUnwOsAglHhKC6LfUA+XXA8+HwTQL2U/Go3rDubh0SXyNnTmcyVh2Jk30uwe9itI33DdhPW+oqE9iJjRA2zQ4mMcNANCas9ebAF1K3QiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHM+4FSQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fa0f143b85so15629395ad.3;
        Mon, 24 Jun 2024 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719253270; x=1719858070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3BP13dCu8i2ssz9SfynI8OeHky+ZXnMSTo9auq+UbE=;
        b=iHM+4FSQpn/2oZcmUMut+AtIYYkuL8ZMjGgg5/rG47dfre8q844mJgCiSxNrxaZTVX
         MKy0ne4vPrrCVDO78tXl8hiWTkl33bz/zbW5k6Vs/NJDOlROWJ/U729TmzYeB1jPpGKl
         G3tBQP5LLIrEU3zgLz3kCXHeuEkv+smhHluMr2gqsjds72NzeQp5C2hySv/8bu4JBHCs
         nGm5WjDKWeefi9SWv8F0GzficQCjcVFl72HuGmmAEWkHuh4q1sXDNt/+CtvCgjdWZYpW
         EobqZlYkz3gqVLE1rZVlctoIdVNfpA5akbEyEh0XzxG8pvQ5toPXou9TvuqfbO0/msuO
         ks+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719253270; x=1719858070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3BP13dCu8i2ssz9SfynI8OeHky+ZXnMSTo9auq+UbE=;
        b=cJgjtVc49mbop3Pl6kdv/C0w30Uj053eF2Y6b+IAJYAiudDbILJR98plBRGqp3iDX7
         2G1GRLHrPGOg+6S6PS3/bSSa1cpY+uSXSDgXCggirajwwGLPTmIMp0qmlt2s65VlyatD
         yHvNyjmBFiOcU7/1pNxaygY3DXCRVGLQKd6GwjXl0wJXhLqmO3+Wlk8nfplLeMkc0gnB
         1hT4FFB1LNFOmhHO+YbvKfRCcvshs5H8UuXP6NtGTMGmz1zND+3atffQHs6ITTVohFy8
         RO6HiJY1OM1S56XC8v7eckirhLM+CXsx2BjXfV/Ck6gNvlnTcBB3DHR+B7Ml8lnxHpoH
         7jAw==
X-Forwarded-Encrypted: i=1; AJvYcCW+rongpuNtWr12szD8z0pBFBz9zJnMyLjcCNDlmmoPx5ut4hXUoOU4jgW+hzwJvJJmrt/gatGUHzLHm5rD1NoDD6wQxw5+/Q2Yv2k=
X-Gm-Message-State: AOJu0YxID4G4Q5Ao6qrgq3iL8hzLi/tgxz+iY3QXG8j5fPBeO2SvL4aZ
	kR5751146A3bF4LMW/oJDcZyoKrkYF7urJQXlkNeAAOy5TQJty/aNsg0rA==
X-Google-Smtp-Source: AGHT+IHwXXnwVKne+2KppR0cvgfENs/xvsTr42M5uZ1NUw/1HOEdKjD3W9Tq6oy4i9vEIiymenr9QQ==
X-Received: by 2002:a17:902:d38d:b0:1f7:1730:b456 with SMTP id d9443c01a7336-1fa23f2699amr54022125ad.57.1719253270019;
        Mon, 24 Jun 2024 11:21:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eba1:6f76:e2d7:7858])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3208fbsm65818215ad.79.2024.06.24.11.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 11:21:09 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [git pull] Input updates for v6.10-rc5
Message-ID: <Znm5EzNHCk_g4puh@google.com>
References: <ZniqQuGkosZYqIYE@google.com>
 <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
 <ZnmX1XeOzU1NfgrY@google.com>
 <CAHk-=wh3ZpDhHseFjYf96CcgTSRoZtjbf41hoBCyfQJ=N+oMng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh3ZpDhHseFjYf96CcgTSRoZtjbf41hoBCyfQJ=N+oMng@mail.gmail.com>

On Mon, Jun 24, 2024 at 02:10:49PM -0400, Linus Torvalds wrote:
> On Mon, 24 Jun 2024 at 11:59, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Ugh, I was on a wrong branch ('next' for the next merge window) when I
> > created the tag. I'll fix my script, but in the meantime should I:
> >
> > - blow away the bad tag and re-create under the same name as before
> >   (input-for-v6.10-rc5) or
> >
> > - blow away the bad tag and use new name for the correct one (somthing
> >   like input-for-v6.10-rc5-fixed)?
> 
> Either works. Some people just re-use the same tag name, others will
> always use new names. I don't personally worry about it, and whatever
> you feel better about works for me.

OK, great. I re-created the tag using the original name but tagging the
right commit.

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5

It should resolve to 7c7b1be19b22 ("Input: ads7846 - use spi_device_id
table").

Thanks!

-- 
Dmitry


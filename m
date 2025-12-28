Return-Path: <linux-input+bounces-16711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E6CE58AE
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 00:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB1830046FE
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 23:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821461FE45A;
	Sun, 28 Dec 2025 23:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYuXAKNp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6717E792
	for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766963726; cv=none; b=BCDtxQEWoRnuOtxdBB38FTkA013tF7G7UXotrfX9/89RsM1julcS4DM96x2rh2dX6VgKn3ifgwsy0cKZcKohod50j/fE2dFcK8mTsngou+q1vrh/fx5doD0ETQmSESSVE3BW+fACmM69GdaBDzKXqpBsc0y3WOs3iZ+5cUBTkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766963726; c=relaxed/simple;
	bh=M70yYPl5d+67pcGlHoD95zgmF0l8oKNZ/CT6G5RmGm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8SgMeNUseFHZVRmjYZ84a5t690gIQHARu93cyVcXMuVkSGqYNOei1ifW3pZf05k+FD7FiqTmkTZKnXABHkyajLaU3t9PX5ge+4NhK2y3XCUXQaouSsxcezwtMDDr1JX2H6tj2G1LOcdi5zX718J92PlQZN2MZDIQXw6/s1ahks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYuXAKNp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso6436089a12.0
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 15:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766963724; x=1767568524; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5E29uaXtWrn0fmlEGq1fz9WsTSgO3zpdKABAcJ6Dwo=;
        b=TYuXAKNpMp1kGLP+ck4Y7agnm0qp5iXk1MfI7DOXBLXtFT1ZUgqS89HKwEKiw0/Yt0
         bKBxF/ZgNINUyhMDupan6NxyDHdA4JVbDmFT6VOVbYUURBgQw33JlLnTCh1BF+SOZB0I
         l2y15Hzp7rG4CWVvb4DRTEybmongqVkBSU74tm8P2/oqtpwxAzFsks+vjdzBKrxwqFD0
         Q9beNGRgLODNQXx0yoV95dmFzFkXJg1P8Qrppnu+677WDbDJZTAyT/lRaOZvXTOdxoeM
         yeNZ5XbISdQmwhX869CQ86uYMPp8BKFOIupvKiGBBiX3Hs/kUKUio5ZV44UkhDwENltt
         Urvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766963724; x=1767568524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5E29uaXtWrn0fmlEGq1fz9WsTSgO3zpdKABAcJ6Dwo=;
        b=LAILSAIYNLQxV1qE2UepgXRFFzgeb3NfEwLdjw5jQzazksCseFWzlFWNYmmyeSIjQ5
         QNQBFR3R7gW81rpBGS/NnKOxSAUZi2u118gl2HPLyAVFIr33mxC1U+DrteWOxL5KoKWx
         Hc9fI39gnb3lyXPs3idjCHWALzFpLP2kYAeeoTc8QUdajmxYgWYJtpYE5ahXZBjvsnVH
         e+huYmeMeZCaGqHyktlNv/FM2CJMYFcIJ6N7GIni0oil9/WH93x8bY950rge9Cw1VwGr
         cUvPY+WR/xhU2IQefWI0evUZqtjDG1CY4DZ01kFyGWgG6GS49PYn3vt6VB9uDSzvjfRE
         hm6A==
X-Forwarded-Encrypted: i=1; AJvYcCXJU/DiCi2FUO/SLYne+Gyn6I3VpCdFqwHj3tBQsAkkTgIp+TS/gPo1gf7Ug6IXmfzVzwNX4reDh0lRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySnfhgvHOlgsBNv2fRkq4qCBtAunOqfgmE9NIoUx7EQvWsS7pF
	XnOofluENAgqTqjQVbOK0Dq8nYSndVcqHtTBaTc4F1vxvLsI+eDduR93
X-Gm-Gg: AY/fxX6L96Norl+wiZur189Cg2C91xRw8XoABeAnQDQcziVH5w9Pn6CPEFijEop0gmA
	K7giNOkGWsE4Ge132cvRaxcf+/3e4/+ufY5Gt7XEi4oRYE5Youqm+RNjfhZ6dozJimnlqe5Iy3/
	5KINVTkjFdojcY5dlIfZ9pdSM44HgT0YTmJ3Rd2dah8bwRe24ZbTRk7CGemIXta1AGfQEOUkg1/
	0KC5J2P6bnDgS4dIQwcVij8BgcnM90/msP6D9i7/W7KWrNbvQoD2AsyCVxyx/D8zXrCfeSj4tag
	daJOK2Q87tvaPiLOw9r9ukpiO91YZKRWxSyL8+kcO/gBBg9wUW9ndNXti9lKi4pnxDVNgQwJ4Da
	b0DwnbxPeFaZ60XghE1BWoc3XAVVl8qL8QL+b51NhXcevsJp+jA1kaHLInNKSJAxGGrqfmzL94j
	hKtucrXgz/ma5iJIvwdxsX92VfZGozMvP3AU0JeaZXclVChs5ojiwCywfFZfLuAVo=
X-Google-Smtp-Source: AGHT+IFfcMpg/w2eYdIWAwyxMCou4MoQJEaSMXzMdNmWlNwCvjH5c51/WGUyh7V+iHFqXFCYjZVK3w==
X-Received: by 2002:a05:693c:800e:b0:2ae:533d:19bd with SMTP id 5a478bee46e88-2b05eb7d3f7mr22076021eec.8.1766963724162;
        Sun, 28 Dec 2025 15:15:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:54a0:1c2f:1202:954f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe5653esm64307954eec.1.2025.12.28.15.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 15:15:23 -0800 (PST)
Date: Sun, 28 Dec 2025 15:15:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: duoming@zju.edu.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com, 
	akpm@linux-foundation.org, johannes.berg@intel.com, pkshih@realtek.com, 
	hverkuil+cisco@kernel.org, tglx@linutronix.de, mingo@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: psmouse - Replace flush_workqueue()
 with disable_delayed_work_sync()
Message-ID: <nx3huvqw5b3kvoklqyy6ryv7g7uh66vwp5abyw44ppm7vtts7j@rmq6oswnunu6>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
 <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
 <2e74b4a1.464cb.19b30013387.Coremail.duoming@zju.edu.cn>
 <ho33u6epmzsojiw5zvqksskpzo3f6z2lykvhgektf65stqj6sr@5hq6qd76ezxg>
 <67e94e29.46daa.19b31d9f861.Coremail.duoming@zju.edu.cn>
 <aVACDawiYQDdQkhu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVACDawiYQDdQkhu@smile.fi.intel.com>

On Sat, Dec 27, 2025 at 05:58:05PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 18, 2025 at 10:25:27PM +0800, duoming@zju.edu.cn wrote:
> > On Wed, 17 Dec 2025 22:58:33 -0800 Dmitry Torokhov wrote:
> 
> ...
> 
> > > What do you mean? If you enable OLPC support the option to enable hgpk
> > > protocol driver should become available, right?
> > 
> > The hgpk_init() function is never called by any other function in the
> > kernel and is therefore dead code. Since the delayed work item recalib_wq
> > is initialized within this function, it is consequently never scheduled
> > during runtime.
> 
> Actually I confirm this as of v6.19-rc2. Perhaps some patch removed some
> functionality in the past and we may remove more now?

Yeah, it looks like I broke it with c378b5119eb0 ("Input: psmouse -
factor out common protocol probing code") in 2015. While it should be
easy to fix (by adding hgkp_init() to the protocol definition) I think
we should drop hgkp extended support since nobody complained in 10
years.

Thanks.

-- 
Dmitry


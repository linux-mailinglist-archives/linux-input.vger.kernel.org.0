Return-Path: <linux-input+bounces-5193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25393FCF3
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 19:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF1AF1C21D91
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 17:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187C416F278;
	Mon, 29 Jul 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVZx+IjN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F23D9E;
	Mon, 29 Jul 2024 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722275970; cv=none; b=LhQejy9Q1fXX1i9hUuZerLwBDiHn+xrVcb08Wr7Kust23CY9GJaq2VpKRjgJ/sVo5LcxwDeyxWiMPF4l5gE8kN8/tBbdhrfml7Zp9XPrWhjEV4SGC7lDKxriXM/cYwBKeZCO5ea7W3Eq6liCaDmuc9LeVsKoEaCiK2NvRLvDujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722275970; c=relaxed/simple;
	bh=MiwDz4sC+g4N7kOU26Z3763Oqxk0w2sckPRlGeGxZxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcWyD6IGQ9kFlQnR6LCs8HuzKtxwMUpq6rbC6Sh3FjwENWKr4Mk6VM6Ie5EIIgoQXuah+R5gC9MCy97GBWMShxnu8p/l/V3gX9FGNtWERPWpnKUe4s485KNid4ttK9bkf8pdOspapjYl9zP227xf0goqqkNUvINufTOn3HGj2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVZx+IjN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb5b783c15so2638990a91.2;
        Mon, 29 Jul 2024 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722275968; x=1722880768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPu1RazojUDhmwPf+kdvt0l/GL78WJ1X1rbg4vGgqCo=;
        b=ZVZx+IjNwO9UOd5RZyw7nfjDGWAxxyG/+AntlXzH6I16LqvhpxY9+lmV/Z3FZnCSQt
         rO98oM12k5Mv1hFAUlpnwNgYb7450V3r9R5Vb2Jmh9lKMIyI4ni+hC852bF3mnHQ+P/0
         gEQ7AVo2oitdkD2Igi6KDhsrbyvQM7PHmgyNxqc5chL9kpFp+I+7LuBNlZzPAkIx2Vba
         sNptsurcKjwzKvjS3fnlz925B/ntAcXx/bHj2nZA53IZgV96h8T6yv2FR0vZdw6w5SfU
         yax9kloKh2Cs3/xUkUp3dUju3XiLxtZrEsBlw9Ge4GjVTan8sDkGFCwpVDO1NYXh871G
         +ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722275968; x=1722880768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPu1RazojUDhmwPf+kdvt0l/GL78WJ1X1rbg4vGgqCo=;
        b=j1gIK8RZnlR/z6Emxnw6+L4YJt3nvcr8dG1ilpm+AlGV8ob6CGYTsULPanzgl3eINR
         hV8PTggMxv9/7U8bYCvHr7R+JImhqZlL4r4Ul00o2AKPQWZXvPzUUlBUoJaVM3Z8BR11
         N1oh1d4aDZVVdQkeVK5JQNrzGNUATxRfuDAxbzzFbeGV/BIbtCbWw5wNklK9CDQlazK5
         SDpdeQ4BaDoscjDBvmEt202IHz2yvoqiczxMy6HNX6BNDYfpFiCibOWAhgYTRx77011v
         iKVn1vOaaolt4I6SlLkfl1QxGc9NJdCCNhINOC8EZTf2nwASCeR11jY3v+uKgOjxkaJg
         YF+A==
X-Forwarded-Encrypted: i=1; AJvYcCV7XnifLs8n5gPXFPne1Uu00EKemrADDf5YLjfGDcX02c4enIsn+rX2T227fU0/SKBvyvdSozlSqR124UBJ4/hOtdcy5w7pG4TqomaI0Sohx/GquVejIVLAwXjFxX0HHr8BdV1NcI2JLKo=
X-Gm-Message-State: AOJu0YxRXtz06OeFLyNA/eiaU5XxIbAMy4K/9oJUq3MP8Xg459F6UACI
	2yaL6qHwZvISwN8qPGlDrr9whSiAUYZo8+czXG3n+EfL1r6vi3hKVm4tkg==
X-Google-Smtp-Source: AGHT+IG/zHgZpmK32P1K0VuVUTDBrzB6wJ9bS8L3XLAsRoCE8AI4LCLC8yhYQ/iUG4P8G1LrLu0VVg==
X-Received: by 2002:a17:90b:3b46:b0:2c9:61f9:a141 with SMTP id 98e67ed59e1d1-2cf7e1c074emr9587051a91.16.1722275967644;
        Mon, 29 Jul 2024 10:59:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28de8b3fsm8833927a91.39.2024.07.29.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:59:27 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:59:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <ZqfYfIp3n7Qfo1-Q@google.com>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
 <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>

On Mon, Jul 29, 2024 at 10:43:58AM -0700, Linus Torvalds wrote:
> On Mon, 29 Jul 2024 at 08:57, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > iThe other types of warnings, such as the warning in the memory
> > allocation case, are warnings of convenience.
> 
> No.
> 
> They are WARNINGS OF BUGS.
> 
> They are basically warning that the code seems to allow arbitrary
> allocation sizes.

No, this is decidedly not a bug. As with any other resource, if it is
available it can be allocated and if it is not available the code should
handle the failures.

Can I write a gigabyte of data to disk? Terabyte? Is petabyte too much?
What if I don't have enough physical disk. Do we "fix" write() not to
take size_t length?

> 
> So apparently you've been sitting on this problem for two years
> because you didn't understand that you had a bug, and thought the
> warning was some "convenience thing".

Yes, it is a convenience thing. Same as some code wanting to allocate 2
or 4 pages and sometimes failing when the system is under load.

> 
> I'll just apply it directly. Don't do this again.

Please do not. Or you will have to patch it again when we will still see
the same allocation failures because someone requested an input device
with "too many" slots (1024 results in 4Mb mt->red table for example).

Just fix malloc/syzkaller not to trigger on benign memory allocation
hickups. They are normal.

Thanks.

-- 
Dmitry


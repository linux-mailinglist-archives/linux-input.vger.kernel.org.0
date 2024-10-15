Return-Path: <linux-input+bounces-7431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809699F6A7
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B051F25086
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 18:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389AE1F5836;
	Tue, 15 Oct 2024 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBrfsuQw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17D21D5152;
	Tue, 15 Oct 2024 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018602; cv=none; b=oViv4/m1EvWirwreDc2qqMmuIl1Qv7xNKTrqTIr7hVli7+RvMFtxfusO3dgkAcjBJb6dWuZowu8j+sq4qBsVurdhBmbkzIy+0s6TCUTjmBS9JCGn5J+Snu/Z7i35rw+3hwyvO/S/N1vJBczpWhJjfpWtpEITWePQmn2Smwbj1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018602; c=relaxed/simple;
	bh=kuYHadpRDCGe/ZwW/bqcFD3qY9po7lfFGs8NnInWIVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUBZcEWaw4O0M20I8oKO+259LHMMfhujOl8d011kCi8xEAejhZFkSeG6BL+8RkBTAzyD+SKH2ecr+LVGnYcx7bNY40r40JFfRDk526yzDgtDLx8EFfynksegT48uq1p9lh9dXUGvSS08gvRQRixkoT7JBEr5+XYLtSLX/uYpJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBrfsuQw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6E7C4CEC6;
	Tue, 15 Oct 2024 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729018600;
	bh=kuYHadpRDCGe/ZwW/bqcFD3qY9po7lfFGs8NnInWIVY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uBrfsuQwhZKBqWuSMMOpiQPRAro0nYKwoVzfHlGrRXoB0uQUSm4cIBRqPafAZNQir
	 J9LhSXtYqrvva32NVINZ7cH6Z2cdUnaJ/hDKlda2E15aetWXs1CSYH3X6Qsu//KZCS
	 hJNxy29lLILzjZCJ+NMc2T+kB9hCdQwqY+OCNDdK8ZYLSTXAF0A2XulYyGbIZnWQld
	 z7QjfQiMQqgHWEQ5c3Rx2TMsHgaV6QAGgazsW4C8czUBnpzX9MyqBUoYP7PlHKV4BO
	 8oNQP7klHb9EwYTbWlgFoFaYb1qJLbgPc+pINZSbz7RPB0/mePm/p6cMZQXRn3+scX
	 4zc6I7WoT9OvA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 05022CE098E; Tue, 15 Oct 2024 11:56:40 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:56:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, sfr@canb.auug.org.au, jpoimboe@kernel.org,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <e5ccd299-3afd-40c0-9de6-125deeee2ed5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
 <Zw60Sj-iFh1KWwWG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw60Sj-iFh1KWwWG@google.com>

On Tue, Oct 15, 2024 at 11:28:26AM -0700, Dmitry Torokhov wrote:
> Hi Nathan,
> 
> On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> > Hi Dmitry,
> > 
> > On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> > > We can easily calculate the size of the item using arithmetic (shifts).
> > > This allows to pull duplicated code out of the switch statement, making
> > > it cleaner.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/hid/hid-core.c | 31 ++++++++++++++-----------------
> > >  1 file changed, 14 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 988d0acbdf04..00942d40fe08 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -754,35 +754,32 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
> > >  	}
> > >  
> > >  	item->format = HID_ITEM_FORMAT_SHORT;
> > > -	item->size = b & 3;
> > > +	item->size = BIT(b & 3) >> 1; /* 0, 1, 2, 3 -> 0, 1, 2, 4 */
> > > +
> > > +	if (end - start < item->size)
> > > +		return NULL;
> > >  
> > >  	switch (item->size) {
> > >  	case 0:
> > > -		return start;
> > > +		break;
> > >  
> > >  	case 1:
> > > -		if ((end - start) < 1)
> > > -			return NULL;
> > > -		item->data.u8 = *start++;
> > > -		return start;
> > > +		item->data.u8 = *start;
> > > +		break;
> > >  
> > >  	case 2:
> > > -		if ((end - start) < 2)
> > > -			return NULL;
> > >  		item->data.u16 = get_unaligned_le16(start);
> > > -		start = (__u8 *)((__le16 *)start + 1);
> > > -		return start;
> > > +		break;
> > >  
> > > -	case 3:
> > > -		item->size++;
> > > -		if ((end - start) < 4)
> > > -			return NULL;
> > > +	case 4:
> > >  		item->data.u32 = get_unaligned_le32(start);
> > > -		start = (__u8 *)((__le32 *)start + 1);
> > > -		return start;
> > > +		break;
> > > +
> > > +	default:
> > > +		unreachable();
> > >  	}
> > >  
> > > -	return NULL;
> > > +	return start + item->size;
> > >  }
> > 
> > I am noticing some interesting behavior when building with clang, namely
> > some objtool warnings and a failed boot when LTO is enabled, which I
> > bisected to this change as commit 61595012f280 ("HID: simplify code in
> > fetch_item()"), such as:
> > 
> >   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig vmlinux
> >   vmlinux.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
> >   vmlinux.o: warning: objtool: hid_scan_report() falls through to next function hid_allocate_device()
> > 
> > With LTO enabled, the warning becomes:
> > 
> >   vmlinux.o: warning: objtool: hid_open_report+0x21b: can't find jump dest instruction at .text.hid_open_report+0x40f
> > 
> > A bare unreachable(), especially in the default case of a switch
> > statement, is generally considered harmful in my experience, as it can
> > introduce undefined behavior, which can mess up how a compiler might
> > optimize a function. Commit d652d5f1eeeb ("drm/edid: fix objtool warning
> > in drm_cvt_modes()") and commit 3764647b255a ("bcachefs: Remove
> > undefined behavior in bch2_dev_buckets_reserved()") have some good
> > commit messages talking about it.
> > 
> > Getting rid of the unreachable() in some way resolves the issue. I
> > tested using BUG() in lieu of unreachable() like the second change I
> > mentioned above, which resolves the issue cleanly, as the default case
> > clearly cannot happen. Another option I tested was some sort of printk
> > statement and returning NULL, which some maintainers prefer, even in
> > spite of impossible conditions. I am happy to send a patch with one of
> > those changes or open to other suggestions.
> 
> Oh well, if our toolchain does not like "unreachable()" then we can
> simply remove it - the switch does cover all possible values and the
> "return" statement should be valid even if compiler somehow decides that
> "switch" statement can be skipped.
> 
> If you can send a patch that would be great.
> 
> I'm adding Paul and a few others to CC who apparently seeing the same
> issue.

Commenting out the unreachable() fixes things for me, as does
replacing the unreachable() with BUG().  So, for either solution:

Tested-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul


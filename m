Return-Path: <linux-input+bounces-7414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C299F579
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8545283C2B
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 18:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039311FE111;
	Tue, 15 Oct 2024 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8+HCqtv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4E1FE0F2;
	Tue, 15 Oct 2024 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016911; cv=none; b=fPXp3N8NoIrKxVsUmOx4+5zKYoy/jk4y9gaVZuKurPZ6vc4EsDzNzoQ5WOXt85CUuuyPw65e0NJzbFz3fYE877NsnFdH04R2L8RXfB+d5gXAYuCB4+K2Ev0vjrXrqPliwwhjuYhQcJq20j/ZSPT+N8hgcnR4T8ERH7WZtVOhNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016911; c=relaxed/simple;
	bh=9hxP4E/PoSlUEOrZl2zCM3G3UcMAI92wXfa/Apufq04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo+JBj7q1sqt0e/vHsGmvnprkzL15zp+Nzt3/ztSj8ck4JG65z5+vrFkbqPGyF+Y1Dr0liF/RPr1hU8SocGInFlMhi3j+Duy8V7Y49opEYUydk5dqUXadpcVAQlAUm6KgvGCjXE7w2epjr21kHfHpLiJkQSjgNQwfxHKj6qYZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8+HCqtv; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e5130832aso2128038b3a.0;
        Tue, 15 Oct 2024 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729016909; x=1729621709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qkbADVRXZDubH3w1fG5mvFr9GeZ5X2VofaUlygYyiRk=;
        b=l8+HCqtvQ6Ki3Wf73TIprB3MUaUVK7bBrvOIvSKR4rPzpGab3Dx5zXL+gaTpD6D12C
         rVBlBWa57ZU4TvbEoVffosHrT0LLK5KHrSmCuwunlkfG4ETY6AqlLicOnuygipiphlSH
         YFUzDPuT8aQ21i3/mlJQCQAawL1clroAMGp3SQXL1FMkKAQjDPIQdtdp/ZHFHL1c2MDi
         7tGNja1RpD4EAVesUyIUYRebaQ/rA89/IPhW908IoFmT4CYnAZgdqStghmLjOUltBVhG
         1Fi7MXcMiLZ2p00P/BIZ7R5oKCmQFT0lBoFjAv++ZjgAqYc0ajQP4mw4CZUee1h/Biob
         ox5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729016909; x=1729621709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkbADVRXZDubH3w1fG5mvFr9GeZ5X2VofaUlygYyiRk=;
        b=TuyhQrgIPUqQ3UFeWpvqDS+xxNZEoWzEU67vo/xJLvxUTSNA3fYE/007SqnXEzquQo
         7ID4L/g1egOLou2zBUoTcnSpRNlShR0/huM03UITvmpvcYJYB6GIzv7mH8O+TE/MMQGU
         TpbgNCELUKkXxhfIKTUw93ZXH10B7JU3lrU6N3McMh13lrokkrPhaO2I4VKmJc/tDqMC
         oCoe4Kaf3IdonfSYP8TBBzXv5m+zgYUK68RDifwEH/poyZmA4lgrvNucZW6YpgZmIZak
         kzXhUMhztpw2shtszsDc7i6qsPZLhSMrA5ePd1eZE3B/3ggVlRGefMbkbM44lK/g/9ZV
         3VoA==
X-Forwarded-Encrypted: i=1; AJvYcCU4BcVZ5GaEchE17e07BjjgikNtR5NL64wHS9/fPH9aERxaxO8bG/1p/EPEGPlWlUXUmMfUiPzUPIi9NBkMIxAowQ==@vger.kernel.org, AJvYcCWvwGWUOR3Gb6ATFhP4rKUX1iX46EIzFQFKdDs3X5lGmSZgvzw+PpBIsa0duL3PrZjDRYDfbxSz4T63mgp+@vger.kernel.org, AJvYcCXzfDe91ijtCZXUTcp1gWGtN1Lo7dECgVEGIFVaOE4pcNlRtOTVy132VCAc0m9MToOtWhnhdAi1HyWSrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxus+zK36r/VwTEdZ0Wutcjgs/2Ff2xVo2eNJ/NSj0CrrwfaTNr
	PyN7mrcEVoPvtbQ75y5w6kVv7rpqlp+GnbXuV/SrcxiX+fkpAfmL
X-Google-Smtp-Source: AGHT+IGS1hy+7dQhNCTMJeL05rsRs1DfnMdP7V4OfDlDE84odlVNQ+IsdCpldlAde2wWGjt8Bf+3+Q==
X-Received: by 2002:a05:6a00:b41:b0:71e:1259:f935 with SMTP id d2e1a72fcca58-71e4c156d9cmr16469242b3a.9.1729016909325;
        Tue, 15 Oct 2024 11:28:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4bfb:6b8:82e3:75b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77371780sm1641923b3a.11.2024.10.15.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:28:28 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paulmck@kernel.org, sfr@canb.auug.org.au,
	jpoimboe@kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <Zw60Sj-iFh1KWwWG@google.com>
References: <ZvwYbESMZ667QZqY@google.com>
 <20241010222451.GA3571761@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010222451.GA3571761@thelio-3990X>

Hi Nathan,

On Thu, Oct 10, 2024 at 03:24:51PM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> > We can easily calculate the size of the item using arithmetic (shifts).
> > This allows to pull duplicated code out of the switch statement, making
> > it cleaner.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/hid-core.c | 31 ++++++++++++++-----------------
> >  1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 988d0acbdf04..00942d40fe08 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -754,35 +754,32 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
> >  	}
> >  
> >  	item->format = HID_ITEM_FORMAT_SHORT;
> > -	item->size = b & 3;
> > +	item->size = BIT(b & 3) >> 1; /* 0, 1, 2, 3 -> 0, 1, 2, 4 */
> > +
> > +	if (end - start < item->size)
> > +		return NULL;
> >  
> >  	switch (item->size) {
> >  	case 0:
> > -		return start;
> > +		break;
> >  
> >  	case 1:
> > -		if ((end - start) < 1)
> > -			return NULL;
> > -		item->data.u8 = *start++;
> > -		return start;
> > +		item->data.u8 = *start;
> > +		break;
> >  
> >  	case 2:
> > -		if ((end - start) < 2)
> > -			return NULL;
> >  		item->data.u16 = get_unaligned_le16(start);
> > -		start = (__u8 *)((__le16 *)start + 1);
> > -		return start;
> > +		break;
> >  
> > -	case 3:
> > -		item->size++;
> > -		if ((end - start) < 4)
> > -			return NULL;
> > +	case 4:
> >  		item->data.u32 = get_unaligned_le32(start);
> > -		start = (__u8 *)((__le32 *)start + 1);
> > -		return start;
> > +		break;
> > +
> > +	default:
> > +		unreachable();
> >  	}
> >  
> > -	return NULL;
> > +	return start + item->size;
> >  }
> 
> I am noticing some interesting behavior when building with clang, namely
> some objtool warnings and a failed boot when LTO is enabled, which I
> bisected to this change as commit 61595012f280 ("HID: simplify code in
> fetch_item()"), such as:
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig vmlinux
>   vmlinux.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
>   vmlinux.o: warning: objtool: hid_scan_report() falls through to next function hid_allocate_device()
> 
> With LTO enabled, the warning becomes:
> 
>   vmlinux.o: warning: objtool: hid_open_report+0x21b: can't find jump dest instruction at .text.hid_open_report+0x40f
> 
> A bare unreachable(), especially in the default case of a switch
> statement, is generally considered harmful in my experience, as it can
> introduce undefined behavior, which can mess up how a compiler might
> optimize a function. Commit d652d5f1eeeb ("drm/edid: fix objtool warning
> in drm_cvt_modes()") and commit 3764647b255a ("bcachefs: Remove
> undefined behavior in bch2_dev_buckets_reserved()") have some good
> commit messages talking about it.
> 
> Getting rid of the unreachable() in some way resolves the issue. I
> tested using BUG() in lieu of unreachable() like the second change I
> mentioned above, which resolves the issue cleanly, as the default case
> clearly cannot happen. Another option I tested was some sort of printk
> statement and returning NULL, which some maintainers prefer, even in
> spite of impossible conditions. I am happy to send a patch with one of
> those changes or open to other suggestions.

Oh well, if our toolchain does not like "unreachable()" then we can
simply remove it - the switch does cover all possible values and the
"return" statement should be valid even if compiler somehow decides that
"switch" statement can be skipped.

If you can send a patch that would be great.

I'm adding Paul and a few others to CC who apparently seeing the same
issue.

Thanks.

-- 
Dmitry


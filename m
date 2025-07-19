Return-Path: <linux-input+bounces-13596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8756B0B087
	for <lists+linux-input@lfdr.de>; Sat, 19 Jul 2025 16:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A7881AA64FA
	for <lists+linux-input@lfdr.de>; Sat, 19 Jul 2025 14:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C03121D59F;
	Sat, 19 Jul 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Urq9Gdzx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9B146A72
	for <linux-input@vger.kernel.org>; Sat, 19 Jul 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752936495; cv=none; b=VMpRoCpR+/v7swA1Lq2yu8mbGkEvpjhmA9E1VenVhEwIFSpqSnpz+sXCrq7LMxc+CTeOcXMO5bwoVof4hDAXLa/dyNF2fOTPsnnugmXkt3sFdn1Q/nSDk1EAAiJD7rAZQjIwdM9AGY/+tFI1g2Usy2Orj+eDGwbiRze9OTSS62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752936495; c=relaxed/simple;
	bh=28XnBw7q177szPp/TEn7iGwfbaGLu0lOkwxbxmfTAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4K6FVYsJ7GOYzNeo4yPOcO6aShcuvGFin9c1UOjxaK9vpPrt1k1iXwH0c2Lk0wEOrQtu1VT7XKQKSt8scThOQ3J6Eyq0/B/kmjDPSnRXlEpUiSVAZ/IMEKM413jFW7++yuQuKpTFBYn0WeZkk3dNoSxol6KP8DVn8RVqLJh8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Urq9Gdzx; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab7082b3f7so38710431cf.3
        for <linux-input@vger.kernel.org>; Sat, 19 Jul 2025 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752936492; x=1753541292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GktA+Qc4C2gku9tgC+xGfCvYixZIxS7PIy2EBRiNL8Y=;
        b=Urq9GdzxQwqC261OTzPmkAWGPRdP5R9W8inZhU2iuFfINgcuuDjHVckfDrHi+Mkknn
         7RvQj1BEfCw+FyDv3eEsir1KMcyodduzyoH+Sx/+MPIRENILLlrmQFR438o3jEcKu8gm
         /EXF/TVxXLSpAv3u8Blsoeoy+sSgqQgPxTr5IbvQJSc0nxU507DZ/T+naEbAVRRuJWnl
         Vcw8+hELlE17hT+G8zIyJ0qxXorPaRBZDD985mRc4o849Bv+bsiznfAJPA+/aRWKZzQ4
         1pMr4GkIj4CenAj6FvCsc4gIsHiYgAIqh2QbriWFDWyHcu9z02o8CKtgmdV4CWa8Q/9/
         Xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752936492; x=1753541292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GktA+Qc4C2gku9tgC+xGfCvYixZIxS7PIy2EBRiNL8Y=;
        b=fX65LWT/YhvDlAYzE5t3s4je49DmiQz/u1qsAB2qOvKFz8bByhY20p18VHhiG7ildV
         g7sxya/g1nBPn9Jc3fgLOP4SOQ1PyXXNhGAl5Uu2UyLNCl+XwIaIu+MG9toiwTmJ/Ql2
         pSijyhwtMytNsbW9HLw2BvYbE59ms8P9piNZW/uWZXWBhZo5edQ4JIEv1/ZEdU5B4mDr
         muvVwj8lQbiV0mpCw8hmSYGwPVV/m15eZ5ejG6uZ4IX2RCdGvCO28c7Nf9zOhW4eyyKC
         pZpKhosW3mwlYA4Bm8BzifyybmP/4ak3BfuIUvvbelOfPI6Nx7e/6pOLeg940UVVgR8t
         WBdA==
X-Forwarded-Encrypted: i=1; AJvYcCWhAbGYex+IZZ8Sle11j0cWFUPVQ8Y/pwPRUFx7vzCWmfveiH43Vsr4oJhVUm6c/THjOpUKq5kFnQg+nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDcZoZpNwhGSFXpXIMI01o2shQ+l/rJngTjNdmO43+dqsLBhq
	KqjNopdS2F0zQkNfSYTLRXfKUIHGIOwdn4gedOsNJb9xqeB66ej1MS5caD8DXo+5Ug==
X-Gm-Gg: ASbGncsQyjBzUF1Hf3I4VwpqFwDdXHzxT/fU3rHjbcUyw92gBTUicWK5XS5D9+m8qmq
	xsRbbB9kTwG8kjHu3aF8K4S5HWkDgQ0O4WigL3mg3jTWd146Ssy5QTpihGnXMFjaI+YuPiCl3C7
	UPZC4qWLDS4zpuHDpF8zZ+YGMAqY8IRpYhc9LuuGY3urHrAjvBUgJQ3EiePYUSM7PtKWYXxDUXr
	RJ1PcrFfs8AUB/kRzrhOpTc4TkpTAGPuc8fYj5oY0e9VyVF6XNRZJU8/YZyLdBghFGtMqqKg9cF
	+iKDWCFCdlSaeM2sjftWLriRUHIYbRgd9wcqTnTR9dr5y8CbK0pcYdXVNqX4cEQIygoM06+keDr
	NmCpsu0+KYH5+BVT/8VCHmU4=
X-Google-Smtp-Source: AGHT+IF+rERqamMpsCeMReo4+AhIbc/oNuC0Bp58/dxdqIZvmhBxs9npo13uMROLsAZUUSfk2u6LoA==
X-Received: by 2002:a05:6214:5096:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-704f6ac577dmr182774486d6.24.1752936492301;
        Sat, 19 Jul 2025 07:48:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::317e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c9250esm208771285a.89.2025.07.19.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:48:11 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:48:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>

On Sat, Jul 19, 2025 at 10:36:01AM +0200, Benjamin Tissoires wrote:
> On Jul 17 2025, Alan Stern wrote:
> > Testing by the syzbot fuzzer showed that the HID core gets a
> > shift-out-of-bounds exception when it tries to convert a 32-bit
> > quantity to a 0-bit quantity.  This is hardly an unexpected result,
> > but it means that we should not accept report fields that have a size
> > of zero bits.  Similarly, there's no reason to accept report fields
> > with a count of zero; either type of item is completely meaningless
> > since no information can be conveyed in zero bits.
> > 
> > Reject fields with a size or count of zero, and reject reports
> > containing such fields.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
> > Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
> > Cc: stable@vger.kernel.org

> Sigh... I applied this one too quickly before going on holidays.
> 
> This breaks the hid testsuite:
> https://gitlab.freedesktop.org/bentiss/hid/-/jobs/80805946
> 
> (yes, I should have run it before applying).
> 
> So basically, there are devices out there with a "broken" report size of
> 0, and this patch now entirely disables them.
> 
> That Saitek gamepad has the following (see tools/testing/selftests/hid/tests/test_gamepad.py):
>         0x95, 0x01,                    # ..Report Count (1)                  60
>         0x75, 0x00,                    # ..Report Size (0)                   62
>         0x81, 0x03,                    # ..Input (Cnst,Var,Abs)              64
> 
> So we'd need to disable the field, but not invalidate the entire report.
> 
> I'm glad I scheduled this one for the next cycle.
> 
> I'll try to get something next week.

So then would it be better to accept these report fields (perhaps with a 
warning) and instead, harden the core HID code so that it doesn't choke 
when it runs across one of them?

Alan Stern


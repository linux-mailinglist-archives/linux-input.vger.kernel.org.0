Return-Path: <linux-input+bounces-14487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3494B43F1C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DB5D188A5B3
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4771E3DF2;
	Thu,  4 Sep 2025 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmtWJS6N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A71C6B4;
	Thu,  4 Sep 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996415; cv=none; b=nUq2egIXp5T/TkBIqcvAXPO2fryItITuBHish361+ziuswDbYFh+KBXF7Pr31cj9I6tVtxnpD0ipN11yn67IqNzmnbIjEAtnwcjNpqMjvvEaC+08da4K66U2/NBw+nV9HjDbZF3/0MySs3QsFMpmdHBBCRboNraFiQYwb0ZGItk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996415; c=relaxed/simple;
	bh=CQqjUVu5trE6dpsmbJAfD1hwuOiRBQjUEFPaOuht6vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REVjEoNVJ7Gn6fy62ZP9lTGonoSaNcIs2TbldWomny12ewPNp8BedGZwiR9gWf4zc9ofpEo6QwCgLYTz+vc6JXGCCNoinJ78oNmA1xiXuOVBOxxcTxI+QNMG3tzmGs4PxJ92jE/w9gegMv0rPW9SWMkWNgSHzSOWq8ykly7CU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmtWJS6N; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b476c67c5easo740905a12.0;
        Thu, 04 Sep 2025 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756996414; x=1757601214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+1JbGw0fGpmxtwsSOst12cbU1swEnfv/zomaJdL8Ys=;
        b=HmtWJS6NLuytzbnKeVyeOr0yyAxjMVw75nbOG0SRivfeSwaKndl5XyftrzzPI0TW1B
         jjuZsp6xbq4JJ+8nrnS4/i39lhEp/G4uehB8WxsX7nUDkh8fvj06WLiyrdZXAhPmQNH1
         tV7KrFTfV7RdfvtVg4PCkdfziy3IckSRfC9KxXJlqJurzVRuQNEf7U/BqSncD/pX752q
         3gu/Zx0jL9jXV0A2Pse70Uy9ygPDEIWaraeX/01lVvPLhMwpoRAlQB+wQD4rAIYrPCPb
         c3SoaRbLWKLJ5SJin20h8rkSak2lJRrFAm0+HZMWv9RZXH5P6PBzMz4mkyZfe/3Eg+X1
         OZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996414; x=1757601214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+1JbGw0fGpmxtwsSOst12cbU1swEnfv/zomaJdL8Ys=;
        b=BlzlebB9S2mwhWaG/b/cMLVbYw40iTa5g6/yr9WF4QxYtjOWE95rJ74ZtyHj9zxi3v
         GcDVKS5X59kUXucGti9wKMdZ3dJjgRzV5m2ZwOKUQrJeVy4XdiBCZAalSygM8HAIqleH
         LxUEDo7DwiL3nBEt+Hly0SH8ezgaVJhcD+9/mlCkrQQ1bMGKDKwcsp7IZfu4t61402u/
         8Jfygrgr44wJR7R5mJXo2ezbfCMOql8tJVbPVDtSLJ3J0yGG3Y09cTkanVaooKWmuKMO
         Ve9px23jWkxLcXHJsOst8XAGYetIHn1k0FIMzAEqULCNAxUT9OcXQDSZyh7DBGIpIboK
         DSIg==
X-Forwarded-Encrypted: i=1; AJvYcCUyXHrJ6RvNqVA+r/z8zgJeHuwcDCAQUXbB5CpsS3pzCui+QCPgBElTPIE063pws+6hFpnsklfZKLeWpHs=@vger.kernel.org, AJvYcCW2il9gT2KhYDZi0Y76ZBdd7yQuNnxckV5vaJoBf4RjCOE8boKiZ94Gax7FpQadpwu4TYMHXbeATdbF@vger.kernel.org, AJvYcCW5O2F2zwabQMgqMs18sbseHP1HKL+fS904xtI8nMsP+H0p++MMS0oR5A6xXR8oJvxAf9USC/tv8HAeUWCp@vger.kernel.org, AJvYcCXFgfID5mmFPDN7tNpYNWPmf2Rihvr8ypgu0lsaJiiMMdDWeoTE8T4cBehO1ACe+oAXu8l8Hrb+BLkkxpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTz7Q/gAWiV81V5hebK4OK3ahEl2H9iR7aJN/kc+1IY/3byQB
	GU0Qfqbeuisna+1Wlg+8oiQmaVcymml28qvyp6M7tZggWrBiz5FOSaWXTaS7kdjC
X-Gm-Gg: ASbGnct7vSAYwI15eu4ORlFDaoUngbJFawO7hWLVtXWZK4No6yQ/jGha+X/qaV9Iv7i
	l7Qm6LwVEoYnn+IF6Ll/81GSrxhXP7XAek+3hK31v1Dx7n5PMaTMOB6PYnEE3yTOXuD2gnfPUqp
	gwyBYaWFmSfYzmf+5GWTjyGuxb8htqXojUX307/g/tdF5hOVFzF1LP4mVs8BKxSczfJG/FDbvrW
	AQ4NCjzJ8eD+lmk5YkMK8Olm8OHVPlRFWbmW7HboSPxxT4BSzym9qd0iLKBx6UPCprGRHWfF3Gp
	Qu6mvHEkWW6UJXuDPsfNhLxPmEKXpZRdqhj9tYQlkb5QKtx+ZyvFO/ZazGJfUddTpebKiInTmXH
	wSWq0QlEoxkMbmnAQJDW3JyY=
X-Google-Smtp-Source: AGHT+IEvA5/WDKDSgUCUGgs9+T+B+p4SGxVG84q25Rng25L/tfZ509AI7QBBg7Y+27zKK3A3L3aQ4A==
X-Received: by 2002:a17:902:db01:b0:24c:cdc0:52a7 with SMTP id d9443c01a7336-24ccdc054dbmr29353105ad.24.1756996413792;
        Thu, 04 Sep 2025 07:33:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cac814a10sm33364705ad.133.2025.09.04.07.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:33:33 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:33:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
	Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: imagis: add missing
 minItems
Message-ID: <23olm2vbdiuliejmwfzhr75xyj3na2mczztvno4rkbi4mdl7xr@uu3br7ucdydp>
References: <20250824-imagis-minitems-v1-1-cea9db55e87f@dujemihanovic.xyz>
 <20250825-capillary-viral-b7448ca6a57e@spud>
 <5917367.DvuYhMxLoT@radijator>
 <20250826-yippee-tamper-5439f104769b@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826-yippee-tamper-5439f104769b@spud>

On Tue, Aug 26, 2025 at 06:38:05PM +0100, Conor Dooley wrote:
> On Mon, Aug 25, 2025 at 08:57:57PM +0200, Duje Mihanović wrote:
> > On Monday, 25 August 2025 18:42:38 Central European Summer Time Conor Dooley wrote:
> > > On Sun, Aug 24, 2025 at 06:12:05PM +0200, Duje Mihanović wrote:
> > > > The binding currently expects exactly 5 keycodes, which matches the
> > > > chip's theoretical maximum but probably not the number of touch keys on
> > > > any phone using the IST3032C. Add a minItems value of 2 to prevent
> > > > dt-validate complaints.
> > > 
> > > Does this mean that there are devicetrees in the wild that use < 5
> > > keycodes?
> > 
> > Indeed.
> 
> oke, Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, thank you.

-- 
Dmitry


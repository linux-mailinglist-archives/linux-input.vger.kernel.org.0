Return-Path: <linux-input+bounces-12218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B874AAAEDA7
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 23:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F352503AC3
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 21:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56628FFE9;
	Wed,  7 May 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJX3cB2d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804CD1D6DB9;
	Wed,  7 May 2025 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652322; cv=none; b=h6r23em8n4u0LV1cR8QVBZfK9cetKgVp9Js0Pu1R3WOU/cu9JZuKrY6TKO+iNxOV8Z90eBZADBNwhPfSDuZDgH7JpiEn6Ikdw6VszhUCPgX8dl1g1KhvVBi6iPqzMkBrsT65joiIzPvqH40DEK0LI7hard+g0cfmft/qAWs27FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652322; c=relaxed/simple;
	bh=C6PGx1drOJ6K79RV41IwKa1LTClhF7+DSTMJJXHHhJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAlwlQAq04z4wDOZ6BCLVOXtVo7m3R6hmA9yx0XXZGKhNKugxpBRHwpzsPOSQNg0KfwlTeahfGHQjLbSUfChMBIZUMHsdVyvLBWK7bhM/63ALSAzNKF5lnIK0JSgVBc11xHCZq8LxUvdKoN9R6zFMx73Jjoapv6ILJtH9VAaPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJX3cB2d; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736e52948ebso431560b3a.1;
        Wed, 07 May 2025 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746652319; x=1747257119; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdCLGz2DZVB3CVya/CFMD4neohtrxAI0XC38K0Q82cY=;
        b=JJX3cB2dnCu75Xcm+6RqlerWhH/dRrVSsUGmeRhGXkk+LBfVxZKsORGxhyRvIN7932
         Myu5ZjHfK/L1DxyzIDwzfD6P14Dbbuz50EPQVpy7WdzRy7xXhhG2/zOqGeopBoh0wLyM
         A3azpL/dfJSmIoFHg3/QwQruRUkguU+GoadNOmP0YHqq9fwnp+TkXKFK6d0QaX0D+nKf
         gD9Eqlrri4D+QHCmwPxQyIWWCemSigNT2mrEl7uRer9c0TSYjv2mgG2j0CzOHKDIZcsP
         lsss0Ksd89em9lC1JipLzbbRjzTKj0OyOivqRbq+ex+dFIM+vpCmve1OpmapEHL6lZ7A
         NXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652319; x=1747257119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdCLGz2DZVB3CVya/CFMD4neohtrxAI0XC38K0Q82cY=;
        b=kcg4p81xwmwvRCdAlTVRYNlkiIBSeQHc7c0tnhnWttWNgepq8DYGEg/crOx8f5oiw3
         uLtnFcbMuWyx9c//Fhz/ymPI+yloAC/nOWbzg+kNp8MChKrT2yhsHyGJtQ6sEMthEXJo
         MG11JZZZ/jSTAhdEpZ21roCt2T/QzjHM5xrlCrB8hYWNgRkLaminC3qBjGcg4QON/Lfh
         KjpBw1bRYUyvPRmn2vjEDsF/Q8etd9ohOx7zQaRa6/jk257+lim7Uyp1HJi9biRMeh3E
         L31u1ZYCloCGS9nJu7SBEhsF/5XUx6wutOrmDr7F6w9ot/t8hBI40lStvm5h6hpVNJ/0
         B9qA==
X-Forwarded-Encrypted: i=1; AJvYcCVWr1wzqf0P11xbTyzcSCLrtnyley2hzDY3vZ45MtT+grmb2xEi6Llqzh8f7tLL6SPLIwaTneAWtKHuO67g@vger.kernel.org, AJvYcCXLrqrznG6P0FSg9clqST5dtTlOzwECuhwO/AyJ5jTQLaodYf0IXd3F2JZl9CC7u4dL1fM2HEJdIz7S0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfsv8jIOgvZpMr35zcJGkIA48Ja+6d72V+/L72dLH0FRmwsiy
	ccX2jUZDH0XAOwU8O17FLdvLfpGf00B5M+AanoM0qMWL1R7QV/G0
X-Gm-Gg: ASbGnct5BL9LgPZg7SOfaf3M7HEJP8n+LCANhKANCmNCqSQONij3lTPhRxB6NbnILzM
	3dfwYjLsb28G0MTeE1FYyZTlOAMEGEFb5VpPwQUHHRo6Vn+JNIc9RcQEpwWwlQm80CX4DbWrDoO
	IHLodUIOT32veCdkV4G0wkZbGWhVa5375Jm38YGwtobqVOUs3NPApUkLCiGPI2Fmw46C/Wtpgql
	+a4RImPT1UYC+QGeeykDbAnWrLjUL6Z+rcvRp5cvSr1tbun599VBQ9UjEXsroXcj6h24f2mNWog
	gKF4XVWYpWlkgIB1U9j8jaTZnMQcotxjjYJBy7ty
X-Google-Smtp-Source: AGHT+IF6cg3WQvAi4difZx/0M9quEsQjn7kDxlNH4NgJkSPBMCMRXNkDANMpFgq/Jw1J2fNtScKMHQ==
X-Received: by 2002:a05:6a00:4296:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-740a9964a20mr1532458b3a.3.1746652319490;
        Wed, 07 May 2025 14:11:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fe5b:f2b0:d1f:f5ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405902104fsm11737100b3a.115.2025.05.07.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:11:59 -0700 (PDT)
Date: Wed, 7 May 2025 14:11:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Holger =?utf-8?Q?Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome
Message-ID: <yn7pxv6l2wg6cnaikpbxmqkblbnj62vpiq6ixcwr6qhhxnvtky@7nikfwvevptq>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>

On Wed, May 07, 2025 at 10:46:35PM +0200, Holger Hoffstätte wrote:
> On 2025-05-07 13:44, Russell King (Oracle) wrote:
> > Could you try booting with i8042_unlock=1 and see whether that makes any
> > difference please?
> 
> It did not help - just had another runaway event with that setting,
> on my ca. 2021 Thinkpad L14. Had the symptom for as long as I have
> had this machine.
> 
> We've been tracking this problem in Gentoo since late 2022, see
> https://bugs.gentoo.org/873163 and none of the suggested options
> for i8042 really make a difference. In my case I almost always get
> the stuck key events when using the cursor keys for scrolling in a
> web browser. Sometimes once a month, sometimes twice a day.
> 
> Fwiw it's not necessary to reboot; suspend/resume fixes it,
> as in close/reopen the lid if you have that configured.

So looking at your logs in gentoo bugzilla we see:

>>> It is around 1 second later that I realise the J key has died.
>>> Now I sit and watch for a few seconds before closing the lid.
Event: time 1664975487.559043, -------------- SYN_REPORT ------------
Event: time 1664975487.591980, type 4 (EV_MSC), code 4 (MSC_SCAN), value 24
Event: time 1664975487.591980, type 1 (EV_KEY), code 36 (KEY_J), value 2
Event: time 1664975487.591980, -------------- SYN_REPORT ------------
Event: time 1664975487.624955, type 4 (EV_MSC), code 4 (MSC_SCAN), value 24
Event: time 1664975487.624955, type 1 (EV_KEY), code 36 (KEY_J), value 2
Event: time 1664975487.624955, -------------- SYN_REPORT ------------
Event: time 1664975487.657800, type 4 (EV_MSC), code 4 (MSC_SCAN), value 24
Event: time 1664975487.657800, type 1 (EV_KEY), code 36 (KEY_J), value 2
Event: time 1664975487.657800, -------------- SYN_REPORT ------------

Because I see the MSC_SCAN events this means you are not using
atkbd.softrepeat for software-emulated autorepeat and is using the
hardware autorepeat function (which is the default). In this mode
keyboard controller repeatedly sends the scancode for the pressed key
and kernel reports it. We know that interrupts are working because we do
get scancodes from i8042 and from the kernel POV the key is still
pressed because [piece of software that emulates] i8042 tells it so. :(

...
Event: time 1664975493.812157, -------------- SYN_REPORT ------------
Event: time 1664975495.120717, type 1 (EV_KEY), code 36 (KEY_J), value 0
>>> It is around here that the computer resumes from suspend.

This is software-emulated key release that we do as part of suspend
process. And afterwards firmware gets jolted into its senses by suspend
and starts working...

Thanks.

-- 
Dmitry


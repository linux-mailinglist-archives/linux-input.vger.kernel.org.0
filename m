Return-Path: <linux-input+bounces-12077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B5AA1197
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 18:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4653F9248B5
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 16:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A374C2459FF;
	Tue, 29 Apr 2025 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j58TMmJA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208252746A
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944325; cv=none; b=ghuy+UITem9IZtwwnbzSAIQ6L+g5bNGgFWN1rXV+RZt0wuUQlLRXbwwAS1KYK6HC16rKDCMU0m6FMaZM7VjOusXuthVUN5kpAaamak1O2G3zuyLDXJyuLNUuOqAHXqvLSyn/GHvV4EE8EGmULU8kseoPbOg3/3w+Zss6jKFDTb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944325; c=relaxed/simple;
	bh=TaKFxe2hssq5Kcxfx9jB4lJIIjkRkV1AwL1s0kSu4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ext+BBsGXOfrVTxViakFcC+ekID6UrsA6775wY3/iXuy66oKIQPa0wjIAILI95jf9rDu7HTtQ8zqfDPC5dDmrltj1wvAlArGBe0jbBj8uvUEGUyKhIcJnJlqD9txT6tLYvFeoseZ/IBVVWIhq+wRiCb4GFtNERXwAe4jZq6qfew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j58TMmJA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227c7e57da2so53538345ad.0
        for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745944323; x=1746549123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oORyFqbDz3vR3+ZORqG2mVQcDwRWHnBpYg/mivLmELc=;
        b=j58TMmJAderVshIsMr4NW7V7rX7tLhwdVZAfJ/42Bp+DyKmPlb5tz1xHv8MrcyC2OR
         lPCBu14JsyfG/o6apbHumneulCbRIKH3HYqyJV5p1sHbLUCk4sRILA3RUrjcRP/JfxZP
         foujKDk59GH6vqBbIdGSqKcerWJLPXFDupoX6032PkPCin0eEwAc9/o6aTfEkvS4ZcV1
         +uvEFqsWMjuXrvIN37T+W7ofuCkzNPUb0R/J/WJancPDpNoWSbCHiYtT0+dMiLOXykr7
         M9cF6Q+Z/EhLlDdhEtjDYUbBZ0Vm4Ohir5aihtm/+H1td2t4QXZOgZtoorfyksOKb4Lk
         l5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944323; x=1746549123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oORyFqbDz3vR3+ZORqG2mVQcDwRWHnBpYg/mivLmELc=;
        b=j1nqdslKYmrhxzjR8w/wOaiK3NQ8yPr61SvEz6eE6AHD2A3n5+ilEWQsxEioB0zkdf
         Sx4voomTSroT3T6PBkJInrqsqlIMAyZg3D4Db5w/LSh67begl3Pr8i645csQU+D5LVGG
         2iZY0jo6avSkp3dqBoSyydRPm9je24Nqylm8FCk8nD8/Fyf6LmF0eCmUjFPaaC9Pb71C
         bu4gjLmmBPeHdreF0e8bcWAPRygyS5gyMzwei+ecEVpIllokgfJj4su8iWaEK1WnsN58
         XqmvNVf9JgSLT5C8AbEhyHEsvzWTqK7zC0Da1gj39bNDQOYRdYngYZA2qWzErTGjyGzY
         8/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVsdC2CLx2l3iDIGTRdFM+pd9N5bM3+NrD0G3nl54Za1y7f39m+ThZK8K8OUmrtPpYh57v7eDmhDcN5Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdG04AwEbLLfJYuJo0ig+O4auo8NXLDLhdGPIfLuyEn4dMifKI
	S67UL41UV1QkfrE6L0UigKEA8FhJWhXaCgd5YdKyZadG1PLbVymfv8unKg==
X-Gm-Gg: ASbGncsoVKDgYDwDPIdaHgjHJxZF3ThpTM3LrglfhdcsXsXoj8mC0V2JO62joGIDGzc
	cZ2l2V74rblSlZ+rQA5TDLmNV7uADZ2aQ5bddNZ0UeM1m14dxMMtJc4Ssa5ZzB23YrLsPtulMbm
	15K8l09VoyYjGV4JDUhhEBGt0A34zp9UYIop2t8NbL0rA32OwYWQO0THJHetyvdYh5Ya1psjUSL
	iDw8fclFeVr28PoNsPzivLZHCMCjRFbp1gndhm6OhhrvbQ1jPJsV3g2ssTsC+QOXjfQG59mT9oY
	rnbOAh9AKW9LY1FJ3rWorHeFmw8YZe+d1qyp0wmcDA==
X-Google-Smtp-Source: AGHT+IF4e6Ez64UmVln7ZoSh7WHUSTrrdOMIyw9nf40SxEzzxVePYaLLhzUwhWOU02PQQjficBnNAQ==
X-Received: by 2002:a17:902:e80d:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-22df34b8588mr610855ad.12.1745944323164;
        Tue, 29 Apr 2025 09:32:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1d59d45835sm3155795a12.67.2025.04.29.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:32:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:32:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: jt <enopatch@gmail.com>, Peter Hutterer <peter.hutterer@who-t.net>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <sgkvmguwmongfjofsgxd4ev56whnythfxkg3dltfajcac3jpyk@tol7oavqk6cq>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>

On Mon, Apr 28, 2025 at 06:19:07PM -0700, Dmitry Torokhov wrote:
> On Thu, Apr 24, 2025 at 08:18:00PM +0100, jt wrote:
> > On Thu, 10 Apr 2025 at 20:48, jt <enopatch@gmail.com> wrote:
> > >
> > > On Thu, 10 Apr 2025 at 10:02, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > > And please send me another dmesg of boot with the above config and
> > > > i8042.debug=1.
> > >
> > > My first attempt was with "i8042.nomux=1
> > > psmouse.synaptics_intertouch=1 i8042.debug=1". With this combination
> > > of parameters, libinput only sees 1 pointing device which it describes
> > > as "PS/2 Generic Mouse". However, both the touchpad and the trackpoint
> > > are able to move the pointer under xorg.
> > >
> > > I then thought to try removing the "i8042.nomux=1", leaving only
> > > "psmouse.synaptics_intertouch=1 i8042.debug=1". libinput now shows 2
> > > pointing devices: a "Synaptics TM2769-001" and a "PS/2 Generic Mouse".
> > >
> > > I have attached both dmesg outputs for the above. I can attach as many
> > > different dmesg outputs as would be helpful to you - just let me know
> > > exactly which different parameter combinations you would like me to
> > > try.
> > 
> > Hi Dmitry. It has been a couple of weeks since I sent this, and I just
> > wanted to make sure that you had received it.
> 
> Sorry about the delay. I looked at the device initialization and the
> "TouchStyk" device does not respond to the Trackpoint protocol queries,
> so from the kernel point of view there is nothing distinguishing it from
> a barebones PS/2 mouse.
> 
> Peter, is there a way to add a quick based on system info to libinput to

Meant to say "quirk" here.

> identify that PS/2 device as a trackpoint variant? Unfortunately HP used
> the same PNP IDs for the main touchpad and the trackpoint...

Well, I forgot to CC Peter. Let's do this now.

> 
> As far as the main touchpad module goes I am about to send out a patch
> to add it to the list of SMBus-enabled variants. Would you like to be
> credited as "reported by"? If so what should I use as name/email?
> 
> Thanks.
> 

-- 
Dmitry


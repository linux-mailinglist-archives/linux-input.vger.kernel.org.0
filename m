Return-Path: <linux-input+bounces-5743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24B95BA9A
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 549042841B3
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25981C9EA9;
	Thu, 22 Aug 2024 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpVo8HC8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFBA282E5;
	Thu, 22 Aug 2024 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341021; cv=none; b=AK9eOqpLi+K0Zb4o3wUuTRPaAYPdVnLv5RCLVa3TMx8j2HQGIkY4g2xMkt4I7sf1OPpaY2ZOhI36rFJk+20tJE/3pTSFj4cV4WCiRLolckHGk7s1r6yY0RBp3oGuznRAoCgpmzEEsl9+VasjchpXetkCDktD2s4dAk8fzany8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341021; c=relaxed/simple;
	bh=UT5JSX7NkLhSkoZlzoteQKFbXqJHbW7UDcXhF8lXT2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObNBFGvnreKUQsIis9YrWqCAAJl0FrIRdwqaogYXZazGSDrBDGDAiooaedr9WJp7lZYLjURmUjxG08MoWa+jNSVC8SVc//jAzY82otmbSEf64wupTezTVAAiQN3CdxF8oZL+hAM5YQtmppCll9jI/aM8d0HaNRywzKmzV6oGaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpVo8HC8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-371941bbfb0so494759f8f.0;
        Thu, 22 Aug 2024 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724341018; x=1724945818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT5JSX7NkLhSkoZlzoteQKFbXqJHbW7UDcXhF8lXT2Q=;
        b=fpVo8HC8iJoLs3PeHaoZKKsDHOstg6Syo2l8mGKcAtJrByj9pEbWLDvm4It4ZPcrMD
         R+TJjrhFJfCaXHR60ztjErcmEtZQbQGS4U3RbflufYyQEtT23EsUGto4iN4X+a4KoSD6
         FryQv3QwBvaT77flxEY3yDJr/chZb0cO6awbJYqlLwaqCvu7B7i04w9Qxynw+/OGNHkX
         RWAkjBjoKqND1GDHVjQ61VdEqdVA0O63Z4GXferl8CE49G6Z4A6YBczPAYGcgntL6P7j
         BQ8aayBTjzoX0bLATTkEzYXG32bOD1E55tkD1Tx/kRjGs0reOUYv9FDer7y1WXKhXsO5
         uVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724341018; x=1724945818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT5JSX7NkLhSkoZlzoteQKFbXqJHbW7UDcXhF8lXT2Q=;
        b=XL6taQiW0X7uN+CAmqsRJTLRBFoffNvEGCnTKBFoLILxAol0YsgDDHHcvQwmrYn+nZ
         FncSekKJWRCFwluPI2YHJ2B1XM8yLPuaXdaXTGU2U0Fc/UcoOkYRR4RFBPHZiAOjfH4B
         ltPkZtQp3RmnzAfr1hlfp821hQSBJQw5g1Yep78wfBq60QkM3VU25V/L4etwY/bXhY16
         hdSNiYD85blypmChefG1fiIs0+cQlJodhOaY4NmQ3W2jYey90mqvFBz38T7B5gcWabJ1
         tGxFIvwh70EeYQjV7rQwCxNxXpL44nv86yMg4fEGlDrGCnXG/bsYbXT5VwJwp4KgzYka
         +xgw==
X-Forwarded-Encrypted: i=1; AJvYcCURTnkwrQVMs/SZBy/Vla+JRMd5seBkfRnYWZn/5CPb5j95iiMdDG1zCicBd1fa7ooW7j88u6ECVnYH2oA=@vger.kernel.org, AJvYcCVIdTEeNTXuVg2GRUessWoIpr3H6MFdxeJbIRccOScKAXg2F4+p0WRW075lW1pRUa5e+6Wud0RzGetZbOKX@vger.kernel.org, AJvYcCWnkAKWVGIcH1k6A5QjydlsX9FbC8lYnGhFSwaD3R32L/B/9pEXhmb+Rvm6K/eC1juUP+++d/teKgY1EimNemE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CCqntU1dv3lyJjUF0pFg+groE7S8mXttehDtLwIxM5ETJzcA
	3n8sa7swstF1R3c6nyCE5eJhti826ffrIhclNFrMhJIV0k4St7xgyZw/mpZAfXgyN6JvD1t8UL5
	Bh5Qe6URQesdpVw2z/c6PDW8zWYg=
X-Google-Smtp-Source: AGHT+IEQ4hUaoGkM7iUabyWcXfrSPEMvBjGboImrtSv+c67yMSVsqMNryIsGZhdrpflCMtOKsHNrZXgtlX0TLg8ChVs=
X-Received: by 2002:adf:ab17:0:b0:36b:c126:fe5e with SMTP id
 ffacd0b85a97d-372fd5a9cbemr4008374f8f.30.1724341017960; Thu, 22 Aug 2024
 08:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de> <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de> <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
 <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de> <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr>
 <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com> <nycvar.YFH.7.76.2408221355360.12664@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2408221355360.12664@cbobk.fhfr.pm>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 22 Aug 2024 16:36:46 +0100
Message-ID: <CALTg27kV7px7TQ0nQuEUPHEqXFxsi3ieXekZK1Ze_oVkWEVjSg@mail.gmail.com>
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Kosina <jikos@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 12:57=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wro=
te:

> > > If I recollect correctly, there may be an alignment issue and just us=
ing
> > > the stack is not enough to guaranty what is needed.
> >
> > I can't find any reference to issues with it, I'm not sure what I saw b=
efore.
> > Also, it seems like the hid-asus driver is using it:
> > https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hid/hid-asus.=
c#L391
>
> You can't do DMA from stack; see section "What memory is DMA'able?" of
> Documentation/core-api/dma-api-howto.rst

Thanks for the link, I knew I'd seen something somewhere,
I'll leave the allocation as-is then

Stuart


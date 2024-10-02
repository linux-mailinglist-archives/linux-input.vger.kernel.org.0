Return-Path: <linux-input+bounces-6999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91E98D067
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C332826C5
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8785F1E1A38;
	Wed,  2 Oct 2024 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTDKIrqI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5BA198836;
	Wed,  2 Oct 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862465; cv=none; b=njvTlZAJtmGKqoJjs6t/tKuZR3eTFlayKTXc2Q/BwIRS2jHj/GA5vEcYRIV3nvzRWJkH0lsoiodY+pcWmaG85aN7ZU0iR0l+VOo80IUUJ9iVPu+DZ7hTz/uBhyF2jbPI2QQxqB5hwahU31knEtABOBaHnmY0A5Xm33wu1Aiuleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862465; c=relaxed/simple;
	bh=8DKd69N+3md0qAF7aqO+LjgYkyEIyxp4My6srEwUCOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXF75u7sEgeDRNlZvJdSDjsMvZuuclKyFoV5qMVDwJ2nj8IYpysH+AG1KhfakYfoQQRqmHaEQZz2oZRkEOjX2XOVJJFhMM2HADdcfs/7y42QLPKCF5NbZ1r0VgzSs9mxyh/pvfDpg7utbyKPdUiHrJP8B9IRy5x5cMbq78KZtv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTDKIrqI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b7259be6fso37269345ad.0;
        Wed, 02 Oct 2024 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727862463; x=1728467263; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Urik/s4KVO/h3jfvtlTjPUIMhzRShqohLSVoyoiAQ4Y=;
        b=dTDKIrqIrhFlX8o6WeRr4xk03HfKyArrOkqU+Lmt8dHEqb+g1mpe80BnsyuFJ5FdXU
         hT2m1/kcXIuc7JMenIZ/NjQx3PavNDBOUFeAj80eDpKr4nNCRWeTSPr2ySOjU9i0DvsJ
         x2lD2zI0oDlDS/ueXaSUqZXW6rYRoaTmQZWdSKpBK8Jepz6zGttyRAle+LLk3ukUJ3tZ
         3HdpkZAHguDN5707J4gHJ/sLD5JH29GUaMRyGcF8yjlNCCLvLOWuXF5Ga5nVYXbG0NVI
         ZqxYurS1e2eTNLSAqvSYniTAi3mqPsKikWxvXsjZdl+9UkWCEpD2jp6j/VXAqH2BBRCl
         bdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727862463; x=1728467263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Urik/s4KVO/h3jfvtlTjPUIMhzRShqohLSVoyoiAQ4Y=;
        b=EuHQjDUOvb6JX4wGMiuSbkOIoDJ+LsJwg9wZWXbrF7Ug8tj7kUGfZpRj92cnUsX7L4
         VMa0pKg8MnU9oHQ/e5zmLe/uszRk0E4s8Xq6sZdfTXz60U1F/P2+VpggmbyQxxUfeotD
         PgEjI41tT19osFQNzr5rgQVPZwORhL1yrdUSqiUNwC8lG5iSNZla+toyo3OnamEDK3Zw
         QByBrKL0wEKK2QLb5pfQKEAJVyUppW37WjoRiWIPJA3YULYMcrqLhnmH+Dy0GTjhanRS
         MBhvgT3l8cHJIK0AZxvVrlhFtzKtC6EnA44NJNe69u+X+GWX05HexBgcbOJRSbTHGpAy
         er3A==
X-Forwarded-Encrypted: i=1; AJvYcCUP0xwWoZzC2pHreG8vVIow9hHybiIPxcS/GZZ7Yldht4REshZbF1VfFplUPC9ET0Scj7XZOxzVGMyOAzo=@vger.kernel.org, AJvYcCUxquJCr7qKSRrp2OrxcShlJyoTKISm4UZsDOjRejRVyI6VnZ8FezATj7twetVxWCSOG34cZ7raswzA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzovg2vl+kBbAD4w2Z3yAGu9fDfgcD/w5OABHav82zcyUuPHsd3
	YNlcNzo45KbXerQTlcAXJu7gjQwgUamTaDcveKZmRNF2FdLUAryQ
X-Google-Smtp-Source: AGHT+IGnAp7/AIEUV8PNiG4EmQSf0voS9emx/ar0Qokl0/5USD7nGzPjpdth9Fc6AYSKzvWG4VkICw==
X-Received: by 2002:a17:902:ec8f:b0:20b:6f02:b4e5 with SMTP id d9443c01a7336-20bc59ae323mr37121385ad.9.1727862463203;
        Wed, 02 Oct 2024 02:47:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:59b3:a140:3cbe:62fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e6c997sm81230165ad.307.2024.10.02.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:47:42 -0700 (PDT)
Date: Wed, 2 Oct 2024 02:47:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Mike Frysinger <vapier@gentoo.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/13] Input: adp5589-keys: add chip_info structure
Message-ID: <Zv0WvDCMH1-D1pdq@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>
 <ZvwNV4zor-MTKigP@google.com>
 <22f246a0809e2d1fc738178400f8a3d67fc4dc56.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22f246a0809e2d1fc738178400f8a3d67fc4dc56.camel@gmail.com>

On Wed, Oct 02, 2024 at 11:13:05AM +0200, Nuno Sá wrote:
> On Tue, 2024-10-01 at 07:55 -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 03:41:34PM +0200, Nuno Sa wrote:
> > > Add a more natural chip_info structure and add it to the i2c id table
> > > driver data so that we do not need an enum a switch() to get the
> > > specific bits of each device.
> > > 
> > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > > ---
> > >  drivers/input/keyboard/adp5589-keys.c | 181 ++++++++++++++++++----------------
> > >  1 file changed, 95 insertions(+), 86 deletions(-)
> > > 
> > > diff --git a/drivers/input/keyboard/adp5589-keys.c
> > > b/drivers/input/keyboard/adp5589-keys.c
> > > index
> > > 922d3ab998f3a5dfbaf277f10eb19e5cd1b35415..eaa5440d4f9e14352409dd880cd254354612bf3
> > > e 100644
> > > --- a/drivers/input/keyboard/adp5589-keys.c
> > > +++ b/drivers/input/keyboard/adp5589-keys.c
> > > @@ -228,16 +228,20 @@ struct adp_constants {
> > >  	u8 (*reg) (u8 reg);
> > >  };
> > >  
> > > +struct adp5589_info {
> > > +	const struct adp_constants *var;
> > > +	bool support_row5;
> > 
> > Is it possible to derive "row5" data from keymap information to avoid
> > having this fake "adp5585-02-keys" device?
> > 
> 
> This is not a fake device. Looking at the adp5585 datasheet you can see there's
> module with 25 keys (without GPIO5) and another with 11 GPIOS. From the datasheet:
> 
> "- 10 configurable I/Os allowing functions such as Key pad decoding for a matrix of 
> up to 5 × 5
> - 11 GPIOs (5 × 6) with ADP5585ACxZ-01-R7 models"

Ah, I misunderstood. I thought it was a runtime configuration.

> 
> Why its named adp5585-02 in the driver I'm not sure. I kept the same name as the i2c
> id? Should I call it ADP5585-1 instead? Or even ADP5585-1-r7?

I think this question is better answered by the DT folks.

BTW, in case of not using row5 we need to describe this pin as a reset
line for the chip, right?


Thanks.

-- 
Dmitry


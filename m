Return-Path: <linux-input+bounces-14572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9AB50050
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 16:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145285E567F
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4638350D7B;
	Tue,  9 Sep 2025 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0WPPmYQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FCD341AD2;
	Tue,  9 Sep 2025 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429678; cv=none; b=VqgdNX5xs7F6K2uhEsBLGqIyd1s1jYgHkzax+2lmK/TBorcKlvFkUtyViFEb4w5+IyANYIilx7eJHRSV9etfCfiH7RlNneievEkS9uXeXamvrukmLGhxcV6lSAiAle2KUlUvWRuuwP+I2nB3irkQHcV/ym23z9HXsgVlyrAHOLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429678; c=relaxed/simple;
	bh=PpFwLDXJv08CFq0GZzcBAKoDITs5j/xDdEGt9D7mlxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etvzFakBmJYZxJj3z3ekZBYJlkJkbFAxlAj9aK5ixmrh+0NV24y0NUPBUGmu+GAJaGVPcPUVTFcKJe0ffqH8PRzA2WGse+dIe+UuD8evxVWbwAOmRF36e3HIB1vSLn1dvO5YHNoEhlTx2fdN93040IcujmIOK+XRdGZ3FwqStpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0WPPmYQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-772301f8a4cso7970916b3a.3;
        Tue, 09 Sep 2025 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429676; x=1758034476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jA3Bi8d//MggMJOKR9RSAK+GhvJF/ZKePtRLYeh1gnI=;
        b=N0WPPmYQfWXWhVlNQAVUkV5rWzEixA5ErFtdrd73zENpiZpXp6UPmr48GHGQ0obmtI
         NhEVOhTxKRenU6YDGqt/UgKkqUqi7OLBrYmS6DVGam+zEjLa+F+4dsT4ARqNBKXNlmwR
         mm7XQqSVfvss/6e0viZRHLOH2OSNhlsqynT3KPGhIkw7XL4tda4Q1MKhcHBk4OGoTDRx
         yOIio+5MiYzHEysFNqkGnK++iNJEuAm+SrpNrYWis3AMvROXjMl+GbpRXMk84oodVsRV
         huqqDp7N++EkvHlMSOnUFidyLlGoSNQdPwIOdWEshJGky7WbBAFpfW9z9iKvpCFyfx7u
         FHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429676; x=1758034476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA3Bi8d//MggMJOKR9RSAK+GhvJF/ZKePtRLYeh1gnI=;
        b=hGhAQN8Co7aBv6yH9kjxdge5ozUoi5nm7yTr0KfoKRmY2kCZNXZUOwRdM74kO3XJZF
         TAp4zdk8lqAj0k+qZcs8inL1CoMkr23X/DWOCWYXApPlXNLJroctmt6Rcmq4bGpNai5F
         rKYIq+x0ieRe67CwaXCvzNNpCFEMjN3uBGaOvXH5lFfQEmHqn/LCzu2xsrwDybVUxnp3
         hODota/Nv2jrZYeH9FBe+WqSiy7utz3SD1I5Zkce0LXz4xyWMzSs6EUZSDQplMwMUYZO
         iYup0dAlod8+kUuA0g3jrnLpkmQ/hpR55HdwJtPRk82hkBIjdpg4eGSatbKNmXT+Q5Il
         wYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1NqkrcDx6eRq04w6USPTbIDBEFTvqBy78DFHsQNfug427dDKrJfQys/rGLVz7bzZlLGyIyunKDeqd+fi7EQ==@vger.kernel.org, AJvYcCUpyNVeViA9iXwp3ID5qs4pzwNutZ6vLcjLkkwEhdtZfqiDNRh8UBr2nG+jAgV8nsA8bPuIZrTk9vTgq/A=@vger.kernel.org, AJvYcCX6ceSzs/Qfiiaw2GGYrZSQeMryAmM+99Ja9+I6Jmj5V/ZpNlDPepx0//5rxJFDxecXB6rw0NmLozPe@vger.kernel.org, AJvYcCXCUE+Qv/F5wYjg3e6GGf9tleiOXsPFRcIPn2WsS3tcCnSTtem5SPmXHvsN8D5+/hA+6k7nCENuDVaF4XI=@vger.kernel.org, AJvYcCXZGDftzFEfHQiE0qG3VYVwRUSsGOCy0I1nSGLOKF/s7WSGeltf1ZRHkuJFOacqHheQViffQPcgw0/AtKhk@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBlbXgPqn4KZt0pXNddhlRWk1OU35hR0jZv/EePT0X7typY+c
	h30f+3BPR91VxSC7gFfiiSaFxJyi44gXJbGP9HMsma60y5RlaI3E8Gee
X-Gm-Gg: ASbGncukkpv8vAGzKN+nDLo6iJvGIK2E9Kp1yENcTif0F+4vTBZaWlbZeyEtEZBllJB
	pCLhGSWJd33zMLLCpW17DLwCte2DmJsq3PoVLBZ+Ol+vmXn51+a6bMSaxtj6YONwfshKgGJNrtV
	9QK7/VcwZU/8/7bQgofH6XKeb+ZeVdfmew6ae12xU4rSQ7h5MbxfLDtGIDjypnvX1FXVRSFDbNM
	YHHi3RZuawqEERnywqEXeZGLMiBu4TFTdrY3tf5FF4Wxn2gDvybwFjVC8gHzDJofa9AvtaELncH
	q9mgSIJUFH552juHOW/gZCbi9VJzFmW4jUeEH/iwynaoghaxo6+bahe8H45X54zS6jdNqR/fCeA
	7CHkaKoaeuixfj4+I3lQZYf0=
X-Google-Smtp-Source: AGHT+IH5mCB08NPGCHa7NzhViyJDulXvqYSo+gbL1Z9Ig9RTxI2/HO5RV9PjQ0c7VpKye/9BVb72bg==
X-Received: by 2002:a17:902:ce89:b0:251:493c:43e6 with SMTP id d9443c01a7336-2516ef57cd4mr146245675ad.10.1757429676336;
        Tue, 09 Sep 2025 07:54:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bb68:234f:c4ea:1276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2742590csm613395ad.8.2025.09.09.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:54:35 -0700 (PDT)
Date: Tue, 9 Sep 2025 07:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Message-ID: <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
 <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>

On Tue, Sep 09, 2025 at 04:41:26PM +0200, Luca Weiss wrote:
> On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
> > On 09/09/2025 16:08, Dmitry Torokhov wrote:
> > > > >    compatible:
> > > > >      enum:
> > > > > @@ -36,6 +33,11 @@ properties:
> > > > >             pin should be configured for pull up.
> > > > >      $ref: /schemas/types.yaml#/definitions/flag
> > > > > 
> > > > > +  wakeup-source:
> > > > > +    description: |
> > > > > +           Button can wake-up the system. Only applicable
> > > > > for 'resin',
> > > > > +           'pwrkey' always wakes the system by default.
> > > > 
> > > > 
> > > > I'll fix existing code, so don't repeat that style.
> > > 
> > > If you ack I can reformat on my side to match the patch you just sent.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for fixing that up Krzysztof! I noticed but didn't want to deviate
> from the style just for this description. Of course better to fix the
> formatting in the first place.
> 
> @Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more
> feedback,
> given the reasons outlined in the cover letter. Also on the driver patch.

OK, I'll hold on to this for a couple of weeks.

Thanks.

-- 
Dmitry


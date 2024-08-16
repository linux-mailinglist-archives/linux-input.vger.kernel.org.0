Return-Path: <linux-input+bounces-5608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5D955053
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 19:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA2D288711
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 17:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E1E1C4617;
	Fri, 16 Aug 2024 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TACsbFfa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6B1C3F00;
	Fri, 16 Aug 2024 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830896; cv=none; b=XQizAZTy+nuAG1+dnbnfrXNLgSq0sMvf57NZJoDW7j9EGf/c6pcwQkM1Gk0QwvK3cukR9MdQ3iRLnLRKx+c3V6wAyv6uxpPUO+K8e/te51iXXSDZLvc3wDsdsAykG2lZQkmYysuIgXG9OYJj3SEagX4kKzzBJ9zqXwXDFLkLACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830896; c=relaxed/simple;
	bh=cC0ViqYReWM6MEpJz77xb7IWEntSof+HqE8pNXN6VV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBTZUtJmg3OKnJRIjMn5uIvo4UD7uR7MW6zNffUEqqp8P0Szfe8oh39FK/qSrHsyGCe1v5/RkuQcLnWeKAEjZP3CsLJH3treLEUaBZ84vXiC61cW49CutRjXtTXmsO3Sf2FAyR6a3wd7KunEc2VdWUCEa260Eow/Tyj5s7K/nLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TACsbFfa; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f2c8e99c0fso745936e0c.1;
        Fri, 16 Aug 2024 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723830894; x=1724435694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GwZUhsFEgNZRQSefmro0fRLVNqib2z/6SHklz+L8Po=;
        b=TACsbFfaRdq1FjMUSoPuKhGwMgQUuoMkmYwBO3HcCM316LJ8nUlWh+tLVYUe/qklrv
         iK8GbHCqxnsLU7AdcarQ+NYoC+EXuGZp4I24jcZ9D0eEr//+efh9x6TWi6kNz8BV5f5m
         aOPe3k5h2SoylHxWmDHMWZ7rthRQ6AOI4iZAmpvayoWB1JgY2C1mXNllMaQpdlf/fN6r
         aQzTOlPAwYFd9kHRE4xVmmK7i+ghu9ZEuqYpQaK6Wd3rdv5YVP4c2lpOmP9/8SFZ9Bu6
         w/foUt6xUvE952tWqCZxSgPfndX2I7xyVvz0+NWUD3URh8gN32yvrYSUAGYkqjB8Zzze
         hvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723830894; x=1724435694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GwZUhsFEgNZRQSefmro0fRLVNqib2z/6SHklz+L8Po=;
        b=jhH+LlGHkjd2uzblryopMPZSAg5XjY91syVSIjKf8yUI32OB90HWJJ+f8A5XtJ/3Pv
         fYrSYfDcW7cuzsq/iU/UZs4HpidZwZPEWnuo63CMRQzBNXX//16sfvdbvkNSW5GyFjPO
         oq2iZTu37SXhKlGO1yhc+y6FGgC1c+cKvsllil5MM6+r8G3xrJ4UY/exRl//Gcwl1Xtd
         FtHYH6hpB8wK/N03v7ybFrWU5Kp617U8+bZ1kNo9IG590z31HJQORrckkzrp8SqEYxT/
         cUdesFao2gfrMd8vG3SdgX2mNB7vHgxi73HJPtLWGU+d70q1FRrXKEuTKPezwYhciEm9
         nSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS4SCI5nCbqISRBjVG9NrAV/+8S9JOF3RJQvJRlwYknZXze4LXLLgjMSayzruGblHCP0n7yqMhY8HHHodCW5zi7nTCss4Y5MQB6ZminmWBBjbg+TsXCnXliS+SDkUOzalv/Y8bpgHpBiittqve6Juk2SfmaqQ0liNOok4qd0RnjxKS01Tv
X-Gm-Message-State: AOJu0YyB4XSegxj9uXNEgcBTKTUPqjJSuEnhFoE3oTZx1xB7Lew3FAjj
	EIGI0kkNxQFOOAQE7hqUifHRzvZdao1ZKa+qxD/ZNMcfbIG7swpP694BHHC5XrQ1TCzUFGTf7vr
	+DPnLeeGSnMEHvT8qmhRRgDaRxII=
X-Google-Smtp-Source: AGHT+IHYqnvSQzmLWpQf9hMb0JtwNSjFXqD/9A6DFp94CyFeoi7sOsVv4AwrhyjAx0ixFaHJEzz2+bC5Sg04H1H/tHg=
X-Received: by 2002:a05:6122:3192:b0:4f5:27ac:ce6e with SMTP id
 71dfb90a1353d-4fc6c7128c0mr4613118e0c.7.1723830893854; Fri, 16 Aug 2024
 10:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
 <20240813-b4-cst816s-b4-v1-1-78a03cbef328@gmail.com> <02baff7e-845d-4f49-b2ce-ee06934786ab@kernel.org>
In-Reply-To: <02baff7e-845d-4f49-b2ce-ee06934786ab@kernel.org>
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Date: Fri, 16 Aug 2024 19:54:43 +0200
Message-ID: <CA+4v9GvD1bbqz5es3=_YaPy6EGKakL3z+O7cy01b++1wLA0aQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	igor.opaniuk@gmail.com, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 11:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 13/08/2024 01:22, Oleh Kuzhylnyi wrote:
> > Add documentation for the Hynitron CST816X touchscreen bindings.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> How this could come with review tag if this is v1? Or is it not
> correctly versioned?
>
> That will confuse all the tools...
>
> git format-patch -v2 or just use b4.

Oops. Messed up with b4 configuration. I will resend the proper version.

> > Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
>
> ...
>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - hynitron,cst816s
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +additionalProperties: false
>
> If there is going to be new version, this goes after required: block.
>
>
> Best regards,
> Krzysztof
>


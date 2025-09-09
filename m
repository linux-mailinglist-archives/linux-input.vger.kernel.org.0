Return-Path: <linux-input+bounces-14568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAEB4FEE5
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 16:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 566974E2F6C
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC5832252E;
	Tue,  9 Sep 2025 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7dmkP9X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD62773DF;
	Tue,  9 Sep 2025 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426930; cv=none; b=n7hy3U/1Kfkln+PHKx4PkuNhwy5lop9vpsPhlYEnDli3ISwrghbkzy1RAu82UQbL6UxfoTjFHA6zO5o6MZV4Omwu/68c9ZLv/ffBvuP+B+BDdP39W0rXd0lXCtIfViIR79hwlrjA/8d82qD+5QD7KJmnfEDLjCVDpVK8664Uawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426930; c=relaxed/simple;
	bh=AvTGoMyt2BYloYrSUVYiR3iLxzG482ZbLtiVFLUWkdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9RXLKX0T/S0Xg1HFEljHJoBsrHGMUYthU9mSeup5yJ7f8r6I4xA5gvkBmYfm9+nz2tjAmpqglHprsAf2PCKPtNqGK11u+syKYqXBhmfAHF326CiKAcu3X9oJOTQ6huRBlLUCjAErmoaGj6IZwfItuDmmWx4tp4z9/rjnStKTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7dmkP9X; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2518a38e7e4so35123005ad.1;
        Tue, 09 Sep 2025 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426928; x=1758031728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nc+eCDwt7jexO4QJSIzCeoVTyCXPs3g9j6DkOagGb0=;
        b=H7dmkP9XcKxjFn+vRf1uIy+mP7LwOdbJV3RZf02it/LRxR7ZmDqJDC9IgfFZEd+eV3
         NhvRrreOeOWtQwpfQhbfn2gUp23iKRkTRziNfoM0p9bKaPgUqS8dbxT/lRENELAvKHDN
         Szn8U5SB7UUezz70Bz2UU3HMDp3/2FeLMdgEfki7VX9qV3JVOGPe1UMSDFlJknb03wRC
         NAEY7/3m3fKcDalyNVn3qlAvSZ1/7oCSsGnnY01eOwEUrhwWfwMJDIL9cO3JVDP58hRe
         H4Cau0uvb6eLKgMe9nyw/bXGfqJGL1SasyssH/9gQh5GX7VE3eLtjU2Jd1CMExeGiW9J
         84tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426928; x=1758031728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Nc+eCDwt7jexO4QJSIzCeoVTyCXPs3g9j6DkOagGb0=;
        b=TyaPH3M0kQX6AIzfChTPePft4XAsdVZbab0spqwYlsqoODUlV5aJgDYihKcJVQHj2H
         5vsKK0jQZI1s7iEf06SnXyj6vaQ0r3sMK8ruGpo+NBjXV/ZkmZ8t/b0TNVXBuVdjvoxT
         ZrpgTa2JemjC6lExQcGROG3lpgrbcS9paQUDAAqapz2FsgvKTR72q+8R23zikvPsptaB
         z9mnIlZ5M4B23tJ8oRrKcS1t9APLcz7gMQkh0jqwLTx2nZ5/tudVUzBEcEmD5VK3nAtV
         Cu3qBucfvDfnomP428+6ClRyNRyCpmxp5r3MLOXE2k0YkS5IABLPwLiJpOm6ApwNpm5y
         sxPA==
X-Forwarded-Encrypted: i=1; AJvYcCURBeHRhaRg7n4P8mA9jaHw2ICw9jw5ZqL7i3ljboRDNw/NnkzueYYuCasJHlORkpRsAqFKeokWJ3z8OmIm@vger.kernel.org, AJvYcCWQ5YNVDC+COSjROv0MoqDHjS50bI1CQuKnJrnCcgmst1ZDNyAecxPRr0KBgTeC/G00OXd3Vktcp8vSqzM=@vger.kernel.org, AJvYcCWSs8Gl3RDPE5n0scPZRMtW+ClmoRIfs8C9Po9t9heb756ALO3FpzDrb0vRfINUf0fedSBVMjuMn7q0TQI=@vger.kernel.org, AJvYcCWmSmF/D85qv25VINHHGiS8B+YqXY1dw9huzbzXNxJCZ6OuxEI261y2bI8427U45ozcLcg/5oRUtW+DCQJnrA==@vger.kernel.org, AJvYcCX5QuaUiZxLxybwnNDvoGkO3xVHu/2K0/CBFK4qmVfWAB11Tul8y1mn+jbcuJAEaChV1n+T11N0Ezcb@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJsIdqQorxsZXQ5bO/4B3Q7vMMPhIVpI6/q353o2qr7eXlCA7
	KTJRQfuGBCXagvmX5H4ZjJX4dJNRMS48n5V4+I6cVCN5C2Fm4x+XJWno
X-Gm-Gg: ASbGncvfNEBWLmw3c+N48Xmi7lBRiAIQ6wP6LeSR71PU6bTQS/5nTWith9I8uRhzRbe
	VaOUFh7jYNdrDN6L8apSvRz3OJbOUtlkWfWZYO+hIklpnORVmbofh8mmbKSKfyY1tUQmMKqH4wr
	rIrtzKKAf/vX0MDAyE91EWxi/vQTWd8OzwGzex4Lbrc1XgrUTiZ2v7pRlOw/ZTeLZplRdL/fUSw
	JW8u8PxlsqEpmgjmKA+ZIfs+Ib7H1JHjdF9xoCzCLoM2cbJcB/uLO9JaYaGGI5MZo8qnHas6khd
	YvcAB99/vXwd9cLpSjnvmRe10hNT8WBYijE0ewjlBOvKKZZYdyBJnBNT60gbhisKLCGpG5cjg1a
	3rsYhDGkVY0D0SixgN09n/FnuiIc714zk0A==
X-Google-Smtp-Source: AGHT+IEskLjQXeN/n7O5ucg1Uxv2itS8CwkZmzKsklSc0DP8hpGVRd/CaLeYaL7Ou267VWv6mKNnTw==
X-Received: by 2002:a17:902:d58a:b0:24b:270e:56d4 with SMTP id d9443c01a7336-2517427c78amr148048935ad.4.1757426928430;
        Tue, 09 Sep 2025 07:08:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bb68:234f:c4ea:1276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc919880dsm146720215ad.51.2025.09.09.07.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:08:47 -0700 (PDT)
Date: Tue, 9 Sep 2025 07:08:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Message-ID: <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>

On Tue, Sep 09, 2025 at 04:02:47PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2025 15:23, Luca Weiss wrote:
> > The 'resin' keys (usually connected to a volume-down button) are
> > generally not supposed to wake up the device from suspend, so explicitly
> > document a wakeup-source property to enable this wakeup behavior.
> > 
> > For 'pwrkey' the default stays that pressing the button does wake up the
> > device from suspend.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  .../bindings/input/qcom,pm8941-pwrkey.yaml          | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> > index 62314a5fdce59bb00d1e8b86d6a29a091128aa50..62a08e675ef9511e0ae9ed9fbab5694ab7242c35 100644
> > --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> > +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> > @@ -10,9 +10,6 @@ maintainers:
> >    - Courtney Cavin <courtney.cavin@sonymobile.com>
> >    - Vinod Koul <vkoul@kernel.org>
> >  
> > -allOf:
> > -  - $ref: input.yaml#
> > -
> >  properties:
> >    compatible:
> >      enum:
> > @@ -36,6 +33,11 @@ properties:
> >             pin should be configured for pull up.
> >      $ref: /schemas/types.yaml#/definitions/flag
> >  
> > +  wakeup-source:
> > +    description: |
> > +           Button can wake-up the system. Only applicable for 'resin',
> > +           'pwrkey' always wakes the system by default.
> 
> 
> I'll fix existing code, so don't repeat that style.

If you ack I can reformat on my side to match the patch you just sent.

Thanks.

-- 
Dmitry


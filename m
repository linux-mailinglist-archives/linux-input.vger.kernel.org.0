Return-Path: <linux-input+bounces-9088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A31A06DEF
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 07:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C56F47A2425
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 06:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22EB1632EF;
	Thu,  9 Jan 2025 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esdHq4FD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C225949C;
	Thu,  9 Jan 2025 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736402670; cv=none; b=Ilck3MPcBQKsT7aoYeMmv5RBVaBOqkX4laAnb9x+XXLPJUT6PzEroxJmrmrQLAGqWzwXbHl0wH46GOhV94dIu6hCGDE9rmYgY4mDnYMi+v2jiQ5eJJNJs3GP7XETBHsyJPMWJ7c+OQ5JVprnOzrAsXorpEsRmzYl0yAnd9Dp3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736402670; c=relaxed/simple;
	bh=nVg3zEaBC6FcqZTiH9+gkOCoGBqWxbC5xBa6U2KriQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkArGPBxxRk+E0AVss/zaMRam8O7dC2vcE2VDXfJamBY18IxUXBep/GzU1bq5+i0CUbhvIWPtaTHNsYpQOJbMR9TRyxuZxv2J8ESapn9FLBPxzJ7WE0C/k7cmdyb6KLp/QWnN5Roh1op3YpmeKIp7gmZNWvhG7oNP8D32FCLZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esdHq4FD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216426b0865so7766325ad.0;
        Wed, 08 Jan 2025 22:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736402668; x=1737007468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux7roB9eckSlaz2AmU2ncsvtwlL3uXNDE8irTROzKb8=;
        b=esdHq4FDfs3c1T9TaJpUs2pc0pyCV8W/4gc+I2aFFOKYk7od0SjPE11eDAN042NHNZ
         08oxoadoSkwnAuODO/IlzC7WENZLanfMKIzTSnOinL+FCQtS/zuuxdewlzmywjKVPorX
         P0Ly0+9sIbQWTwDStvckavKEUgkCA8Pf/9f1m5ojIHYOcHfMunpKP+F098c2YefzrjbU
         Nx9b0ClbjPlzWqPXo2Uv0cDEsKpaj8eHAsOzD0JsKAjxZ1wy3XXJvLp3CEdOb4nv9+hn
         0u+NrFzYtwcX5mJSSfcVAlfNeUUDrdTc5uDaTI13FNOW0knq/cMNVNe1zquDoqQVJ3zg
         RzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736402668; x=1737007468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux7roB9eckSlaz2AmU2ncsvtwlL3uXNDE8irTROzKb8=;
        b=nWzRT9FDI13iiR9CstuBw1AaNbYLQJLM0dohXFs0hcbxaXUYziNILDjhW3DxIOOYqB
         rUef4MSLSr7AWxB49zpYwR+jXw/o0pOul50cweJHkreKLiJQ7TaxIaJWkFo96DcOuKPl
         8WS78f+cvsIYAUm+MOXBANB1qI7iZRqq4z7W/dVVW2KUxqFakfQW98+4Lo9iKnlUdpQ0
         6oEslfdRPEY3fBeDXSmc5LJr22wLLwQ0JHo80hi4arv4L9iYROgFTJxVc66M1xdncZ7b
         7kcA0E+zpqU9geamSKA2A8vI2nJC0NhMunqY76c+YjUGommQ7xMKK9z4oOT/1c5Qj9DY
         Cjvw==
X-Forwarded-Encrypted: i=1; AJvYcCUUaREfEvkgpjl58WujIrSQcIsqmgiXiHcYtbW6WqmERewEtiDVNzcMDvCUGIhr1Y60+GvAy/HWF5AjIJM=@vger.kernel.org, AJvYcCWCORIWVCiQb/DngJMFkqUfpdKjLbLbd2hc5LZ6LNTFbCEUwd/gp4ytLB95Xxl2TNKuAZe7hsgzIkIBGh8T@vger.kernel.org, AJvYcCWp9gaTWEKzDusa3rGcDOmHytcVjQdRhu2r/5iIrSv2kQFb6y1DY1tyX+zQmggwuIq83K/GOQX1xeQG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EaX3y+cSPPL0//osRPKrubwXdWeKhVvpvxpYSXF296eXlVYw
	dHknsQKnbQjaq5PhksyDnNUDi1AkcLrakkW+bnxDwHjje+5n5rk4
X-Gm-Gg: ASbGncvxh/REsVkqP2MSs33NYzz6WFld4I6UYhmbsX2D/gq5gdzrC0XFBDwyKf6Yy5U
	fDFDagLCC2CDENqoG7tF0cxhTesDgZ9QcjMca99y21PkN0uxhcQsLdyyPFwpMvcj6k/UbLJjqtt
	S3DHye4gkD6zJrwEsAljpwjDCrBPIWu8FvZ50/PJNvQgUoDc/txcr2tkvjOJGzeviU70Vv+NJPP
	DQqtZatupMTlHDBZVGEclOKAeynfPF7poH+W4jxFBAdcwwHu1+XNnge
X-Google-Smtp-Source: AGHT+IHupHHa/c7ax8iA7M5uwfcqicJpuYdMnw+M6BqyXs62Om1D69+E/s6MVoDACISBiVTW3fZjyQ==
X-Received: by 2002:a05:6a21:8cc4:b0:1e1:9fef:e96a with SMTP id adf61e73a8af0-1e88cf7b937mr9065240637.6.1736402668307;
        Wed, 08 Jan 2025 22:04:28 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d200:de01:af7:7458])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fa328sm36121112b3a.134.2025.01.08.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 22:04:27 -0800 (PST)
Date: Wed, 8 Jan 2025 22:04:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z39m6JKPOuL7eikT@google.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-5-markus.burri@mt.com>
 <20250107192701.GA1329697-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107192701.GA1329697-robh@kernel.org>

On Tue, Jan 07, 2025 at 01:27:01PM -0600, Rob Herring wrote:
> On Tue, Jan 07, 2025 at 02:56:56PM +0100, Markus Burri wrote:
> > The property is implemented in the driver but not described in dt-bindings.
> > Add missing property 'gpio-activelow' to DT schema.
> > 
> > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > 
> > ---
> >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml          | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > index 75975a1..b10da65 100644
> > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > @@ -38,6 +38,9 @@ properties:
> >      type: boolean
> >      description: Do not enable autorepeat feature.
> >  
> > +  gpio-activelow:
> > +    type: boolean
> > +    description: The GPIOs are low active.
> 
> Ideally this should be defined correctly in the gpio properties. The 
> problem is that does a 0 flag value mean active high or I forgot to 
> define it. There's a similar issue in spi-controller.yaml. I *think* the 
> problem is better here since this is an active low boolean rather than 
> an active high boolean.
> 
> Of the users in the kernel tree, only 
> arch/arm/boot/dts/ti/omap/am335x-guardian.dts got this right.
> 
> So I think we should mark this deprecated and put a note to use GPIO 
> flags instead.

So is the proposal to force GPIO as active low if the property is
present and leave as is if it is missing? Because current driver
behavior is to force GPIOs as active high if the property is missing.

Also, what is the benefit from having property marked as deprecated vs
not documenting it in hopes that DTSes will fail validation and be
fixed?

Thanks.

-- 
Dmitry


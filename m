Return-Path: <linux-input+bounces-7882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62D9BD5B4
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 20:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6275B21F59
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 19:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F111EABDF;
	Tue,  5 Nov 2024 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4017n2G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E11E7C1F;
	Tue,  5 Nov 2024 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834078; cv=none; b=AiVMiPD8bMfd1FCCu9dPNmU1gfmU5olS7I+f9nW2/C3o/BWVH07RekJz0kVU0KsJ/F0q6hJ5aoJeY0Kh8lv80wbkawR10vusYgIak3FbK5YsMRIKJSW8cnauPnmXS13+drc3Ij8A8QGgZLBSBCJB00oxpg6M4ABXwLsowM/gbZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834078; c=relaxed/simple;
	bh=/YMjs/G3oj4S95f3EdJWESuBy72XqnpyIBFn+ojmm7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9P6PVN0w0iF0PP+Wokf8+oe38GWlhTzP+O0Jw5FpQmystiM/H/AyS16m2pAvHMHYfXSkE2hPcHl7dR7q6YDhLMqkukbFrRZ9HUogjDNgNkos21RECDPnBsUj7M5cFGdjh/0eLAMqPaOJZdxnKudinLKDxSb3+3+wAeZfqUYDXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4017n2G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c693b68f5so63186985ad.1;
        Tue, 05 Nov 2024 11:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730834076; x=1731438876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/POYcZsa+Y4sDY8gY0M0D+AyybCKFemXpKCFDMhhk+Q=;
        b=T4017n2GUCvQbnMkWr2Ci3rKoBuRzHTyY4yDyH0tBjBD3PuCJmf9VegvXHSwaL8kl6
         lFGaflg1fJ3o8IK0ChUr2nDqmi42yv75Mr8C2aAYpIiUMs/sbXYYuZzKBkwR/cbd9Tj0
         f9HU3IBnussVt6XG1FWBpvf2hswOmThbGMO457sopdg6KKYlDz95d/3Pww2UE+xrhNAt
         yYkhr6okRQDEEbTZhpJH6CJqAGYTlg1duHSeWGYKBCAftM08KMrmoIVeyeyOLEaN4I56
         upAXw+qLZKaQOezYAf/to3tBXtEQGUwOSuNJ5+VqDtnMHKhx3KetraQDNXtcZVnu+wwV
         mDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730834076; x=1731438876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/POYcZsa+Y4sDY8gY0M0D+AyybCKFemXpKCFDMhhk+Q=;
        b=A9lo7TgvQm/dsqV3boaZI+bF96idaiWcEEcLbJU2dGZsfVH/1QlK/4gIjcBXlGzb4u
         JwUvV6F6EUhoaiB9suNvYllZgPOgpLmBKYFgh7mmltvlmR9dxFivMXmMUcbHYukLBPSG
         q+paz/ezuAOvDETbW6ajBSFvXXdPQdMZRRjbDDbn4V6UounCDQLbK0+Z27mVWyURhZu7
         Bo9xukdZFDeHMqve7mUtLuQnb0arBv6+50FswuAcnQUZal8CbC13wqOTRlE1TsrdHXvn
         OfxwiRW45rUre5xfBm8pdJdvvMR3MR6LSIGdozlrEcvu2HPCuUNxrCoZxGOfgstjUcBf
         dtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1KhJCxLLLvu0gLkQv6chTdiio9TiLMLaR4iW8w54AhwA/IR7CJiPYRAGO+0A+wNK82pt45d1m+T1TCCsh@vger.kernel.org, AJvYcCWYTYbAqeA0F8Gmo/XZoic/K/N/klRY1qczhMv52WDkz52I9Yy8KF7e9USc1YeVpS5v1maHgiHtyKYv@vger.kernel.org, AJvYcCXAZBDSlPQqh+gn8YB0QPSRO924CJ7Ru+De1jL3FUXiJwQ43pea4szncPRIO6BM/lq7v1cza15sKCtxnaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kh76ffmtfgNjzoMfTfg7mPkKoHDhLjWgz57Sofz45AsCjdtb
	mR6Bbbqi9KxdIEsHrl+6q+CT2MFPaKonmzaz7EAMX1WxR6HcsnsE
X-Google-Smtp-Source: AGHT+IG0RIwiy5IluRTrH7x/Dm8Zl2S5emkG0OY5PKzt8ddd/HMYfIzoQ7ES3TBKcS3KpzvDNYEWgA==
X-Received: by 2002:a17:90b:2d8d:b0:2e2:cd79:ec06 with SMTP id 98e67ed59e1d1-2e93c18815cmr29399739a91.10.1730834075684;
        Tue, 05 Nov 2024 11:14:35 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:65d0:e6fa:350:5727])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm10210925a91.5.2024.11.05.11.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:14:35 -0800 (PST)
Date: Tue, 5 Nov 2024 11:14:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <ZypumDqlw2tdllG5@google.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-5-markus.burri@mt.com>
 <20241105-earpiece-swizzle-a3e36d50b9c6@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-earpiece-swizzle-a3e36d50b9c6@spud>

Hi Conor,

On Tue, Nov 05, 2024 at 06:22:36PM +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 02:03:19PM +0100, Markus Burri wrote:
> > Add missing property 'gpio-activelow' to DT schema.
> 
> What do you mean "missing property"? Why isn't it sufficient to mark the
> GPIOs as GPIO_ACTIVE_LOW in the various -gpios properties?

Unfortunately we do have "gpio-activelow" property already used in the
driver since 2012 when DT support was added to the driver. This patch
merely acknowledges that it is there.

If DT maintainers wish to adjust known DTSes and switch to proper
polarity annotation through gpio property I am all for it.

> 
> > 
> > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > ---
> >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml        | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > index 745652b..9ea66b3 100644
> > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > @@ -51,6 +51,11 @@ properties:
> >        (Legacy property supported: "linux,wakeup")
> >      default: false
> >  
> > +  gpio-activelow:
> > +    type: boolean
> > +    description: The GPIOs are low active.
> > +    default: false
> 
> What you want is a flag, not a boolean here btw. Flags you can check for
> the presence of, booleans you cannot.

The behavior is fixed. If the flag is true GPIO is assumed to be active
low, otherwise (and in the absence of the flag) GPIO is assumed to be
active high.

> 
> > +
> >    debounce-delay-ms:
> >      description: Debounce interval in milliseconds.
> >      default: 0
> > -- 
> > 2.39.5
> > 

Thanks.

-- 
Dmitry


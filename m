Return-Path: <linux-input+bounces-7763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A62289B5ABD
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 05:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33FE51F2387D
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 04:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E666193081;
	Wed, 30 Oct 2024 04:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK5jkAB7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AD8F58;
	Wed, 30 Oct 2024 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730262902; cv=none; b=u+2sYyuPWvZW2aHvSwMJxLRDLMuEkmovjNVL0UBymIvzx9azuO7vERVD27WVPtnpkFce5YAWgmvC76oZlb8HTbnk5V9HUXm1Uhn0UWX2iujSREcjXemTyqAZ10z9nKQ0B8SXGApymVXBxIZEIcTQFYm8RuXG0ALc4/FQSDylk44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730262902; c=relaxed/simple;
	bh=+EuhkwSDaDAWayoAOubmOujSXprEgb4QiD7JNkvz+MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSVkC/CvojkZkWh0WhMhOtaJsgREDgwZyNnPLmkK12o1HmC8Km17fZk9dBpsHCVoVCZUxwe+t6BIrOqAM2UIoHDFSoeL8nsHvn0FMOY1mSG4CsPZUF9O/aNjfmb4UE6Z/4YKVStDhzB4ZvRqzOMHDZkdMT/p2IoGkuuMjYdq/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK5jkAB7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso865229766b.3;
        Tue, 29 Oct 2024 21:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730262898; x=1730867698; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zm51Q8bH8xmiBrCSz//TF2AHJWoAEHVkksNlNZ7l7wg=;
        b=TK5jkAB7qhloqPHRvYnYNXMVaxt843Htn44K/8F9mVk3DJO1soH56wCz7bvYkVrqAy
         npc9FM2WYlkv5syXua/RqNrINU3VfGESHpbLZXx3klwXt4L+FbFr7s9O1Kw6EdmvwevH
         iVnena75SYqMSn+k3sPGfd/MSxFCjQ9ja+f2NXjcIKPJUKae9I3/mBEvMWu9sRhr+B1z
         0M1Fwm8Eb2bYnUdBx+GSXll6ghAxI9rVZaOboED2hW93kH7yEn6dxk2EOVENmOn4lFtp
         9VbsPXdhCJ/0QEl/MX+pt/2xSeyZtOlzP/MIQ41xrC14CwDmgQYIgEebRleOKQVErFe2
         Cp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730262898; x=1730867698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm51Q8bH8xmiBrCSz//TF2AHJWoAEHVkksNlNZ7l7wg=;
        b=YUxMVcu35RFOgv+tq6kGLxviB89RMxwB9FvngK+folDEyDa3Mxe+TFOq5VcYDCvx8I
         UzxeA6cuYHt3Gw9ohBvteFsBWKbmZv9fmeAMZjiTglxKGW+mLJTlm7qqRP7ZazwZkSbz
         Vd92Nbz7hnZ5Er9dj+53jW+a/yM3B/Zm1VVdQ0oblVPcw2mmQ5Tmwr28YPzw19HqlHQI
         ry2FZ7KNZtVKIR53d51J35bX+1tmRl6BaBRpWkPJdimcwlvsfJW5g1LkiGJ+ZsMF0pxp
         RFOav6gamAWAKkf9eXuX2IFoonT0RNdTNNMlAeDaCl5j1Qv0tCDBLy/0jTc4hHoHcCXc
         ylrw==
X-Forwarded-Encrypted: i=1; AJvYcCUdov/gEKfg7FMPrmuPiHlqcKzF81pf00KXmb9tGriVCi7mf7P3fT1/yaaQMhvMdgSH/9yooDrsww1F@vger.kernel.org, AJvYcCWBjW8N/6rwDBXLQfyBDLN5ycVvbKaxPxKdkB8D0Lm207j3ocOUoHN88kk1nF/LuKIbW8AUAH/lieS3adfz@vger.kernel.org, AJvYcCWOOO2jbwU9UUdTBwwZxsKUri7fwTCM9uRLRPJXG7+GtCRdCsey+cWBrb1fcN71qnUWGh1bI95WQ5wA1/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxWNS/u/CulYEmioIjnbYhFfGEKoI/MGjND2kElbETNbmJuFE
	0uf7pJhkD/jnmc225Mh3gwXTsjrRPST735GXfhWGMLrNVC22dpEl
X-Google-Smtp-Source: AGHT+IEvS0eoabyeQerrNjnEQ6XSEfClc3+BOk1PNBwVvFOgS1oYbBwT4YLdZvmHOpaCTVSgkXK5+A==
X-Received: by 2002:a17:906:4788:b0:a99:5ad9:b672 with SMTP id a640c23a62f3a-a9de5ca5eb1mr1312064466b.10.1730262898368;
        Tue, 29 Oct 2024 21:34:58 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1ef322ecsm526392366b.49.2024.10.29.21.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 21:34:57 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:34:49 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyG3aciw6OvqoFZ1@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>

Hi Doug,

On Fri, Oct 25, 2024 at 08:29:13AM -0700, Doug Anderson wrote:
> Charles,
> 
> On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - goodix,gt7986u-spi
> >
> > Compatible is already documented and nothing here explains why we should
> > spi variant.
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +
> > > +  goodix,hid-report-addr:
> >
> > I do not see this patch addressing previous review. Sending something
> > like this as v1 after long discussions also does not help.
> 
> Krzysztof is right that it's better to wait until we get consensus on
> the previous discussion before sending a new patch. I know you were
> just trying to help move things forward, but because of the way the
> email workflow works, sending a new version tends to fork the
> discussion into two threads and adds confusion.
> 
> I know Krzysztof and Rob have been silent during our recent
> discussion, but it's also a long discussion. I've been assuming that
> they will take some time to digest and reply in a little bit. If they
> didn't, IMO it would have been reasonable to explicitly ask them for
> feedback in the other thread after giving a bit of time.
> 
> As Krzysztof mentioned, if/when you send the "goodix,gt7986u-spi"
> bindings again you'd want to:
> 
> * Make sure it's marked as v2.
> 
> * Make sure any previous review feedback has been addressed. For
> instance, I think Krzysztof requested that you _remove_ the
> goodix,hid-report-addr from the bindings and hardcode this into the
> driver because every GT7986U will have the same hid-report-addr. I
> know that kinda got lost in the discussion but it still needs to be
> addressed or at least responded to. I guess there was at least one
> other comment about "additionalProperties" that you should look for
> and address.
> 
> * Make sure there's some type of version history after-the-cut. Tools
> like "patman" and "b4" can help with this.
> 
> * The commit message should proactively address concerns that came up
> during the review process. In this case if we go with
> "goodix,gt7986u-spi" the commit message would want to say something
> explaining _why_ the "-spi" suffix is appropriate here even though
> normally it wouldn't be. That will help anyone digging through
> history.
> 

I apologize for any confusion caused. As a newcomer, I am still learning
about the community practices.

Thank you very much for your patience and clear explanation. I will recheck
the previous review feedback and provide a new patch marked as v2.

Best regards,
Charles


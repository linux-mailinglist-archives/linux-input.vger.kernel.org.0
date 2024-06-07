Return-Path: <linux-input+bounces-4229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BCF900AFB
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D480B222BF
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16E9197501;
	Fri,  7 Jun 2024 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghhL+aS8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A18EC2;
	Fri,  7 Jun 2024 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717779943; cv=none; b=OXGePNo2DrOWAokjizbKUcArhHeuZw4/hVMsG+1nDkZ1ip4YzMWcTLFEZTiyLHxS7av/I/MjLPucpY1FRN+RXOKL2qE69U4ZaRu7cPci/OgEZ2GbcFjUWkHwBTXbd+qTIsIdDCjhTbzYh4bkxlwbdoTssVsbBf3ShjlBfqf7IjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717779943; c=relaxed/simple;
	bh=Am2/Z8lsAFupWmwCt+Zbzylg4sC7Q8nztArl9OEkYIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dodn23L/HaOU0ndnQ0nr2/cc70KFeXUclRxdQ1lsCDufrgSroc1QWNU4RG85b5QuqKOhHYaBOcWJpQ4u7fELNvihqDzrbPTFRsoK8uo6tkNJrYTX5uv5Ggn1rmWZe7uBJDJtOVaIeHe3qy81Bjl0f7311kZIYyaEe1lMBR5KaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghhL+aS8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f480624d10so22134785ad.1;
        Fri, 07 Jun 2024 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717779942; x=1718384742; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHj/K79H43xlfqHPi++1hQlZOi9fT45WBsM4gL6Ozy0=;
        b=ghhL+aS8IXZhsLPynxQktX6uYzp7PjIapkJAX5h79YASvoXD9Z4zTZbrE4N6vxdAtC
         3vwn+JLmfQCoPT2vxmDqKL1N7FfyPWHNemITB5MYv1m+jWbGf7ad9rZnOETYbnVfbhyx
         GkIh2rYRPzmUS2x0/fHEqY/smwGqRK1CbwfNSnEvojdAbq9P8QgC5+4pbnbqVcv737mw
         YQGzDceari/YdzZL32Yd6UEcx02WDRBMLn0cJYe6warMiSBAvAJebxNkOJU1AQMgRBEF
         UQycdlQoI8qq7Nzh3vG6M+JdMHU0Ddccmk6n9tEMAChMGy8C7z2BFlEv5xR+KMnP8Umx
         6tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717779942; x=1718384742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHj/K79H43xlfqHPi++1hQlZOi9fT45WBsM4gL6Ozy0=;
        b=NNih8cs1spb0uUiB12YXiHHJEbe/ASrrjBMaBLmva1plmgHdOvIxes5+CXqMqxOAsq
         9PtVRdIjwpP9JMcB4YE1bqX8vc9pXW8tlWdqiccxjUgegbG0xnyXSC2QiKJKSedAhlNs
         sf4gComjzPM/K1SLlwq0Ol73Lq+W+m+9+vp3yBQAPWMaCmnwZ49X4t7H8NY2WwtJ2WHU
         FzaYZsFIAteets4WoU2s5CZKL7gt+T+fXp5zn7ABksaUW7tP0AZ+k9aYOssyvwuSQH2P
         fsCX6ZrQ5lZq4ennEl6bSSr31OFvWJqG6acA4vtbu807d7BN/muPJH2GwsIvz8fSQroN
         CDPw==
X-Forwarded-Encrypted: i=1; AJvYcCX5gGgIR+FZz87apZTdIaV3JaHKKKPhvy3aEIFhvMSejUt8ekjbP8Iy/oRV9OtdwbGmHAcP+9kDS9rRBu/h1J+24ikpF1ZlRCqUrWLid8fuwkCZb4g/SXO0J6PCCV2ZpFsZwyQzYKePpNayC7zodyeVRlbYpCtrikULy7CK096923E2driT
X-Gm-Message-State: AOJu0YwaSHs6YefblYlnyIiHzDxfBhDqlXCLmZM63SLckcopsIWDs6lS
	zGf06fuONtSEzhlyT2H4Q4tl2XaNhyqb92Ipr/tKKE2ipmJrBuF6
X-Google-Smtp-Source: AGHT+IHXZ1fiScEjvfYMxnaznJDXzLlTLYXF9DRYPlV/e2tsfx6QSK86x/T2rx2f5e/Zm0ZKb5qdfQ==
X-Received: by 2002:a17:902:c952:b0:1f6:80e2:e448 with SMTP id d9443c01a7336-1f6d0398fadmr36477375ad.51.1717779941605;
        Fri, 07 Jun 2024 10:05:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76cc90sm36923965ad.84.2024.06.07.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:05:41 -0700 (PDT)
Date: Fri, 7 Jun 2024 10:05:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Kamel BOUHARA <kamel.bouhara@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v13 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
Message-ID: <ZmM94i98R-UMv30V@google.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
 <Zl5ZmYyntq7OJOvZ@google.com>
 <20240605124746.GA57733@tpx1.home>
 <7ca4a22f903313128de5c0f65a49b319@bootlin.com>
 <ZmIq9jmkZtEaGw19@google.com>
 <87bk4dfc7b.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bk4dfc7b.fsf@BLaptop.bootlin.com>

Hi Gregory,

On Fri, Jun 07, 2024 at 09:23:36AM +0200, Gregory CLEMENT wrote:
> Hello Dmitry,
> 
> > On Wed, Jun 05, 2024 at 03:48:20PM +0200, Kamel BOUHARA wrote:
> >> [...]
> >> 
> >> > > > +
> >> > > > +	error = devm_request_threaded_irq(dev, client->irq, NULL,
> >> > > > +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
> >> > > > +	if (error) {
> >> > > > +		dev_info(dev, "Request irq failed, falling back to polling mode");
> >> > > 
> >> > > I do not think you should fall back to polling mode if you fail to get
> >> > > interrupt. If it was not specified (client->irq) then I can see that
> >> > > we
> >> > > might want to fall back, but if the system configured for using
> >> > > interrupt and you can not get it you should bail out.
> >> > > 
> >> > 
> >> > Yes, clear, the polling mode can be decorrelated to the irq not provided
> >> > case.
> >> 
> >> Just to make sure I understood, is this what you propose ?
> >> 
> >> if (client->irq) {
> >>         error = devm_request_threaded_irq(...)
> >>         if (error) {
> >> 		dev_warn(dev, "failed to request IRQ\n");
> >> 		client->irq = 0;
> >>          }
> >> }
> >> 
> >> if(!client->irq) {
> >>     // setup polling stuff
> >>     ...
> >> }
> >
> > No, if you fail to acquire interrupt that was described in ACPI/DT it
> > should be treated as an error, like this:
> >
> > 	if (client->irq) {
> > 		error = devm_request_threaded_irq(...)
> > 		if (error)
> > 			return dev_err_probe(...);
> > 	} else {
> > 		.. set up polling ..
> > 	}
> >
> > This also makes sure that if interrupt controller is not ready and
> > requests probe deferral we will not end up with device in polling
> > mode.
> 
> In the case of probe deferral, I see the benefit of treating it as an
> error. However, in the other case, I find it better to fall back to
> polling mode with a big error message than just exiting in error. As a
> user, I think we prefer having a degraded feature over not having the
> feature at all.

No, this is not how the drivers work, we do not simply ignore errors and
hope for the best. If resources are described in platform definition (be
it ACPI or device tree) they need to be there and they need to work. It
is true for regulators and reset gpios (you do not ignore errors if you
fail to obtain a them in the hope that the device is operable), and you
should not ignore errors when trying to set up interrupt.

Thanks.

-- 
Dmitry


Return-Path: <linux-input+bounces-4186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B48FF6EB
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 23:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC78F1F22C6C
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3855F4595B;
	Thu,  6 Jun 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAld5+a/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E94FC02;
	Thu,  6 Jun 2024 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709564; cv=none; b=TpOuc14r3gIyC6DLyvEv267FopsdyuWD9UAi4Moo4CIvWpAwk5+zULjAGRoOYYYo7feB1laQ3nqsCELwLpzVc4dhPzmeKsLfis8XFfRARST8O1uESFWi45z83ihkdUyUrYtXwPq7UBl4LZNsy+cXIgLPxuPDtsKCRKyPElVdDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709564; c=relaxed/simple;
	bh=VyqqIvxELS07SY/UCZXKvm0fiKpJWcw9PEObBiG/th0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWzAz+K35Tpr26nm4PkLN3U3lYYOgxX/6ZaH9SPF/ADFBK9+KQrSwqNujhFqfnJ9eRiVZ7zlF6i1VykbTMdXLtaMFj90R+D90WFqkAKHlojlhExqkByytWc0lZN/8NnB4D8CwlCAkKFJwO1lins+L6mti7pi649gqWC8IvxtaIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAld5+a/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f4a0050b9aso12731665ad.2;
        Thu, 06 Jun 2024 14:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709562; x=1718314362; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oCJ+6h3oOdiBUp+f2OAuium5zQQWuoIn8eHud9GJWzg=;
        b=hAld5+a/XBTvnk8LRMJYLDf+8PDkcsJqRsZ8lC23r5QjDONVnQX4zRV43gA33rKsiy
         I+Dsn5jh/bOAZEF9B2QU3qY49NtgYoSrnw/z8gRzs7GQ2EkK43caqc915Jmh7wXAbSIL
         iGkXLT+DCVhK9Pk4uM4tjhW3HuTcxnvmlQFyh0CAYfzBQQOAoT0LoFJM1p3wbpW5IhsW
         q8KkOvJ0qA+ufbbqgpVZTsWmSpPxc35y2OBLb0UEIhba4CNonE9Atto6zwoYcXsGJcVv
         fQzq/lL97g0WDL0QGdjnRd7b9R7bLXx2ROAWXHCw8aBMR6xpGTpRQSd6UIwzQOGdqDtf
         6hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709562; x=1718314362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCJ+6h3oOdiBUp+f2OAuium5zQQWuoIn8eHud9GJWzg=;
        b=fUIunPDi2n0ebQBLTGiii9issdZmgFtuMbIaYpc16Ufj8lVml61ZaTXh0Q/THMAYtu
         GW2xnIKMPKIjDvUItAA9xqrpD8apwPw7SsRJJtj+VuGRSCyDGtbHjR44yGlb/AdaZtJ4
         N62lBSx5mrlPp2jvoEhOwcfEvHoUAJ4iTQVFxuXWdcQ1jrSwz9Cj2LPdfseMbDOxlri0
         nWMDldFZk/v3ufyMpVAA4tccT3at2RBc01lPSS3CaI0N261tDsutbGx6SwrdzzDbSo0G
         HPHFwtA4KXPjwJiA2RwBgnT64uJnPuAnfMPEHWF0pTFicF3WZ736xz3MkwDFAEZeDSeJ
         Ft+g==
X-Forwarded-Encrypted: i=1; AJvYcCU6O73CzJYxS4xzr2uElso3n5viOxkT8QpViZUipMOl6U70y34VP99kKuLeYDhVQXUTm/cOqWBjFJ94mxN9rvbVUC5BBkEObTi3V7Prlv0shTRoycu2adHZuGVEyKQvLIfjf+E8RSLTatwelgphWCZ+pHP6UaD66OWQBG8mkpgYUstv/wyW
X-Gm-Message-State: AOJu0YxsgsMVj8CBRWPqymLrOUv/xJD3uZ/7wZ/65RIZHbg7vzGRofaB
	Abkz62thNsDDVokF8Au164WMieLITu3jo3LZBoL07BIw4sVzA0wbNi0ROQ==
X-Google-Smtp-Source: AGHT+IHEDPgg5UbUeel1ZbrOc19j/l10c1qIO+cNiOqendzAFNoWoER2y0caJd6aHszt9OHGhAAkoA==
X-Received: by 2002:a17:902:ec90:b0:1f3:b55:e247 with SMTP id d9443c01a7336-1f6d03c1052mr6536285ad.55.1717709562007;
        Thu, 06 Jun 2024 14:32:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cdcb:6470:dec1:846c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e066dsm20024115ad.206.2024.06.06.14.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:32:41 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:32:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kamel BOUHARA <kamel.bouhara@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v13 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
Message-ID: <ZmIq9jmkZtEaGw19@google.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
 <Zl5ZmYyntq7OJOvZ@google.com>
 <20240605124746.GA57733@tpx1.home>
 <7ca4a22f903313128de5c0f65a49b319@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ca4a22f903313128de5c0f65a49b319@bootlin.com>

On Wed, Jun 05, 2024 at 03:48:20PM +0200, Kamel BOUHARA wrote:
> [...]
> 
> > > > +
> > > > +	error = devm_request_threaded_irq(dev, client->irq, NULL,
> > > > +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
> > > > +	if (error) {
> > > > +		dev_info(dev, "Request irq failed, falling back to polling mode");
> > > 
> > > I do not think you should fall back to polling mode if you fail to get
> > > interrupt. If it was not specified (client->irq) then I can see that
> > > we
> > > might want to fall back, but if the system configured for using
> > > interrupt and you can not get it you should bail out.
> > > 
> > 
> > Yes, clear, the polling mode can be decorrelated to the irq not provided
> > case.
> 
> Just to make sure I understood, is this what you propose ?
> 
> if (client->irq) {
>         error = devm_request_threaded_irq(...)
>         if (error) {
> 		dev_warn(dev, "failed to request IRQ\n");
> 		client->irq = 0;
>          }
> }
> 
> if(!client->irq) {
>     // setup polling stuff
>     ...
> }

No, if you fail to acquire interrupt that was described in ACPI/DT it
should be treated as an error, like this:

	if (client->irq) {
		error = devm_request_threaded_irq(...)
		if (error)
			return dev_err_probe(...);
	} else {
		.. set up polling ..
	}

This also makes sure that if interrupt controller is not ready and
requests probe deferral we will not end up with device in polling mode.

Thanks.

-- 
Dmitry


Return-Path: <linux-input+bounces-4402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C38E90C5D2
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D52828306B
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 10:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FC715B113;
	Tue, 18 Jun 2024 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grti8WhL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1415B0FA;
	Tue, 18 Jun 2024 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695632; cv=none; b=rqvN3Fz3xutEjH8AKIoKNhys3VJ5wfAKOF93gmuNw35UEHB+syOoNM5s7TzjgY/NnI0Yk8hCtJRL/220cFbxDHYzEgt8h6MbtgtsvRIrKeRXHOOypKtziIo+ibtYJkfaa7CEp+CSVkQOKf0hwK3NlVUakqDhYfUmzBxjPjNi1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695632; c=relaxed/simple;
	bh=iRjmF4W3MCyCCZaBe1RgE+WC2LYE8fIZlNIkr57SHTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjNHTZBmDL29jqItH3E4cHpnwpmPVZPPxCQZ+67G40pSO95yUs4I4qG88tpTS/cV9Kd1B8Tlm6+UFNdgnOCg0jABAkLp01BvqzvMFUMjyuBxpTsVm5Iq/4MCyYsaufhCTXsPbdCKtLMQz8/gOx/q3T/8iTvMz/CJXX0qZqaIGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grti8WhL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f64ecb1766so36856805ad.1;
        Tue, 18 Jun 2024 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718695629; x=1719300429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KnomKee444IxvA5fIMw/4SC/20gaSTbQakqZLbgW7qY=;
        b=Grti8WhLh9mGs5fbf9uT++nd4EEA5W5RfZEMMdoR3NHh144u0Uy245vTQBDdDXdJB+
         Srk/YQqyW0tH1NQImOzRLGq8RxlYAQ3M7yCbSCKYEQkf+r0p+Iw9NBVrQtxJ5d2UoYz/
         ngOkmNQj12V5PCeJCWL0WE/9XOVTjnAf6BNNYokG2Bcui6zXqKMtta1j/h0S7MuVQk4S
         q3aL6rMW8MOjozECehmlw/TVQ99amurrRs8m6BMLWuexBEdIkZ0/9po1UlIC+OaYt6CM
         IXS1t5ndwcWNkbO0oQLcLcKQNzAme8Kl+RXgWhLuya1b2SM231EReTuf6MABcGJPlbQB
         1+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718695629; x=1719300429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnomKee444IxvA5fIMw/4SC/20gaSTbQakqZLbgW7qY=;
        b=RAxIrhqvgFsBd9RJ1ceMIHbIbVIzpxhgKrh9/4KGj631kk11lM7zf0sszQoN3vJyvh
         OrdyEJ5c8Y1VCeDF9aMCUdq6CphtoHL/6rIU5ia0sKlYJGnIEFZvFiv7h49wDv3p7/ct
         3sastjHXXvdAFGdshQV1rM9wVukU75ZPInrQO9sKFzuoTwyBYrscRlOjPZAvhIkssxjk
         UaFldhYwH7ak5K1t4i1ob4J5EVl8bdr+rcoQBuV3ImysO3LU1FxIgedFjWdh73AqYMe8
         iVXEoNHVXqvaP3xp+SEHqgBMizEnKILEg/upuIvoz6FQjkaRH7QqrjZK+3MHh6jHndVZ
         gNpg==
X-Forwarded-Encrypted: i=1; AJvYcCUF4PgOSrIQ8dHgy6rJi8XaNl4nZXum3pXWgj9hUc25JodGsFHyStmrxtYRv21JvBbx4rATakeFcqzBoK/L6+jvM0P6fs6ldBhu1cg9Wl9J7KXaT8B9pqHWEhEo3qbmy/JG0VsWV/O2S2W/8GUiKYzzr1jT0fBA/VQQIXhL3YmZk+7LZVzz
X-Gm-Message-State: AOJu0Yy4wYaD+fAYuqgnPc85blWMDKkZPVh7TRnWg3G8D5LMh1VgG5fQ
	4Jt5Mxcy8ruPuhjywwAU+y2Yx8J6suVh9WBA5HS95Q/ZX8Ge1oBy
X-Google-Smtp-Source: AGHT+IFOHdsawk3a1oH1WO+9GISGpmZg1DJsrjPf8odb5ltVd36eKzsjZVlRHORq5DhXsvzycXO/IA==
X-Received: by 2002:a17:902:ce87:b0:1f7:3d0d:4cd with SMTP id d9443c01a7336-1f8625cf213mr127466945ad.24.1718695629167;
        Tue, 18 Jun 2024 00:27:09 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f98f901bebsm8562825ad.270.2024.06.18.00.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 00:27:08 -0700 (PDT)
Date: Tue, 18 Jun 2024 15:27:02 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org,
	dianders@chromium.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZnE2xjDk5uZM-NON@ux-UP-WHL01>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
 <20240614121538.236727-3-charles.goodix@gmail.com>
 <20240614-blah-sworn-1e13ec9c0e94@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-blah-sworn-1e13ec9c0e94@spud>

On Fri, Jun 14, 2024 at 04:27:52PM +0100, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 08:15:38PM +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> 
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u
> 
> > +  goodix,hid-report-addr:
> > +    description: the register address for retrieving HID report data.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> You're also missing an explanation anywhere in the patch for why this
> address varies between gt7986u devices.

Ack, I will add an explanation in the next commit.

The address variation between GT7986U devices is related to their firmware
versions. While we strive to maintain consistency, significant firmware
upgrades might necessitate changes to this address.

Charles

Thanks


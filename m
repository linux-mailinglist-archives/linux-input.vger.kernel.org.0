Return-Path: <linux-input+bounces-5593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714E953AB9
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 21:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B1FB20CA6
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 19:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095B978C9D;
	Thu, 15 Aug 2024 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrV7BBnf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E54AEEA;
	Thu, 15 Aug 2024 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749277; cv=none; b=rRW58q5IIPhm7t0f//NZrdtg4gqKr6/SLwTg4kZ9R2vvQGxcnFbkliiIh8RIc7IrfYwkC5DRXNPK0B1VZgt/geLetTq2Q2ZyNr9Eryfbmz9SkN9lk0OtY4HNdTheAr1CFzeIqbBVFBYsgFSe+CXSAxh0QbVF/aGMFxQfIPm470k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749277; c=relaxed/simple;
	bh=ZZ/G5UApgamR1bZhb2gVHjVkFTPdIRkoeKz9QdIpCek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIsEPxZgQAHJlp6GtYFxgjuNZJZkWYlrGeXRyInTwRitDgaYi/5rmfbl7sXG9Ls2Zxs7o6uVVubsjuFfw6c99HMiIe2p0Qxorw9vL6UnzLZn1PjpwwuieDrkA/wYeEV1kOPpXJ88mKgY82tNMIoIIEgPfagN6Ud5+gbJWdmkkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrV7BBnf; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6bce380eb96so873160a12.0;
        Thu, 15 Aug 2024 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723749276; x=1724354076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7WMncMgmKEb+KbsAwgAmYN6PSSe41pQsIcx1ldX02Q=;
        b=FrV7BBnfl2s+3P+srv1C2px10lhwWn23KhcViQVIlsvZphKi6qJsJtRRWnZNuMBXMT
         I7BYvyNiK9f0FEdAU2QTZ2DcIG29WFy3x3wrAyah6hU4d0dSgBWihtFTCcMYInclWJzF
         MZyeyDuu06oQxxNpXdf4Np57Dtyo1zANF9v7ozunCBc0pDvm5XHhg8EF+EZQBPyDjCNG
         pMQdq8fkdHlTjfLp5u+6NIpKvpjwx8CPrVLEDy7nn82Hiqh+0aWT7CsWdvNy3ugvqKK4
         qUEQ2MFVVj5Hxu48rKxqt2b0lFa/fIbjI7tnrNK1Kh6SP0EoNM1SsumyYchqQx+GTdS7
         Nhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723749276; x=1724354076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7WMncMgmKEb+KbsAwgAmYN6PSSe41pQsIcx1ldX02Q=;
        b=buneI50aG2DTbpWC5hpDyrkBJtyUkz51k/Wz+wx/IquRt7dF6rY+8taMcqF4dzgkCq
         r/nBz/1MwO3FlO6fU7gz/H6+GkD5nWCYiH7+TUELxWloK4naNhz0jCStcJFqjHS9J42H
         le7+REBDsok3/pcKjUo0nUPSz2Z6ZEJUH70/Isx20hUszmn8bosOJ8908uj2JEhDY9mJ
         LITFbwBf4FwQyawUVm+G06iW16CX6tdtOBElRHkGagQpbpy4n5/IX+tMgySKH4HL4jta
         HwYA+y6/jgaH+fwahTvKx3FB+fYOEoJ+u16Xnx7bXKfiertgN4aUfcB9AHHXbbKGZZbZ
         hflw==
X-Forwarded-Encrypted: i=1; AJvYcCVB6lhDrFz6yj1K4wJMcqOaLKy1oc8mz9aZDkrTUcGd44OlnyANTq+9UiI6mUCNlkm7dI59mcTSMTHsxUC6Rqhu7pbDTj2oJU0fwV/sGymUn9DBqhU8h0XNhFfJhUZGLIsuFB3KhK8BNzTVGrlIqVfbeP3NgLMRlz7do93wK7SpCD/5W38d
X-Gm-Message-State: AOJu0Yz0JwVdHaWM7YPjVWWQrGmongto4e8t+k0sIenkxxj9fYEwvBJm
	CxbLa14NKmi0Ow3IVpg7Tt279Ok2e5MWplBDb7B+KrVWf2lh/YM+
X-Google-Smtp-Source: AGHT+IGcVeNgkntbw2cZPknkiVRzDRUVnj2hzr5w9yADfwCWLixg2lLFoSq+Drgxr9JvKyFlLM6+Dg==
X-Received: by 2002:a17:90a:8a02:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2d3e03e89dcmr771031a91.39.1723749275678;
        Thu, 15 Aug 2024 12:14:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7ca35fsm3968643a91.9.2024.08.15.12.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 12:14:35 -0700 (PDT)
Date: Thu, 15 Aug 2024 12:14:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <Zr5TmAkd67XcyYvJ@google.com>
References: <20240815161413.4182796-1-Frank.Li@nxp.com>
 <5864cdcf-a1f2-45a6-a034-a05315402663@denx.de>
 <Zr5RwL5qRVBKbHcc@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr5RwL5qRVBKbHcc@lizhi-Precision-Tower-5810>

On Thu, Aug 15, 2024 at 03:06:40PM -0400, Frank Li wrote:
> On Thu, Aug 15, 2024 at 08:44:56PM +0200, Marek Vasut wrote:
> > On 8/15/24 6:14 PM, Frank Li wrote:
> >
> > [...]
> >
> > > +  ti,debounce-max:
> > > +    deprecated: true
> > > +    $ref: /schemas/types.yaml#/definitions/uint16
> > > +    description: Max number of additional readings per sample (u16).
> >
> > Could you drop the (u16) which is already part of the $ref'd type ?
> 
> Sorry, I forget it.
> 
> >
> > [...]
> >
> > > +  ti,x-max:
> > > +    deprecated: true
> > > +    $ref: /schemas/types.yaml#/definitions/uint16
> > > +    description: Maximum value on the X axis (u16).
> > > +
> > > +  ti,x-min:
> >
> > Is this deprecated too, the same way as x-max above is deprecated ?
> 
> I am not sure. I guest x-min and y-min is still useful becasue it may
> indicate invalidated touch. but x-max and y-max should not usefull because
> max value should be Vcc.  x-min and y-min help filter out some noise.

There are standard properties touchscreen-min-x and touchscreen-min-y
that will be used if present, so I think ti,x-min can also be marked as
deprecated.

Thanks.

-- 
Dmitry


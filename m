Return-Path: <linux-input+bounces-5676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8549571D8
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 19:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C0D283933
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29185189BBB;
	Mon, 19 Aug 2024 17:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzQ+zbk7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AC189BA1;
	Mon, 19 Aug 2024 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087671; cv=none; b=P8aae0hZQo1Et2qu6Lq1oc9xL//rMzj+UUUDd/OPJaxMzibpDIIqOmnQD9WsQiuX+h0pzMZSMHsJr8AubonXzlueaRE3SeS25p5oGj9jL73GCdgdKqm3/mKcjTUhauhBTGyjZNis1KxvYH88EGfCAL+fQ8yM9wjJGYQv6eqyuhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087671; c=relaxed/simple;
	bh=GVD02NQubyS0tdG5zYO8erIAmlqeCCAzjJYLVCvYX3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJDFwgvuduB8E/1JYW0ebQ5G0C49w/cI4f4gIzIqa04QzKVJghtyucgkaSI4BYiwuzrOeacuKbQUMbdDDqeLIm+Fjjz53I3jraiLioFAaVWUt3UU8XGuiRGe0cNSiapmxhbRfsIJ7cNz/8Q0s0RS681e6Mq8ewdXFC5KzW1wUvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzQ+zbk7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201f2b7fe0dso29326455ad.1;
        Mon, 19 Aug 2024 10:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724087669; x=1724692469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+1W3i8+g2sQNzk6r7xamyZJgO74Cx+unIizekLB9TE=;
        b=LzQ+zbk7P2by+8NnmBElxU5qHX1mVm6SzKqnORXDToAPY9XIX8jmmxs2eXJDw2FTh5
         /yMZ46lNvvO4A90aAvQjH+WWuxfOWi4ucokD3PH9aiy0qvpdh4/xTEJNlS8lk3b5u76G
         HOkVT3XwlWauiyslMCia+6eiuVvB34KmjVz7lmE478CkpQEMT9C7igeFNvNXi2ZQdPED
         xU9RP54ECRT8CHpnwVPWhXsJfHQnh0Qq2Nn6XbbzfqpFKt+RNFO6sQCjYRlhjH1ebva/
         zxfSqq+9z2fgq2nv2WQk5V5WPLB8hgepAKWuyo1jjxduQ7vHPmuvFWKLM4mQIDWb4JrI
         waSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087669; x=1724692469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+1W3i8+g2sQNzk6r7xamyZJgO74Cx+unIizekLB9TE=;
        b=XuByH4Dn3G+lC7z62jAjYvgPX99+iUER/5ZRPr42UUZizxpP9cyHITj7QcUSK+DQbz
         Q0ladsqVRNHzsw6CKFjg6j4aOkChLCIumpZ2c/ikA2e/X1O6sxvVtM1gBxRPyL8DItp8
         Kg1Lhs+jNkOJYyrdwuVVS1U0dbGIH9m8rxgSQ4gtOSisr2KwYiivbgo0GzUtvom1820r
         TtX3tSKjJqI+5v+z7h+vG3BHeS3rX9KJGQemA+X5WSCwz9w6IdEvgibMY6G7WRTFrnwy
         dX8xMWanG2AK9d3DfQngpIODxz/dv410SLZEuwI8h023DWUW4vOdFFvGa3IQ/p3Vp3u7
         yGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA9VCj7s2m7F1kQtyxJjmIEGSDmLNZfv9T2yjR1qlAhG+dKvn6Nl4t2OvQDoQwLGyEsLptm55dyLWLNO39EDVN0c72Q6QWIQ8PCo+21EC8mOjJz/pch+g3SL+3DXRrBpQiQX/GsI9LexISP3aDhvojWVP76uZImmxgyxfdVKN/pNC3eWq1Tc0mnYrIHgcPqcehGWnYVxDfWCRk1NkC18usM8ZXSwTDe0E=
X-Gm-Message-State: AOJu0YyAD7ZCHgAa+RyScLBOYrU8RkGgtdOo6mAD13f28bi4x2vQljf1
	Hp0pJMQmJVkgHgUdPc/KuFQjLbvtLHtcFXoP08+djEKNAU6PtYgh
X-Google-Smtp-Source: AGHT+IGbr2onx4ALkUToG2oYkiUzveBUM0PwKcKZAeoti+0kD3JnIpr3+bOL7x2PCFhQQkIUjj3OUg==
X-Received: by 2002:a17:902:e84b:b0:202:18de:b419 with SMTP id d9443c01a7336-20218deb7a8mr81679975ad.63.1724087668636;
        Mon, 19 Aug 2024 10:14:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202592bdf7fsm6166015ad.181.2024.08.19.10.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:14:28 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:14:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 09/14] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Message-ID: <ZsN9cXx2eoGP8ugW@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-10-dmitry.torokhov@gmail.com>
 <dbs44pwxfhsnmdzsd32mp7rlhq6w5fanu5bakuisxmyz2ehbtd@cdfr26oicjll>
 <ZsNpdhKlLYegkosN@google.com>
 <20240819-backstab-fanatic-54788c691f9c@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-backstab-fanatic-54788c691f9c@spud>

On Mon, Aug 19, 2024 at 05:48:06PM +0100, Conor Dooley wrote:
> On Mon, Aug 19, 2024 at 08:49:10AM -0700, Dmitry Torokhov wrote:
> > On Mon, Aug 19, 2024 at 03:02:07PM +0200, Krzysztof Kozlowski wrote:
> > > On Sun, Aug 18, 2024 at 09:58:06PM -0700, Dmitry Torokhov wrote:
> 
> > > 
> > > > +      - keypad,num-columns
> > > > +      - keypad,num-rows
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > >    - interrupts
> > > > -  - samsung,keypad-num-columns
> > > > -  - samsung,keypad-num-rows
> > > > +
> > > > +if:
> > > 
> > > put allOf: here and this within allOf, so you the "if" could grow in the
> > > future.
> > 
> > Hmm, there is already "allOf" at the beginning of the file, so adding
> > another one results in complaints about duplicate "allOf". I can move it
> > all to the top, like this:
> > 
> > allOf:
> >   - $ref: input.yaml#
> >   - $ref: matrix-keymap.yaml#
> >   - if:
> >       required:
> >         - linux,keymap
> >     then:
> >       properties:
> >         samsung,keypad-num-columns: false
> >         samsung,keypad-num-rows: false
> >       patternProperties:
> >         '^key-[0-9a-z]+$': false
> >     else:
> >       properties:
> >         keypad,num-columns: false
> >         keypad,num-rows: false
> >       required:
> >         - samsung,keypad-num-columns
> >         - samsung,keypad-num-rows
> > 
> > Is this OK? I don't quite like that "tweaks" are listed before main
> > body of properties.
> 
> The normal thing to do is to put the allOf at the end, not the start, in
> cases like this, for the reason you mention.

I see, thanks. It would be nice if it could combine several "allOf"s
into one internally.

Thanks.

-- 
Dmitry


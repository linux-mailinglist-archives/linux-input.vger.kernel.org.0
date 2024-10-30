Return-Path: <linux-input+bounces-7765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F19B5C17
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 07:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B011F23F5B
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 06:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B11DA617;
	Wed, 30 Oct 2024 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUdUB5M5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B221865E0;
	Wed, 30 Oct 2024 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271439; cv=none; b=NfAeLxSxNa7dv1t/MxOLdM+2VW9slbW4Fz6ilDMncKtwF1p3DFSkULheqBjKS7yMTIXAVrQv9+YB41ycYjPiAlIYavBcPYoRd7jbWHfCRPW8WaUgZk9lWhjl13zTMrgWuaUK6J6bSO2x9+PdiOfFX/xugGOzRMhQ/K8WPMefi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271439; c=relaxed/simple;
	bh=LKGwHh0BFEdIgbVWglg/WXDn9wwNB2S1krhabVnAQ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrOQfS0EuKzqPzWKiEaTqCHXEOLrGDi4BN8BSmJ5KfzyFjnOp/067S0JBXzJMrwnSeZfEy4J04A+4ea4xxhuo6WSpOCGp/eIJQNRi66QafEMLCqR1MR+wUx7a8KfwrsRD3dcI3safK6FGznim84aWZfg4zYsefz6APsWTLsgoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUdUB5M5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso12306451a12.3;
        Tue, 29 Oct 2024 23:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730271436; x=1730876236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uUm0aeOry/s+B1yaF21vBZ5QgCEzbZhQViRgGI83yM=;
        b=KUdUB5M5kordIP5iZOzdcH3ju21IJtz7WMkSHX4nELkSqP+cyRXyaubxKTvsKu7Yp6
         y4BYpDRWy8UuqFdjiU3lx9hSgV1nWEwbo1AXZ2d8rXnnWSOomu4jOxxnyYorYOl51ZiH
         2r+5k+22yLPhOfhmNoIjchIsox2Pa22x/r54Irf/7fYYcGhU6ONUAafDzx3OYl/HJxnO
         kBuKQzGxy0TdEozSt2wkkIzNkxnbRCJyDxuRr9S2A+Vn7RjbT7W1BGmiak/v6qFMkCpU
         zLWNPcs72vrZxmRCLzJAgMJnEHVNnA6w1zPmC7TlwKIcWkLXPNuvnuXLEfQD9B5qn2JI
         USnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271436; x=1730876236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uUm0aeOry/s+B1yaF21vBZ5QgCEzbZhQViRgGI83yM=;
        b=IAhrb8JPGV4FA3tkgnyIOkh36F2bTlGNSTJIFpjbUV8Lf7XBcb24CEUbjlQyWOx4YU
         NO1v8hoBvN3OgVOqfr76x0e16MSG+p6Us5rZadwS4LAFPp09oN7yRndKyc8jwHmSVH2O
         OkA7EsBa5bLy0G2a3jrVHeBtVnMgBJw5LAAWMahHz/6BJHpgN69q1oOfFNwhubUp6Stt
         G4ne2Epny0TfNfsILCjDaZDA1EKNhK2d0ubF6aEpF+ZAy1+r2/H6z0wrbjqqiZnDmFOP
         /qb5CnwfVzTzZXvsshrKf3n5ZhpwAQAXE1/2oTRzKNSI2KONbSuYP4loI4KwLlS+yFcn
         +aqA==
X-Forwarded-Encrypted: i=1; AJvYcCUnVGjcvirvEUCaCrRX5ebDl8Cqjaa3JXJ6iTDeSMPt1H+EqS8e6S1MvFsviesyU3+HdBrZ/J8m8/ecPoxH@vger.kernel.org, AJvYcCX93QsBW0vRoY9VCbg1t/CbOv/Z7cXLdVqxUqItMTPuANilPRLM2BUVOsKAJmL7CVOWZUVufEVbTbUm@vger.kernel.org, AJvYcCXUOAW2vkN+/+vErfuDfP/DuEjG46bhO5o1OaPG7m7hEqksFVmHxm3oofXYM4SWS3xOH/yeWnwWoyUaWF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuoRUxoUPLO9/wNtgi7tN9kLjZppwrmAKDLo4mJgCTDCzxiv1
	zdKgqUTqin2i52QVShR0xMKOOwX3AWTwSYyWtdbEgIv9yXHqVzBI
X-Google-Smtp-Source: AGHT+IEspBs33RogwkJx37UgWAkcoVEx/D0maB02IAVcNSTs16SJxZeo5MNVrvQBVAlV5LHRyzbH5w==
X-Received: by 2002:a17:907:1c24:b0:a9a:7f84:940b with SMTP id a640c23a62f3a-a9de5c91b71mr1178124866b.10.1730271435595;
        Tue, 29 Oct 2024 23:57:15 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f02706asm536290566b.47.2024.10.29.23.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:57:15 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:57:07 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyHYw40duPrm0ZeF@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>

On Fri, Oct 25, 2024 at 09:19:14AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 25, 2024 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Charles,
> > >
> > > On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - goodix,gt7986u-spi
> > > >
> > > > Compatible is already documented and nothing here explains why we should
> > > > spi variant.
> > > >
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  goodix,hid-report-addr:
> > > >
> > > > I do not see this patch addressing previous review. Sending something
> > > > like this as v1 after long discussions also does not help.
> > >
> > > Krzysztof is right that it's better to wait until we get consensus on
> > > the previous discussion before sending a new patch. I know you were
> > > just trying to help move things forward, but because of the way the
> > > email workflow works, sending a new version tends to fork the
> > > discussion into two threads and adds confusion.
> > >
> > > I know Krzysztof and Rob have been silent during our recent
> > > discussion, but it's also a long discussion. I've been assuming that
> > > they will take some time to digest and reply in a little bit. If they
> > > didn't, IMO it would have been reasonable to explicitly ask them for
> > > feedback in the other thread after giving a bit of time.
> >
> > If the firmware creates fundamentally different interfaces, then
> > different compatibles makes sense. If the same driver handles both bus
> > interfaces, then 1 compatible should be fine. The addition of '-spi'
> > to the compatible doesn't give any indication of a different
> > programming model. I wouldn't care except for folks who will see it
> > and just copy it when their only difference is the bus interface and
> > we get to have the same discussion all over again. So if appending
> > '-spi' is the only thing you can come up with, make it abundantly
> > clear so that others don't blindly copy it. The commit msg is useful
> > for convincing us, but not for that purpose.
> 
> OK, makes sense. Charles: Can you think of any better description for
> this interface than "goodix,gt7986u-spi"? I suppose you could make it
> super obvious that it's running different firmware with
> "goodix,gt7986u-spifw" and maybe that would be a little better.
> 
> I think what Rob is asking for to make it super obvious is that in the
> "description" of the binding you mention that in this case we're
> running a substantially different firmware than GT7986U touchscreens
> represented by the "goodix,gt7986u" binding and thus is considered a
> distinct device.
> 
> At this point, IMO you could wait until Monday in case Krzysztof wants
> to add his $0.02 worth and then you could send a "v2" patch addressing
> the comments so far, though of course you could continue to reply to
> this thread if you have further questions / comments.
> 

Thank you for your explanation, I understand your point. I want to clarify
that the gt7986u-spi and gt7986u indeed use two entirely different drivers
and two distinct firmware.

Using "goodix,gt7986u-spi" could indeed cause confusion. How about modifying
it to "goodix,gt7986u-losto" by adding a special code?

Additionally, I would like to confirm: when submitting the v2 patch, should
it be based on this thread or the previous discussion thread?

Best regards,
Charles
 


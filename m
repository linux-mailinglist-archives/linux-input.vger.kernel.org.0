Return-Path: <linux-input+bounces-6832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F51988BC7
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 23:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E58081F22387
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 21:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B861C2DB4;
	Fri, 27 Sep 2024 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PybVDUNb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25F14D43D;
	Fri, 27 Sep 2024 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727472461; cv=none; b=P+c2mBhQLUUVyLlITQDR/7w5x/UFkIe3AONIOgOi50DaAmBdRRO4mNCupZouEYxSic/VOReENpHhSEC8oej4TOGmswte8fqn3GOg+pPE7U6iDCmCZmNjVN3du2K+Mroda37okutZNLodJYOpAgg5mtuwv+SB24lNy8tZhA8wGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727472461; c=relaxed/simple;
	bh=A6JwDQyStfbZ8YKe6c3lmvls0MT5nqpf+QyiQ/YQVWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOSsBfB21l5IhH/tbP3R0+Ct+jNyP8peNBPa0sttC0TDp09X5JqCbUq74nHRSQ1LTN4dPlWOzR8aAbmD+LMIZrVm9lo55fgWvejaIl5NaxyIu3qmdv14bu1fUn8m9rLOIr9AQby3jaA+kCBg7wzzI00UM0sDzJisQwUpY8jhfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PybVDUNb; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso2110923a12.1;
        Fri, 27 Sep 2024 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727472459; x=1728077259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hx89B/g5+oNMFTKqxyiWc+QFxNAh6k+TaxFItoQfhVo=;
        b=PybVDUNbhIsSncuAzm9o5J7RzRzpYOBq7IcXScWUlB7/PNYPje+nJdTTHpxtjO2O1J
         d2jzvbuneZO0m3S4YA8OCcS+j1QTI+0FiCwhd5qWgN1YlIGEVPymuSJg/QlqQmkwQJak
         fps0G/TEF7FXHanNhgNAONDEHR1GDa2qatbcGKypy6ZNdzWRpfGbEXdy0WRQ5JDOtNSt
         1t7uxENaLkhkf+ka7D8JB1l8o/RXMPbAJXuX8VtSUIZ9xqKjKvnNCV9tq4LOEqk4Hvib
         ILAPPTo/NPX835UXsDb7g1kOj9pUvy1PPbIozHhRhONQt7Z6qT8FxJGq2kOlD/gw8OAD
         mrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727472459; x=1728077259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx89B/g5+oNMFTKqxyiWc+QFxNAh6k+TaxFItoQfhVo=;
        b=UGPUMWZ07FoaHWSUP+cPEnVjX4VQtydr3IWCs1sjGKzLsjYtz3AFCfoZFkC77DugvM
         K9o25g9dRdF4Go3H16laeYMWasGADQbRkfzqv80ZaFRiNeP0PwVnsPZ1dveinZm4xUcw
         8HWK4XbEgBNXmEI3mlnpNWtetIkiLzB7mGBOqFYuI9j+EIi5gx7fl4MM1Rgr7BQLXE4H
         b+JFpn5ezd4OWqkHbWpGXVn8sPUuTf+EHEThIzVTdGgGdArtoEtAV9oX+sL3iuzQ4vK5
         GxxyBQbx/oxFqnbKzbYu/bDfpMVr6MCJwxWHPYXYZMxlELC0OaXGN+bwccd4/0A5c4Io
         4CQA==
X-Forwarded-Encrypted: i=1; AJvYcCV1scOZHjL/L+0seUUCtDDwjD7QVC/Q5Nrs3eieO2vG5so32roS9gjVZ+H6e7SwbGcdzI2O3jbuz9nP@vger.kernel.org, AJvYcCVDcS+kDBfg7tV0vtJwyMO1Q/rHwfsiEwOZaTBi+hmz5cx6OPaDISpjftAgvGfw3/CMVdNgY8+IbDpyFPo=@vger.kernel.org, AJvYcCVI31qfxDMZkVcq4FC4nrOSL6dM7jWtHWfhERNJo+AWxtNXG6DmTRBvjNVradMOfQR00wyhsz2e0MK2fYoUsD+Bzec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVco7YQ8xrxNU8Fz7mveSD7L8rYLQCb0Mg3OQgHZYKOebOlpNY
	yXu1v/Cg6S7tFIxl9ZTvuPnWCxVMSO57mwEl9Gd/2QhEFleSVcFd
X-Google-Smtp-Source: AGHT+IGWcjFhe4aU6nFhQtEGGyjIrD7fr+owrnBxR0hZrhfofOMXTCR9pxQf+0wywbYB32+rqbX4aw==
X-Received: by 2002:a05:6a21:a24c:b0:1cf:3201:c3ad with SMTP id adf61e73a8af0-1d4fa7b56a1mr7288329637.49.1727472459307;
        Fri, 27 Sep 2024 14:27:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dbce:5230:fa9a:bfd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5ed338sm2046723a12.67.2024.09.27.14.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:27:38 -0700 (PDT)
Date: Fri, 27 Sep 2024 14:27:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: gpio-keys: allow generic
 'interrupt-parent' for subnodes
Message-ID: <ZvcjSJIMsrRNQT_t@google.com>
References: <20240927081757.7022-2-wsa+renesas@sang-engineering.com>
 <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>

On Fri, Sep 27, 2024 at 10:30:12AM +0200, Krzysztof Kozlowski wrote:
> On 27/09/2024 10:15, Wolfram Sang wrote:
> > Allow interrupt-parent in the main node, so it can be inherited to all
> > subnodes. This is more compact and less error-prone.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > 
> > It would fix dtbs_check for arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> > and would simplify arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts.
> > 
> > Plus, it is the behaviour I would expect.
> > 
> >  Documentation/devicetree/bindings/input/gpio-keys.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
> > index cc78c2152921..8fc331e01f7e 100644
> > --- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
> > +++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
> > @@ -15,6 +15,9 @@ properties:
> >        - gpio-keys
> >        - gpio-keys-polled
> >  
> > +  interrupt-parent:
> > +    description: Common interrupt parent for the following subnodes
> 
> That's a bit against DT spec:
> 
> "Nodes that represent interrupt-generating devices contain an
> interrupt-parent property..."
> 
> but gpio-keys node you marked as interrupt-parent does not generate
> interrupts, so I do not think this is correct.

I think this can be read multiple ways. The device here is gpio-keys and
interrupt-parent would be attached to that node. Children nodes do not
represent individual devices, they just a convenient abstraction to
describe the hardware.

Thanks.

-- 
Dmitry


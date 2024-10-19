Return-Path: <linux-input+bounces-7553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B985B9A4B07
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 04:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 533BDB22CB0
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 02:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222A51CF2AA;
	Sat, 19 Oct 2024 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3JxgK2h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A61CF29D;
	Sat, 19 Oct 2024 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729306575; cv=none; b=X6LWA/0FtWSFhmYdnHM6FQCzS0PKSj43Kgsuu1yd4vLBj2IrFnKAy6VflC4cdrtrwJKCqDWYPnidkO7lgy51W+QHphoURx0y/99QhkQbcON+dREfzXOrf+NCarE128rNXuDr1A9WA3KU40O9dWQxzE2OIDHNNXnUat1heDRmXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729306575; c=relaxed/simple;
	bh=nTS034SYwHdOV6HK3jk24gldUiLShQrlRT+Tbt5bLt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O06U5zi8rqlW7BnXPAxU3AY4bY3xqqJMI1kTdzeYD1dBjKoELfEMXeD61R3p+9ES5pBLmyHLvLm6SESG4AZqnhUCchSEGIbyeXsnFtUPXvhzy4Csw2BfQzafUU/JejFcNCDFnKFTR2t0ZUFUujsZsyUD+fztkogzAwTRfbFw574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3JxgK2h; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c803787abso21764135ad.0;
        Fri, 18 Oct 2024 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729306572; x=1729911372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LR/qVJWm69xL37u/FTFJ4b/eyl6G3SttNK/YN7uXhfQ=;
        b=K3JxgK2hFaqhh0XTCmxv0mgk/DUOuhBt2iEst9b9Bddqa4PcoqKxksGJ8r7p6MEg2P
         /Vxgh2k/D+Z2Eefrr9whWZ9HNVpaqdsg0trwSzrrCmGzFxFopSAP4FfkdwtutmPS2cSr
         HSDCrw+LhYsTLGlAMwW5M6qnB2qJuTiRI8DMNI5CYZMnPQmIu2q9YCHtC8iw/RNEUbsY
         JumqU9a8VgxDhVC6jfVX1j7xl2rITPsruHhc8Srcax1IotNuD85t0UnccIZwiXkMHY6c
         5oE+tSpZANPETN0xllTv1HpVKGUXJwqhP3+XK++QNy4EVLpPuN9ZUhgrMxVtGyOpzUy4
         M6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729306572; x=1729911372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR/qVJWm69xL37u/FTFJ4b/eyl6G3SttNK/YN7uXhfQ=;
        b=Gi3BekZC7zA7MUVwNT8JK/f0+g5naF8WdnNc7CaSMd5K4xPCTT5I7U5u7BUchW3oBo
         1CmRmrSmLAsAxbnAnnKEuDovP6YoLW/2mFYnSHOamJFWzYy7Y7NjoWe5TEHnC0hDhOxr
         /P/dGnU5wmAI8uxoN9VeXMws/Y2P6VSdFe/ox+rNQxeF+619JVMdj6gRMcBdliIrz9s2
         jeX+HLha0DfznsGpv0/IUUrTo9CM0E0ZyGbdQnn1gpORgyGISRydtg3EkJtf8sb66iGX
         SysE4OGBoQok/1V9WLWSOqkTSJxBOkYVVV+eCgVhSh+g4TpQKdYaml28GOtMm4jdpJ4T
         y9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUUEXivpDKNuQb5sSt6CAAmXFKYns8kx5yLF64BAMssIZd2wF50ZzYqPyFRG0Yms2ddzV9mxb9pkF4I@vger.kernel.org, AJvYcCW8lExBDSvk0mfM2L7sEGjyxySpieiglLDyBDEB1mWgzBjkFW0nXas2WWXaanx845AdwtDJX6xXRUUIgmpJ@vger.kernel.org, AJvYcCWZVUBeOOoDb7KikOgEeSnB+/X9TKjw8ISRS6kyFfa06aFqe1auDw2yEEpN3WJOB/1/pgjL3SnSmXELLhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUM3+osMvfi88MSI8/Bt02rcd33NyZr8/yJGV2nLvnhdcLTXL
	BqpB/NAHhetm9TNLf07J23bLkfjwzJI+K93cBS+eSIwKW5HHVQc5
X-Google-Smtp-Source: AGHT+IHeEe3mm/8rpLqYRoj9nMzkIH5w4NmN8fzepjnVMeMUupa5m1tlbZtoAOW1ScA1wderM3ua2g==
X-Received: by 2002:a17:902:ec85:b0:20c:b3ea:9006 with SMTP id d9443c01a7336-20d471ecbfamr144521605ad.6.1729306572386;
        Fri, 18 Oct 2024 19:56:12 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2e70:ca2:a7a2:d21d:dfaf:c0b3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8d66d6sm19342245ad.125.2024.10.18.19.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 19:56:11 -0700 (PDT)
Date: Sat, 19 Oct 2024 10:55:55 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxMfu4yxk961mZWB@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>

Hi Doug

On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
> 
> On Thu, Oct 17, 2024 at 7:09 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> >  1 file changed, 58 insertions(+), 10 deletions(-)
> 
> I'm happy to let device tree folks make the call here, but IMO it
> would be much cleaner to just consider the I2C-connected GT7986U and
> the SPI-connected GT7986U to be different things and just use a
> different compatible string for them. So essentially go back to your
> v7 patch from before [1] but change the compatible to
> "goodix,gt7986u-spi". If, for instance, this device also had a USB
> interface then I don't think we'd try to cram it into the same
> bindings even though the same physical chip was present...
> 

Honestly, I agree with this approach, but Krzysztof seems to prefer
extending the existing binding.

Best regards,
Charles


Return-Path: <linux-input+bounces-15093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB1B9C404
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 23:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D22B1BC0B91
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B43222582;
	Wed, 24 Sep 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX+noERe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED99811185
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758748613; cv=none; b=NEr0TtZUl7EhrnC3ajG3ytHwIfw61KPfPYLpqIvGHNbWS59CnK7MjjBUHD5MhiSx31mv8mMC+a6V2+CytZcztJ+UGiLJhR1Hjb19Rtn6UhUY45bSVWyTCVVsH9VjT6f0BGmTie3MsXRQ+TO56dAYxpkfmn6bv8ZJIQZpwp8OlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758748613; c=relaxed/simple;
	bh=DKZzG72UISxhlAARYp/GkxOmVV8/FWJVYJWHSvM0vVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCX9XUcK6JOMAebmCs2XEMMFt3x79rl0Hvb3v6ivI8OT5vGDn7ljINaqQ06pVFRVUcReMt6fwkcYC9HURg3LtWKhv5nBQYwyGG5cTn4aqPzEGVmI8lJd4hzMfAUXhcCpRFOZJH9NdWY1RGX1F5cYogq/5AllmVDcoH4B2ZYxzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX+noERe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55562f3130so198993a12.2
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758748611; x=1759353411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xuvGcGCNfXilXpOqbgSBgLeaAryZccb9FysizhkGP2E=;
        b=EX+noERez0jz3TIw9H8mXdSc3V6qv2vtfe+X8dcurkDuzPuCIdxjroV/yiQNoxatSw
         WfQ99TM0vlDPIWZvB/6XiDnEQLOdSOlHO5oLPzpQ8KvUAv+wK7YIRlsXVKrvvcdEW7mW
         +s9XBKzIkmTUtg9iE9rzB4xU3iccBW617bOLz4QIGM9IXfra3cJcILhR6jJ+hciCBdv9
         6ikMBtSEngPEpw5pbHQpUx5lURPBUeJHXE85SsoHjkiAUphkVxpGV0kF/23lpWj04zwK
         DHfd36b0gPAhOrWIVqNQMkzzuS6eDHfwJ9N82kxvG9rmq7K9rcqrhSVF2fVrpWxiCEli
         Ok2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748611; x=1759353411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuvGcGCNfXilXpOqbgSBgLeaAryZccb9FysizhkGP2E=;
        b=J/OwUk0BsVWYsIycGYilKk+aP4wFV5i8+Oh/ILqJy/oZD261cFO16t9FR7JgzYRwco
         O31QYYuEaKyHJtKlkGBnPENqTFrMuZBD0nNzkVZBpAGWxNgnfCmU4c0J8pPSEbKCsor/
         AiJOYs18AgJ+nEqC6cpQO2zPO3GCLoxwg3LOdfZzZMIjIJjqfQ5uZn40Mmu4Bz/4J111
         uAeYH3EHhU6x1814zht6G7g4hscQ/kztM9LHFZ8tioJhLDDubOkfzioxofNyS3s1d+AI
         qkIthHXB9/dDDNoyYJPgf3p18g3UXm/5So4zOVEoiXTfIsmYekJ+wJu0tLAQQ+5CqiW7
         vEaw==
X-Forwarded-Encrypted: i=1; AJvYcCUDhtvQ4xTlP6laC8BmRs6Wd6paeOxfg7hQZIRHZAxXNIAhQWTa1rp4ZflF4rk+0V0u/inJWT1MgDjM9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5rvffpRAgvmHJC4WxSW+8nhEH1fSF9nIcmfXgkAT4vW5gXiW
	S+KLJTxkrNEx1qdbqWYtJJLKxlDOtx/BjpPr0yttosCQmgcRR69nslGg
X-Gm-Gg: ASbGncvIw05fVKY552smuJh80p5TLbaBKIlQqZrlC+BqaHkqz/zFGOItNl3pRg6rX+D
	vIVZI4q58FCRaaD76SkOIMKiKWg4rJ3H4rXWdUramans2JGTC4vvHMDTcAuCqQ7E7Qbhbrnnx7r
	3y9Xpyf0YakoOOASi7XM07KXuVReCZQnWdlvHEMZxigpDMEBVUB0LOzpZ6QQ8JWTPBo8AWO3upC
	1nivQNpOv1HwyUMnraM9FPaqb6kJ+sUttUfE880QXSRJfdTxHBFDLl0UFOx1sv/Hp9FEn7kW1Ti
	HKHF/S0MR17Tn/7+U7hW/vZ4bHQ4inuuSTrKukLqexL1mA4MsgXqFLaZx7N8i2PfqUxSNEuq6yo
	KNkSJ7wEdICCrNokF7JRYDg==
X-Google-Smtp-Source: AGHT+IHWuciSphrjZknLN77DKQabDo4w0Tp+2s67hJjD/svoMlbxqq7GF+u3+qtUxqftKfjfkPx47g==
X-Received: by 2002:a17:902:cec1:b0:26a:8171:daf7 with SMTP id d9443c01a7336-27ed49fbcd1mr12131535ad.16.1758748611369;
        Wed, 24 Sep 2025 14:16:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed688229bsm2017575ad.68.2025.09.24.14.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:16:50 -0700 (PDT)
Date: Wed, 24 Sep 2025 14:16:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	sebastian.reichel@collabora.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <4j3yf7l5gqcvf4o33vfkq63rpaaj6ktatjdb5co4ft7xpn77ui@r34ffqwwrczm>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
 <xugkxduy7thmh3x373rcsacfdslnvscdfii23acx3qq2jp73l6@ymxf7g5earka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xugkxduy7thmh3x373rcsacfdslnvscdfii23acx3qq2jp73l6@ymxf7g5earka>

On Wed, Sep 24, 2025 at 02:14:03PM -0700, Dmitry Torokhov wrote:
> Hi Dario,
> 
> On Sun, Sep 21, 2025 at 07:33:42PM +0200, Dario Binacchi wrote:
> > Convert EETI touchscreen controller device tree binding to json-schema.
> > 
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> This conflicts with my tree, could you please rebase against my
> "next"branch (or against linux-next)?

Sorry, meant to reply to v7 version of the series.

-- 
Dmitry


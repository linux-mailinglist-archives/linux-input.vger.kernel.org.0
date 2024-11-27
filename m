Return-Path: <linux-input+bounces-8273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E49DA5D1
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C36E284FA1
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBCF19994F;
	Wed, 27 Nov 2024 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnVlLQn1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8019922A;
	Wed, 27 Nov 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703476; cv=none; b=KmjkinxFwHrhVLcIZBI/yvYrPfyG8zkJ3AiprjbKgwVhDbFfFxapGPHo+mx6z3DetMtot2BwSBGHmEFC7inx3iWXWuSzIgh6YOZhIaxeEbdc3IzkSov5wSjYFzT6n2jiH0WbqQSjJztWKOe3scDOaV8ilGDnl0lVh7eWBk1IG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703476; c=relaxed/simple;
	bh=6Zr5foNoeYHy00EYMyERNSF8LJh3JyyQLGIUZ+TN3qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3AC5zz8e+X5bFlecpzSr11xvlZ8IPjgRbe5g9CSNKxgiflxaHpOg+er4WhdTRK9nwODikUgx+8O7/BAsWn/wliILdzWSaOetRdZOAXdjBwhOlqD2A1rJ4ZVA6BILAi1WzNk2PwTAfAHu3U37IhEdSlXoWdLPE7wCcFKdoZhbFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnVlLQn1; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eee6874ef8so49552787b3.2;
        Wed, 27 Nov 2024 02:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732703474; x=1733308274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=SnVlLQn1t7wbJe6CbTdByTAFFddxzy96L61Xdaa1EGr/Bip+ZZtkK86M9BQubEVb9P
         CNrd4t7yq5+ieI/O/OacJFO0AQQEmLhCN3GgMGs8+DF58V+nDGEl97wOOPGhWlK9MOX/
         ju34st6EtvyrJvyc6BbCu+tWPqSeERSMvgN8fgU3vnlzkTbaTRXgn2lmh/aUUPJ64Q/e
         0cXe73nW6zeiiQLK3Ec/DfBFxifwuMxj25DEX5eAuqqdwSfKb3GKekwaU+aSmMLbHJMz
         cEijvjWI9TcJl6xzpXS06dLZ1Iqzgx42671pcLXAmZaTNJFEbPNGF70S/iK874UAqJcg
         jfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703474; x=1733308274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+tMGsu8kyM/fcIHQ4a5jlISh9lUT5BBdpOf/BUGU00=;
        b=PxycQ8JKJxqOgCFW7hvrIrkXhoeICgUXTZ5kNJUi25zUCR3gN3pu/r5fCfeYnfMc/x
         NsHvkCBxZxN2SG+9EzblFooVf4o8Y5wTvlACLcVVjla8oK90ktngHq6nlA8uROjxG8sr
         e395kF/qPAM9+XruoMCSjngBhCn6/yqLuGgnfJkBiQqvzBxfRZ6H4ByfkJ3XKGr6doQ4
         8BfkP4DnXtuilR1PogcmtL6mC9Lz151gMYbFYLpAyCXWA+DaktY7WY3WvsWuhNvgcLDN
         rdxqXNHeIsDyqi07lKFIDD4hsP6RuID5tPmmN/dIWoewHxXoYFW262LZd3gbvNYo33QZ
         ZsTg==
X-Forwarded-Encrypted: i=1; AJvYcCVm7BVhnPy2IxR5cZ21J/zxsGutt7kDIK7ulyrDra8OwPWoiuzFwy6w9sR2rrGDW2CocwrByOCVxTHCkIc=@vger.kernel.org, AJvYcCVqa0FpSvlz20lWbYnGPA1Eas1T9/2aku+VVfyfjOBTh407egDZ7C8D+mU++OTPwtxf+pP6paMFK6on0UlZ@vger.kernel.org, AJvYcCXgvuJ2e6Sqy2uIyUzumwPpwOD9+Sb3BQIo/AQFTzvIcznRRkSi+la8/bLVeranybGaxzkAZEJ6Y4Io@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0b2UvQrRDHi2E+YmsEhhog/Fj2gMweV33FdkOPcmPBL7vPiR
	2NlEX41MeVi9mmXFSmOVkzKnuY1a6I8C+6hOuMMNUqGyGMWXE2E051cBRCnibPdDYHVurna2Rj1
	ampCemUPvPyJ7TaWrCwexEpn8Ils=
X-Gm-Gg: ASbGncty/5R1bVn9hwvzIVsW9e8azwLEYRsa/5WVZR5r6bX45EecOX1SQmpllMb7tqq
	JkchyUByvBxmAuxBVwxgoMRmySaCUorsJ
X-Google-Smtp-Source: AGHT+IE4Rwjoqcf6g4WNVWN6SK2tYJNiVr4zxnFoZgSAN5swW6pmwHPwkZxnwv7KUL2OiNM5h7LYDp0/itheP1WTPd4=
X-Received: by 2002:a05:6902:dc9:b0:e30:7c38:668b with SMTP id
 3f1490d57ef6-e395b94b0b1mr1678379276.37.1732703473698; Wed, 27 Nov 2024
 02:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
 <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
In-Reply-To: <y5xdrrb6ome4vggfadmnbtegigxlvwrxpqmwh7qhl2c7faesti@57odqxajdiwv>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:31:02 +0100
Message-ID: <CAMT+MTQ40y0GoOHXp=UUR=79JBPUCt9DSihojZyBwcwgR5_O1Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +             touchbar0 = &touchbar0;
>
> Not used, drop.

Used by the bootloader to forward calibration data to the correct node.


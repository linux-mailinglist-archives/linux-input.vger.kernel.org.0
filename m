Return-Path: <linux-input+bounces-16619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4FCC9452
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 19:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AB8B300D00F
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 18:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177B033769C;
	Wed, 17 Dec 2025 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y675B+a4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA52D7DDC
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995302; cv=none; b=VXONIhnytOW4cf+CSV1F6ic/f0au1039PW/bjWcSezpwIWwiXIlHOlgONCWKgPq/QgcxcxuTXev58CNlMmrVSYECkdENk3izWP9bMquV19XMinaSHkmlhE8s7Z0C7kTYx2LypOBLHJcEVxZBY9MXMdX/CsouBNUFJVvcs8te30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995302; c=relaxed/simple;
	bh=0b2gRGXSpyZ15UlE+OKvYacDD0BErU6W+ls5XNZdyMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqRB2I5H0ZpogHr00DTK8n+TJub/fEKsKkbTiHBGQtbwWpydsDBKzc85u48//v6FASMd6fdUt30mCeR+T9mHMz1DURKqK+jn5oZako2Xc9QHH794qV0xhqbTTDb56FXpA8hdWf9zO/OlGWzJ+2fkR11YenHzZRcu/Pjq5IjQ6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y675B+a4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so6914155b3a.1
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 10:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995299; x=1766600099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOrq08hGajOOcYRL5EptOwi+//lemPFZkoEb66MSWgc=;
        b=Y675B+a4c4kaOLrxIbjU6GAgwZ2mQtZPavGmyF7NRcAhWsu+rjjBm2PGAgPg2GZ/40
         z8E/2KMIa9LuXjipPfU0ACMggWnVSqL60d4WzxQnNaT4cwCz3+zIEtVYX0f5lZnCAqsy
         JwTi53PgicXSk9tXWjA0z52Xmyd6i+kFxbQjd217Mv1W5bzARczqbFC81q0GLBKhp9aF
         GcjcKEWkCJAR2GToRBoNkgdO2m8BP/jseyz9n6BWu15yjxeVIpi4V2wvG+uds0nV8WeQ
         W09dfbbvq0YzBVjGdr2Tg/3aHUgfQByIhFwUzAgW+uilLLDmB2l3ga1yyHUhnJSNPY2M
         MgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995299; x=1766600099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOrq08hGajOOcYRL5EptOwi+//lemPFZkoEb66MSWgc=;
        b=pMldrqJ4vto8ld0i3QINxnymSCm5cggdS1j09jarKh1FaRU91VBxb+yJ0kp7dORBjX
         JzKL5BhxoNUqNDaHW8MpfXGGz/5/ffAZ3fYHqrltFfVrnGcmBlztzkY2N44K5awda6xI
         ZaZobfrXgOWzDgXm33HWY/ODo/n1uiG6Vii/wGFsFkoVv5uCVX7ooHeDsrDGIMKELoY1
         G9JpoG744OBHXPEPEQ1zMTr63bjCbJPl72CW7gnv9+Iwc8QG9Wmr/BZ1okOHaWegTchf
         Dk2GxbNjqr5P+d3scxW+CyZGie5S7ihSfMvH1Kz57QeIgrGXJPOb6re82qRlz6lKnQ3g
         mw9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrrGiSGBDRQ/59J4FlwSvDJjes6lXlbRfXsW1ObtJ1vu6MnuCKOIhlF8iIRt9QSqh27NthThgwsNuG9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbDAsRIsLSnypjWaIELNRhN6JQNss6lTMPQApY0FhiMs6LuGs
	cxeY6vXVPONB98z5H1NLSze0vsRwx7fAxV6L7MhuSKKWfHkJw+DZl0W0
X-Gm-Gg: AY/fxX4+mb2yrPtwIznAKqIj2EPq3Invlmb9tpbkC2U1X9DIvaUk0/deDGEr+x6JJDm
	pBOvUqgqBPJmP290AJqS7MKM4BcCD8e5z4fBql08xqLHivc6Qd9LMPKIL/vM9xuWuay1o7Pi0pR
	h1UlDPRIalGqhEzlHJDLwDbRKJQq/i/aODTw7prV+fWZvCR//G1emuUZONXZ9Wd2G2rtfaxfqQH
	jnRY+6k0NUkYFIJqTwPk45UC7s00mBD0eQRNvLU/OOSxLaYz32AeG/lnK4rw+q+wmc5faPVcofR
	J2GIjMt9o/+QlZJ8uzEiS+qw3SxxpXro5iv/5MnXw8TWhgZtWVJ7kyQfNZnMAc1fAL/dqhr+mnu
	jbMDwW4Aw48KHQEtIwjGH7KjEldfpt7l9wXfEY1+4krWm9paQh591LwC8/EGMf6za3vo+DK9uTu
	Vy+0RrNaNlDZa1+cvcp6rXv2LAVGtdqE56Y+vuRzm50ZaZOrVTjg==
X-Google-Smtp-Source: AGHT+IGu4A8aCmIISvgNTt5TQ/2P2t6MUK5elnXz8xGRiwALTRAQVQAklx3WiH8aN/Y84/vAAG4n/A==
X-Received: by 2002:a05:701b:2407:b0:119:e56b:957c with SMTP id a92af1059eb24-11f34bd911emr11560652c88.1.1765995298591;
        Wed, 17 Dec 2025 10:14:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86:f92f:a027:b12a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a888d8sm533828c88.11.2025.12.17.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:14:58 -0800 (PST)
Date: Wed, 17 Dec 2025 10:14:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bastian Hecht <hechtb@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: sitronix,st1232: Add
 Sitronix ST1624
Message-ID: <vxady6umownu5jap3s46p5n4skqv4iz23azyxztey2vzpzghl4@strecn6y6bgo>
References: <20251215212524.3318311-1-robh@kernel.org>
 <20251217-intelligent-herring-of-defiance-3753db@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-intelligent-herring-of-defiance-3753db@quoll>

On Wed, Dec 17, 2025 at 09:40:43AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 15, 2025 at 03:25:24PM -0600, Rob Herring (Arm) wrote:
> > Add the Sitronix ST1624 which is compatible with ST1633.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/input/touchscreen/sitronix,st1232.yaml    | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sorry Krzysztof, I already applied Rob's patch but neglected to mention
this on the list...

-- 
Dmitry


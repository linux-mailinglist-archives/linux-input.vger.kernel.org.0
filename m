Return-Path: <linux-input+bounces-6995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517598CF62
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 674DB1C22038
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B8284A52;
	Wed,  2 Oct 2024 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqtwpyBS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C380038;
	Wed,  2 Oct 2024 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859668; cv=none; b=C7uBNIsPU1Pwpjo1rAIsirbQWvo19RquwnVOQgZHyLFUe4VSPxg6r7amBfCbSPycyLuQL69sFmd9bM2Wzqfn/b0a1YygpgHz+8gExrr3nxnmQbo5hQrQN+Bo0Zt7f4XikTJU6JQlYPBaj9QQN3gB1xhJ1UKpdScMIqUng7rYuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859668; c=relaxed/simple;
	bh=DHXsldvJpR0ERKTiWc2XmgkU9RuF3lSx+N9gC6ec3O8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmkcFO5WqQqAzKKuZNbeMR5VIvc3Yq5jz12FIWiYJArmWKGvVCugbUw46s363TxJhjndSS0nzz0/S29h8yMWUgK3LAHML7OrlXRzWknQCXxIGH8wUXyVCS6WopFaqoU00TLfIz7uvHipwiT5pU8AEyJzsfB1qNsm+zR8MSXsxmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqtwpyBS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so944391266b.3;
        Wed, 02 Oct 2024 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859665; x=1728464465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gk7IPUx9huRBJ0A73pBRTKkKQFCn+rnKvVWaqiY9C8o=;
        b=bqtwpyBSU8W1LEUCedryTE9BKfm3+RdbgA92AElR+kc686WELP5RMmN9fWx+DBXFko
         Skgx777USU66+/m8WEYe5DHEAwhV5WLOB+czYMY931Z29hGVgTHJQm5aTLzBInFVdki7
         HksWGORJDsh+Y5Zi7AQWpkR7i+VQIBo4/kdhB57ZwIYmz4WGJ/+SmyalsWeulKgqCl52
         TjtViV2Oc/cM1AeNSkdPrZtBMQddOnCvfzqjeSXnsCI6+xNLmwQOsMVD+ruL4B6Eb8am
         278s5jF9LCLEniYNRxC9FyRwZY4vfjhhqVgh0D4BwTK1Q/BlQCq8OrKoAQ1ZTAJcR0se
         sV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859665; x=1728464465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gk7IPUx9huRBJ0A73pBRTKkKQFCn+rnKvVWaqiY9C8o=;
        b=vCsZPJ15RgoO67SiHYnDPTc0JHDw63Ypbnvj1+51aN8j0zYjITgbzluXSyICE4eka0
         eWV2JcHzEYK4jvIiI+KE1YgrpmNgOygPvjPysyGbesPKFFsfVnDDmmi6v3+LijTiRwri
         5N+rod+g+sOPlVgzs/DsWGkHH7GpA0g0IfZxbZ3SDpb9Fw88T5g3bSmFg0gdZ1M18ldE
         VswMtCAreoFzR39Z9SMuwdqvvK8V7Wjm4dDY+h/vQh2YID8I6qzht2R0xY9rPD85er7n
         WxIiMTo0hnn4+tMGJxZL+WX1s3fm1qxyJCUgm31+4Hz8caHxVrnm9VtDs7RFu5jcWmwR
         vrgw==
X-Forwarded-Encrypted: i=1; AJvYcCVYU+RAAQ2gvjNTLZanUJopC8FqT6OgSVqgj85CXVZcBGZTPJv2LmcHnnhZDe9qICfHIBASTC/sD63cdsA=@vger.kernel.org, AJvYcCVZPiyTR/5obttS326yU+kWOzYP4CD4S4g6sCIBIKG5cE7EuVh9mF60SEkqBF6Fpb2lnqJ3NgLAJWep@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJl00ahAXOVHPCY8hhGfjnKnlI4aJRGfmBEonKHWHjx7IQksL
	o6YrqXKNCCdhgozr1HerBwbMu07rBSXdxBq5h9HWYse38Jr78efK
X-Google-Smtp-Source: AGHT+IEzNAkRmJkmKPReSX2GxsaBP58DCtj+OPFDo1QL0bu9e0FlJbHJEeJ0+u1N7Kjv4wki0IM9Ig==
X-Received: by 2002:a17:906:794c:b0:a90:b6e8:6919 with SMTP id a640c23a62f3a-a98f83615e1mr240313766b.48.1727859665010;
        Wed, 02 Oct 2024 02:01:05 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bc88sm845000866b.177.2024.10.02.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:01:04 -0700 (PDT)
Message-ID: <b004c0996f7e0da9ad1dbf58ea47ea147208d998.camel@gmail.com>
Subject: Re: [PATCH 06/13] Input: adp5589-keys: add support for fw properties
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 02 Oct 2024 11:01:04 +0200
In-Reply-To: <ZvwOTox14Za3XJE3@google.com>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
	 <20241001-b4-dev-adp5589-fw-conversion-v1-6-fca0149dfc47@analog.com>
	 <ZvwOTox14Za3XJE3@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-01 at 07:59 -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 03:41:37PM +0200, Nuno Sa wrote:
> > +
> > +	switch (cfg) {
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		fallthrough;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		fallthrough;
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		return adp5589_gpio_set_bias(kpad, pin, cfg);
>=20
> I don't think you need to use "fallhrough" here, saying:
>=20
> 	case PIN_CONFIG_BIAS_PULL_UP:
> 	case PIN_CONFIG_BIAS_PULL_DOWN:
> 	case PIN_CONFIG_BIAS_DISABLE:
> 		return adp5589_gpio_set_bias(kpad, pin, cfg);
>=20
> should not result in any warnings.
>=20
> Thanks.
>=20

Arghh sure... Will do that in v2.

- Nuno S=C3=A1


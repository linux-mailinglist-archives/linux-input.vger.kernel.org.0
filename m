Return-Path: <linux-input+bounces-16390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ADAC91AF2
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 11:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC52F35367B
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 10:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45230C60B;
	Fri, 28 Nov 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyFJfB5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283530AACF
	for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326228; cv=none; b=f+ylWFQRJD+P9m9ezCSPhs5jTklTdDhHWR63KRSmpUDC7l7bwqWIeUrQAXZp2qTSNSqBjxTSTqu5JD/Hlq+34ICHOKsv5zMV2PbRydB1ndkHZBd8Wlyd+7avGZsOmEZhJlSqzpvIeAvMCyKu2lTslaCzfGzgzpGhyCEKSB/482U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326228; c=relaxed/simple;
	bh=LsjBUCj2srMne7edzgGW8cbMkZIkCTv5yV9uYfkGBBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVElaWggcy2TeGU1FUyND++xTmhdnn0Exr7dXUg+2vBES6baCXqeoPsvuHxT4BAWQxzTCHh11q2RNL00yXjX3dcTOyg1w1y4AvCBJUu2gffLAcuIbe6wVH1VP2z/RiYwSHxPHfxwKrNpScLBg6WqMbSNmAk+/snOuTBX1CEjNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyFJfB5E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29808a9a96aso19596285ad.1
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326226; x=1764931026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=TyFJfB5Ep4A7ODMRUKn8tZ7ZKi6TTBW1kh28faa/niAkS6GcO8WPf7G2Y/g2oubik4
         fzhckhp4qq0IWU5BuOJALxL+nzRPxaWHgo1g9roiJv36iT+0X0zcgfy4kLjj4LdS1Lfd
         /Zg4DJZisPmw9SZFyC5gUpkdHDVHYlVp+2+5V6+6U1k8P7EfvhrYND5Xr09YDd1O7r8l
         Mp/4S/Lb8cDe/tJyl7mgZfCnk3kI+lxQFxcsLRG/9PngjLN7x6NQZrojCz4YtrlFc1wy
         s9yUOjCqBxKzevDIKlwZp6JZL/rHCSdgSNlqpZnvl6jjaotXbp3Wnla1FLhVmXgX7wDu
         d9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326226; x=1764931026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=SU8QO8CbIsGPcl5/GuH7LmDk5mUX35IbdluAMeHWBA4l9HptHAfsVzdYKeXtKvxHUW
         9BvL5ZAi070077A1io06lfPzx+eeWXqDKpx0gFJb9QhqjLsDFsE0EwrKyPxFjbCYthIM
         fHOL6EgbvGuZCGyrgJZfnb2sDDUuXIPWkXCWA1woNamAXAW7vwLMbROk99u2v1DDfIup
         BEWfhuIzGb1ocGKjxTT77OzkeIKZs0W/kD3Bc0qKuMjq3DYupcESOG99ny6lt2MjrnNQ
         x7d93WPyI1FSm99ePcrnM8TG536qIXePi+m2/KFFiW7rdLk7qYViFlbQBv65wfnboq1V
         sBSg==
X-Forwarded-Encrypted: i=1; AJvYcCW87gtFmBRlk6SWKTF8/L2aEBX0RrF2lNQDIODj3P/3Ml8HUZlW45k5IsU/dD/FKodKhJ7/N/Crd0slpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4KQKdracC+BLFMsPUxzji37mCn2F9d9FrEwjYyBbDvH0QWQrB
	P6EMI3Qu2v1QatJ+r52s4cSoh6UN6DddN1Sfgc/xXqdBFHpJafSRDxXG
X-Gm-Gg: ASbGncvqGG0mXxKFITSgjXjDH92Qjsp9wq4JeXS1/8k/WFPLOU+LdsTXNCBqyH3K09A
	/MfaisYz6cDf+ON+nI47TmtbjcMjOyt0uSbIceCfiJyHEihG4pzu+vXtmXbk2pqbkX3A76fkkhR
	dotxoER/nWdgN9T0RYyeD+u6Sp9hleyR3hXT9yO+AfyV17wdfHOqWLtjJF+r1M0vfTGE2kakwNS
	mO+RjcRqA/knV7/Fmk+rw9QQNSuY9B/Cq0v3cSsILAQXPtp+RRAXi2jo3NVP6Di0dHdZ2LHf2Of
	WjHSdnvqzTCeomG22fe5kkfdpal+sxCcto7QbAU7bl/ZiEe4iN0/4ecy5fZiCP1K3Ew4ytXuLrD
	DpiwX1odYVBDbWk7t4m3mXvN84nHjNPAYrpf/mBoDYKYW9QjXtuJpvo77wU0G5CaSyoZcjzqYJX
	i14XLn3gE7ZnvpzRwQIbCeICZvSYJuhUnvRjwzxG44dltw/vy8atmfJJMP0O2FEq2qVTc4jn0f6
	C293gcMQ7IyBO/zKmcgJ/JR9+eai9mC3OVqpl16MjNxB+54rkMLaeDg3+RCuOvZT+ZW+WYXHu3G
	XPaP3Fvvj84s+cxTpsXVXhqg9FpAKno+o0JaTdkDkyEzeCN7rZNeVJw=
X-Google-Smtp-Source: AGHT+IGMXq1Dh7hKw7TbowlI22iUZ08cEdFKrn/i/FIQAiWpJQ+dGpYRwCov3xkXMTBkJf1Am/GMAQ==
X-Received: by 2002:a17:903:b84:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-29b6bec45damr309873285ad.18.1764326225590;
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm41643525ad.41.2025.11.28.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Date: Fri, 28 Nov 2025 20:36:56 +1000
Message-ID: <1938104.tdWV9SEqCh@setsuna>
In-Reply-To: <20251120134445.GC661940@google.com>
References:
 <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
 <20251120134445.GC661940@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 20 November 2025 11:44:45=E2=80=AFpm Australian Eastern Standa=
rd Time Lee=20
Jones wrote:
> On Wed, 12 Nov 2025, James Calligeros wrote:
> > When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 err=
ors
> > out with 'case label does not reduce to an integer constant'. Introduce
> > a new __SMC_KEY macro that can be used instead.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/linux/mfd/macsmc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> > index 6b13f01a8592..f6f80c33b5cf 100644
> > --- a/include/linux/mfd/macsmc.h
> > +++ b/include/linux/mfd/macsmc.h
> > @@ -41,6 +41,7 @@ typedef u32 smc_key;
> >=20
> >   */
> > =20
> >  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> >  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) |
> >  (s)[3])>=20
> > +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) |
> > ((u32)(c) << 8) | ((u32)(d)))
> Are we expecting users/consumers to be able to tell the difference
> between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
> internal)?

_SMC_KEY is used in the gpio driver, and I would have used it here too if n=
ot=20
for GCC complaining about it. I wouldn't expect anyone to want to use=20
__SMC_KEY outside of the specific use case this commit addresses given the=
=20
suboptimal ergonomics.

> I have not tested this and it is just off the top of my head, but does
> this work:
>=20
> #define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

This works fine on a smattering of M1 and M2 series machines. I can submit =
a=20
v6 with this and the hwmon driver dropped if need be.

Regards,
James




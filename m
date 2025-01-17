Return-Path: <linux-input+bounces-9355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F552A155DB
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4844160553
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDCB188713;
	Fri, 17 Jan 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjxrXH1J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE120B20
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135481; cv=none; b=Nsajs+OT1msZmRoplhy7h+gdK9+mzysjwIhH9rK/+b+SZICu8U3P2Q5aUpFHl0bENgnem+CQRZzEzeaOxeFkdZmM5ApaNwQqebPxUjFvri664pnEHnVE8heMuQkkGIDQjeY44M+14KSZuxUvFzZFpPPvkR0PQYHKYqA2yCGc+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135481; c=relaxed/simple;
	bh=FxWjGTwG09aZKxdRrDQyHKJHwap9pV0agGpftwC8+9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIX2d68MIIdnfHBk+1l1KSTt8aATlw4i0EEg4T0Wdu+sj0E3/IfT+BZEpmUToEuP92gtJZ+FegKbJSyvcwk5BvtDmJngo4CZFqGk0DcP18pt3r73xhcIqdkk4BMEEHBGPi1/k+nVzPw1e8UPJISluCADyqDikNjv9oPrc/K0+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjxrXH1J; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216401de828so44568615ad.3
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737135479; x=1737740279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YG5RkR+1MpoJ84aHYrRhosF78PH5vZydy6PwU9QMSAc=;
        b=CjxrXH1JzcNeR0DUAoG85WPUfTV1+eLqicmX3uw8oqD4xoBWlSg+zmnx2SNl3Tb6cy
         1njLlNgwHuDFHzPEnELc6ouK/uYl0Vyx4ZRmDLt840DvakTtOQRbTJj47nt46Gi3M2Kg
         Zw5GdCsdoCb8iIkQPaUJtAuKG6eAmz7mMw9CQK1O1qOZ4oYAcxtEG0d5r3LcWvDy3qze
         9RJoTTc5BMBrrGkgs1a9wvCqzwteVOhNcdLTMHJi5jCNotT3h74pN0sRKx60FBH4RmIl
         vEZCi09OGKHJesf8icdCtUB0Ba+kyseYpJQK+UnhuXE1jQd1e2dERuffFuZsnYLfksNj
         18tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737135479; x=1737740279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG5RkR+1MpoJ84aHYrRhosF78PH5vZydy6PwU9QMSAc=;
        b=gr2/7Ex03Vu3Jf0YmvqJKelBRquJF3vOldMbfopZiEwb/WTXrn+Q6X31wQjF+C6OPP
         csR3GfXtKyOvqprKquazJKzz/vgiVY1tTT2R1GRPuAKr0wilfezV0o56EJwTXVFxLlwU
         JwMQIk1JyWZgN2Ynr9XDYyYwgBqVHohZWD4BifXPVQlII9Kryykg35vYYr3tolL9e5TU
         vNRerGWqiqzvgNxj/RgrdxDNK2iUNGtBeH8z90skjzAF8WogbbjPG9M+R4XpPgSSOhJn
         01Oc1or/JasXEilSO0ZUs/m0zKsxiuCc/uDMJfCbSM1R4+CqRieS47285IkekTL4ezFr
         9l/Q==
X-Gm-Message-State: AOJu0Ywp2E7Rd2k5GeWwXRQ0t3OhJQyupX511UW8kr/ntJVGzjRq77mH
	F2CQI3tH9sk37PUz4jX0uMpSj1+0AD2IwiMxM012C1XGF90cE9KoQLsK0w==
X-Gm-Gg: ASbGncsConHsB8XHLtl37poDidAH/M9J1iY+n/uC4lg9GswfuAIRS8fOc8uTKuFtItx
	45nd806o5pPbzyarfmRWk1R3MOUUAGMTSwm151U8AC/Z26JDXanNXmYf58SFoJbsrLwYCi5eNRs
	Jm7VnSMNaa7KwLFDJCnKcI2tjZCpnomhm7+FpL4/rOr7pyr/7zZ1F69ID15Dmj+8WJblcbqHs00
	HpR7z+BjDrnXunIx/2djHNUlIPvy3yk4Im6o9TpHL37EIobQbY4VmX+Sg==
X-Google-Smtp-Source: AGHT+IEFr+OWwQlDunvG64iVHbgCN6ScEoibys81sSI5fsqqVG8T9Y7CnyvG5C+AV8A8Zogmrnv19Q==
X-Received: by 2002:a05:6a20:841c:b0:1e1:ae9a:6316 with SMTP id adf61e73a8af0-1eb215ec18amr6512631637.35.1737135479583;
        Fri, 17 Jan 2025 09:37:59 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9d5335sm2156229b3a.110.2025.01.17.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:37:59 -0800 (PST)
Date: Fri, 17 Jan 2025 09:37:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org,
	"Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Subject: Re: [PATCH] xpad: Add QH Electronics VID/PID
Message-ID: <Z4qVdJ0MbiEH6QsA@google.com>
References: <20250116012518.3476735-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116012518.3476735-1-vi@endrift.com>

On Wed, Jan 15, 2025 at 05:25:18PM -0800, Vicki Pfau wrote:
> From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
> 
> Add support for QH Electronics Xbox 360-compatible controller
> 
> Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry


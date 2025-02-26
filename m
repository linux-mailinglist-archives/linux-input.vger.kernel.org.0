Return-Path: <linux-input+bounces-10377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97725A4514A
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEA247A4259
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A493139B;
	Wed, 26 Feb 2025 00:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBrPPUe4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921238F5C;
	Wed, 26 Feb 2025 00:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528839; cv=none; b=TcVmM8yjlrz7spJEHDTJ2UF9LOxX4WuMCHrm6bWMgAJK3eEEkRsqMFe9G6btm4/Ryn0KMzzCPY966C9sDbjqIAOyTJqPJbie/p40+b44PhKTJWItxv0Y5qzHLlsR4rys89geWHQ45wDJ9/A8+2LsPRKy1j0CW5NvNigrkOqDxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528839; c=relaxed/simple;
	bh=81kqLu0qsZmB6hPXG4hMrwLWHQPsJfJCyEYGSKct8B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5iSZRHZkOtiTAbP+oivb6XEt4Ks3fci09S+zOLfvCRhIXIp3YveMqRIXYIyN3e2vwefk43ftXYpvGBArN/je2YWV2bjiwLebYTCo+4KeTARVnGKiiQd7l1Y1hjR+0WO2IbwNuOplOXvhx2NcyaUKrdKb5s63X6cYt1COU/CnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBrPPUe4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so12479873a91.2;
        Tue, 25 Feb 2025 16:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740528838; x=1741133638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3WIXwXd5RU4xfM6GT0dafiFJt9RW6ERSXWTKaGcu+U=;
        b=gBrPPUe4r34pmrAJzHL38jZARJTIszqL4U3sDD6JmScY7MqgSvnheDkJvr0DYA+4Sp
         rRwYTG4vokF1HPr52n8il9V8Fz/ng0OPLE0WZHVD21Os959uQgoSg0aAUvZTZZtK0FJi
         SIMv8cibNfjyFGWYjiXPUlWUsMCtXLe3z3I/n9c8Lk9f2YoaHkSGSqXCky1SBYGidzs7
         pfHYIcmLUgSnADX5Tv+gf9f2cdT/2tw48JhcumebfIlkDncIfATi8RZQb5lx3v6SNOUH
         ugTzE3BqOaAgYw3fc2rJ5HtgbrJdc0Sgubw9rkGVWLIO8B2Ih+qqcX3DXlSVLf8tdP1p
         Y7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528838; x=1741133638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3WIXwXd5RU4xfM6GT0dafiFJt9RW6ERSXWTKaGcu+U=;
        b=Wf8/DdNdkRcmvGjhnhAq5dPWMicajmJWsMA9FnxXBNJZSAB8XvUT7nr0HV9uvKZhhE
         U92wuuUQacZWhdv9cThHqHr9cEDSh3JKZ7QdV8zCRoGDsVxjUNE50MJtgq+wv2h8hhgI
         M/qzMGWpVMd1XwqGummGyIfu+XheYUTdjqY11m16waekIttik5caR8b18t1CrIox/DqX
         48W++oA/FQiZrIxBaz/BjJyl0BnktKrSkboMokawrcCX5i2QMvH56zrL/iWPpKbgo5wq
         11vp76as8+ncrxPXkfLYDPYlCJ92uwRUleGsd1GPXy8iZ8OsNXfz3U3b3OT5ML9lprL+
         75Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXPWLjTNIIAg9/d9kIRZGSQsvAD14z5qaemPE6RechqW+7p8mHq5lj7wNB9puC3tqAze8m/Zk/uuTkLys8=@vger.kernel.org, AJvYcCXUzIbHDe//JZ0WMfb23JlYkSBFMU+8kyaH9VIPwa0vS2Sm6e1pfyBRwEwWf7wCelE93cLa/CyVMjBd@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUXJ/xGDoCPpmXaxcI6sdx9VWMd7CAEztSEfp13GuyIRQivCX
	BkzXXD6FA2AcNoxGq5mQ6Betli7o609lWxY2ffyL8BAJH2ZT3+JzDZmIYw==
X-Gm-Gg: ASbGncuyDDVfeprgctF8dUInLAQZH0S1kSVPO6nwuKDu+L3Bzn1CIGBdu5MAUkr0qZj
	0xmK2tqpKEwoqRcpKV4BJfFE6kgZ6y24DbY0H6aNmiCdVba4mrSxsVa8wU2qoQ1yUK8kHh+f4Xr
	IYOTX2H94ts68FmUVAqEJT8ykOyt9VWqJcL+WJV3hjijx4+DfjEoXnIxkEmzzSn8QidwHatXRQU
	nqrBtSHt6YzCf1xWkh3+XBH1bS9IjEDXUKP1hJRjA5FazgsZh4s1mTFcV7VKKfmF0cKXq+hAs+d
	OvDlSIcTvJrWz95oXiGvJ0FGoU0=
X-Google-Smtp-Source: AGHT+IGcAYBRzcMv8Xao68xJBPfBWGRbbWQrveGNvVuNxS1lzrB2SE3Z1/ytl11Xr8tl9Pa1Sw/4pw==
X-Received: by 2002:a17:90b:5547:b0:2f9:9ddd:68b9 with SMTP id 98e67ed59e1d1-2fe7e39f0c1mr1735570a91.26.1740528837734;
        Tue, 25 Feb 2025 16:13:57 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6cf86486sm2352686a91.0.2025.02.25.16.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:13:57 -0800 (PST)
Date: Tue, 25 Feb 2025 16:13:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <Z75cwjrCBiR0DAJL@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-4-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 06:49:02AM +0100, Markus Burri wrote:
> Convert the gpio-matrix-keypad bindings from text to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 

Applied, thank you.

-- 
Dmitry


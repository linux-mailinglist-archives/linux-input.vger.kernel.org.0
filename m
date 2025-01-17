Return-Path: <linux-input+bounces-9356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B88A155E3
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A339188D6C3
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B619F461;
	Fri, 17 Jan 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyHEtRio"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936386324;
	Fri, 17 Jan 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135786; cv=none; b=sClW0i3qiT0ofY4s70eBS3GnGy/bXriLO9QSqkdsjIgCZYwsMniNsNSgJ85iuKltCNpuZd3wyuUYBv7AH6TgD/IC8CKvzm74PFr8d1vUp1hKe0ZIjzyFS7XSzep1ldOXlz+6Mo5VluiNt8WiGyOBsj4IPXyzCGBM1ytfKtDlJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135786; c=relaxed/simple;
	bh=yUoHi9qOKIXUAPV1cOImCRoZnJ6ZnQS7GSvZ6pLOwjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbwNv2nKg/XzksqNg7v34u8ZdFML+7VPKtEBgk29Oo5Xwg+yHuuZooVOBRuVAyRfNYqzXmSIf7mxBO7viuRFiZRQUYZlMVHmq3jjwfnOi1XfcMHPvwNXM+ABynJQVW0qY4WUsIyZ1kHXcA50a+/CW4fHkRdZCPnNaaVN4LDzXxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyHEtRio; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so3408397a91.0;
        Fri, 17 Jan 2025 09:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737135784; x=1737740584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgnpqUZl4hGYbxcYQe+A404fQT1bwy4DECFrl03821w=;
        b=DyHEtRioj+ksfGMsyPRO9+JeW2v7jdlre8zvDSFLWgAdzKE3FEUPfSvipBjR59LAvW
         /UUHM7iPRS3TgdcGjFhdXC2sKjx7phRw5L5ztFn0vcWEpBeaEqtLphzxt55ibeo5bEfd
         dCIBMmAmWPm2O8dUA4uiF1ixC3D+RyGt6nSiJPPVo/6o6m2EtcmjFxcDB4QdWSPe7FIV
         /aNH0eVQPfKDP4DNlCvOZ2ugu+pwQYhmfB8kMAhASB7CGDPNg3miGvW1HKwbwpF+d/eH
         LiHPUf0WREdqYzwLcViqVRJhLm+tmCaeiN3w4n28YQ6A0PWESdthDdzgU5I1bZ/LnBa3
         Ll6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737135784; x=1737740584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgnpqUZl4hGYbxcYQe+A404fQT1bwy4DECFrl03821w=;
        b=haxNFlnS+3/8jXKGs/8J0rakeLxkiHOf5WQkHzyktwKuheLbFSzYs4oCAsNBKzxR3m
         wz5EUVzIpzZ6LvjjlLdppNED8uesLraK9VUYnkFz77R3ZdD/J+uGuL7YyaOh3TI9Prrk
         WyQtYfd534ByMFOPddQLpJBXurG6pAoUnUJj7NFxQR/1cIaizUyQDME9YapiX1Jwrc+O
         sbrvr6M6SiRdNrkfuCNsuuq4b565VmMtGKHDsWzWpBz+RhQFEKhUzARSUjKYKBdmGYkz
         XKPx8zQOLj1Q/ifIbYAr9qSKLzZQd3PqVpipOEYoCL3wKbGvXtkrtnF2TlE/pSVGqEML
         lhWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZA5xh69o8n4UGeUCkTBLjS+rVl5fCgC0717rSbgBFIW4RmXk1wQeO+V2pXdUyielCpGNIhG+fDzZTJQ==@vger.kernel.org, AJvYcCWSBY/BNlV/Jy3opWPaxwo1ja5HLJuu18WyVG3TXfVqmt1bxhADpCVo80DzoGeP68uPuVQ9LEfy4VnShj01@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4g8QKw6P9W/wXcTqeyEU/KElZUOSeRIbM73+bnSwKtWeZai8E
	k9PGZjIsoz5JEaQmov4KpJxDuTuGc97vDJj1K3IQObkGLJJpA55H
X-Gm-Gg: ASbGncusmUyt/kyhW1nzf021NMA1So9UFUJrimbz2ip25TopVRpQfWd5SAK30Iq+8EV
	CX1H9sPbCAbLxogiiAa/TKh4CxATLLhlMLgVh5DdaV7Yb6BjhtRl71o2HH0dr1zC+cc8GMwHfsY
	veMe4hFexhDNhXrnWtz7gRKJpuEBg2RhrOS45W3EvSWUkwaZdWr6xguUihoIY8PWiulLTkJXkxG
	dqddK7N/97SCEwnOI3m5OK7MpyjyaxU1joWFJzmD38lIDn9ZlSFk7VZIg==
X-Google-Smtp-Source: AGHT+IHErsTqbqdHjEXJCkqykIjKXRDSizLWWjq+vRoWTFtfHOrbmHOSO1sjDVA793dJPI1iAIHl2w==
X-Received: by 2002:a17:90a:c2ce:b0:2ee:a76a:820 with SMTP id 98e67ed59e1d1-2f782cbfa62mr5635679a91.18.1737135784060;
        Fri, 17 Jan 2025 09:43:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c15bf82sm5564519a91.7.2025.01.17.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:43:03 -0800 (PST)
Date: Fri, 17 Jan 2025 09:43:01 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, u.kleine-koenig@baylibre.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v1 1/1] input: tps65214: Add support for TI TPS65214 PMIC
Message-ID: <Z4qWpRNvn22XRV1E@google.com>
References: <20250116224009.430622-1-s-ramamoorthy@ti.com>
 <20250116224009.430622-2-s-ramamoorthy@ti.com>
 <a14f5f69-02b5-4398-8639-389626644b8f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14f5f69-02b5-4398-8639-389626644b8f@kernel.org>

On Fri, Jan 17, 2025 at 10:23:58AM +0100, Krzysztof Kozlowski wrote:
> On 16/01/2025 23:40, Shree Ramamoorthy wrote:
> > Update descriptions to reflect this input driver  applies to TPS65214,
> > TPS65215, and TPS65219.
> > 
> > Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> > ---
> 
> That's just churn...

Yes, when something is being reused we typically do not go back and list
all the new users unless there are other adjustments needed.

Thanks.

-- 
Dmitry


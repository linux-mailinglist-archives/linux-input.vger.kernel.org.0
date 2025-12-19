Return-Path: <linux-input+bounces-16634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C4CCE95A
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D458301988D
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB26F2D4B77;
	Fri, 19 Dec 2025 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frYr3M2Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2722417D1
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123268; cv=none; b=TjInv44z+/+dGGxjbHeIf9RWQbvIq/59sJsklNpVyB7hAxn2dbFXLw4p17EPfGqNrPM4QnSh+nCLbs8KBc1oo4AESjGV+xHqHzk6J1PiyxtfuSKFx03f7CklkYD0OZVesKw11b04UIry9T4jAcwd+qLDNQ7FOXYcPrEJsKkGUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123268; c=relaxed/simple;
	bh=qt82SR/vP5Y4Y18D8U8WzWGSwSBnYC+Vs15v4LyIptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkQrsAkSCZfg8K+NjmfpybFWGFgk+tiWnoYaNU0mcnd5FamsnHMnBrPwL9Rrp+rLvJ1/pGdaDP9yQ0GdSIeajGyYO8JFuQlK4PS9OrVhKnL6gcfeEN2VYpIumlM5sekU8TC2iJjZpFhjZ7pJtYUv6vZpyEdLrAGX+vVG/Ldxcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frYr3M2Z; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29efd139227so17869205ad.1
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123264; x=1766728064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=frYr3M2Z72/hM1G1Qn1Jkw4pCMqob3tooEcGJbx+NVav0zH0tEZFkTTmb3rn77O3x8
         BeAIkOITuSM9Yuv23Gdb0zRYYQZRHIdxJzMpeYVs7ZJl0DY4CyX1lW2s6l+MWewHg1Wi
         c98qGSZ3tdyYXxf8lhkC5RQAczasdXXuF18GHPtlAidbyUAjg5+y79e7AJWdX/SwocNH
         QRwncHWwoTkX3wUuRgs1tUnDCb23lfyNH/iLuus5f+FJOCewIHMpu2RBLO2jnxA1arC8
         VLDVXxToGNqYSnIhJ7P0RYMvsv6YNhK3BkwpIh8ba/DPAOjoi9r8J5kSUqodP3sQchSv
         9PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123264; x=1766728064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=YP7oW9+6HVDoIh6si/D66ny8fZEnCCj9Cxbu4B9EA5CotI0PJLQ287+LhUSmuai801
         3ELE/3f/a2qGE2ZkjkkswDlPExm5AToPuAb+iWI6V6LbwzBMlRhmgFBkqf1XZOb6u0/q
         ukYChTN4CrLxTv1VEB85paZs9BpWpAmh/qqrNcalQrGKX1Kh63kyax3vZ1538ao9M5YS
         0NfViE3RrkMflJNAFkzNjH2pQoXLtvqGMvWDZTMk4QpwWwdbuH3ii454zWhGck6ih2fB
         zy1dubFeVCbcE7yq9r+grvRMzowtLhzqgFwiz5amQDdquwYKyKDFXjk2sBOUW9Rj126W
         TAfA==
X-Forwarded-Encrypted: i=1; AJvYcCWjeYVDtsBBWYbR1XLaK0aHz4gpZAoVKZ5v/0BwrIOo0btEuZh8hYTJTd0/63qced0AN0xmdsIGIZs5nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9px7O5bJ8KiZgN8fxpDuYDm4Q/QBj5/476ton/PEq4u5lvWG
	asHl+TJso+w6+sZ3A/66p1Mu5x6ddXQ8A65JLzvsSuiNRVbWcSelhGyk
X-Gm-Gg: AY/fxX7hRPnaFQU+m5uFElaOF5rVkI60+jG8B4W6Iw7B+o+dMOygAHK0sH6AFs8WO1M
	FmLpwfR3RLWychQpT7IIAECrIP7qH+Zc+nvTkGABe11QI5gMof5tjqw1JP+tzNu9quyfqCbtaIu
	vgObl2SP9Pw0z/kwvdYwc0R9hM32diN4J/PXiNb3j2GE3It8XzcrVjeuuyBKYa6mctColWBQ5wK
	Hjl47JUsFE8FeYTce3Nti/rBTAONW2SDMcFxbl5+OhyBMi/sPDDcefyPK5JZlK6Pz2R1Ho3AB4X
	nzpt5PK5ynCL4xtINIjCxkPFBH7qAAcP3cLp9vyjZsSjPU3xSjZL2fHCpmxMMq2Q0pkZlurfYAM
	CEbRs+YurRFXb8IGToqFhXUns4Ckn/uSqWBYz3fOPfpubqADHmCDb7gEvLuUHMLcmlBheRBpeyU
	iR8ZZR1kyJDKTC9cGjQxlc7egamd9JDTo4kPwItKQ7VJjswHCS1txBjyGcz9RhgZI=
X-Google-Smtp-Source: AGHT+IFVBwDVTaEx5xp3GqAkaC1oC6P66f5ES/MfkM7Xqee++lMNo0SereuLr6hl3BVB30yHpD8ptQ==
X-Received: by 2002:a05:701b:2615:b0:11e:354:32cb with SMTP id a92af1059eb24-12172300658mr1959588c88.49.1766123264305;
        Thu, 18 Dec 2025 21:47:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm4895244c88.15.2025.12.18.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:47:43 -0800 (PST)
Date: Thu, 18 Dec 2025 21:47:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/8] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <6bbjei3z3arl2t2alkyl6gzok3yanzbni63q5z53mbcabb3za5@2ot3tcfkld6g>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>

On Mon, Dec 01, 2025 at 02:07:21PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> Further switch the mdelay calls on the reset path to fsleep (preferred
> in non-atomic contexts).
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thank you.

-- 
Dmitry


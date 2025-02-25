Return-Path: <linux-input+bounces-10315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C97A434FB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94DA13B53CF
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD753256C7D;
	Tue, 25 Feb 2025 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+JcAQ0Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47714B080;
	Tue, 25 Feb 2025 06:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464092; cv=none; b=IQDGukMSq/Rwv8KPQVYI0TY4jRObM+uITl1Rz3Rmk8lFoODOd1rbZI/s2GPxXOWG4sEQYoNcQs3jAslzldweKPB0OBfe6YvsUCf7KFltYFlXw7Vn+YPB7C4dVh8vtgWD05bXY7bEvsbRbGM5Eg63SppVy4YqbiuGpu0reU1OkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464092; c=relaxed/simple;
	bh=agvOuJoTNh8OTM20uhL6EZgzAA082YyQcg0WmGwlpK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MA4357bafG3uYV/YjpWQ5xm6aw7Yzk/NcWiTAjui645qTeOt0/BkvtEbl34LYBizeQ7hcOsII1fYQOI5hJ5JNsflOYJNEkhib33+oR7M7ViAHUZqQVLCnmYoGfLIEDelU9/4xDoB75AI/7f7i5pxSzdEGioLkkH3QxZ8kpPLLMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+JcAQ0Z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220d601886fso78509995ad.1;
        Mon, 24 Feb 2025 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464091; x=1741068891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=H+JcAQ0ZPpcABOqhNMGnRCEpWKjlHxKiuDROAovMMpUZkS+cMnCqokophf2l0eqgnJ
         D40WYn5LAKbZUiqt1os8EWQq+VXReRIyWELVV//dtDGhrDV0JVCMft1gOCTx9g25+NIb
         DxNeb3ZpGcjGWPceAqUDYAHI5xBvMSOMJHSl0V0BH7l0BJqSMWNvjbhav1qFjrZNDQQX
         ThlnH/0/OHcX/gPH6oz4adYRDpM70DSjEECE8z1aOyoLQgq6fUdwrzH+quc8JK70Uwdk
         UlU7gTtplILZZW76qSNPlBjSbseHU5VpKR9fZOp/7HdChiChwM5APzYl28VMRgYxIyw2
         eMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464091; x=1741068891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAVQolx9KExb7Tb78lU8f9flTHmTgz7gOctqgRk6LUA=;
        b=xKrJK4c3heEkmoC4pu+p1MknSPjWEFRjCldtrchFvotD9D8Yu5sLVPke+EGRkCHSzF
         +M7nu7abEmSd5RbC3JTdY/5KQZI2szaihz4zO5x7GUKXO3tEQ7JtQYYAusOEsT+Wi3XG
         7qIpLgoXsSGXRA6PtGkOSY7yGljKyhb8sKpFQx4yJDNL4FlcvkNQiLorZjzWMP/WofjO
         MSYjrmzmPOmF+RGsLx3AjUQA3rUoTO5HBHhzA26Gw2eo2DYsxZmYnd2qOx1Ob6bMZOuq
         PowU7LSgfc1p5jIROBxGGDOQ/kr5aSiVB7FUhFMUMM+PwYZGRJwbpHl3uizGzj8gZMPq
         UWvw==
X-Forwarded-Encrypted: i=1; AJvYcCUtEurN6EZ1YD7UWP06Cb4tpUX6sEv7+IyTWGXKC5icZPYqrzXKxZswLM7AQHQ74UnytX3sXPqehwFbfKOj@vger.kernel.org, AJvYcCVLevMiBWZx7v2rEyvmQf5q1nswD9URQuqEUvh0qLjsnyi3QPrMdex3mMUg7SqEIMgyApYN6LXj4HZm83I=@vger.kernel.org, AJvYcCXE5ebonN/yaVja0AjsnLVr6ttu5qVZuSRKtgRAHaE4Ktse2QvcZhFbk4E8DJ6M78QPzPIKC0OjXNHG@vger.kernel.org
X-Gm-Message-State: AOJu0YzqhsFEAoIjLFarZTvVBSXv4ezMZAaqyaeXk3NiL0JybnjRVLB9
	OlQcjSsvih/zA4PNXZhfAnqg3DZNtrfDFgdvbC60hzw15UpB9hrAX5Fj7Q==
X-Gm-Gg: ASbGncuBx1w2zwqGV+Rks1IGnISGvA+6Nhzd/ibCjy37sIb37hzqkj0JiBwC5Rwn0vP
	3O38ALw9yqZpHjI17P5pNS3CFxpGtOFd1UNyQpuj2mfu61mJbK/rOQZCTFll+MKZyd+7EXKBSBu
	Ysk3j6druh3XEcpb9QbWeUYD36klZCSKxyMwT8uWPJe4QORK0pZXUmjQNj2zMdffDgtJXHjeF8c
	JasHjS5PjQxghvy0qkZtouHu2c4GV2M9mGoHsvG1qKpgNB/KJYMZrS4YNXeV8FYqlG4J1fsyzjt
	I8g5kpGFkdxHZyhbkrrRhC7X9CE=
X-Google-Smtp-Source: AGHT+IGwkid3k/avMSIUbwqT5je0rV66CDm1UlnOW0Q6bT9hXylAJGMLD+sehIyy1nTfXR9ACddpGQ==
X-Received: by 2002:a17:903:22c2:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22307b45598mr38223475ad.5.1740464090521;
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0927a7sm6292795ad.143.2025.02.24.22.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:14:50 -0800 (PST)
Date: Mon, 24 Feb 2025 22:14:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v7 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z71f18TQLEiexUaD@google.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>

Hi Sasha,

On Mon, Feb 24, 2025 at 12:01:08PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v7:
> - Added a dependency on ARCH_APPLE to prevent potential confusion on x86
> - Link to v6: https://lore.kernel.org/r/20250205-z2-v6-0-cc60cbee1d5b@gmail.com

My apologies, I already applied v6 (patches 1, 2 and 4). Could you
please resend against linux-next (or my 'next' branch)?

Patch #3 should go through Sven's tree.

Thanks.

-- 
Dmitry


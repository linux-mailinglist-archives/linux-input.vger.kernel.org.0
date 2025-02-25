Return-Path: <linux-input+bounces-10318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DEA4350F
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57518189EFE1
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE80256C89;
	Tue, 25 Feb 2025 06:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho/bdoeE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D5254B11;
	Tue, 25 Feb 2025 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464243; cv=none; b=LcuXJtacqGZMKGSMuEDKaCIFubgvFdz0znAq7mvL/tVgX7Lrjfr0i7YVPOWQd9Qk6SPWEbxfh/upIb4Cq0QNEswS42x+6pvtwKuWp/zfsToXcV0H1g5U9wWjmWblNqBKXpfUBzhTw+6vWKHA0EEmA5wTAybm/k8iN4RFi+CfJZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464243; c=relaxed/simple;
	bh=+OIw2U7cW2Aih9mzXBesBSFmW2rsvEzWJRPKAL7iUgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwBQSTd2aCrTlX52jbYKmwdadLRtafyOuqh8R1fRGie7uLxx8vfRipbY69g2fcA4mwI2lEVVdbMcYWmQZsBp2uSlyWrhv0cRFU07KpINPQEdvNDZ9Q6uXAbaluiODfTjKEtGMW2Zm+KaEIcYln4Z4+GamMJFa9JCpdu8JX2pEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho/bdoeE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22114b800f7so103194305ad.2;
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464241; x=1741069041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=ho/bdoeEi9zEFFPGynem4ixJehgzM7qjJU5oNe52Gkrkwjv1D7rIaFlboWZ/JjUSZw
         bw0KUZ8uIhg6xR7bqRXlvcTwxMIfOt6A/b4ijs1a/59X+cgtnn2hIRW/pk6t9bS0WFjo
         nGaKdulScbVJSGrcn+9Sn6V/BW3b6f0jpg4vuBJMi5f6mfoh2jr3936BljsfZJFlgQMS
         yIPdN5b6E4EntF1akVOzMUxsESQeHYuMvBeg5OLgNDYIAWxMyooNSTKl2M2d9XDGjliX
         3cvCQY3CXKFb17yxcCYsPYSLw5kHaotaOxkM8H/+OGkHrzndM75aXoJwq29EUvW7nwsd
         k05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464241; x=1741069041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/ATSqnAwKiVvZcf6pu7CEp14XGA+aCxxd64pSRjACU=;
        b=BnrV8i628hmH7bd7H5jtJS2vQpfWLRYhmPMlm3sNp1/CeeVtytSK7AoAwaBedNYVpm
         F1u/YnyQF8YM28hlAhXkEsOjsaNBWQojDcc/LAozyB1CMix8pctefA41Pv1KYCsnJ1JT
         ycvRgYyZfAeaHZSiMan6oevdCGDtHi1FqVYSHoGHuqjz2i4Qbmck9OgQ2UUYqnaXF3aG
         AuJlA4lQv5cZH31QIck8sBhyEcmBqy+PSsPzIU1KPKrlxx1v8sEXlhA+OWnNnVNbYv5f
         LoAA2wAzjYr6xdXeY2kSWs4/jRTW8pLSz1DzgeJMIQ1IvJXaivI4I4ORoO5yEzbGk7l/
         m3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUs+Eh6GGq6EYi3/Q/nXiG8KvP1cWpvgVyvAaOYlFxzK6QnX/tmFO0tsEW8rWL9XpOH6FxTsV4fqpXezges@vger.kernel.org, AJvYcCX/ytqd5V6PmK+vQpSsa3gsGg1Cimj5yRnyUqaGSxJxlJWJF9LYVT88sa1cGb1NO1/xZjLnARUjUFAaBb0=@vger.kernel.org, AJvYcCXuLPfZhrsDF53CY/drMWJ//xKP87LBk5xG1qnNlCTxu7MAu/+LTv7SODLMSmXuuo+2SxsFMOmj6PwP@vger.kernel.org
X-Gm-Message-State: AOJu0YxTLi8XGAxA34ftEVSyJ6uJMybez5rfCd7xShUVrkpVVtg8hOae
	01xNNc/iiORX/7sASLVaNBOgow631RScAnWBpqO8VHYO1aDlJfez
X-Gm-Gg: ASbGncsBMW10k8MRb5PmSTyXqn+nEbiRNogVEzMFg6sY/SuA9n4dmCa8wVf/4aLNUn1
	TGvxkxDwrlXep2XZ2jXSmc4v9qU97xuJ9AkAnOdfN/ECpj0jqyXtTltYcAEyOjIzQjt3FsefNDm
	aQqCLGox5I/8WyZRlH7PgfEQy/0+Wd+PrC0EtFH7S6GdHH/KEhQA3YahZx9WmxBi57cEAvG3O6b
	ANVo3O/xgLfJ+aekUCpOMShyKbmC8rTBFVdVuTYu0s2fIn1a8Yxi750HxamwQ4IDqqjuK2uboI2
	tGkt5uZB5sKugo5cJyeD3JgRdA4=
X-Google-Smtp-Source: AGHT+IFdfc+NREhBU5f8tx8tcf6BbapEfu39IDYdFhX5e4nIcAOaurJrGx0qrdviMD4V0yM96cEyOQ==
X-Received: by 2002:a05:6a20:6a10:b0:1ee:73ee:bcf4 with SMTP id adf61e73a8af0-1eef3c49054mr30784128637.2.1740464241392;
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9b5csm686996b3a.90.2025.02.24.22.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:17:21 -0800 (PST)
Date: Mon, 24 Feb 2025 22:17:18 -0800
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
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 1/4] dt-bindings: input: touchscreen: Add Z2
 controller
Message-ID: <Z71gbmXAHjX-BTrD@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-1-c2115d6e5a8f@gmail.com>

On Mon, Feb 17, 2025 at 12:38:01PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry


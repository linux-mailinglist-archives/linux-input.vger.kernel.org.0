Return-Path: <linux-input+bounces-12045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2AA9F605
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 18:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E676817F3D0
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 16:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E141427A929;
	Mon, 28 Apr 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/Du8+ER"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8027A122;
	Mon, 28 Apr 2025 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858487; cv=none; b=R8s+IYg88BPu+Fbv86DAlQ7eMAihbaJbOzE0PK9Mnlc0FkNGeq7uRV7DMHpGE3lduWiti1tAyIpQx7jsmpxLehsQG1e6mvkl7i+dBV0hv2YsepcFPfNjIeATnHx3ivQPDgOMkCIdokG0w0zWYrNMr8zpjvK9gECj4mTuk3IBWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858487; c=relaxed/simple;
	bh=QzeqsQmPl7q+5IzShp/s7Qigk9UcbxT5FKZM6T8FKwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9K59P9AeeBTblc0Weqn1KvPi9obsSon8WCYdU/wMbV4fWEWo+tS91Fejm8/NwbwDGxaY/hYOX8rzpqvqiyoaP6SzKsD6F3up87ZQVsOQSjkOHmYwBxFkdiF1WhbtPAxLBd86laZ8HUwYVzGzfsdiYEIuehVi9nASgqRJ+hMNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/Du8+ER; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4635302b3a.2;
        Mon, 28 Apr 2025 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858485; x=1746463285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bKnxtUI6nx93CIB0imngqo7gf66G5/z4JIMwCRKMZE=;
        b=H/Du8+ER9StKa+/GTrmYUEZ6P55sZs0ejTsY96VSuKxMs3fnCnToWJyKozP/HMndZx
         2buLUfwGNRR6siJssYa+duBH56GCihDdR+WRWVCWtARX9FfVBmfUJIa7jvegq56X8emu
         y+1XypiyX+wQSnTwE6IUCx2Aawc14SVjLvZa8PlsEYTXV85UNISbBGHhKS9bfsg3wplg
         HczHfkfVQXKD/HCIX6g/fEL7leCsWGtd/qa/7DsEYul2fji49rsfJsHDOwBMMpaKyqdr
         21pW+tzQzOpBd/wNmJlPQMPWdj4UvDPvinRymi8llRqytn6braavglYaOyaJDjhsZxEz
         fSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858485; x=1746463285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bKnxtUI6nx93CIB0imngqo7gf66G5/z4JIMwCRKMZE=;
        b=Whs7EtoqrD5+e0tERj1PJQ+kySKrsMo0tISkf00sK7qF3KxRlKOdglf+yk6HdsnmSh
         K0IWtwEKpP/dAW2UCso9EEEB+Z09x3uo3tyr+GJ4CdrmlP9KvcMOR7Z9uXr1ED+7RC4f
         1Dkg3fZ1a+y5ShYuRTeevMY/cmdGiGMAkhedAOMWdgRLMmZOTIVUnuJcshp4S2yal124
         HvvFwrE3kszElgRcwoTY1krMqAtaN5DYwSCyft/k9yT1UAc0+3H0UNBKeZAXgKAe1xtG
         bI6Mo1v2K82NgWOZpNhoVOjxNhrVlGlmYk56g+GXTEXKQvMhJwRmbfRTOlRLLUR1XCGV
         DZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9sW0FWF3L26Jue6i5dad6i66TfjQEFTYJgWJiYSsUBw8ovi701LF1ebmvuevJSTXHOuCyJNwpHw1/@vger.kernel.org, AJvYcCXFpIrwRgXfWaLRGvjXNm8aJ/xkQhM6CpzWHtnd6qks90COS8qACNgMqY2gyLTK6s5NqKLKS25OP/MWoyA=@vger.kernel.org, AJvYcCXtBFLLk9pHsY1aYZGW+1SKrPo8yzDaL+I3HxlmSSt9YRD0abetQWIclddYo8T2Eg6GreLn1GRiMT1S/FWg@vger.kernel.org
X-Gm-Message-State: AOJu0YzMjNvtAu23NG/OEMNjHQKVQRhkHJPKF64USsbmS5DhbOSrcmmo
	dC2Lgc1Xu3zS+LZPhAYS485RLdRaQhLaX7w61qEwU4tqptYahJWj
X-Gm-Gg: ASbGnctr/TEFsxEC1C3AYIypO350h/mwtjnw4Vfl8rrewCNy0Bp1eUfllkyUCeYmRVv
	dhT1RziJGYrZ70lxrAt27DtF5cuUEFhsCC37rqDpc6UrjtJLceBLrq7vSaBY2bwqmtPBlIpp/oh
	4WRTqnuzm9rWtjyZtDOm+z/QvJP83vXZC4fe6IhpsE342O/ZxC6AL/0nbPhoP4Bbffua6f49lK6
	ZDPTXcfA1SKnQHKM89rbMd9WgbNvFvASuuXHJiJQGgKO/7D2atLBRrD6DhNuzPkN1eHASA/+36A
	BrLsh5F0tMSA9FYXRHAFXfrV/UYTBRz6swhGYWeX
X-Google-Smtp-Source: AGHT+IHL69QrxwjhYu4/55O9zDlBA1SvHCz6iujXxZbkeN59cSS1ILYQAkqVjkEEReBaabOBFmdJjQ==
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr14787124b3a.24.1745858485343;
        Mon, 28 Apr 2025 09:41:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c4fsm8163918b3a.4.2025.04.28.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:41:24 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:41:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] dt-bindings: mediatek,mt6779-keypad: Update
 Mattijs' email address
Message-ID: <kapqp5k5mlannxgk5hkohd7q5xz755kfkdy2tqgkovp3xj5smz@6djbotrywt5z>
References: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>

On Mon, Apr 28, 2025 at 10:35:13AM +0200, Mattijs Korpershoek wrote:
> Update Mattijs Korpershoek's email address to @kernel.org.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry


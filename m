Return-Path: <linux-input+bounces-15090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFAB9C2F8
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 22:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66CA19C17FA
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 20:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97A52AD25;
	Wed, 24 Sep 2025 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG/slZ7l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D78F54
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 20:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746830; cv=none; b=nbsgXJMMA23J2mgtOH/n6PcDUAxLb/IC6Q6CJYAA2jArg3jVk2nVGQc385ELge4bERkc3cffD7YHCrdLJdZk1H85t0REYo+bRSTdiIG3r1H+vKYohz5ep1AuFE6XpXwbtAY1lzmHIIlOEU21+CHh876lAPF71nfIHQT4EEebqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746830; c=relaxed/simple;
	bh=/wubRCVudmsrBQ30JtUy96kLo/ANA1UJeqjl03QRQeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laYGF9S3CjWt3UHYNFr4ZhuJTMEkPd9JAM1Z5rCBwK5Td//55cfYQ1o95tV7uDvTpSfG9tt5ArGgrS4IdUUQEuLUIo4UOUL6iTsFUHgWz4p6/ApfS0tcHooZEvtagCz3FN6Hc40Xpdn6ML0B8R1P3yNK2WD2j8CgrCn1beaDxoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG/slZ7l; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so370950b3a.1
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758746828; x=1759351628; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uz5b/SWGJp4PVPnMnGvykn1mjKR+ltxumCbS3PwzZAA=;
        b=iG/slZ7lkyXHk1VVZwD53ZP0ndSkryBkiAjhAYqWSIWQ0l+zBElACOmhDnryNF4Fmw
         a40vvoti9EbK0JRogbKVq/8OWprzajvRbxj5TufMjkltTcsV/6ySitiwViOgKcTIuoUr
         vx73XjTjxUYFuZVtVgTUoHcwmlWjtdbMT4CeHXNvGe3accqV5PbK9APlGFg6oegJZYRu
         sf4xoUwhLxw4bvzYHC5rr4+kQh9ojYelDt6RsVcdz9LgMBdDocAZnd+6hRlvZzB+VX5B
         YMPM1IJenBHowbGABA5EOBjDmCSDtxOi3Po7EE+iN/yTKQuB9eOYOS7gVBG6VoMW0eQQ
         pBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746828; x=1759351628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz5b/SWGJp4PVPnMnGvykn1mjKR+ltxumCbS3PwzZAA=;
        b=X2n3NkMZ0sFLcw3GBRQk6rC6DfwUmrzIEJo0saMRQ/OUyoQvBc3wwrXXk5EfjYOypm
         Q2Skjx/TsYKKkuMpZlnGKUzgwibqeuIx9xcXY6B2UsKOSM2Bkh6x/IyjyFnVQ8OUjMGT
         C+djWuSOEf0c33nzk4QRs/jAo0WgdFmf+tj/6ubFhy0e/OwdAtlIswz/1KuReIWPsFm7
         bYgWmEKv+LAPkzqSI7EXWkH6rW0fKcHo10tAqRtrR1ph0tU7AtfyiY4vi0l4qQn4gVkQ
         /4RujwIpBh+23xU5Qwg00A5o22Os6/uri3MnBr5OyjjscYA6yAcNIbXbOTgD25HDNmzt
         Vbgw==
X-Gm-Message-State: AOJu0YxeoBEw2/4e8vfEfBIRW/sWjxej7NnFpOtZl6wBNTLzpZqDTWUr
	hPnO5qfsAaGcZG+dPEcxSMEvXfnHWbAdA9YXEvp6tQHQmbrTBuDmNBajHeHrFA==
X-Gm-Gg: ASbGncvNUPNW9OlduUaCt8YFaG1Edx9hXGf/Nq7t6Fm1Gllx5Bl9SkzRwtQa4/HADfv
	revxm+auYJJm80c406Dvdi1vKt8I8Y3AhHMKSmgNRFtFIe2U2JIjbn9SmQ4/wzIK5zZPsy7zZhY
	cUEn9SaACciAvpLAicRzsZFwG4vKTg3ZYIzC+NYNHgF6Rn1kJ3y7H7wFYbMMe3lFb2JxAZgFjOk
	KIiU1vnKCmFJhjxBh0IQFU4S46L2/o+RI3bquNu1Qowod4IPPdBb7DpC9zY3vxHlFxVIFRt8m7x
	ozy53s8tSGz4O8SzUy5+M2Lnt0d9bt74fkSURY1fgdh/dMsGE3myKLEb6KCJ3YfyR0vWgosTiKY
	rDqUp13h3Z/KnOiTf/xaFNuJcM7vPZ984Mg==
X-Google-Smtp-Source: AGHT+IFhtij1snqb5YmNiUxxhLFAlPngjUoBWbojYxm4jaQCU68Yvkxe8ZDdSxWBPwsKHM5RwYoZgQ==
X-Received: by 2002:a05:6a20:6a27:b0:2df:37cb:6b7c with SMTP id adf61e73a8af0-2e7c42295fcmr1088119637.3.1758746828457;
        Wed, 24 Sep 2025 13:47:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c52eee5fsm180456a12.0.2025.09.24.13.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:47:07 -0700 (PDT)
Date: Wed, 24 Sep 2025 13:47:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: j.ne@posteo.net
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ps2-gpio - fix typo
Message-ID: <bcv4wihu47ala7jtv4daczh7olarwdbdbsfpoj4l5yk2dj6vrq@5axihop6vn6w>
References: <20250923-ps2-typo-v1-1-03d2468acc32@posteo.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923-ps2-typo-v1-1-03d2468acc32@posteo.net>

On Tue, Sep 23, 2025 at 02:14:50AM +0200, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> "The data line must be sampled" makes much more sense than what was
> previously written, and given that "s" and "d" are neighbors on the
> QWERTY keybord, it was probably a typo.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Applied, thank you.

-- 
Dmitry


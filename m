Return-Path: <linux-input+bounces-657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E080B95B
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 07:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002C71C2084D
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 06:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0790A7EC;
	Sun, 10 Dec 2023 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsHKfa04"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24C0B8;
	Sat,  9 Dec 2023 22:40:04 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35d67599613so21568705ab.3;
        Sat, 09 Dec 2023 22:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702190404; x=1702795204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EynoV2PXYriV37OkBd7LflakvlW/dPuJ1KwDl4hKKJs=;
        b=MsHKfa04x0sHn9LIGf5VDdQeDylwIAGsauwUb5Y98E9s0qwtNSyb08xNilK04tDWzU
         A4srGxNuNNlJ9eeOu06aY6jWAfp5EEDsEePp5KE0PQY4CCDhBx9QalH+P6mCqjyHwQsT
         nb77fJHqiexbcOScgSRr5zaqs/C59YmRFKznpXwMCIQHlC2EdTksMoVSjn28r7PE9O6s
         9aGnjcmWh1m8n4mXRZa9BkKvXgX6Gao2oE7LRo8ha3so+WBjFKfaKGX9pfVFGvj+A54y
         j633pIKi9jyVc02tcQCea3K0OOnUCQl/GnaY/XDP+SrVdis+kcn4l7Ss9KmWkkXsG0zp
         C9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702190404; x=1702795204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EynoV2PXYriV37OkBd7LflakvlW/dPuJ1KwDl4hKKJs=;
        b=nzHI7viE15hifVavHE+4o5tZhsKRLOIg8DJZAjRd+/dgt+HGUivRxO6jnXBSP9mFjf
         d2sR1Rc2nVwtEVZVVJzc+KdYBdzyPzhw6oYa87yHYmz2QORrNcVGbpgS8EMd3nQshDaq
         5b4tGXkMpYYCRAENotkKEOcApRJ7kT5UWZFss534T0xkrGOO31LemxhqgdbL1MgBCJpt
         B4mMy6N1UOtRi6ec5gZSivnHnOrcGAKsdWAMlhfaTNLFOIrmUWNdgBzH6F9UL/C8t12P
         bCjd8gZ5HbG/LJOiOmH0c7gXqxOhbwemo88vcTuh1OL07x2er+65X1CT7knd0YChPh0C
         pbNg==
X-Gm-Message-State: AOJu0Yyz3pLMukmalgz5SlDlme6r42Dcb2MF8otNIfnJjPQi5+4QJZfk
	4Ai9c55y2lOVUggCFtNKMFiduB3U+bs=
X-Google-Smtp-Source: AGHT+IFT4rzupqEde5Wa9N8+6c+71cmUf66Ij5te2pqLTWuzZEgxsRpzDX7kAIBFJR0XCHNOTyyHUQ==
X-Received: by 2002:a92:ca48:0:b0:35d:64b5:a963 with SMTP id q8-20020a92ca48000000b0035d64b5a963mr5014094ilo.25.1702190403857;
        Sat, 09 Dec 2023 22:40:03 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9082:8aa4:377c:de99])
        by smtp.gmail.com with ESMTPSA id a21-20020a1709027d9500b001cfed5524easm4287566plm.288.2023.12.09.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 22:40:03 -0800 (PST)
Date: Sat, 9 Dec 2023 22:40:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: pxrc - simplify mutex handling with guard macro
Message-ID: <ZXVdQENays5f4l3b@google.com>
References: <20231202-pxrc-guard-v3-1-2ca8bc8cf689@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202-pxrc-guard-v3-1-2ca8bc8cf689@gmail.com>

On Sat, Dec 02, 2023 at 05:59:48PM +0100, Marcus Folkesson wrote:
> Use the guard(mutex) macro for handle mutex lock/unlocks.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Applied, thank you.

-- 
Dmitry


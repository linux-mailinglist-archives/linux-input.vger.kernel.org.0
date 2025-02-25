Return-Path: <linux-input+bounces-10361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A65A44E21
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A743A932F
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 20:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24D42046B1;
	Tue, 25 Feb 2025 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hODyeU+R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1EDF59;
	Tue, 25 Feb 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517150; cv=none; b=Y4Nix9oX32G3Acde0SW2svrr/nx4ozGnhYTKkt6oJwP5XGf7DuZVTxlZQnK8t8iVbEPp9URcpwA2Q76tdoVx02xK9zVGDFCjLYyyAZKpU0C0w8It0tB39c0szgVmQvlK56DlxnxFHgYt1SEmAQ7SaB8aZhIeX7KluPvPxdoVp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517150; c=relaxed/simple;
	bh=IUa/EqCGMggMTdvnmZ98pkhqTkwU3QTApiJmSgwhVzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlN3n+mIxlckqQ7QVIjq9CGUiS6L0pxT0BEZSfa49zahbINin/ldaFCFxT3G/le1v7kGGrkT4k06BHwShORji5zp9CvkNFyTSW3UaTq5ioNfjAL4LyH1mZ2TwiW/oaPO3lE8l8JvbhIsVHdpFVQ5aNSpoT21iXR63N+mVIki+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hODyeU+R; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c4159f87so87538295ad.0;
        Tue, 25 Feb 2025 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517149; x=1741121949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cx+DTuM+S3pjCkvjagETiUApcILKF8GI4XrxIDKV1Ds=;
        b=hODyeU+R5DmdYF+0YPUnU6jO5wrMeyxVVByXDTPiuAq96Vvn98pWYgNTTQjdYJvFK4
         v2cSl8b0COucaMbxC6DsyCCRoE1eeaMl0bwl+BdKQCQ+ckUsI5Y3U7+HXTl3QtuybpqL
         YQFcPWmDs+PhFo5ctWlcDFpFM/eyw6sRquE+7DT/OHeKXxXoAss0r2SXEGtn5Ywh4pHW
         3nOEQP9NP2d24gSAwGh2CVTNcvE/Shfm/bILPm1a8J/6+2V5lAKV4Z8sYOCBzSl9CeL9
         PbCpHShGiBYmMvvZcShI8gGQr68nIDRMEZbOc5ExPpGGuE+J1+6or+q5FUBGLdvq3Ue8
         xSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517149; x=1741121949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx+DTuM+S3pjCkvjagETiUApcILKF8GI4XrxIDKV1Ds=;
        b=hbWyxRiRnuuK+kB1kZ/RbD888bMQRhqDvS9PLLKEjOwMP/vpHm+ZKTGPeeLu+tVMUH
         BGz9elz/rI5SR1XpM//9U8B0RQdp1ipeLHHwNinvn3pBN66OCfHP9HicXmhG+K622gUo
         09KzwLTczI6/Y7FQ0v6Nf/4M+7RYSuiCa9cLgka83yg82VdXeNNzeVsn+iRwlGCgKqL5
         MALaj28+BExhOWzwHFSZXVe72Y3iCBZ4Br0drPkc5sjFj0auZcyTVgt3JMjCljuGfeSZ
         LviARZtekNBZ6xQ/l1IKCoyd3JcZ/QAdzRmq4QJNhlY6NLwyQnY4AQcELJInnXYe2YWW
         o1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZpGRn+Wk7vdK4+fvZ0TPF12ZigI7A9gbI7J6PRI2GCik5cSoGCdxU9qHanqqfAUtyENL6+m3DW5xX0I=@vger.kernel.org, AJvYcCXzrfT44z3+hvPHW46gsuTCXH2FUC3pf0BPXMcUBiXDnx2KIHfQAugad2gUP5T2PwfLq3nG7vj0NaoCWGAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RifLJ767+4kudBzjPybZhebbev0X2DWQLWG434EEEeiRVtJd
	Qmjxg+NNZy9uR15IoUy+RNTK9QacoOpjDzsf0wFTtJQ/w/hrV3nKrsc2sg==
X-Gm-Gg: ASbGncvQ/lBKmgjanlXQYV4n/3AZPE6m8mjzLd9Yl4fszr7joEy23wE3C4OfUKaiLWA
	Kp99PEW7orHjh6NsiA64ta0CNXBHXzVNwf5cJRebZ8pxCTADtRV5X7FfyK0xF8IzYDY7iUmwXw7
	EaSxC3o6bhYJDBdDHDRX3iWWCPiau5VewoIGY3ptZ4UCWjL7/82g47GMSpO+Pgia3nH36hk3ujv
	HMoHqnlr2+yRjYQCPgQAUnRF2dHfc+zxKjjdutOhHg7aCQ/zxmaFsvjEOJO3NFVYTfFxAKnrkPg
	xEIc9n7wYTFEpmYPhVXOTajx1kE=
X-Google-Smtp-Source: AGHT+IEHlT6XytMKDLbwVbqri8gh4lG8ehdNDBBokqPrCzaiiSa2E1XKUddLHDA7h8HfKgYPjGB1FA==
X-Received: by 2002:a05:6a00:1ad4:b0:730:888a:252a with SMTP id d2e1a72fcca58-7347918d99bmr6418549b3a.15.1740517148664;
        Tue, 25 Feb 2025 12:59:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6ace59sm1989107b3a.5.2025.02.25.12.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:59:08 -0800 (PST)
Date: Tue, 25 Feb 2025 12:59:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: David Collins <quic_collinsd@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: pm8941-pwrkey: fix dev_dbg() output in
 pm8941_pwrkey_irq()
Message-ID: <Z74vGRGiHPT9wdn5@google.com>
References: <20250216170336.861025-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216170336.861025-1-dmantipov@yandex.ru>

On Sun, Feb 16, 2025 at 08:03:36PM +0300, Dmitry Antipov wrote:
> Since 'sw_debounce_end_time' of 'struct pm8941_pwrkey' is of type
> 'ktime_t', use 'ktime_to_us()' to print the value in microseconds
> as it is announced in a call to 'dev_dbg()'. Compile tested only.
> 
> Fixes: 0b65118e6ba3 ("Input: pm8941-pwrkey - add software key press debouncing support")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Applied, thank you.

-- 
Dmitry


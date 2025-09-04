Return-Path: <linux-input+bounces-14478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B409B43B8C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BE711764BB
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAC72EB871;
	Thu,  4 Sep 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyJvHmgn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E52EA480;
	Thu,  4 Sep 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988869; cv=none; b=g/DgAcQEg31REzS4hO6iDRcQF2Wl+UmqShi0J6yb+PTdUY00gPlRyoUp9sOb2qbJ2EcOY3x3py6KKEo8T/gobVB849kOb1wP10FvKdzqVpFTPR2WGovgulBUwSleEHx8m6WWMuG3J2L39VEeVEck4KKLXQp3NimxWfI+ODpNs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988869; c=relaxed/simple;
	bh=wZDhbFsgmTueBN/a2zLR83yhR4/cUs6y8TYhFvqGpEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrVYosgUCSXXTBmC58c9n0LexkozNDcpql5pNM3w4SVdXCGPNSpDVs85fLpuUYzfJrM6R6RpZK+mSiXOefFkkN/887pxeafBQm5L7Z4mkBUMJ9Q+Oc7SRqdfQMJ3VxAMkgf8ipsw16cWOBWRYKwp8YScasnTMoNfKQcRaBMuQ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyJvHmgn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so697418a91.2;
        Thu, 04 Sep 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756988867; x=1757593667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+6RnTXTsFZV2E77rjI/+MMkmxPjsaktk/mW1McK42s=;
        b=eyJvHmgniAaJhWA/x2nWFU3k/8+Wecf870pRzaCpxyHR7HIq/Y2qGIw2IaFgzrRMJq
         DTRduqtroIUYl76C5bFsPR9guhakRbzB7TtZ+/2JpB7Spe5t3vwmMofax/psKTnSIS28
         czTg1SFp6bC8GT4pjP6QV7n1jdRhvEGVS4//rt7AEw+bkr/MnL1baDsv0PgVzyuyQGaE
         tlrX7RvvxfA2WnGBk1id1AifXZePcKjlYmazCIJbfnDzJx7QhsLK0USFbmCC84LT1ycT
         BlKMUOeVxkJ7dCNplYIsVj1XBw6e+tEzAyhymGmps0EW6xf33xzGbAMVQXZBjlkCEm/h
         GZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988867; x=1757593667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+6RnTXTsFZV2E77rjI/+MMkmxPjsaktk/mW1McK42s=;
        b=MxvmjZXe6trrUCmS8FfXnvQmADCaeadbStf5ujpl8r3n3WDtrglYaq7ebp3ItCW/LJ
         1E1K8WDGBZAOl5Ur9+CzlR8qLAI5MZtZKt/LA4labp64eFhdd2JDq7ef485UsPBj+Uda
         gVznFhwiFH48v2dqaaqj7bYTFcXTPZOWjaMlB10cwr/9P6kJAWs7pShZA/fJYfhHLVdZ
         gmDe/hEmdtRKQGDAoIjajLIZ5ZQ+cOOF2CKR5H51kMebQjP0euTFpeVZWDfb1Ao+TgUt
         GlQXUzcmPJUMb0UGRCd3iNSdFkvcUWHGHJa1KsXLECrWszKQniGqdeuk7n45GUwi6HhD
         wFNw==
X-Forwarded-Encrypted: i=1; AJvYcCWkd12BPxPBM3t7VKW+63pmQnrJCkld0c7fuHYfsxH91G1M8H9HFiyNUVnIEWLf0Qv5Aa9Os4QNmSMzGyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+TG2rY9GOdFzkWudF0756oPX62dttL1vVY2EWI3rQXyqPjwu
	W2T7NYFAVgku9uPlavb9kW0wenBqs7tF8pgmvcfguZVrf9Xv7vu6exUe
X-Gm-Gg: ASbGncssqGoOwVDqztqsqCtNdx+QxFADfX4ZOeR59KyDFQDiigiHY0/6wCtsNi0Pktj
	RUsfpRvO9WvXgRIEn31pTSm3OFWeKYlvelLAk++YJIgLr5OnCETxhhUUQEfYMZ+sOXnBOx1P4bh
	PPgle6huRjxlL8ZuIRNaLnBf+tZdpZf3YWFByQnva1l0PHvqEnwPCRdig1oR67sZO4PWTc4zd26
	dAnx2ciBXPXrzc8cZsl8bpxxAcznu1Zb6QbCdsTtTRQQXcY7vdYSoZzF3Vic3buiPZWc3/d3Alv
	6b+GC0mwNegf0JmAVOZrf2hx/faaxfH1BHQjAyI2B2AfHebGeFteSI7lgA0prtWGQwDyiW8f8o5
	in5eFXqylczeERX023D4w4+8=
X-Google-Smtp-Source: AGHT+IGplxNuZwrzLDkICPoqrn6Q2kmNbBGpJJVHaB243MvEBlIyDJyve/PyR5jcmCa8eLNJLz5mVA==
X-Received: by 2002:a17:90b:384d:b0:327:d459:e600 with SMTP id 98e67ed59e1d1-32815452282mr27226305a91.15.1756988866709;
        Thu, 04 Sep 2025 05:27:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b58d8ca8dsm5576683a91.7.2025.09.04.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:27:46 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:27:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brandon Lin <brandon@emergence.ltd>, Sergey Belozyorcev <belozyorcev@ya.ru>
Subject: Re: [PATCH v1] Input: xpad - add ID for Flydigi Apex 5
Message-ID: <u4vua23v2a7fb6j5ysf27fgc3x5li5q2l4zqyl7vw3wf7sn2um@qlbmp7xbgvzv>
References: <20250903165114.2987905-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903165114.2987905-1-lkml@antheas.dev>

On Wed, Sep 03, 2025 at 06:51:14PM +0200, Antheas Kapenekakis wrote:
> The Flydigi Apex 5 has an XInput mode. Add the vid and pid for it.
> 
> Reported-by: Brandon Lin <brandon@emergence.ltd>
> Reported-by: Sergey Belozyorcev <belozyorcev@ya.ru>
> Closes: https://github.com/ublue-os/bazzite/issues/3014
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied, thank you.

-- 
Dmitry


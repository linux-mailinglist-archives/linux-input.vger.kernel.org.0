Return-Path: <linux-input+bounces-4034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 307888D7ACE
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 06:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF757282903
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5C02261F;
	Mon,  3 Jun 2024 04:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZNg3ab0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA919BDC;
	Mon,  3 Jun 2024 04:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717389540; cv=none; b=F2RkE931LgMEJVvwV/dYgWflqpsj/3/lBG6bTp6+Socp83F39/V5kzMha1lmmUd7PcRHlxZT9yZByTdzKVyTw5/RAxE6aCw8Y7ILnZ5NhMU97HzExQ0AGLWj+EFJtThhVe150N/d/DvzlDUAGRVnBTYL8YwLnyAQf6z7oJO9nWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717389540; c=relaxed/simple;
	bh=8KdtnoLsEVr9UtKMZkzhWnd1toDgM5gQIylS8tYniJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce1e7/tMWlLBGnrMhNOMRNi9kjTFIHffVslS6LGS6NcRGTE5t+vgpDQfgCtGuQiX/q7SNFNW3dFKqeHVojFqafIN6kr1B2wwZAZ0gp0FvWrzrm+Sad/AIkZO7rL4JN59gzFjDxHaelb3OxVf8T5En2Yf1GngVNGCrslfunxhpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZNg3ab0; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d1bf6d156cso2027918b6e.3;
        Sun, 02 Jun 2024 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717389538; x=1717994338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgYwcTir7m+MuZwhkrSFc35B5SCMgqECR3ujkTzudEY=;
        b=QZNg3ab08fa2lep5Fyt4z/Wrp03mafWA0wjS8tMHpoD/6ERGqNjpVjF5RnCvYbU1QK
         i7FUo3NOEMPnxij/DO95JELi5Gu6NmK022EzMPwqzh/7sHOz2seBggDLC4JpGiaca8BZ
         BjjE7sOmaL8MYMscMZiDbITxOocAJ4sGrYbSZ8sgJpNbKA+6jVfMS0GEz2N+WM2btWjt
         HISYKFOH6KGyCGjeUY/h+VekUAv5WQhLZ7JSQHgvctb9/SQth6sDLYmUopPzGaaZHtj3
         bqugk3Vm424P6mK4VcygUU7Cxqx2xRvwJ2EdsGYc1QMCoDARBHbHG1+n1ydcxaTb2ULD
         jORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717389538; x=1717994338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgYwcTir7m+MuZwhkrSFc35B5SCMgqECR3ujkTzudEY=;
        b=sbm5fUsdFyfcOzdCIjujC1TNDiMfxP5753urM4XdpJsRvn2wCt+IwxGG5q4y77qf9X
         I43nPMs43UJusyNNlFlCEmieWBWM2wH6PGfMFguPyiIyh0L2HfWntgwEH4osH9QnFO0i
         WKMSwtoTlarN29jRf0RIXG+rwQl6xrgQejiUe6Ukrv2AP331emRu7is/n3mG3NG86jqa
         79S3bIAhali++/OHMSTHG/4fvvQmDhx+8fHzT4Ofdp3vD9CXcJjTbeqt3PurSke3XbiH
         NszRO2OCFtXlHj4Kb/l/pJB/AZdm1mbXZsloKf5SKrL6yTcvK2gKIEazlqr3jVNVRPfd
         0qAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW21jg6itlrDoBsozN1FoHDrDVT/zO8d3rqeoNsraW9NSl0ie8uLp2BB1t6RBHggcolYW8chvwAnGQu7X6EQa+GoHZ/mqpAzNEeLWHAN27n5Q565Dnm9QolO0cSGhpGVO7foev4ZI6XxI6Q0GP429scYwUSUy9pCIohIgbwNSP/LhR8X85qk4zNQHk=
X-Gm-Message-State: AOJu0YwqHOTXzwvYgcbawlWXubxhRUI2i16PdIUVfYQZ5F59fqqxYfgc
	C40IH4gSu295nk2ljbv/p43vM0QsRZ03CD992HQBCMLD/iu5R8oU
X-Google-Smtp-Source: AGHT+IFVPL585/e/Z7yF/M0HJLZukbDvudj5VOhmdHYJ63HF8iNiFY9Xvk2gOw4P7djgev/04DPECA==
X-Received: by 2002:a05:6808:1a88:b0:3d1:df3a:5770 with SMTP id 5614622812f47-3d1e34a1e4emr7612451b6e.31.1717389538520;
        Sun, 02 Jun 2024 21:38:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70245aa1982sm4352629b3a.163.2024.06.02.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:38:57 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:38:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Henk Vergonet <Henk.Vergonet@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	ye xingchen <ye.xingchen@zte.com.cn>, Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, usbb2k-api-dev@nongnu.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] input: misc: use sizeof(*pointer) instead of sizeof(type)
Message-ID: <Zl1I3xksaHPA7yJ-@google.com>
References: <AS8PR02MB7237884EB989EFF55D1BEF8B8BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237884EB989EFF55D1BEF8B8BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sun, Jun 02, 2024 at 06:32:58PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry


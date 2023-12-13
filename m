Return-Path: <linux-input+bounces-747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D147C810AB8
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83CDC1F21533
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC6711718;
	Wed, 13 Dec 2023 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqLkmP5g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B343AD;
	Tue, 12 Dec 2023 22:57:57 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58dd3528497so4074728eaf.3;
        Tue, 12 Dec 2023 22:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702450676; x=1703055476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0x8XsR4YAwwo97TrAM/5YN28oe0YmORax7Uew12g+YI=;
        b=IqLkmP5gF3V+D0swjuf1jkFdcPmGpsnrBVrUJdalFnDUd9wqORSy67NDYBtrhJ7msX
         Qu2j6UDbfjNkgg+lO0+AWlZbQA0J1UsQNmCbVvzzAmMUbvqW5lQI4CJqBLXmgVH1VDVm
         Br8E+nv9wlgzvFSBETnxcFCmgIRUnsb9tBaNev3GEWg5nUcOMCl7iDf4xnq7LGWMRAcc
         QiQXzDeVWL+jvWeoArdBCVlfz+ZEAmRcfVNFZEu+rSwXEi7AKBJYJ+hewiBeHH+E70+p
         cA1QA6W84bmVrQly46IbJHrS/XpB9Atk4j1xg3i6uoDxedFfWYG6mLf7FTq2M+r1wLSQ
         xlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450676; x=1703055476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x8XsR4YAwwo97TrAM/5YN28oe0YmORax7Uew12g+YI=;
        b=rpnAU+q/H/UlJXfG8rCnkOMrcVmbOiE49h5fmpeL5QMcBOjhGz6UgJtAdO5Bpj+bEV
         xaJ6L6A1xqh4xMvKl1woQB+XD6VMRDpGpHEvulcw7wDb8qYfED9PdlU/lt7jkRxspMxs
         i7yAlLjIkZF0nZyVfiSnnbU6Ky0JGqGCZahBOu3oiM5DQXgn1LiDBmXWsw24sC5/7VW8
         oj5K4M1WLPoBqyR9C8uahdTRhOtBwBDAFXUTw/QN6qYF+iSdqSfNPiNrMJsRtsPXB2tb
         zPShCjpxceKGRpjoNtoVM1AuC1GOLW8kbO8SnrzeIWENkPhZD3mCopO0fVeLLIGTh1X/
         BMsg==
X-Gm-Message-State: AOJu0YzLtdQhCmKG72pw1EnieeddZ6zQKxSeXsi5/rTqlEhyrPEBxWZ1
	Q6XMkvPBEUA3GTRHp7polWw=
X-Google-Smtp-Source: AGHT+IElKzhtzSCEhBL3bROQSWht+atWFoSQ0f+N73GnAQYYmg3rf9EZTvLg30skzzknESxlSgmRDw==
X-Received: by 2002:a05:6358:7248:b0:172:93c5:5913 with SMTP id i8-20020a056358724800b0017293c55913mr19150rwa.48.1702450676288;
        Tue, 12 Dec 2023 22:57:56 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id j21-20020a170902759500b001d326103500sm4477635pll.277.2023.12.12.22.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:57:55 -0800 (PST)
Date: Tue, 12 Dec 2023 22:57:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ye.xingchen@zte.com.cn
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	jeff@labundy.com
Subject: Re: [PATCH v2] Input: rmi4: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <ZXlV8Wzss77JLeH8@google.com>
References: <202212021504062431427@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212021504062431427@zte.com.cn>

On Fri, Dec 02, 2022 at 03:04:06PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with sysfs_emit() to simplify the code.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied, thank you.

-- 
Dmitry


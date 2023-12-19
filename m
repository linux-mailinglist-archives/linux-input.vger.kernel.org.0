Return-Path: <linux-input+bounces-853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C31817F78
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 02:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B56286038
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 01:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C107717F7;
	Tue, 19 Dec 2023 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea2iuAYK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78517D5;
	Tue, 19 Dec 2023 01:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7b7039d30acso326456839f.3;
        Mon, 18 Dec 2023 17:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702950636; x=1703555436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0xvDh17ZMCtlzMWyZ3QkQNxMsFP8aXfvo5lLiBPa6M=;
        b=Ea2iuAYKi9caV4O6FM1UNUxr0FBExt8xhQCACLfduPXYYprb1BUTYGA/CrWAhYL6ag
         XO904lpSIh1NsNJ8vsxch132H4+wFA3i+cWAbA3acl0zmBR8qGdJR8cFNwj996scmvhU
         2vezZD82vuc2BWUxAVlWMSPlX7O1r91Mc+whSjjUZQsAX2peuMCCp6wMsSlHbbLz4aef
         XRQTPGg2nfOp8k5EqtIqMO6B4mrbtNlgMZANKFIMSlViScG9pPc1xsdSmS0f2RBJmnnq
         12Y3SbhP4NUsAf1QiuOCXj9TBhSX0OvvisSgOY2d7me+xy88PtwKEJxsVXy4XhKwOnPH
         q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950636; x=1703555436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0xvDh17ZMCtlzMWyZ3QkQNxMsFP8aXfvo5lLiBPa6M=;
        b=qc4RGaGn18Ohha4F/R83aTQo+eGelYMaU4B9/pyFxbEtEwjWc2SWF0ucTHxot80G+q
         Z6bJvN07oc/rQ828ldkInOaDDJLUm2rlGDs9SlBNt2IHtkaSjdPsNy/eOzFIA6j5DHiq
         wdIodaYAg7aRMXs2YbOyJlpjBoQlglnZvMMk1W6kj0el6GvgmvzDrEGkiZNqN60Hhi+J
         79kvHmdUlikdlXRTINT8kVBTPN6Rn/nzcw0aMmj+F1PZayca1OLdBdsP+RyueddtrMXC
         xuPdUAaaKNsHg3aKehrloSFJu80/ZxwuklEEniErMgCLdF6Ru/Gs6fQCVNTvceQnttXb
         rytg==
X-Gm-Message-State: AOJu0Yw++cx7wGJ66da2QdyrSmVELb/qFaGoMIv26GOuw+QUAGcGTXBT
	fiLjrKOgenDPEwBoV6zjJV8=
X-Google-Smtp-Source: AGHT+IGoR+WvxpQ9kCaLKmhnKM9aiki/FyYWbUtzhoPRKmMgNUkoquvrLWEtvJLRFZxXSavtLUvioQ==
X-Received: by 2002:a05:6e02:1527:b0:35f:b462:dd6a with SMTP id i7-20020a056e02152700b0035fb462dd6amr2262617ilu.21.1702950636320;
        Mon, 18 Dec 2023 17:50:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e0f5:2344:80e4:a1fc])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e85200b001d0675e59f9sm19684062plg.200.2023.12.18.17.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 17:50:35 -0800 (PST)
Date: Mon, 18 Dec 2023 17:50:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] Input: da9063 - Use dev_err_probe()
Message-ID: <ZYD26TFmAJMGDOjV@google.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
 <20231213214803.9931-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213214803.9931-4-biju.das.jz@bp.renesas.com>

On Wed, Dec 13, 2023 at 09:48:02PM +0000, Biju Das wrote:
> Replace dev_err()->dev_err_probe() to simplify probe().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied, thank you.

-- 
Dmitry


Return-Path: <linux-input+bounces-748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C1810AB9
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81E628189E
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B41107A9;
	Wed, 13 Dec 2023 06:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5grFS/c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A8CAC;
	Tue, 12 Dec 2023 22:58:14 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1fab887fab8so4939142fac.0;
        Tue, 12 Dec 2023 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702450694; x=1703055494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0DAn5xLi9rQnaABRWF75LVLMVJOq3CUle8klA98StY8=;
        b=l5grFS/cCA+bTXfPvDq9MUiOZwfLFvtOPLzmUG4BT8tpEz3dduWugXLiEbTIweYp5K
         rzZFXZ4gmLcPw3oNxY5ji3ofqyuPhx0t7cVOkDvF53hJXD4jxfH6GLht/Z/NP4QEK/t0
         A5hKjyIqnG2nE274u70M9+AA6wvCHtBRDCHLwyiQvr6qpH5HdifKvFkEl4SCHDIuL319
         BOHz9f25lsx4XmMlVK7DrMCeV+IvKQKSi7N2P2gp6unbVsaHBuFIN5bgleMYEKCfwnJb
         tKuSqIyVmfTPmz80EOaSCJECQtSR8pFh8lfAxRK3xtac6KXZ8gxpIA5jbyiPyOmUrxbB
         ZNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450694; x=1703055494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DAn5xLi9rQnaABRWF75LVLMVJOq3CUle8klA98StY8=;
        b=vQKj5+gAy31b8yquRyCY0VV2uLYGi/kHkFU97qKXTE6IGfXrx3hEMiodX9/qsL09+j
         jWgzrpZkW7HhoqtAfAvfxRemI8LVaInIAVc1wqR82Dcem6qw3kFj5rftxLLc/0QL4OXc
         /KldfxrCN1FfQPchYuPj3SxtLGoWCvHi6qOUwb+sW61LA2sm+h0IPLL4orTCXoOYulD1
         QtygA1nOdf7jYt/p3Uu7j6A7VGXkitYzCu4G2C/Dfdahreqz2/OUeDXNVXK3ofgSVh8U
         nRtYjgw+UZsPdutPdYufN/EcpHUTmySrdB0ppEaNZOEMiy/kJ7KLTBoGiNo2V1V25Hop
         qADg==
X-Gm-Message-State: AOJu0YzgSa/XoF5+8/Gi4nqnkjJUBRiD2+oOfNkgVLDq9Gx6wspNdTCW
	cKBkbXrvIk0d5sYiGxpCNpU=
X-Google-Smtp-Source: AGHT+IG3c8aFQUtCtrW1AZlRJzMEWQYIny2RwUFDnEd1Q7XPoItpD5A7t0a4K7dj7raZf46hIApPcg==
X-Received: by 2002:a05:6358:3393:b0:172:8991:8120 with SMTP id i19-20020a056358339300b0017289918120mr600911rwd.60.1702450693543;
        Tue, 12 Dec 2023 22:58:13 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id mt17-20020a17090b231100b0028ae58d4435sm590399pjb.28.2023.12.12.22.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:58:13 -0800 (PST)
Date: Tue, 12 Dec 2023 22:58:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ye.xingchen@zte.com.cn
Cc: oliver.graute@kococonnector.com, u.kleine-koenig@pengutronix.de,
	jeff@labundy.com, nick@shmanahar.org,
	giulio.benetti@benettiengineering.com, michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	wsa+renesas@sang-engineering.com, johan@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Input: =?iso-8859-1?Q?touch?=
 =?iso-8859-1?Q?screen=3A_use_sysfs=5Femit=28=29_to_instead_of=A0scnprintf?=
 =?iso-8859-1?B?KCk=?=
Message-ID: <ZXlWAlufTzIAk-QM@google.com>
References: <202212061148163560976@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202212061148163560976@zte.com.cn>

On Tue, Dec 06, 2022 at 11:48:16AM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

Applied, thank you.

-- 
Dmitry


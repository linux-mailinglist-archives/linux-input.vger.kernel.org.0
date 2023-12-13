Return-Path: <linux-input+bounces-744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF628810AB0
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654D51F21534
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C9710A0C;
	Wed, 13 Dec 2023 06:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIc6mod4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5002299;
	Tue, 12 Dec 2023 22:57:11 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d099d316a8so2602273b3a.0;
        Tue, 12 Dec 2023 22:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702450631; x=1703055431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhkAtvgGaXDYadwgX0rvctwX2fGbm2rs7JZCU92GB5Q=;
        b=dIc6mod4azNygbMt3tNVcx6oNoRrq6AUBQEgDQtHMx2Sj6TWLLPASjOKKxXrNLP4YU
         Mj69vAOSjbDZEKrb9qZXL70YKOfleycYgVtKRfhk7DM7+AK/4ovi0XFZAzMxjqNnPDwP
         YZtOlhgL4YcN97A9GXM0w6zHk+hzzlUc2SUtt3aCdEwtOWrlsjUgdSMKgu/SMplOXEoI
         U8nQO0QBHHLv9i29Li2E2SbyXn/OkK4DxxAUfZJtqchAYvOtPXG/o81LgSkBMEZE4dnR
         PtVYSsyxNQpnGf18wHmX80sTH/OZ8aKyrUALxgz5eYU+b92kA46nuZLRsVcbPoEua5Nb
         xEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450631; x=1703055431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhkAtvgGaXDYadwgX0rvctwX2fGbm2rs7JZCU92GB5Q=;
        b=sBk5d9g3pczkGJ5bZl6fgNwxwI5CoOtXBzE94R6xApZQcCTTHNHCtDfblsD2XDg9ao
         WUMpZPP6wQvML/r6rlVMAJqx2PDFtHeHNWwDoNHn8QUkaKhehYAszJ1VBV+Woz+BXLP8
         bIsJUyzWdlhw5/u4fi/LaGUSCiGmCt1oaMrn6ZGSZkQx/JwtqNyTAMxLuRyPLRiBmGKh
         HA8LmInAbt8RIGSWG+5HGhFNaSyf5X2aKn3Lrby+hX1HuCibHvheIzck8/0HzWBPGvn6
         tEhqhaO05tJYnHw9pV/OjzRX/Ec0VmkQ401VhsVBcKUK3oudNSxvJyVRq2SBmKsa+qBw
         amhw==
X-Gm-Message-State: AOJu0YypY3Uxe07zYavvonKANjl6E0HxLP70NfbzmjnJHEZY2UEICEZM
	dpZHTdVPsYstp71J8j2rrDE=
X-Google-Smtp-Source: AGHT+IG/CCMSbbvjPxj9ULXJ+fq3qoiapX08iDfkxtUphQsQB86Ri+Mayo8bMlc3XFm3bs/dboXE2Q==
X-Received: by 2002:a05:6a00:1d86:b0:6ce:448b:b8 with SMTP id z6-20020a056a001d8600b006ce448b00b8mr7458739pfw.65.1702450630622;
        Tue, 12 Dec 2023 22:57:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a0021d300b006ce77ffcc75sm8280069pfj.165.2023.12.12.22.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:57:10 -0800 (PST)
Date: Tue, 12 Dec 2023 22:57:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: ye.xingchen@zte.com.cn, colin.i.king@gmail.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: misc: use sysfs_emit() to instead of scnprintf()
Message-ID: <ZXlVwzLMd8Drxtq4@google.com>
References: <202212011548387254492@zte.com.cn>
 <Y4jbOX4ePJz7vbu1@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4jbOX4ePJz7vbu1@nixie71>

On Thu, Dec 01, 2022 at 10:50:01AM -0600, Jeff LaBundy wrote:
> Hi Ye,
> 
> On Thu, Dec 01, 2022 at 03:48:38PM +0800, ye.xingchen@zte.com.cn wrote:
> > From: ye xingchen <ye.xingchen@zte.com.cn>
> > 
> > Replace the open-code with sysfs_emit() to simplify the code.
> > 
> > Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> > ---
> >  drivers/input/misc/ims-pcu.c | 10 +++++-----
> >  drivers/input/misc/iqs269a.c | 18 +++++++++---------

Split the patch in 2 for each driver, adjusted to the latest code and
applied.

Thanks.

-- 
Dmitry


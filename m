Return-Path: <linux-input+bounces-746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8C810AB6
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82531C2092F
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845EF107A9;
	Wed, 13 Dec 2023 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntq7rfRW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A507AC;
	Tue, 12 Dec 2023 22:57:46 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b9fcb3223dso3470587b6e.3;
        Tue, 12 Dec 2023 22:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702450665; x=1703055465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlqkEABFGnEx4mQf1+94PdsZHbFITiKp+Rbi57V0c3s=;
        b=ntq7rfRW+y31WlpMI8cJ5qpf/9yDzsVGFgwAtJsqTq22EMDWBvTcePsK1gPD+vsgo9
         cLmRT+NN/P+lRoj4LbgiX1grIRbr7wqPHuv6/SOLXWgjOuEYp3bzsZKztEvUQ9eVANi1
         m83MSxDLNnaL6cJIj4SVi3kVaOgc2lN9q5pjhyUKm4+mJhyb0iu/PHnRHnPpralpKwQT
         YVfdrHSsRDiN36MD7FTkLxCEbtGGnVb9RFX82UAF2az8dBQHwLXXjrzEZMc05wWcYvJO
         kZBPYho3Eykk4s0CkqmBHQYAvO/ugmzbVYzO0zB9TKNttGd+VvCe5SXSyBMqH+7CIFlR
         ZOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450665; x=1703055465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlqkEABFGnEx4mQf1+94PdsZHbFITiKp+Rbi57V0c3s=;
        b=p14ESy8Pq8t4FzTPDFdvBYPdGJUCQnk7oFVHN7vG3xf2qQgXU6V/AmeuKB5uZliwZF
         IQPczHOl2nSgvUyL9eZ4np8i/al26ZmRN4ATDVJ2jjDdNB0REtl/40flCTEbecc5QdVn
         QTj/31M1ijNrUyRlO16b1Quiog9+nx9/uCfvpjZErreC/JSRzV4yMYGWOfyhFtCA+Zhs
         5GOlbDijqfZWkXjjmHvfLoSi/am0bYlpERxNY5bYDixIXbygn1uMmkS1HNOtStygE9Re
         AX8QqjEh8Ms8w8aUuT+59vPnIk5KgFX8XUMi/JgWcRTuxV8eqndRK3IA2svv09c0y1CA
         9e/A==
X-Gm-Message-State: AOJu0Yyv3bEdx49sjPsyEI2ScjU+YHBbUakbHmdEV08v7EOWek7Hcji2
	jKtwBnGZfaBIA+YjOi2cmrs=
X-Google-Smtp-Source: AGHT+IFUnuCIf6lRLHiJgHr+wSOs/A+NwcLuoaCMUs381S+KgiCBHQ7KeraK0NaGm0O3R4Ad8/uq7Q==
X-Received: by 2002:a05:6808:210d:b0:3b8:b063:adf2 with SMTP id r13-20020a056808210d00b003b8b063adf2mr10186577oiw.79.1702450665464;
        Tue, 12 Dec 2023 22:57:45 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id 19-20020a631753000000b005bd980cca56sm9138178pgx.29.2023.12.12.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:57:45 -0800 (PST)
Date: Tue, 12 Dec 2023 22:57:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ye.xingchen@zte.com.cn
Cc: jiangjian@cdjrlc.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH v2] Input: mouse: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <ZXlV5miOaHR6Giaz@google.com>
References: <202212021453578171100@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212021453578171100@zte.com.cn>

On Fri, Dec 02, 2022 at 02:53:57PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with sysfs_emit() to simplify the code.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied, thank you.

-- 
Dmitry


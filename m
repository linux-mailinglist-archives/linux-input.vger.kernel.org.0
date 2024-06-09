Return-Path: <linux-input+bounces-4273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB0901856
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D0C1F21279
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 21:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32C52F9E;
	Sun,  9 Jun 2024 21:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2pqihU5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D394558B9;
	Sun,  9 Jun 2024 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717969293; cv=none; b=cQqDtsdGpBCyLyMAJe8luRjWKRpEqOW5pbUtpouVxNqteAqRmNnROCQpi9z9ZKzReG12PlhGMzcVYpjPeMF+8Ne/BDRuY79ioPQitMJk2YvDpm4DMeqtlhPsaRbUp8XrQu/oGZ4U8K/vSeuqNw8iKM+oVqEJnHwo94fq0SOwxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717969293; c=relaxed/simple;
	bh=Ti1lCadmrkvVtjeAn4RXvBoHq+kyH8MlfVFoXz9WGVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoSxSKJms/lp7XRI/cPec5AMQgA9Csln6juhfejbvJ/9RQ33hDmOEdutH5fhHeSWKSY46ccjuwDJD8yBgPSbtrbKYi+vLcQnyS6yhxPYR+ZN4MBlmMhUYEUTrEsllqOScn9ofw15UHd6UGjuvyTbcfw70GwTeYVkJNpYOdOgHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2pqihU5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c2c6b27428so1550474a91.3;
        Sun, 09 Jun 2024 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717969291; x=1718574091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1/NQGBcniwOGtlfkKFY4bfViy5G6/qqoA0oBFSyyOU=;
        b=Z2pqihU5bGr/bMMj3et7/Sl5a/b8M+MkU8FAe4/StJcmqrqXO1hoQMZFWRMTWMO6xU
         gdhQLF5B96BPffNFVZErpoMVynTNiDx2e/dQ1JoAnxQmqVpsr7zmfnUgzPfu3nEq6bkJ
         KYLQRkoWwTf57v9qNI2DS6fAdBooHpZPjLr5RJewDp/Jtkd+D2lcJFTI1yvKBVIakYn4
         kQGrsnofjRU9VMO2P/XpQ30uMgG0G3Tw28i7hkAT6ivzjS65p3BfL2geQ2lBo2OgvxKe
         vny3a0gMxDY0ECOAtV88uDxBaSMvNbtzzqCHN93g4/LFbAigj0kGuAYhxsbKSwiQkvPZ
         Excg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717969291; x=1718574091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1/NQGBcniwOGtlfkKFY4bfViy5G6/qqoA0oBFSyyOU=;
        b=FY1f5oX8IhHhTFJsfH1AeGq2XtKk/6/+ALxJ3YLSR/dbHqfmWmKHXeSp8Qgr1uwKu0
         btPNiBlLaEqfiax6G8vg+Dq79N9jTnlx1aP/1p2fBfWkXJ6DbvCXJChc13zZaX617rCT
         tkD9llyNkrbisMBCiRE4jDTYrzYsMYO+Zd9oOzwqeu6chpzVc4ZKSjB3AW76oCN9vVH0
         +sd2aZ5e7sTjFslpG7vqzjkenHA0UElFQmvsHDkpyJSkSNSIgSBMRc7deUL61+YNTg4R
         npqmUKfScYCVtldPbLt7kOWKT0YyHqu39szNwD7btn0sep7dPWpUupBXFGI11CeCUlcD
         /gpA==
X-Forwarded-Encrypted: i=1; AJvYcCXmFAbQei8iizIedSVC5pFuBi7eTsOWM301Pf40LqTWvDbAxxKEqWrP3Q5BMLrT8oZ2tShGEh+8U/e74Ov3lzEAVvlUtLlSYyFJ9sm/qrmhaDLysRVeAacjpX0HuxD0Y86L/XpZe+pzD7PaqEcKiEdRRlhtsii39IWhfz0iYZ40eE9LcY6NqBJ3lFM=
X-Gm-Message-State: AOJu0YywazrNGmDLHeMi+1QxYPByhOtBcaa1H+TLOaunySz5+C1TQjVo
	Zvu0aQ4KDc/FiIC+lA1iru5nzEtWjw2mIRvhVUak+NIKAyVjbweE0T3c2A==
X-Google-Smtp-Source: AGHT+IHJJsfWu0z4qAJiwFg5/tkSiQXhyKVwNBCsm+WCSX3/V+8Aq8is+U/owQSeGL6hBruGzHR03A==
X-Received: by 2002:a17:90a:bc9:b0:2c2:c670:8a4b with SMTP id 98e67ed59e1d1-2c2c6708b6amr6051432a91.26.1717969291333;
        Sun, 09 Jun 2024 14:41:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2ebc8b49bsm2593241a91.50.2024.06.09.14.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 14:41:31 -0700 (PDT)
Date: Sun, 9 Jun 2024 14:41:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: add missing MODULE_DESCRIPTION() macros
Message-ID: <ZmYhiDpM65GbEWgG@google.com>
References: <20240609-md-drivers-input-v1-1-a2f394e0f9d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609-md-drivers-input-v1-1-a2f394e0f9d8@quicinc.com>

On Sun, Jun 09, 2024 at 01:03:30PM -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/misc/soc_button_array.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes drivers/input/misc/sgi_btns.c which, although it did not
> produce a warning with the x86 allmodconfig configuration, may cause
> this warning with other configurations when either CONFIG_SGI_IP22 or
> CONFIG_SGI_IP32 is enabled.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied, thank you.

-- 
Dmitry


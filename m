Return-Path: <linux-input+bounces-5295-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798EC9467F3
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 08:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1421F21F45
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 06:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22DB1553B1;
	Sat,  3 Aug 2024 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3Tm7+7y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91231547DD
	for <linux-input@vger.kernel.org>; Sat,  3 Aug 2024 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665337; cv=none; b=rstH5xxCb+DiQnSUbOasZI+Yzzw/efLxSSaDnBRn2gRHfkTiFvprS35s3pL9GqPPYFldKAbSp5W7D6KtYTI7F3jefmwC8MHFyzsVnMH0PDW6zXbLhM3YLm06A3O4asGQu6/yOPopKW27l4Vrp4TgWwgLq/2PuCeI1en3f6Y+p5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665337; c=relaxed/simple;
	bh=aq+QZJ5UlPbyOr6601NDyg6YaeBd4++4Eh+UJ35K4EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfRVolj0dLeFmCTnlRDaDb4sWXCBeZWf5hIY9PuFqsoNS5+LL3qK8v6Jxza1RJzJ/ZlvdUCd4ZsqKXnGkDX0MKDs0BFixP7R4I2rPa4uSgKLwHAB5pyGTZqqvCRELqLntiKKFPV89uGicFGFCwlySI+B1HBG5zTW5oOjudc6ZaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3Tm7+7y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so6066315a91.3
        for <linux-input@vger.kernel.org>; Fri, 02 Aug 2024 23:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722665335; x=1723270135; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDwjyZKQZG8g38NXPSJoXY46aseDE9YYuBGkgH0lUUQ=;
        b=g3Tm7+7yvzXiVYiyebxDRnhnIucLk3Nwhctphzu3wtQ4D28wLqjwNnYntfGVDO94Mm
         x61a7x8B4XmdhsMAvNM8ejhGLPF1O06f3MW5ml38yIEbYK3YoHMxF35ZWnxXpwnVhb3G
         3jiQIgmdOSEeUxwVJAKNZhrAHxO7bqxEyvf6PjiEKiRvxAC0FmZ0XhSINPaf48c+icfF
         La75I2tDTD5EplXc/Gyvf7BTBOxNbJKapzjF+SCWMuNNk9FOVs2cFVomIaYHHUxq2bCu
         88+Fe1xM/cqO7qm/Ru0JsiYsPjyjCn1HQmNEqgxStHCrpQiMPzRc3qONg9sv7NV5PU9o
         3QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722665335; x=1723270135;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDwjyZKQZG8g38NXPSJoXY46aseDE9YYuBGkgH0lUUQ=;
        b=TrgJtYKsrUGRki3boCjK5oLLOpGU4iXErhxVfAgrKBaxNfJxD3Sz/xNNI63ycyht68
         F1nl9vZziTYVarOadHnEUZI0reEeksV2obsOzDNvSuxfGS+CowReGoyxtDEKOA6kJPIc
         65zakc8pioQ0CupSRtz08CWobSBKOP7ucV3yr5wG9ppQ6QfMTD+nTbTzc57rfh3F+Vr/
         coHw1K5NVy4uraVt0ag0y3rPtfDCWbSdvcomiOmTjAJy109hY3ZGdEgQPX/FR/TyOU0x
         iGF5wsGKwXfuME5UEHqxV77NIH0IjGMeMopHFmng2pBKLuDZM1EmFgvLASnZAtUOFjv4
         4LOg==
X-Forwarded-Encrypted: i=1; AJvYcCXZq3t/B+mRwZ0sRNDEATDo1xFJlbqozWTU4FTRwN0znUCozMDjkAQkVLVrjWQ5Wpovcup2CvnI7kJ6XKJPrewv11FV4veVZEEqlg4=
X-Gm-Message-State: AOJu0YyG4rvsri++gfqoDu8Te6MFd9gMfdTdatVOijBauEPc61IP81Ny
	z6at8eFCVYlZsCb3epI7KxDXtIA+ama8/6ft4/AD4Ou9kFJZzcMt
X-Google-Smtp-Source: AGHT+IEs4e3NvuKXXC421mXNkQvAK+4mZ7xixwZ5glc1TUFLZo28gPbmF2cpV2A+Mue5RbBOjOVnlg==
X-Received: by 2002:a17:90b:1e04:b0:2cc:f2c1:88fb with SMTP id 98e67ed59e1d1-2cff9413d63mr6270042a91.16.1722665334917;
        Fri, 02 Aug 2024 23:08:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc42f9desm6128544a91.14.2024.08.02.23.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 23:08:54 -0700 (PDT)
Date: Fri, 2 Aug 2024 23:08:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ttdrivers@cypress.com
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Linux Input <linux-input@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Removal of cyttsp4 driver from mainline Linux kernel
Message-ID: <Zq3Jc7Vt0BM5VWAa@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

cyttsp4 touchscreen driver was contributed by Cypress in 2013 and since
then has seen no updates. The driver uses platform data (no device tree
support) and there are no users of it in the mainline kernel. There were
occasional fixes to it for issues either found by static ocde analysis
tools or visual inspection, but otherwise the driver is completely
untested.

Should it be removed?

Thanks.

-- 
Dmitry


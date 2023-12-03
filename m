Return-Path: <linux-input+bounces-425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A2802688
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 20:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51DD31F20FAB
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 19:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542A11799E;
	Sun,  3 Dec 2023 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6wyskXG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A817A1;
	Sun,  3 Dec 2023 11:06:31 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-67a9cba087aso21787596d6.3;
        Sun, 03 Dec 2023 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701630390; x=1702235190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps6r7g84dej2iXkt9eKsvqXbWsrUKi3Q/Yryr1CTCAU=;
        b=F6wyskXGMMBePCsoWEYdvji8gix/8LxHALFr6sAa5QLW5b41HVvvH3txALkh5WenjR
         SxI9WISliAIdbbLsvKHjGXYpKdMzglZ0AGVgImQ8vcO9271d4aYqvT8zcfPty4dpz7PC
         qB1et7FKzepjiFCejt8c/HL9cbv2CjeRnwyNJAALGpiFCQsgM6BFKmY77+bluzYjhEKz
         r2oRvYXv+UqylQf9r8gmcDCyxIAqkth3jJR1Ur43jPt81AupovfzQfAMJNKaaYaCpvUM
         /eLe3aTj/0tqBLWzr2IiOyTkN5WR6VLvo/ibdxGXH9eKMAOZB5oh3yRoIaSKDxQbro4j
         tkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701630390; x=1702235190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps6r7g84dej2iXkt9eKsvqXbWsrUKi3Q/Yryr1CTCAU=;
        b=D7RyxVkuYFhdYNhp5Z+aeQ8TxMBRjAAepIDOJQaifLeCs3USvT7PASrp/zVN924I/C
         +GEdE7lGPG9te0X3CtxYIORG2f/+LrMkhu2kj02gEe+h7gozwBL2xDXgdpU5q80zdp2U
         gmn3jbP67JPk5qUE3Xy7ImFB32dqapPEfJNBdufhbZkAuYeILY1lMoVTmXR0bkjbKrHf
         M4gekVvs/HJGkPcsCr7VA4sj5HKUfizUAynoXABfVk8iYGnI2RRou8L2uZ0hqbNqScPJ
         6aAIH4sHK3OW3+BhfyyuWTac3z9iiVldcwKKvoF3E7gDyRvym4jmBIDmSD74syKjjrcX
         BUbA==
X-Gm-Message-State: AOJu0YynQ5c5rC0P5EalzbnhLHMrCnQ4I3H83v1SK295QGFvWSv3clNj
	NZvvUhfeRoMCUcPxN7zH56trSZQUvjw=
X-Google-Smtp-Source: AGHT+IHSZbpgjuAE4pTErekVoiDs5F/pXk9m/mmWeM7SZhBaFZUCgVuf3SVJEUjW6pLgtj5I5fn6jQ==
X-Received: by 2002:ad4:4e4b:0:b0:67a:c636:179c with SMTP id eb11-20020ad44e4b000000b0067ac636179cmr859020qvb.37.1701630390150;
        Sun, 03 Dec 2023 11:06:30 -0800 (PST)
Received: from google.com ([205.220.129.26])
        by smtp.gmail.com with ESMTPSA id g9-20020a0cf849000000b0067a9e2d26easm2418097qvo.112.2023.12.03.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:06:29 -0800 (PST)
Date: Sun, 3 Dec 2023 19:06:15 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haoran Liu <liuhaoran14@163.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipaq-micro-keys: Add error handling for devm_kmemdup
Message-ID: <ZWzRp9xP66plWt1Z@google.com>
References: <20231203164653.38983-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203164653.38983-1-liuhaoran14@163.com>

On Sun, Dec 03, 2023 at 08:46:53AM -0800, Haoran Liu wrote:
> Check the return value of i2c_add_adapter. Static analysis revealed that
> the function did not properly handle potential failures of
> i2c_add_adapter, which could lead to partial initialization of the I2C
> adapter and unstable operation.
> 
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>

Applied, thank you.

-- 
Dmitry


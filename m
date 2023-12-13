Return-Path: <linux-input+bounces-751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F58810B23
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41EBC1F213E4
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D69C18E05;
	Wed, 13 Dec 2023 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4vGyjAr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2516BD0
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:25 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0bcc0c313so35714155ad.3
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451604; x=1703056404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tM2s/S2CKuXn+ASp9aF4+QAb3KC6X7aVjt5VC+fglvw=;
        b=l4vGyjArF+/pxJBPjsEGYnjVHyWX3DyIsXINO13qa7WGpgT4qN+9khtJY1yKB9s4u3
         6nIVp//tqiSLgIlwPzcdsN+ZXz3tuerJedEqmb04gLC5d6AJwTrHuadM3Fbqd6GW4N2Q
         DwCWLomyde2M4q/vDh+Zk0ynECkvCoJxl541iOoHQ881KoPF57Q1Kcniq5Hl49exxesB
         DimZtmwVdgGT+nYXY0mElf+0mTfAf/zcSvarUuf+PwP6CtessbA9vtBltvx66R73fJD8
         440pUax1ZaUPkXbKazSvWgYiuxFXRTtJ+AhOHcRf6rqghWrqwYDBh4gSNABkMIstfA75
         a/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451604; x=1703056404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM2s/S2CKuXn+ASp9aF4+QAb3KC6X7aVjt5VC+fglvw=;
        b=qKk8iFg8CDyi1C5Dr7pjZ4xTsX1x1pBMugqQLugatQ3STa+1uoOBiiGi8GB/N/l6F+
         d+4zqI1t5gbA+EoNRHDcVQTcZjWnf9DX9f+SPz1wa+37cKH6DqhzaT4YGL+WW0vrbR78
         Y1GQQPQMzWp4cn22IDdJBmjxd4AyNUz9IL3RD/Q4etenP+jU+Ogf/5gOiHkemN43QWqH
         T7oqxdljIdjYDH2w2PVz3cWg5q1QRnmoStEYzvTDAKd4FwIFElIV3M6FPNhL4zsiALYM
         vBb+B1BUOajVs0f+7/vbLBuqXcTzIYoKGEGIP8pL1vrKnSfWVkvX3mvZxd1rv8VjSDEi
         4wKg==
X-Gm-Message-State: AOJu0YzOfv7PVKjK9rnJQhPYCSYNK9nqtHvw5QFaSWYtV7j58qLDVKgJ
	IypF0+DdKicWpkzI7ZmkkRU=
X-Google-Smtp-Source: AGHT+IHpI3pbjW59rKG3+reMix6bV4MpFDI7hafx1MOWaqj1nmlf/U33aod3IACdTKq7KUBvik40+A==
X-Received: by 2002:a17:902:e789:b0:1d0:6ffd:8353 with SMTP id cp9-20020a170902e78900b001d06ffd8353mr3729953plb.94.1702451604434;
        Tue, 12 Dec 2023 23:13:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090332c800b001cfb41589ddsm9795649plr.293.2023.12.12.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:13:24 -0800 (PST)
Date: Tue, 12 Dec 2023 23:13:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: navpoint - Convert to use GPIO descriptor
Message-ID: <ZXlZkSbVKbjRGdj_@google.com>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-1-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-input-v1-1-9433162914a3@linaro.org>

On Wed, Nov 29, 2023 at 02:51:45PM +0100, Linus Walleij wrote:
> The Navpoint driver uses a GPIO line, convert this to use
> a GPIO descriptor. There are no in-kernel users but outoftree
> users can easily be added or converted using a GPIO descriptor
> table as with numerous other drivers.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry


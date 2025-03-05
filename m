Return-Path: <linux-input+bounces-10556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441CA4F7B0
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 08:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6964F188E226
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 07:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFED78F39;
	Wed,  5 Mar 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPhX6XC1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85861C8635
	for <linux-input@vger.kernel.org>; Wed,  5 Mar 2025 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741158580; cv=none; b=Ku15/mOB2OHGK7NxkF68bOGj1AGd73VtItjyQmqX+/7+Ut7q//M6Loc+7RmnrKyfaYm+OFjyn4dxa2KKv9MNUrVkSJBudycyntQ2AU33WBOLKhQQ8DvvwP1Q7bdvaTZJcYyNmYACH1sE8DYr6c1G4dTLTVel0n/WWz6fbyEGG7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741158580; c=relaxed/simple;
	bh=+aS7GMKlVg416EsuGORMC/97qXvmi5T+MDZzRCQpxmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/o143n1lKmbHJLZlNn7t3BhNwtnxhraM0dQrtHsIGPlKrRJmWI0Mn3bGijakAV+DgcYiu1Rs5yC2RC0PT/mklv+2EtsEebpYDJTpUwgEi2M6mLjGfxHnfMycovtSOqhVbqP2Ky13nxPYG8j5GVgq36iJW3Am8u9Ak4/Rb8YSMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPhX6XC1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so10406058a91.2
        for <linux-input@vger.kernel.org>; Tue, 04 Mar 2025 23:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741158578; x=1741763378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hef5ejsFbgRZSrRRg5oG7YQSt8xVWa+Umjeoh1KhiUk=;
        b=YPhX6XC1QCReKkJvy13PiPA4e6w4+CqrjRdyd2t4NU85l/O86baeVNr7YzgXgHXbSu
         IGf9y/OYfHw5w4HWcg5NADm8BhNWfnncdeTOqGCxPgMST0oJY53eRiW+cg1iT7EaepT4
         hZ4Tnm1pIA0H7fKTq7e5zIKZUfLOZw3NWGzsn5vVi7CFOQE9rIp6TNyYwPJ1anpxCsm4
         XCmoC4BWEg1Yc3FPui6IAvnV7Sl2jXIYvzq8bP9rT2v9cvtndn48E27nVd7py19bqRuV
         GT+Prnzv2S5MWGGRVVK3PqOgYxCOAzLrN3woY1CX8Ah6s2Q03mROnGzGMWg8pj7cPaRw
         mGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741158578; x=1741763378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hef5ejsFbgRZSrRRg5oG7YQSt8xVWa+Umjeoh1KhiUk=;
        b=XDMFJEbHjB+4KhGLCvWv1tKS6atoWi9kHNYtFPZxWeXjpG3pw47fF/uVurtWNf+DkW
         jzSFkn3BN+mlsPC9y6pOa7Z37HQprcc/CQcCQ38CyYoeu7AYnLIWm23GKVJsBENdGkmL
         ihhZF3a7ad8+YpCZsUgz3nNOqnxPJkplO3D0N+IsXfsyQfuBTiJldmhNfFGS1H4JEsmg
         mwIDdZ8aO2Q7VJv4zo7hPG8LvSputwpWJZXeCh/2FJLWR4H5eVevPLtCwvOuf4vHHSN+
         DvNMqFTIcw5zuem8LNHcetDbP3PC1EZBK6QbNGiMY+tSRJGFCsxlszUEcNY5Qvd5EBXS
         5NCw==
X-Gm-Message-State: AOJu0Yw9/Dx/RLKw5zd6qW7hdwF1yvB7KZbN0kpW6ibCahp07/wZncoZ
	glwu2cYBvl8D0IHl3MOHeqQEV8JcdH9D+uRY35/PygO3Z/wHIhyLowuEMw==
X-Gm-Gg: ASbGncv6zht4ArdDsSjcuv0xSl7sVFAzEc81ValOFro24/JE0R30tFLo3uYw8RylGhS
	ZsGXJKgC1Fo4xZ/FNKl1NhQZe/NnHVMPhn1WIq9NqH/xsdZ/JGRDWGeDItoyswyj0eepDdGpKUc
	85HOhrwviKN41gDJ8XoAS+ZBRx8OVE4YLFOVBUR9hMq6MYclxJjtgT21sePEU/m6zfu+ZWZMsTm
	mMk+jFTiGgjNFHMSwM5ypc4AC/CwIbw5ILPjccX5Cp/ofrldzXsZl8h7INEMDIA4VmwObL3hS/P
	VTSceD5Qb9Vx5b6eWajwrjM2SNzMMS0CLx0raYcYebjJ2w==
X-Google-Smtp-Source: AGHT+IFbbcj/viZzxOE5JJVWcAf4WoEDKPPpxg4vn+yvlieFC8jrcb/E40tjErxqy6pu4mAFCGOPoA==
X-Received: by 2002:a05:6a20:3d89:b0:1f3:1894:9520 with SMTP id adf61e73a8af0-1f34956f12bmr3027322637.37.1741158578049;
        Tue, 04 Mar 2025 23:09:38 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:438c:d5a2:41a6:66d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec4142sm11223577a12.56.2025.03.04.23.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:09:37 -0800 (PST)
Date: Tue, 4 Mar 2025 23:09:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-input@vger.kernel.org
Subject: Re: [bug report] Input: atkbd - restore repeat rate when resuming
Message-ID: <Z8f4r2AbNX-6EpO7@google.com>
References: <cd3caca2-607e-4cf4-9262-bc5867b690a7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3caca2-607e-4cf4-9262-bc5867b690a7@stanley.mountain>

Hi Dan,

On Mon, Mar 03, 2025 at 11:11:35AM +0300, Dan Carpenter wrote:
> [ This bug seems really ancient.  But so far as I can see it really is
>   super old.  I'm not sure why it's only showing up now.  -dan ]
> 
> Hello Dmitry Torokhov,
> 
> Commit 3d0f0fa0cb55 ("Input: atkbd - restore repeat rate when
> resuming") from Aug 4, 2006 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/input/keyboard/atkbd.c:604 atkbd_set_repeat_rate()
> 	warn: sleeping in atomic context
> 
> drivers/input/keyboard/atkbd.c
>     583 static int atkbd_set_repeat_rate(struct atkbd *atkbd)
>     584 {
>     585         const short period[32] =
>     586                 { 33,  37,  42,  46,  50,  54,  58,  63,  67,  75,  83,  92, 100, 109, 116, 125,
>     587                  133, 149, 167, 182, 200, 217, 232, 250, 270, 303, 333, 370, 400, 435, 470, 500 };
>     588         const short delay[4] =
>     589                 { 250, 500, 750, 1000 };
>     590 
>     591         struct input_dev *dev = atkbd->dev;
>     592         unsigned char param;
>     593         int i = 0, j = 0;
>     594 
>     595         while (i < ARRAY_SIZE(period) - 1 && period[i] < dev->rep[REP_PERIOD])
>     596                 i++;
>     597         dev->rep[REP_PERIOD] = period[i];
>     598 
>     599         while (j < ARRAY_SIZE(delay) - 1 && delay[j] < dev->rep[REP_DELAY])
>     600                 j++;
>     601         dev->rep[REP_DELAY] = delay[j];
>     602 
>     603         param = i | (j << 5);
> --> 604         return ps2_command(&atkbd->ps2dev, &param, ATKBD_CMD_SETREP);
> 
> This fucntion call takes a mutex.
> 
>     605 }
> 
> The call tree is:
> 
> atkbd_reconnect() <- disables preempt
> -> atkbd_set_repeat_rate()
> 
> In atkbd_reconnect() it's the atkbd_disable(atkbd) which takes a
> spinlock.

I think your tools are confused by the guard notation. atkbd_disable()
not only takes but also releases the spinlock.

Thanks.

-- 
Dmitry


Return-Path: <linux-input+bounces-5319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 575919471E9
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 02:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4741C20429
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 00:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559DDEA4;
	Mon,  5 Aug 2024 00:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ee59iofD"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD401109
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722817349; cv=none; b=o5lYKG6ykzI9eFMyTH9mgpTy382AZVKojvXdu615wSgHmj2bUpWKUbpq391YyuF1fXm4aTqrWfhMwGKTHx7yI5n699k2ELAo1EyavyxFRIeSK4FzPHDUk6R2lsbO3BKcGvMyUYMcdHxUjD/MAGwvfEJ/cpvJpdVFxZ9QZDUoMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722817349; c=relaxed/simple;
	bh=PQvcQ8t7S1Bi+S4T8EGOEg11/VjbQzVW6VNMnvTl5To=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NBWoid2Po5xgof4fFXBY4L/e/1BGe7EEP1yYHvdABDey3FZnsecsZqhj2LnqSExYE0boPaSc6T1oBML7UYJXceQrEco023+D4STmNO8d19IdJ0KP1fXmWxEtqWa1jt129uQ8MPyvdHyJKyvZvVY0wyx4LlnQok4d4r2EyVIZ1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ee59iofD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722817346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oBVCiUmIJ/pcUNh5weJT45NG9FUYmnt3UvfN0Id1eB4=;
	b=Ee59iofD0TvsPwLKZUL5Eqh8nGJ13VLnb3ZOs+4hkc7TdH1WglCREspPfDkpC1Nr9/iJVo
	Syfo5tYSiAjJ7cZy/aIuFAEpQkRU3n32UkyYOB67W7t1vmTCrKJChf7P+K9u3ej7i15mvL
	NXIlSiYMkqDilJ0mgga9gJC+Ma0acv8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-oP2-2USCNs2uDwnuj1yDVA-1; Sun, 04 Aug 2024 20:22:23 -0400
X-MC-Unique: oP2-2USCNs2uDwnuj1yDVA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1fee7c9e4a4so76446965ad.2
        for <linux-input@vger.kernel.org>; Sun, 04 Aug 2024 17:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722817342; x=1723422142;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBVCiUmIJ/pcUNh5weJT45NG9FUYmnt3UvfN0Id1eB4=;
        b=QTpRT+T8RqfalX1ee+xQNsk4rhrTizmjr8DQWJ3kYv6mXiSGOZ2tlzUxAMbyvQ0G2m
         Z6pRJS0+4NV3FA8zrdlM4fRyoTcZgl9VvSNSa7QmF4BxUsVbM9h5cQACrR7FvGLuAY0v
         rNVJKLUMTAAid6u7CEsAV3qRvk4v8ncTvLN0ZJOt75M4DCr4nBvg1n79pxz6mAegbFH4
         S40mDD15p7Cq5VhUU3KTRfBkSYczwkNb1ijQBp9lcYwmfh8JyM5EVjQOkXJ5qeXwvUCW
         WIW8eCODe4qfkC11Chk9YQuJp4xlLy5k8rWnVTMkC/8T0ukJ8xyg1vArOj4DZBHDvxmK
         RPHw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0IGUYFf2fK1IS3yRuGkqLq8D8n8L4zmS0s/X9C22oxiIDo+rK+ypgvP8fSXKFg9uY6TuBI2BjIWQvr/RNos6Bb+vvp95LI8l19s=
X-Gm-Message-State: AOJu0YzYzV6L8ymzyBpzz65CdVzGVi3Ft5luajOWDsoKep4bRw1HuqRf
	qjajvIqn5M8xALqlxFXr7eOZeJikasB/lOnliHUXw2HxzJ1MKWxCkZoC02bXCAjXFcSkjW7Bpqp
	+eCOEcCPpcPrSrK1E47h/AA90U9P/gzIl2gwjsV9Lgq9KxOgMU5gX0Xcx2Sjg
X-Received: by 2002:a17:902:ecc2:b0:1fb:fc96:757e with SMTP id d9443c01a7336-1ff5730969emr88782145ad.37.1722817342112;
        Sun, 04 Aug 2024 17:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4yKMe5je0FqceGU22lDwDuJqaOtMxq2d1pVGzFinAoW5Gy1aEKZ5TnASTwP3+a3ZJ1222TA==
X-Received: by 2002:a17:902:ecc2:b0:1fb:fc96:757e with SMTP id d9443c01a7336-1ff5730969emr88781945ad.37.1722817341453;
        Sun, 04 Aug 2024 17:22:21 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b5886sm54653605ad.299.2024.08.04.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 17:22:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp4 - remove driver
In-Reply-To: <ZrAZ2cUow_z838tp@google.com>
References: <ZrAZ2cUow_z838tp@google.com>
Date: Mon, 05 Aug 2024 02:22:18 +0200
Message-ID: <87cymn95tx.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

Hello Dmitry,

> The cyttsp4 touchscreen driver was contributed in 2013 and since then
> has seen no updates. The driver uses platform data (no device tree
> support) and there are no users of it in the mainline kernel. There were
> occasional fixes to it for issues either found by static code analysis
> tools or via visual inspection, but otherwise the driver is completely
> untested.
>
> Remove the driver.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



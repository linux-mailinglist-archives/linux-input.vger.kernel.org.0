Return-Path: <linux-input+bounces-1971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321285B750
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6901C24111
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AD35FDBF;
	Tue, 20 Feb 2024 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TT6ekZ0/"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1B5FBAD
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421233; cv=none; b=o8raEhQ5VUmgJ2m/pGwd6XSeUlOoCKShacm+1L709HzP8GaZVO+V8FyhHdrZgfdLS/uVydVf81T85If3mnTiTBBkBYCbF8bud7Sldk2s6MY7KyftpZ8lsYCLfxh40ivPunHaWrU07eB1ufyPhVkBaTLBLL+ubTmwuK+MjaqNkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421233; c=relaxed/simple;
	bh=Cr049JDQLVE6h9YwU+hPc42YZw3O5KaA0156euo/6HU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jr2NHT0RC5ELqE7cL5RcY0G+wM3WNvfhk2fGK3ZNjzbRunfSQ7eHweVE7/xU5vlFDshkTEWZ61aeR47OhlyM50K1bOIHQZVCPQeLq/DMTQ4twAsiZzN4HOpm6AwBWatAvleJWE6nAl9tracUqYMULbSysElrxGsJzCQraYgH9f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TT6ekZ0/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr049JDQLVE6h9YwU+hPc42YZw3O5KaA0156euo/6HU=;
	b=TT6ekZ0/0PYtmQq3P+eHBYnvjlMoiB8yUxJ4rOdOF1+Pp4YkJqqublB095txQSQKgt93wp
	DNSIjJuqXXam/PWofgvJunyfGRLrslJ1hUtEML5bUPA7qXBtX0F0C8fbuLYfKOtK0rbuC3
	X6kF6skwhSsJsSKQHuDXxsZbrF62WuI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-M_s5ZulHOnKQZfncz8Z_RA-1; Tue, 20 Feb 2024 04:27:09 -0500
X-MC-Unique: M_s5ZulHOnKQZfncz8Z_RA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d09fe39949so39790461fa.0
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421228; x=1709026028;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr049JDQLVE6h9YwU+hPc42YZw3O5KaA0156euo/6HU=;
        b=Nj+tKIkTS47Dov0Vd0lslEDbQOB+0EN3n7Yv7wMPIGNhY1znSlSQUsd0YqgTrknltA
         t5CWwWEXV1oZtvcXHLH4JAAGOiCOD5m9d0L5jSeUBHxaKkKb4U11Ylt6pzwWCeBOgKOF
         1WhDuH41FBPsyo0Zf2mouHc+7+N+FeReU6C3o+92ybCmve/pRaRXI2mdg/bM82not4RX
         Dn8XN1OVZOZFJ6W6XrXIjIufIQZYR24VnyoVTopgHy2zPiM3pgcAtUA7WJsz++msP63Y
         DLOjsD7pu5Uykiq/PX4f1/6t1QR3PKgLgNEDQQf5hU8KX0x4PGjXfqCSpedjbwaN0y/9
         0aUw==
X-Forwarded-Encrypted: i=1; AJvYcCX2cewLuPwEk2dJykQ1Y7jOkFAF0/UHG7HW9kz0c2bC/u2lX5jKrb5YBM/7PNqjiGTsPD36w90PBmlgO7VgdlNL8Z7sGp/vDp3pKEQ=
X-Gm-Message-State: AOJu0YxPcjBxUWf8Q8c+Kon+1NzGL0eUmnelrmIpRein9zOikrns9eiw
	fGCkVZII0Pi+vH7FKdRJW240X5RW3YUvVE/u90yr2zDF0Q7VYe5tvUqBZMEO+Mtlj3Wrid0qRPy
	R93WFps/4IjpVmz0nT5pir2fXqzezqhE9m673o1/G4fnXfjw7EXQTgPhETYOZ
X-Received: by 2002:a2e:8895:0:b0:2d2:3707:485c with SMTP id k21-20020a2e8895000000b002d23707485cmr4468701lji.20.1708421227878;
        Tue, 20 Feb 2024 01:27:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIOUqTz15wX4tpCLDU3x6oh41ZPQVlb/WZWHFmGcfp/tIINmvltfgmSrW/DyUZvNLfveew0g==
X-Received: by 2002:a2e:8895:0:b0:2d2:3707:485c with SMTP id k21-20020a2e8895000000b002d23707485cmr4468689lji.20.1708421227590;
        Tue, 20 Feb 2024 01:27:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d55cd000000b0033b198efbedsm12732585wrw.15.2024.02.20.01.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:27:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/10] backlight/pwm-backlight: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-7-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-7-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:27:06 +0100
Message-ID: <87wmqziiz9.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The internal check_fb callback from struct pwm_bl_data is never
> implemented. thus the driver's implementation of check_fb always
> returns true, which is the backlight core's default if no
> implementation has been set. So remove the code from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



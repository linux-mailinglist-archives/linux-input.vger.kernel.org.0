Return-Path: <linux-input+bounces-2944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64A8A269B
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 08:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A611C2189E
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 06:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236425C82;
	Fri, 12 Apr 2024 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LIvnVQpN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884472D600
	for <linux-input@vger.kernel.org>; Fri, 12 Apr 2024 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712903336; cv=none; b=QrIR4UHXXbw4v5zpP2MBL+l08lYrUs6KA7hEcSgJXKxCoDhGwkr1Japb5mHo2sh4H1W2CzQSsz0Rbn/+RP3vTPkr2cLa/PddQ7kKvz5d2cyeqr+yOSbbJonYh1JHizdbOAV2FHPYkeiI9w6zdZ8Q6kNKFX8ADuioyNTL86NR+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712903336; c=relaxed/simple;
	bh=+RwbcFry8D89CJYvhce0MUVsj/oVUO7sMBwglPpCnGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSncdS3VnPgYcBls2hVBmPY3sTMQ38/qkUXg4aw7bqHf+StGsQFQZ3fB1lA8tSgrW8J+C7Rh4yQbx3j3tPIrdq0cyqfkDNuTchLteNvAfFZpD0reEvKkEBLmsU3cYiwOxhyVkgnEnyCDjYi7R2oSVEWoHkEpe2/5wQFW75+sSQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LIvnVQpN; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 50D883F5CF
	for <linux-input@vger.kernel.org>; Fri, 12 Apr 2024 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712903326;
	bh=+RwbcFry8D89CJYvhce0MUVsj/oVUO7sMBwglPpCnGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=LIvnVQpNGsTZBw7M6U8kjl1Grkjs30CcDSNpEkMt+tNQfMy6x1BhgCi5e2VGt1mMW
	 o9909cz+Rkw2H9LvUaZys097VfbGx0PH57LuXkHGqjBeov+hsmKI2mSXwzFwQ5f5+r
	 6NS/x08Mjsa6rqMvvRSS4M16uBp+DyR6AKD/47+Jx/6BITvU0qrUaAlZ0ORtfyr0Qt
	 G16XTpzv86Ri3nCE1wNoqFuT4sSGX9iteMjUFZT5TQOkYB/HD5phzgwezU3DDqHra/
	 5IzdrWE6+l/2opqAwzGx3eL+Wnb/ye8nCKPPb0WcsWZh07zlyKjT/SuaQsIZnB2sSP
	 uAYJlUf4c6GyA==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a5066ddd4cso555319a91.0
        for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 23:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712903324; x=1713508124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RwbcFry8D89CJYvhce0MUVsj/oVUO7sMBwglPpCnGs=;
        b=UltzpcK7QExE/7EZ7YVs1QfHYLZdH6RY7ltidP1CPaDBiUFlUwNbZYVd1hVQF3k8A/
         25BTur3czKQX6/Jb7LjsdhwqXA6EsQlZgFZXac3slvfUeaCIfdOqfCtxfGKKxKNvQwS+
         LZVnx/ABAlGsacxybq4gcOgG8iCfFPoVUxbJzYbQ41EUXjAogVU2oy+4H8gYa02kl9xo
         waqhE42pml4BUoUj0hwzoaJucMkv71yGa9HWSgObWLnE5Rwx9p7Li6s/k1yRmXG0dKvG
         OMtoQq1DRYBytWABlsNwSWsNcgilbyo5+h0NGArJF+zj+xFPqTVLfVNztW7ejHJzlckL
         y2kw==
X-Forwarded-Encrypted: i=1; AJvYcCVtCalgsXsG56GDDuYIvvkyQnAu688fvuuSzqQOZ5uLu3aXesBNpVHmeUU5xHrSfrjj0mfA+b8GoOE4I5YnXljG14B9fAVv42r9IDA=
X-Gm-Message-State: AOJu0Yycb9OcadHi42wkkQK8laup/ldQmJNm1nPrHoNj+XbsXx2/xbPF
	mYKm/X3NwZTd3mqkYg9bR/TcEQ3H5wj/cD9/GsB/CpBnecrN3oFg46MfkgD5vYujGzuU+HzOup1
	6xmcF21ew5LgL2GN1FgdvFFq9zY4bEZSSSyz8+mU2VITI0hp6ZemK78sJ8Lx/8A7IzndInGacJV
	w2p8sD5hqwVcOufbo8arY4kD+W4CTr/PR3XZc742u9BGDVFnXTZW8=
X-Received: by 2002:a17:90a:6f84:b0:2a3:ba0:d9f with SMTP id e4-20020a17090a6f8400b002a30ba00d9fmr1707267pjk.11.1712903324486;
        Thu, 11 Apr 2024 23:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3ziXTJu0QamXxvs6gYNvz/UNmyeoJRNxjKRKuN6UjDuQ4mIcj3plCiuEPcjfLbDFMjUnt4dCG4AFXjDUNO/s=
X-Received: by 2002:a17:90a:6f84:b0:2a3:ba0:d9f with SMTP id
 e4-20020a17090a6f8400b002a30ba00d9fmr1707254pjk.11.1712903324140; Thu, 11 Apr
 2024 23:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405102436.3479210-1-lma@chromium.org> <ZhOccGFkTFkUkRUI@hovoldconsulting.com>
 <CAE5UKNqufWZfKLAXLcpBYKQpJEVt6jPD4Xtr=Nesh34VkNOETg@mail.gmail.com>
 <ZhVix-HJrqQbiPrB@hovoldconsulting.com> <CAE5UKNp3uS9cqDbQjcP3SbfxVi3wPFG4LtP6z=WU_V+M9x6LtQ@mail.gmail.com>
In-Reply-To: <CAE5UKNp3uS9cqDbQjcP3SbfxVi3wPFG4LtP6z=WU_V+M9x6LtQ@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 12 Apr 2024 14:28:32 +0800
Message-ID: <CAAd53p54HYPZEbK2aKQXjZt0V0-u-+F+6yqFjLzSVZx5BXG91w@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Cc: Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dtor@chromium.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Douglas Anderson <dianders@chromium.org>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C5=81ukasz,

On Thu, Apr 11, 2024 at 10:23=E2=80=AFPM =C5=81ukasz Majczak <lma@chromium.=
org> wrote:
>
> > Sure, but what about other transactions that are initiated by the host
> > (e.g. SET_POWER)?
> >
> Somehow it is problematic only on reboot and works just fine on
> suspend/resume and
> set_power.
> I will dig more and try to find out what the difference is.

If cold boot doesn't have such issue, maybe I2C_HID_PWR_SLEEP
shouldn't be used by reboot?

Kai-Heng

>
> > Perhaps this hack at probe is enough for your use case, but is an
> > incomplete hack and at a minimum you'd need to add a comment explaining
> > why it is there.
> >
> You mean a comment in the code ?
>
> Lukasz


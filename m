Return-Path: <linux-input+bounces-4721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC691C9B0
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 01:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259B31F22FE2
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 23:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7ED17BDC;
	Fri, 28 Jun 2024 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ghBDcNEO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4F78B50
	for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719618761; cv=none; b=OSQxbMbGHa6l7FJoLis+5EfxdsggHRZPKS17SvVnYdWlk53smCfk3hYJrUypan/8YrwPXQ/6f1GqLIw+Qx3Zj8gHBY08YIfWG3fOkXo2dx6ffX8dN/dO45Z+6pewDnBuidXPdanBu2HOyBzNb8VGUo6Jq/mgdjvNN2hveXyR344=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719618761; c=relaxed/simple;
	bh=plgaHI6w0BxfpzbpP/KpTiiGUsDa6exApUlaR8tyzMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwEoaoaLygE1hN6TaQVKu8McMcF88LJivtrAbMKlm/HZsrYuA4fWP2RjWPu+9jp4TL0VALyWjM4sdyAB6MXFDpkNT+PBhn2YB9EEzONA28gQa/lkvtyMU2j7u0XyRbJkIi3AUm6Mr+RM/NrS7ufJ0A5hrzRUrlnIudKIzKoQ8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ghBDcNEO; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-701f0c97b62so943312a34.0
        for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 16:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719618759; x=1720223559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+a0q9CHc6ntwSTXX5bV2xYfBM5U2p+ATNjpIdvD9QL0=;
        b=ghBDcNEOT2yeucazhrlh5BsI7dgkByIQIdIG3N574XFYmbftq25ysSen4JEODbzFQd
         LTzjVoOIRpXHKEOFHMSNSgjHu94G0l4liF+nsTIzlFYoIVKmN2uNvs5okg4D6YzO+Izq
         fbUdr18niHDlU3ZD69YMpKufBBK1oLR/KcL5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719618759; x=1720223559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a0q9CHc6ntwSTXX5bV2xYfBM5U2p+ATNjpIdvD9QL0=;
        b=u3x1dC/4Q14SOQ3kW1eG6DYgWCmIlRlL0gZL0aKOG+IMtRfdasK5McdyUHQvlYZ1A3
         Bc9YIxFo8sdQMH/BDFTjkhoXRtiI97g+KzBoXxr6GwaaFfE5yms9mGLD59olm1VNSJZf
         yP6KI6oIskFRdX/1cAMgjzNDPStrL8uqy9hxilvKrkLFBCOVbgoOLYV1waR0cEl41zbd
         YvbVEPXFS70XdcXu76tKmzU88ZdM++GQFuII5ED+ZmvHtxtjfPFiM3spKUV3wKRMiEVd
         i548PCMt+YmfxEdyFaP+hwswUamdYFCvcr1YUlqzq4t+tH7xTqd36PpDhR++Du5slflF
         Vt2g==
X-Forwarded-Encrypted: i=1; AJvYcCURPc/WlrJQAzIQ3bSBllIaAatqp0yPHFHoGwQOO3Biz8YpWS9pHs+80qA4NOjDt/sLi/pVIFtp9ZpIZsm+zw95kFrC3amhbtlUvXI=
X-Gm-Message-State: AOJu0YzRVirPEDvidHcsdEuxE9njmbM2M08FANx3g5YYaNog2wkTBizN
	AbTAO2ff7XKKX3bhBpYB34dtnL+jhOqu8oWJ8zB0vxbLtWsumrCn369/Xrj1cA==
X-Google-Smtp-Source: AGHT+IHgFO5tajoidl0Qobw//a3BTtOceg5I5uerWD6fo9A5Zu3i3HpMgH0zzNPEcb/BnFuGSbwSfQ==
X-Received: by 2002:a05:6830:18ee:b0:701:f4f7:28af with SMTP id 46e09a7af769-701faaa8dfbmr1410568a34.11.1719618758389;
        Fri, 28 Jun 2024 16:52:38 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7a99a66sm488361a34.1.2024.06.28.16.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 16:52:37 -0700 (PDT)
Date: Fri, 28 Jun 2024 18:52:35 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v2] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zn9Mw-vLZeUcCS8b@google.com>
References: <20240624065359.2985060-1-zhoubinbin@loongson.cn>
 <ZntY8UO-VIW3reL4@google.com>
 <CAMpQs4LmAc6_-2KHEnZsnaMdbUWVTE_zhDK8W4GEtnBJyr0AUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpQs4LmAc6_-2KHEnZsnaMdbUWVTE_zhDK8W4GEtnBJyr0AUg@mail.gmail.com>

> > On Mon, Jun 24, 2024 at 02:53:59PM +0800, Binbin Zhou wrote:
> > > +
> > > +static void pixart_reset(struct psmouse *psmouse)
> > > +{
> > > +     ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> > > +     msleep(100);
> > > +     psmouse_reset(psmouse);
> > > +}
> >
> > What is the reason for the 100ms delay here? Is it to prepare the
> > controller for the upcoming reset? If so, could it perhaps be
> > defined as a macro?
> >
> Yes, the 100ms is required for the upcoming reset.
> And we just use it in this one place, do we really have to define it as a macro?

Got it; could you add a comment stating the requirement?

With regards to the macro, I wouldn't say it's necessary, but they can
make things more readable in general. I'd say for this case, especially
with the comment, it's not needed.

Thanks,

-- 
Aseda Aboagye


Return-Path: <linux-input+bounces-847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AA817D3B
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 23:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6F81F22BCA
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 22:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBAF74E17;
	Mon, 18 Dec 2023 22:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XOiq8UPj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A074E01
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 22:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55193d5e8cdso4351712a12.1
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 14:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702938437; x=1703543237; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rsymvm4HmpqYuugQPdCiDnFwCOLsg0n9U9U+h0BAIUY=;
        b=XOiq8UPjStGlcQSvszG3/upH8JWPXAEMr5hMxIPr6flyUcYc63kLvj91kVcBcffXmb
         xKo8AvIqQeyX5XsKxl98drQEGbrawXlH8WSq6mO+TMLjQ2TXltQiCGGOZwyG8v2MCbH2
         ljap6BYjnN/8boAaScJekyiFUR2p1QdjRIaAvAbI3uCbFA2JYN2MEI0gOw80yHIVx7nX
         pF8cdCJZyKAGoCRu3SRnwldQbJ0Op0+t9WXnB1+roznD4brzLn2uvEUTfRrCOSwZ4f7a
         o6OttDLMMD+z3DPFvtNlQ0AieaGG5i2hsxYF7ZmgtvcCs8wlZLO3B5xbPBN11Xr73iRA
         HeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702938437; x=1703543237;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsymvm4HmpqYuugQPdCiDnFwCOLsg0n9U9U+h0BAIUY=;
        b=pBItdSdi/AR8QqURjmT4OoZGh86MUXtAsYPJ1W+SAYaxYhtIU8GWmb6kK4i+824+wX
         kFaCaxXVnqRyq5UCrI/yR9q7sOGwBQM1+0JtJk+Ib6BMvrvnYnFplDCQBq50UiTfshn9
         K0fBNlUE9kPWK+VVF5D0serFaMEb9HM1NjL29DqyCBhW6AMFOErLMmRD0bD4k0tS4iO8
         MQbMn5Wx3x/zX/z3P6qQn9s1Q2BndZ4eo5f8ORJLxwZiCzJrJqjy9+a9YEYIAspJ1/Ek
         CAEI2+mBxVlsv1GTAZZnTLg8aOXRRLNm8Vz8ypr4weHwZCI9fUJu84oF/TA/qKLduwHX
         bnGg==
X-Gm-Message-State: AOJu0YwKY5/Q+Hwm/9ATkCHKwuIXfSDrBYFMTbeNJyFbIndsrBrQEtTO
	qle9US7RrZ6KgVCo2XK4pmoAigU8KHJZ534C1k4=
X-Google-Smtp-Source: AGHT+IF8d68/tsKUyx6nAxyhalfzH6tlbRfEoDDG1PzBg4faVwjHoqGxrFwmpFZaai96OZeOlzA8Ag==
X-Received: by 2002:a17:906:4f:b0:a22:e2ea:4fad with SMTP id 15-20020a170906004f00b00a22e2ea4fadmr5973967ejg.83.1702938437157;
        Mon, 18 Dec 2023 14:27:17 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id hg12-20020a1709072ccc00b00a2359f95ad8sm1551997ejc.37.2023.12.18.14.27.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 14:27:16 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 23:27:17 +0100 (CET)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, djogorchock@gmail.com, 
    linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
    kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
In-Reply-To: <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
Message-ID: <nycvar.YFH.7.76.2312182325460.24250@cbobk.fhfr.pm>
References: <20231205211628.993129-1-gpiccoli@igalia.com> <87o7enxn1x.fsf@protonmail.com> <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Guilherme G. Piccoli wrote:

> I think I see ... I covered both bases in this patch, but IIUC after 
> your points above and better looking the code:
> 
> (a) imu_avg_delta_ms is set to JC_IMU_DFLT_AVG_DELTA_MS and it can only
> change iff imu_delta_samples_count >= JC_IMU_SAMPLES_PER_DELTA_AVG.
> 
> (b) But the if path related with the imu_delta_samples_count is the one
> that also guards the divide-by-zero, so effectively that error condition
> cannot happen outside that if path, i.e., my hunk changed nothing.
> Ugh...my bad.
> 
> At the same time, the hunk is harmless - it's up to Jiri to decide, we
> can drop it (either directly by git rebasing or I can send a V2 if Jiri
> prefers), or we can keep it.
> 
> I can try to test internally, github testing may be a bit uncertain in
> the timeframe (specially during holidays season). If Jiri thinks the
> hunk is harmless and no change is necessary, I'd rather not bother
> people for testing now (I don't have the HW).

My plan is to send this to Linus in a day or two, to have this fixed for 
good in 6.7 final to be on the safe side.

We can always remove the potentially superfluous check (thanks Rahul for 
spotting that) later once we get the testing results.

Thanks,

-- 
Jiri Kosina
SUSE Labs



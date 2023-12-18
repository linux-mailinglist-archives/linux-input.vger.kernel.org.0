Return-Path: <linux-input+bounces-834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1D817657
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 16:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EDEC1F272AB
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A771349883;
	Mon, 18 Dec 2023 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MoZGdaIR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51549886
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a234dc0984fso162246566b.0
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702914627; x=1703519427; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W44AYSpSZq5w3GuvXWPscQwLaQmSnY9RT5YYSugX0sQ=;
        b=MoZGdaIR587B8ANCErl3VZF2Z6ttQRwICZmJ3YIL7PXCh0xQIidrHamSJQjDEjfmBt
         Smc3qDP9xV4cVck2ss6JJ7wmaAS/iWZAnVRjt7Drg419DYxcZbUhTX+TvttSzIIYbRm4
         tpNSpkBbp1QpwbTH7T4piMfeevs81xckNuNN+wr+8//B08jl57n53LsFrPohns6wksaB
         pVD9P3pGPKTnnX5KUwFeYcCSy+AkdJ0lkwTCDSpnG9ZfMg2oENF+SN3lhuE0kdzNTqGe
         wCkpr5PrTYJ6+7vKKEBZPiET/kF9YopEnIADbZHhXf4c/MVoC3i0m0MaDU2+zcRvAWBl
         mHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702914627; x=1703519427;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W44AYSpSZq5w3GuvXWPscQwLaQmSnY9RT5YYSugX0sQ=;
        b=Cgw6cO9G7Bm3tCMiXRFNI8otX3Mg1O+rGWJNGYxMSeuOQ85Kh0IISki9IOMUyYM/iN
         hTNYzDQPZn96ritxT7g+KEXZ5LNMb7PoApyL3ooiZOxwd45s3AWWepYKqTomJEe0cs+U
         zuTTLLsTrDOqHDl0KsPuqZJ/XiIBe4w5RxDMzcJYADb7XBTGw7ugrIcatp3ITlvT6nOK
         QVL6pJYmLVmkojsZJauUIJFOvipVs9TAxdYVs4yA+6qiW4GxxW5RXG9QUWi6Tp018A85
         UxuXTxGNy/RVDFh0HURISp5GonmBgHvhgC+L6e7UTHwfocNoxk56ZUwXe+qDOIm42sXn
         l/AA==
X-Gm-Message-State: AOJu0YwLn1etjfKDIi08ao5xwUUDA4EzvkAsv4DmLZ7wkQDXE3STPCjz
	ZF7zi3rmF8YMApJHRcjP13XlUu17urS1UKUrmRM=
X-Google-Smtp-Source: AGHT+IFULkCy2qkaPDEhuweFXx3FIQfgUFPktNlOrxyr5gAZNsXbmWvlPh+XRPDpGmGrwyZbTwv3Gw==
X-Received: by 2002:a17:906:3f14:b0:a23:f50:60f7 with SMTP id c20-20020a1709063f1400b00a230f5060f7mr3681596ejj.102.1702914627450;
        Mon, 18 Dec 2023 07:50:27 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id sk26-20020a170906631a00b00a1f7852c877sm13612273ejc.142.2023.12.18.07.50.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 07:50:27 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 16:50:27 +0100 (CET)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
cc: djogorchock@gmail.com, linux-input@vger.kernel.org, 
    benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
In-Reply-To: <20231205211628.993129-1-gpiccoli@igalia.com>
Message-ID: <nycvar.YFH.7.76.2312181649360.24250@cbobk.fhfr.pm>
References: <20231205211628.993129-1-gpiccoli@igalia.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Guilherme G. Piccoli wrote:

> It was reported [0] that adding a generic joycon to the system caused
> a kernel crash on Steam Deck, with the below panic spew:
> 
> divide error: 0000 [#1] PREEMPT SMP NOPTI
> [...]
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0119 10/24/2023
> RIP: 0010:nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
> [...]
> Call Trace:
>  [...]
>  ? exc_divide_error+0x38/0x50
>  ? nintendo_hid_event+0x340/0xcc1 [hid_nintendo]
>  ? asm_exc_divide_error+0x1a/0x20
>  ? nintendo_hid_event+0x307/0xcc1 [hid_nintendo]
>  hid_input_report+0x143/0x160
>  hidp_session_run+0x1ce/0x700 [hidp]
> 
> Since it's a divide-by-0 error, by tracking the code for potential
> denominator issues, we've spotted 2 places in which this could happen;
> so let's guard against the possibility and log in the kernel if the
> condition happens. This is specially useful since some data that
> fills some denominators are read from the joycon HW in some cases,
> increasing the potential for flaws.
> 
> [0] https://github.com/ValveSoftware/SteamOS/issues/1070
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Thanks a lot for the fix. Is it confirmed to fix the issue by either of 
the reporters? (that's not clear to me from the github issue).

Thanks,

-- 
Jiri Kosina
SUSE Labs



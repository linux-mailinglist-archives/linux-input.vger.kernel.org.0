Return-Path: <linux-input+bounces-849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7A817E43
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 00:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23CE284FA6
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 23:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594B760B2;
	Mon, 18 Dec 2023 23:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZpSkJ6m1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FC760AF
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2340c803c6so250080466b.0
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 15:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702943364; x=1703548164; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMfpYlByeIbkxqqbl6TvO1n7cfxKlidiiSvXyCCWM2U=;
        b=ZpSkJ6m1w8613JgYVgxoqiRDAwsLANtBhiAdPCt7KWtF7UHvm+LjWdj4U+aahci5kW
         1D1OJnnxPVF57ztbHQrlcGBRfC+YsvGarAb/zC+EHQZejfQjw3y0aeHiqNheI6KzuL8s
         5vPt0NJYrkcRYAQuH0A8NTTCtDCWWg3AY4TiBVDP1cySZt6HLN1T5uJ1q4AKXN2tcM21
         UotLohQGK1lL8GUUYXdPaLtboK6lhesaHajlNvLZ3K614YODwwo/X+Pa3YWcDXmtK8d/
         O9i9WnkWPPvC7Y9Ir7MFhKtztcpwVVCY9vKWdxlKa063IduOk/XtX/5tOJ7I9eMMXC7X
         lEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702943364; x=1703548164;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMfpYlByeIbkxqqbl6TvO1n7cfxKlidiiSvXyCCWM2U=;
        b=IpTTwu9wCGZVk6qNn1H0KhARj7vjO0BBw/pML5SceLVgzQAsF+/McQzeqCt9xTfFS7
         KTr1WylXAngFyXUE2qDwgJMg1UIAS/TStxHLGRhdoOTu1KAoAaQ358MOtWdF5BFxh82R
         yCMtJnbB8X1UI914hmigXETRnl6skZPPCracgJNr8e3eMo9mnPZdbQ27EX3Y6Pq2h88n
         18wIKeh0rqATTRCOpsLZXgNXqnlQ9iVKqBizWOxSKSWi2u5fdcnkPXfGH89oLNYkvHgt
         2lUiRi78zADGDeTqg7OO0W5mTHGoUcuCuThHgWkgNFefqHfVrDB2sKMfRYcW7CvdtzW5
         4t1g==
X-Gm-Message-State: AOJu0YxA72eJ3zXBgf1nkfTdY0deCk3RocP6QXZJsFu40c/jK9pdAxQ5
	WlgllqBJVo3C9kDuOIaUPD7ogg==
X-Google-Smtp-Source: AGHT+IGsmjKjG0yo72NaF+d/ywYc7GiTQZgWDsXq+c9ywWZPYVJP9o01sp7v7rD26H1vaaMx4nPuWg==
X-Received: by 2002:a17:907:160c:b0:a23:748e:f3e3 with SMTP id cw12-20020a170907160c00b00a23748ef3e3mr111521ejd.61.1702943364367;
        Mon, 18 Dec 2023 15:49:24 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id kw20-20020a170907771400b00a1dc4307ed5sm14582669ejc.195.2023.12.18.15.49.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 15:49:24 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 19 Dec 2023 00:49:25 +0100 (CET)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, djogorchock@gmail.com, 
    linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
    kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
In-Reply-To: <59290abe-c780-5287-d27a-745f4f00ab8a@igalia.com>
Message-ID: <nycvar.YFH.7.76.2312190048380.24250@cbobk.fhfr.pm>
References: <20231205211628.993129-1-gpiccoli@igalia.com> <87o7enxn1x.fsf@protonmail.com> <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com> <nycvar.YFH.7.76.2312182325460.24250@cbobk.fhfr.pm> <59290abe-c780-5287-d27a-745f4f00ab8a@igalia.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Guilherme G. Piccoli wrote:

> > My plan is to send this to Linus in a day or two, to have this fixed for 
> > good in 6.7 final to be on the safe side.
> > 
> > We can always remove the potentially superfluous check (thanks Rahul for 
> > spotting that) later once we get the testing results.
> > 
> > Thanks,
> > 
> 
> Thanks Jiri and Rahul! I agree with the approach, better to have it
> fixed ASAP indeed.
> 
> I understand no action is necessary from my side now.

Not immediately, but if you are able to eventually remove that 
likely-superfluous hunk with a Tested-by: tag, I'll happily merge that 
patch.

Thanks,

-- 
Jiri Kosina
SUSE Labs



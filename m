Return-Path: <linux-input+bounces-1073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B182199F
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 11:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B282282DED
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEFFD27F;
	Tue,  2 Jan 2024 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a7C8hfrG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C7D26A
	for <linux-input@vger.kernel.org>; Tue,  2 Jan 2024 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2864eb81c9so20313366b.2
        for <linux-input@vger.kernel.org>; Tue, 02 Jan 2024 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704191028; x=1704795828; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNSPUkz6pyBycuxYcjsR5qM1VoTPDJiEWo53AGdrr7c=;
        b=a7C8hfrGyVsgWJp4qp2IddsX7CupshTAbOjOsVlfxggNIvKZchXLrwXrL/P5Xz+R4F
         aAnyW3RKtBdIfSxz4GC4OHbmQH6ddyxbOYRWJKyg7+YlZZvmI85WJifKLlAzj5Blxbjn
         SwZWon2MvXpukHDSeDzh7XLGa44U+Z4IYZ9r22EOtHhV6vmAdbZ0zh1fALk8mNgTvM/2
         K/IeKuvZzKSpCKx9BBTpBg7iFRjDgxIDyo5tGbi2JnbTy7FOYuc6f9OHSaPzqIE9o7/W
         IjSBdeENdoLjOuWEysdy5qYncMvQwsftWwofXz23l0TuZ6WOP8Hbodfffp/uz8R22+MX
         TQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191028; x=1704795828;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNSPUkz6pyBycuxYcjsR5qM1VoTPDJiEWo53AGdrr7c=;
        b=JVvjV7FdkvQcGj7WRVvlMRSxDpYOf0W+zsUDeVO7h4ADPnXAM/TTYX2CR5Vsap9pha
         TgbvMg+gXxtKpvZvy1A9iRjqaGGFo7v37SWPsJ864Tz9ghlvXaJvGemNM6zacWSfVEwV
         TQZ12HGU4/RcvrgE6OOBgw+GEUEbjbUqHCwfdzuL48C9Fy4hY1+lwoFBSKtd8yk+2u/C
         pN4SNJOtmBNw1ZEE22WRshwiaYafYulPW+28Y86iXHJfgaNdV+kuwKv5QtRrVp6a8OzN
         2yHp7D+D/X3P/Ps9GXWiKUwAUgHC9+csNMl4UPPRcSAWg6xOQey7zw0myt5Mze2f4Lt6
         nPvw==
X-Gm-Message-State: AOJu0Yyf80ZpmXkrKFoS04Z8Y1TYPSMlUkpZPHMsyLTqGLojlOa52hG/
	TXTUw39u0r8HPB0ueayvWuUYCLfIS1HwiA==
X-Google-Smtp-Source: AGHT+IHeTBafO1EYbZO7ExJegdKcMIOvlnAHZiHSEL+V8Aig2wsSsqocdMTP1x+mITPSPHkis5AY4w==
X-Received: by 2002:a17:906:51d1:b0:a28:1ff1:e0ac with SMTP id v17-20020a17090651d100b00a281ff1e0acmr894399ejk.155.1704191028489;
        Tue, 02 Jan 2024 02:23:48 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id o16-20020a170906601000b00a26dc8ec78dsm8926285ejj.147.2024.01.02.02.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:23:48 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 2 Jan 2024 11:23:49 +0100 (CET)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com, 
    ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com, 
    Shyam-sundar.S-k@amd.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/3] Add new SFH interfaces
In-Reply-To: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2401021122350.29548@cbobk.fhfr.pm>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Basavaraj Natikar wrote:

> This series adds new interfaces to export User presence information and
> Ambient light to other drivers within the kernel.

Hi,

thanks for the patches. I'd like this to go in together with the actual 
users of it on the PMF side. Does that code already exist?

Thanks,

-- 
Jiri Kosina
SUSE Labs



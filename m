Return-Path: <linux-input+bounces-2360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD408794D5
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 14:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D94D1C211C0
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 13:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9B58112;
	Tue, 12 Mar 2024 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFvNsaN7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A179811;
	Tue, 12 Mar 2024 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710249127; cv=none; b=cx7Kl30yfHNf0GcdIYCxi0ey/mASoKm27WrVTm2tAt/nXOVGV7weyFGauy336U+eb5YAi06QrRRIMPX2lEWj2r4SSV1dmaZ3FDlAwsTAcnJZOTq/8fj+4k9jp0Xbmnayyb1Y5XAmr69AaHQPefF7ph7Ua12KquHIJT6XhvVaaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710249127; c=relaxed/simple;
	bh=HQmXSsmyUcj8tgSlEA+p2fWtbXGFRAy0mt/mVaVTx2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zf8TMCC5F/iy7E21+XtHurzdHc/7amCtpU0UdXaIexfgxsCHpyTIZHJfi03L6VPaBEM42y2jTiV3/GmGQQMWbpgqbNfs0Kw2grHpxLo0EBooP6Bbdv2pWdElPE3CCl/oVDXTf8a8sYYrkzir/pJkW7jn47V4kIWcwNbajzmOHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFvNsaN7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e92b3b5c9so2640514f8f.2;
        Tue, 12 Mar 2024 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710249124; x=1710853924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+a7BPWzUxNuZnAXNJ4Uc90cX0RiZZroJoXZLVPXUqo=;
        b=jFvNsaN7QKXeK03InC5Qw0DRlqk7CBZthm1/2At+VoQCd7WNttUh+jUB9FxkFp8gCm
         +qsGHUmsGuYGBwDqNCjbOEd2nVQvJbPWhYFbknmbkdqg9hDfBFwW8UWeFg/UPyVguskx
         G+cTilQ7O4rI4IYJnU+evgfBm0jnl9y6ifXAo98p5ZAcf8cighUXl6YQcFJkzJe4a5PL
         Me7WGNoc3RTRO4Ljv0ZRR2tsnVEoNNqlSLMO5D3ptcBySwdCI+t3Yh2toSchGB6hnwQx
         GIerR/92Y/fXYlslwIG6tUQf/Z9xoxOJSxL3Esc/qn9btnCBz/o06RoK9fBYaxByxbV+
         7ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249124; x=1710853924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+a7BPWzUxNuZnAXNJ4Uc90cX0RiZZroJoXZLVPXUqo=;
        b=qTW09wiYCdylsQuTyLCAcJ2umUEYB5R6Y1/gZ7mLODE/Kw3x/QD9MD38g+ECS0YL9m
         QfXpk4noWE6I9n7D/xlHDUbxycMvNE+ldCvF++lBx8WZbEDqcPtAx19eVYI26pnAxzgh
         EWsosrSAsrkDDlocwhBsx0fhlcWIrtEBTFBzRD27K9dl+etH8wl6vYbeJ/0UUZ1mEdjL
         RQd97ABxafrRQHc7vFEPfeezVQ4CJDljStoF+PD/s/wOHOPAOVPC4l4ApZZ8RYlH6Hkh
         HiuDRuWA5scNA8IKdpsflLqA8RI6+PfIVtq5+wVEOwUGLa/ZtjkBDeCYLxr96YCfB0YY
         l6ig==
X-Forwarded-Encrypted: i=1; AJvYcCU/MBYpCduG375zoNvMI/PipD9m6mOEDVzuuGOUDkXXwJ5bg6QYlovJCIPKfHS12yecvrSHaGSdJfEypsvcTcICnuuBKJK+1K/cFJtXClsEKfXH5+8d7f4vVD6C893c2e1GfXE=
X-Gm-Message-State: AOJu0Ywcw0kjVTVkPjcuwS3PyBrfL3WR5ejRlU5eNEHYtbHOz1OAatQR
	RwWeihtZMnXcCuf35grTWAViVzIiVxh2omqNto8D5Wsg/G9UnBxY
X-Google-Smtp-Source: AGHT+IFIN4QxCgPYlcLBTLVsJ9oo9tcjA0Zmai7qLH+/hSTttZx6bWp5xNfnKeL9o+npx+bY3pHRAg==
X-Received: by 2002:a5d:604f:0:b0:33e:798f:6d1e with SMTP id j15-20020a5d604f000000b0033e798f6d1emr6508595wrt.37.1710249123767;
        Tue, 12 Mar 2024 06:12:03 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec5f:c111:da0f:dec2:677b:7567? ([2a01:e34:ec5f:c111:da0f:dec2:677b:7567])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c310d00b004131bb71c07sm12403772wmo.11.2024.03.12.06.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 06:12:03 -0700 (PDT)
Message-ID: <64e1cd22-5536-4de1-b3e6-da83aad24a8b@gmail.com>
Date: Tue, 12 Mar 2024 14:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: fr-FR, en-US
To: Mikhail Khvoinitsky <me@khvoinitsky.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@jikos.cz>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
 <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
 <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
 <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
 <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
 <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
 <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <CAMMabwMDvumbNOvFk3mdqXfprO_xy4gB5R0KangvzJatv8BhUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/03/2024 à 14:05, Mikhail Khvoinitsky a écrit :
>> (I'm not sure of what you mean by "hi-res scrolling",
>> is it about 4K displays ?).
> 
> No, it's about scrolling not by a fixed amount of lines but by
> individual pixels depending on how strongly you press the trackpoint.
> More like modern touchpads work.

I didn't even know that the TrackPoint was pressure-sensitive :) I 
quickly tested this (not with scrolling, only cursor movement) and 
indeed, if I apply stronger pressure, the cursor moves faster. I never 
noticed that. We learn something everyday.

>> So as far as I'm concerned, this patch should be included ASAP in the
>> next kernels releases (both latest and stable).
> 
> Yes, as soon as it gets into master (given that 6.8 has just been
> released it will be soon), I'll make sure it will be included in
> stable (either automatically or manually).

Perfect. Thank you for your work !

Regards,

-- 
Raphaël Halimi


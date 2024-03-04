Return-Path: <linux-input+bounces-2185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF078704D4
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 16:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43861282EA5
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 15:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249B746542;
	Mon,  4 Mar 2024 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXCY1WWe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA445945;
	Mon,  4 Mar 2024 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564882; cv=none; b=UaIp+5sI4j7R4IGoNMEzXGjSN+sur5l3fvNY9tS77zfiemcTgqjK0SrX2QQmlbMpt6JDtdLH1LwizIbDEnaYbyWPv6nRqQHk0JBOLuG1sidhonCx01bekpqCzCfMdp/tNOPkTi/wG6Fff2sk/fOmDxwNg0RJoOtZGO9ex4JBRrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564882; c=relaxed/simple;
	bh=0bsNLdlW5oPD7As+xxqNQnSKvVtobIkGNyzgL3+TtHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhG+0IuTfwwTbRZSTeFyrGpXhVZRY6q0CVvEm9SQRkFWsg4e+ug3NH1fKY/RHaxePt7z12s2BQkqlZtp+xfCHHgaTq8IiNn9EurBJ6K34zhRCTMIrFCzDayvNFiE0KohNYg28E6J9N3RD08KEr5pSvOoOamOfB3nnDAB2AP+7lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXCY1WWe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e12916565so2446615f8f.1;
        Mon, 04 Mar 2024 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709564878; x=1710169678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuLvtTItBdW+KFQjOVDTDYjZp8cHHf6HQzGZuz/XxJ8=;
        b=AXCY1WWeKqKZ5MNdc5kj81kZuAiLTuff5vSg/ozV8uwlC1682nHLijlRV02iD8/klh
         QHHbrkEGY/m+hZI2VClQrjCMOp1iJNDlhztp6yBLf5b4rbzXHQowGQ9vPEwT63gHaOLp
         gAGbY7GT4/TAlKHdMNzLkwQP0EqasTT2QQxCixos6GmPaY9xPKZ/JPwjntbUFJc2TVcF
         Fx1eT6gcUut0hGp3OnNm/JlC/4Z+D/I1VfIDmFVaY6Up0r5CaAUFP99QiMMi+GICemHO
         1+5iDNers/39iRx2Vpv+2LLUFS0oG3xRcjKLI3MvLXv70hUFve5E8gg8mDyISoidYc7c
         yiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709564878; x=1710169678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuLvtTItBdW+KFQjOVDTDYjZp8cHHf6HQzGZuz/XxJ8=;
        b=bNAUOWVxb/ZxXbfRRStRhZp6onfhrNBgag8hJ8ggE/gCWpopDm5nsy/otRGDJPb4Z1
         4hf8EILJrC61+kOZ/wNmv2BeKb/yLYNfOSXSVCAlrz2db7RydsnPR88yABfqn58hC72P
         c0l8oUZgjlovSFf+vWRGyTTruGlgSneqc8SC3TdjwTXio6aaF+XvT1edgRAcJok5iZYB
         eBb49Zq6o3WdARl2z94SMvMO4shP82WPgAP0LL0/6Cnmuw8fyQBYZY+C+OxdB3Y+OuI3
         TGFo4t3wvrD1+gkbQV+h5yEjTmq7OZn1mX4tbiP2F3fAzHFqowWmWxtKjij+1fRlpHFN
         hjpg==
X-Forwarded-Encrypted: i=1; AJvYcCX7u706JF4DtSrxeqzdDg7aVwZ8eqrh3RT96ikAAbYdOqJZhUzr8AAQwmX32uVXKlTE8Zsg03DsPLojUeP1d4eUXqvcWfMW
X-Gm-Message-State: AOJu0Ywe03v5ejoe8my3LZV5MPqYOa+JedFmM9OuYfvhueXkk5DuyBrz
	uosItjQWuOSlIFgXZtlMfLh/zFuX9VGZX+8+Oduhdr9kjCqxfH4I
X-Google-Smtp-Source: AGHT+IFPhdSu9kMy8dW4eWTrqqZe1EwoBbENCord9ThR7ss/TK8W9M7oAvcYADxCRldgPP0462S4XA==
X-Received: by 2002:a5d:574e:0:b0:33e:1d01:152f with SMTP id q14-20020a5d574e000000b0033e1d01152fmr10787770wrw.0.1709564877442;
        Mon, 04 Mar 2024 07:07:57 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:d799:a000:58a7:60? ([2a01:e34:ec5f:c111:d799:a000:58a7:60])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c354500b00412e668b0dasm1995898wmq.43.2024.03.04.07.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:07:57 -0800 (PST)
Message-ID: <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
Date: Mon, 4 Mar 2024 16:07:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: fr-FR, en-US
To: Mikhail Khvoinitsky <mhspacee@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@jikos.cz>
Cc: Linux Input Mailing List <linux-input@vger.kernel.org>,
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
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2024 à 15:52, Mikhail Khvoinitsky a écrit :
> Hi,
> 
> Sorry for ignoring this thread. I've submitted the fix [1] quite a
> while ago but it is now in hid tree targeting 6.9. Maybe we can
> redirect it into 6.8? Jiri, what do you think?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.9/lenovo&id=2814646f76f8518326964f12ff20aaee70ba154d

I'd be glad to test the module with this patch applied.

What's the default setting ? Should I set any parameter in sysfs to get 
the desired result (apply workaround) ?

Regards,

-- 
Raphaël Halimi


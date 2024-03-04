Return-Path: <linux-input+bounces-2187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCD87069C
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 17:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B511F21749
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 16:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F69482EF;
	Mon,  4 Mar 2024 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2PH0El9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5C482FA;
	Mon,  4 Mar 2024 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709568573; cv=none; b=Or46oKYDyz7DMo3Tx0yGqRExE9I2bbFku5Lr8gEzKe69SnCOOrBaaoLXs+gZuxMtQwj3R1ZaQp3dWanvfXSwHxI31gTGHpXqSPLTF3kGD+23HaYc9ltfQk0SiM2BnTkt7wzRNDcCFbKDb3C6nyi+pmRhqg0A4Z1drS6y0uVREkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709568573; c=relaxed/simple;
	bh=lPGDIkEBplDb8m3Vlj3yhM2rJxIPoJyBAnQ3eb8BooA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHdiIcsR5Y7HtT/SV/BW/4aml4hl9woQn9Yl9r6l+79icRcTNGhOoFgNSSW70HPkeFk3wFmG8LA+yRRsi/BvwmDfYhf9grbdErnTYUVBIeKPL5L0ouECVSwCTfAT/bhExfRpgmpPsFHPz6yMhHRvbNSdYD+HtPCdiY3uJgGcOhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2PH0El9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so52368891fa.3;
        Mon, 04 Mar 2024 08:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709568569; x=1710173369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuyOvIyOBwfiR4M4sxlaKTMFgYgHpqmg2LxHSN+K2Ns=;
        b=l2PH0El9XpNINb3eebk1wWiXvgl0Bmib+wBlDejsyiEdsFVfEtJtIbElijqdOLGOtx
         GwkOas3L46P1QavGJubk+XPOuCZdolCcqcooGMf6aTHmZqivA5F++Kwt8uTq+1+HeeVp
         Wo87U2oL7Y6WwWQJGS7uljTMLhZ8Rpr5iyM4xVtwa30jWjeZLDzEobERhBegDB0yFrnL
         sfyP3JFnEcPHxObz+9Bdkx9yZWyU/14bX7Txnncnnj9ghopTYWr4rRXCm5mxY99He+07
         C3RxoUswNAwmm9NuVgerYYo8V89kPcDl3wrRApzaoYGBmCG2AawIBZj7CvRkQb0umj97
         QKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568569; x=1710173369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuyOvIyOBwfiR4M4sxlaKTMFgYgHpqmg2LxHSN+K2Ns=;
        b=iCudSc/FKnexNRXwPCsK50xReGaVYWSmGMOvaa+mOynsGwhBWHEH3ZcWU9d99A9aV1
         PoSlO36Pkhb21wU9DearVCuSC8LZcVdhTDA2eNGzC1CP6PPBMtX259elEUl2iqbwZWrH
         4F6q1qzWt1QDBgHyF9BLlO8SOl4+D9sOWnLq5PIyeGnfpRTGIhgodjPcoBq5fLwJ2TYs
         PHwPjM+ka8br88kN4Gg6Z5wurKRrnaX+jT9Wv0qFuyzQFcN0iowxrVVz2XzM07hdE3su
         BzoAhL9pjk3LWj07ApTiD5ka43SlqFBWM4rFGLrsnKAS1mgh6P0hd7sneI2/6RPOywa3
         jAMA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxMf8bK94AqPr1P/y4xEcnbkioDPQqEwON7dUcOC45kITHiPVOX4R6HOl5Gg+S71E7sp9Lrs2z9EhBA16ssmJR4xX82Wf+uoOxXz3HFZJhgbf7Ygf1sdMJeAd/x1bVkuS3xE=
X-Gm-Message-State: AOJu0YzVBUv8KZjb2jLdO+UCDs+80CUrghLKs5Vplli6oCFpLxo8VNtT
	fh7cF2F6gs3pB7fM0sRv671P66HoJEBvbgWHRsvvqcOPuqptvJtQ
X-Google-Smtp-Source: AGHT+IHsFmOZ5Jx/twmR31hA9WNEe0pZKDYSnXlXXA6XOj7BbAjQPSpBTrOT0cgrIeaLhyYWT4F0rg==
X-Received: by 2002:a2e:a7c2:0:b0:2d3:4b07:9140 with SMTP id x2-20020a2ea7c2000000b002d34b079140mr6808242ljp.47.1709568568844;
        Mon, 04 Mar 2024 08:09:28 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:d799:a000:58a7:60? ([2a01:e34:ec5f:c111:d799:a000:58a7:60])
        by smtp.gmail.com with ESMTPSA id bg14-20020a05600c3c8e00b004122b7a680dsm15266992wmb.21.2024.03.04.08.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 08:09:28 -0800 (PST)
Message-ID: <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
Date: Mon, 4 Mar 2024 17:09:27 +0100
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
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2024 à 16:12, Mikhail Khvoinitsky a écrit :
>> I'd be glad to test the module with this patch applied.
> 
> Sure.
> 
>> What's the default setting ? Should I set any parameter in sysfs to get
>> the desired result (apply workaround) ?
> 
> Default is 1, so you don't have to change anything.

Thanks, it's done. I'll test and report.

Regards,

-- 
Raphaël Halimi


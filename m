Return-Path: <linux-input+bounces-2208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E148711E4
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 01:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBD151F210AB
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 00:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDAA46B5;
	Tue,  5 Mar 2024 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asPvtNjX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC546A0
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599394; cv=none; b=rS054vqqyTBEno/CZr+EJC3u6Bcjm7NmTMGjFb1WGbMeuAiohOyJv5K6vi3wrO1RZvqdsOweSELPgIEgxETpGNbFOobQTloGilxnJgr7ZumhdIHKIgUyClqJ80F6Sm6CPfkQ21W/T77ho+1qw23LUqkr+aQVXqEMf/4p9AA3DXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599394; c=relaxed/simple;
	bh=i+9TG63dIeCwX6A1FSQfa+pp6n0t0zRwJsg1MOpwRgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbdzGhJVoGDBhu1AoM0dmeWxJ67RVv2HBSWtvh5s3vlmfqILrstews++tt26M9lZ+2kF71xEyueXg2Ak776CUn1sR5f86rfvDssZs9jLBODByWxP7K++1UIc2K5dhWN4GBR0GGHNeB61lBAPRXO+ORyuj5FJ4tKNTwixPK9sAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asPvtNjX; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1dc1ff3ba1aso38711775ad.3
        for <linux-input@vger.kernel.org>; Mon, 04 Mar 2024 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709599392; x=1710204192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URrS8glJFWUiAoRtO7SlP1XyYj10mu2KuLYcQqYWEBs=;
        b=asPvtNjXXpdOoD8s5aQRc21+MzLzOoMAPUq1hAFQw0EUa6M16HfuiyaJjhtnRK12TV
         LMeqcINWzaD4bNyjTgwTkOgWSc765MJ4rtcNWaRmiYRvfHqJRYGkejOVi4tsEjhNehki
         PaTnMGXypaPvKr3zElI8WvBycK5xPZZgrdJ/uGcC6/KGbXz6kHt8/6OF4UVYOIup2uFk
         xvSo5WoLghY51vPdAl+l7plDHpqYePozYz8gWyoUIVrOOidTDs5nsxntItOS4OsU8oxY
         77puHxlHE6RbuaGSsz6WY8z1I4xgypGePzI1HAqE4381Q32jV5nt6N7EdZvpdnF2SaWz
         aS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599392; x=1710204192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URrS8glJFWUiAoRtO7SlP1XyYj10mu2KuLYcQqYWEBs=;
        b=uPqAi19PLz+0y6alnJnep3YSt4mD8dKSBMZsQzktAUkp/6r2TJXKXFLXnIfW4kiK40
         c6CMzd1Pvs0Y7Ic09P8ZAWNDmS1fKWs1/YKx4lZ8j6W+l0YjgWbgUoZvoRXuj0Jb20hQ
         JQo0c2NonUsyp6WjEfTyS3eXlAPCrmECjA7VVFs3Zww+6RomyfQxrlSwjqqkFfThgCAO
         tacp0T4IC5HwGPlSwT6GyYCbTEqjhpkzpmpAJ+vXpnS2hQ3uQ+C4jDk0cV30JkrA6Rn1
         qW7eSiV7a1nvHufnIGHZz6KmRKa/KndMDSyUxbO3Svos9wGDIY4ic9hoAP56HRDjKx4w
         abCQ==
X-Gm-Message-State: AOJu0Yx6ezrIDX02qTK34UOHcx5o0PQQo9SlLOZdqBp9yLYiU2ZBMUGd
	1l2FL2fJ/WqyComGaH6Ldlan0t0n5KnkORb6rfPR8l1KKrgtP2Po
X-Google-Smtp-Source: AGHT+IFhhuTlc7wpW1QmkMEqysiKoeeKq+VLyCf7t6+s8MTxMtiELQ7rMq3Inhj8hkRa5YqyHR8GZQ==
X-Received: by 2002:a17:902:ff02:b0:1dc:ad9d:9e7b with SMTP id f2-20020a170902ff0200b001dcad9d9e7bmr384383plj.59.1709599392487;
        Mon, 04 Mar 2024 16:43:12 -0800 (PST)
Received: from ?IPV6:2607:fb90:571c:c787:a1aa:d99e:c4b7:75b8? ([2607:fb90:571c:c787:a1aa:d99e:c4b7:75b8])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b001dcac08a360sm9183856plw.175.2024.03.04.16.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 16:43:12 -0800 (PST)
Message-ID: <8a2e32ad-abbe-4459-ac99-c0b8e8e2cdef@gmail.com>
Date: Mon, 4 Mar 2024 16:43:10 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - Add additional HyperX Controller
 Identifiers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <44ad5ffa-76d8-4046-94ee-2ef171930ed2@gmail.com>
 <ZeT9cbHRVe7td8WB@google.com>
Content-Language: en-US
From: "Nguyen, Max" <hphyperxdev@gmail.com>
In-Reply-To: <ZeT9cbHRVe7td8WB@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/2024 2:45 PM, Dmitry Torokhov wrote:
> Hi Max,
>
> On Fri, Mar 01, 2024 at 06:15:42PM -0800, Nguyen, Max wrote:
>> Add additional HyperX device identifiers to xpad_device and xpad_table. Cc:
>> stable@vger.kernel.org Suggested-by: Chris Toledanes<chris.toledanes@hp.com>
>> Reviewed-by: Carl Ng<carl.ng@hp.com>
>> Signed-off-by: Max Nguyen<maxwell.nguyen@hp.com>
> Your client messes up patches :(

Sorry about that... I tried to submit through a different client.  I will submit through my previous method next time.

>
>> ---
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 7c4b2a5cc1b5..a7e001a1f6dc 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -131,6 +131,11 @@ static const struct xpad_device {
>>   	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>>   	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
>>   	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
>> +	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
>> +	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
>> +	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
>> +	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
>> +	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
> These need to be sorted by VID/PID.
>
> I fixed it up and applied.
>
> Thanks.

Can you help explain the sort?  Do the VID/PIDs need to be in sequential order?



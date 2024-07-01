Return-Path: <linux-input+bounces-4788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585F91EAF5
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 00:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62EB21C21433
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08250823DE;
	Mon,  1 Jul 2024 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHDu8+jk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71FE17BA1;
	Mon,  1 Jul 2024 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874128; cv=none; b=ZjZ6owCipN1L8z0ZE3RXEmk8cepQT3DnFnjda4wgFrbSljW6rpOg35Ls2Mxl0rKqHs1zIEMgUcg7vpnKwNaYAmZsArvJvS4IGNKZJjBoOKf5+p8I4CQi6HVjoKDsYuQi6Jm9XdWdOeYnvYtmbWYt9v0K61li5d60isp2nJUxy4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874128; c=relaxed/simple;
	bh=/6Z/UAr2KgLqp347jHQwBD9sTujLQ/+JLX5OMYw3hw8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=Gb5RWIzHP6HqS3KvNJI/ObFdPsHKWITgZEnY/rfapi43420WCCovmgPRQmcqYY+Oyih9uXoE3I8OWIw5vMOhwdsotTMg9bzfwYJMq9LuZMzRsPSCtLxnsgBOw5tC3ObmNT8LGIlD6fRNPKiwNTvJ0DtIeozw1LJDFuyUM0M0wcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHDu8+jk; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7066a3229f4so2171362b3a.2;
        Mon, 01 Jul 2024 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719874127; x=1720478927; darn=vger.kernel.org;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdlVPgQAR+X09paap9HfMATsnRFfGeCHqlkO62FRPcs=;
        b=AHDu8+jkE1dqghzR8TOIdrNns2K7FPieKwMDqNjL2zPQoFM+9ShR2CS7QqAssKOq2K
         qfhh8kqiRvusRnaMcSUmE3xHqJsir/YpscDGVjvna+C5RfeoOQJWdmTC8ueMj0T3VXNk
         3CIcFhkAKoj+bva+t8fUdDhIY2+JbComrMorPZZfdT13rGhGfhC715nnT5f4TkKs3xLH
         Kb3+yq86WIZ87mvj8iNDFqW3I0605+ACUF7Asd10pAnwkYIEzsu0CJjUUUd8lSgkueHG
         p1KVThjmRL3yNDkPaPE01WJbHD/oYox9BeH+2UeYaicQu5AwhifHRRsc9sVhbaFdfyvF
         dMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874127; x=1720478927;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdlVPgQAR+X09paap9HfMATsnRFfGeCHqlkO62FRPcs=;
        b=qgj6P8aDYVyI5EtGETzbim6bMTqKNeqy9udh9cKecyxd0jUHkicNrXxiuq+MC6onzH
         80iIC4Ymt2M7RNwj2OrOVMHu93n8A1SN+b1QnPuEkK7T6Fk6KrbepOOfVkizIHQ1r/ZB
         tCgIp0o2Iug4gSq8ErlQXos4UPrGlnJA5L27fEuulNtbVMG80CkeXP+K2fSFNFFSmJpG
         JOsjpoNw1y/TIMjuAkLukJLBXD3ydcuAfrKRD6Tansi0fuK8E9Ka2bcmWPmDfU+aPUz9
         vJoxf/CuW6eiiQaboM389dM8aYvMx5/o6hzB6308YEIeBcv8pu4tSmqt++G2UHBM6KG6
         aPMw==
X-Forwarded-Encrypted: i=1; AJvYcCVIH6mPvmiX4rJoVKWPNOI1wdrEJfA35q5rMWIbwzjDsKF2gwgzjLr47ikQWso+rIzIJKAb7y2bRlPH8gToInJlAwWIci0Ims0sFIhRtmBFIVLzYmmeN0WtLHeB4JTOh0SANcfjSSHLdNA=
X-Gm-Message-State: AOJu0Yzb6/e3q0Hn/s6Q5t1+0ilHsHclD4kaltMVnRGxsuNyU73n1aVZ
	cb90lSNMA4hi8KySh55ciUEHKgAOPeGUMzNDuHL4HFJlsCWjYiEV
X-Google-Smtp-Source: AGHT+IHFN4CHmBRJmSu3HUoM28FBmLYAzslqhKRbx5V+Mpzpac89oqKSSeVgLrGFTnQlhl4Ua+32Ow==
X-Received: by 2002:a05:6a00:1acd:b0:706:334a:43d8 with SMTP id d2e1a72fcca58-70aaad26836mr6351092b3a.2.1719874126879;
        Mon, 01 Jul 2024 15:48:46 -0700 (PDT)
Received: from smtpclient.apple (121-45-106-167.tpgi.com.au. [121.45.106.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044af3b0sm7288776b3a.175.2024.07.01.15.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 15:48:46 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] HID: apple: Add support for magic keyboard backlight on T2 Macs
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
In-Reply-To: <MA0P287MB021782E3C0DEDB8FC65F1C35B8D32@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Cc: Jiri Kosina <jikos@kernel.org>, bentiss@kernel.org,
 linux-input@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Tue, 2 Jul 2024 08:48:34 +1000
Message-Id: <8DC4D384-1349-4C8A-848D-589BA25B15D2@gmail.com>
References: <MA0P287MB021782E3C0DEDB8FC65F1C35B8D32@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
To: Aditya Garg <gargaditya08@live.com>
X-Mailer: iPhone Mail (21F90)



> On 2 Jul 2024, at 4:19=E2=80=AFAM, Aditya Garg <gargaditya08@live.com> wro=
te:
> =EF=BB=BFApparently this patch is breaking touchbar functionality is some c=
ases.

I think this is because apple_magic_backlight_init will return an error when=
 it finds the touchbar interface, but this return value is not checked, so h=
id-apple still binds to the touchbar backlight.

This should be fixable so I don't think we need to still have the separate d=
river.

>>=20
>> static int apple_probe(struct hid_device *hdev,
>>       const struct hid_device_id *id)
>> {
>> @@ -860,6 +940,9 @@ static int apple_probe(struct hid_device *hdev,
>>   if (quirks & APPLE_BACKLIGHT_CTL)
>>       apple_backlight_init(hdev);
>>=20
>> +    if (quirks & APPLE_MAGIC_BACKLIGHT)
>> +        apple_magic_backlight_init(hdev);

return value isn't checked here ^, we return 0 unconditionally below.

>> +
>>   return 0;
>> }


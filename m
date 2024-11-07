Return-Path: <linux-input+bounces-7936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3E9BFDB1
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 06:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA07B21F27
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 05:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B95191F92;
	Thu,  7 Nov 2024 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzrkOILr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590EC10F9;
	Thu,  7 Nov 2024 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957898; cv=none; b=rAAYdDKbCzyJHmxnNB90PDASesqX5eU/AunxODNW+p0OVBysqIElSgkA+n5yr+dvjvUAbmFsgSldQRXRhFpOJNUdSY7E8S1ZP21nL+cdPdBNQTzaM+Wi07pg0AJkhZDctW+UQF9b0VZPi6RwqX3UqBLlBuzFaZd6rxYkmnPxIPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957898; c=relaxed/simple;
	bh=mEcullaj8Sv3WoRHXtlwHwXZOfjaigSxz4Ct/EJQ8DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue+u6W/xzgfa25jR2Y5MfsI3YDhtyOaC/GDISX9OpphMpDrIma6BRsXul0SFu0B8qeKMCga4LkPDlW/ccLlOwmFbqtHG1NlRxL7ZzgTGcjHaPMN4ol1G+v9eAhuCouOhffruXv1n6QX4/+csLhX/d5wldDvHoRTu9Bw8Zyt74zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzrkOILr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7203c431f93so413760b3a.1;
        Wed, 06 Nov 2024 21:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730957896; x=1731562696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEcullaj8Sv3WoRHXtlwHwXZOfjaigSxz4Ct/EJQ8DQ=;
        b=NzrkOILrQeMsQG7RfcCrJHKNz6gBHzgxyGRQx1qyL5N1nxLY8smUlAzYenP+U45QaF
         HPeKPursQraUGo0YjFcNkBBJGK/YsNDF/m5wJR5q1RYX8Q/mNEY2kiWjpbTezSjegrxT
         KZPuypG57WXXvhsbpkNy4PCJHI7mcvoDTNEUb3tcvOJR4hJAodudX1rpQJe9rHmOKZdQ
         pPfJYo0A1tj1I/QfbdNcDhsnJIuQaZf8rR0haDZwgtaLBiDTx+CWp/nEBukf5eVpjew2
         rUO4G1FZ+/gOX51i6oS2c1qP3Vr87jyo/VE91GbVau2i2iEsu5OfynWstulExyySzjdG
         kOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730957896; x=1731562696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEcullaj8Sv3WoRHXtlwHwXZOfjaigSxz4Ct/EJQ8DQ=;
        b=af/y5Ohyb6w3BWe8SOS4egUq2ODTDkaYamnxXkkGR2iYvRDLNFHUR3USoagy4iDMqP
         KZxyAuilmyyBW5c/6nFIjrmvtHWFL4/kdxIOANDozPKouN4jku/kAjbyQXLfruTPmPuo
         nDTOpNRxQC7n9/AoHvuzMW35e97aeIXeHDkp2sM7tnc4oYdhVAyJKqJeDW7jtRZRRGyE
         ljaF9hN1I43XV4r/csNMhbe8zTFqSpFXHeDU1TEJ7HVXFzemBnpS5X6xICRMHoqe4rZh
         OzPYXiaFm4dgIbdvB7gARSJXGI6hmu204EZMes2a7MYi+9n7yVJTrFG8PmRSnnMXgrEb
         fzqw==
X-Forwarded-Encrypted: i=1; AJvYcCWqGYiPFGkMwneuApL4b4W28e2SocD5nLO5FlQtQ8X+gl9W4pcuuu5rCdFAmUQ5OkYU88DHhLT7+fX9BQ==@vger.kernel.org, AJvYcCXjrWvaJrs1aq5F+FJj/Oc7uCjURM3a7HNw7RDEucUn0XMKSpEIErYQjMqLS28XnXG/45zAw+YvxIFLs55p@vger.kernel.org
X-Gm-Message-State: AOJu0Yydasz/df+wjGPgnQoGoFk0ZkY7Omz5D7lEdOQUA2KpbJQW4128
	3ked5O2p5+F/jvmFA6I+qaMmbb6rMSZB9LtoYF9R0gbAvdFbz7UzQE0/jnL/
X-Google-Smtp-Source: AGHT+IEABnugwBNoBdk9jAlJNldwPr7yZAmPFyutYwyQxwaFRHy4LTNZWTkGm6DcoOgrHnDFKToyFA==
X-Received: by 2002:a05:6a20:734b:b0:1db:ff9a:c9bf with SMTP id adf61e73a8af0-1dc12969e90mr1218389637.39.1730957896450;
        Wed, 06 Nov 2024 21:38:16 -0800 (PST)
Received: from ?IPV6:240d:1a:13a:f00:e44d:d023:ae27:27fb? ([240d:1a:13a:f00:e44d:d023:ae27:27fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e41644sm4043045ad.139.2024.11.06.21.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 21:38:16 -0800 (PST)
Message-ID: <7386515e-ee11-4a3f-9bb4-3f2c453c68cb@gmail.com>
Date: Thu, 7 Nov 2024 14:38:13 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: Add reserved item tag for main items
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240926072541.109493-1-tatsuya.s2862@gmail.com>
 <nycvar.YFH.7.76.2411061450380.20286@cbobk.fhfr.pm>
Content-Language: en-US
From: t s <tatsuya.s2862@gmail.com>
In-Reply-To: <nycvar.YFH.7.76.2411061450380.20286@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/11/06 22:51, Jiri Kosina wrote:
> On Thu, 26 Sep 2024, Tatsuya S wrote:
>
>> For main items, separate warning of reserved item tag from
>> warning of unknown item tag.
> Sorry for the delay, this patch fell in between cracks.

No problem, thank you for your review.

>
> I think the change is fine, could you please just extend the changelog
> with the reference to the relevant part of the specification, so that it's
> properly documented?
OK.
>
> Thanks,
>


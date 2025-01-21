Return-Path: <linux-input+bounces-9412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33913A17B17
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 11:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B6B3A1C72
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB1B1E766E;
	Tue, 21 Jan 2025 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eTfLrJA7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A451C07CF
	for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454245; cv=none; b=ljjNgu9f17QAAv0vrMlODE4Oa+3OpX/fhyWHB7zo3JWNdCQnBWsXdQY3yzfAYCIjUe2t9BQNCak2JVfaaqWv6DdWjOtfc1Fu0LvXQUBO5BXlUbn4/DLF2QiWMKYk25x1/6tOLjWk6BcvZyyZflPYXU+/YKjC5fuYZBywhZ+IgME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454245; c=relaxed/simple;
	bh=CI7FmsqudmVhYBCbsOCRKMqjy3MmFlVJq7TwHksWTDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4nhHRJa4fMSGIdboXxoTogmwz8MXguMeAW8lkEwMDcSsQeIHqhS3iCAyz73B74kGRDaUt49hIHFR04YAVGTx0BfNOXBKGhgCH0BhMBTzkzJVVOApcWMpfrwij1bIXDE3zHgH6akD8aXQTlv0r64DIShLz0VIrbd4kYnHmsfoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eTfLrJA7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee0b309adso813610666b.3
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 02:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737454242; x=1738059042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peWYivbfAOTnI2yradHMHdT/q+b6yZhKcWKaBFpAlMQ=;
        b=eTfLrJA7my9ydxeLCIBqojeQy602TOMZwHVZsuj+JspzpVWNJi10Bpng4JtD0IJekg
         fbyPq4xHvUo8q12F0m7y+pn30jNhGCih+fxwM1xYb/x6ZRLZ2c/r3OnGuzgR9tVfqT5q
         zkLhqy+L/R4ba4BOzyZHqcZjVf4KQNAY2q5vgYOaSfEdilKN8I+CrthVpnuxN25zNVXk
         fAjVKPuDgkzZSztxMbmkbW0tr8FrjIGd0CVs4wTcBBCHnT7+aemNbRIXC0/1eJL5O5b2
         vA8XPA9J8aCvcaGaUj6DcRHJxrO1oxrcmOFqcu24VUshAR4dFFMyVwMiEe1Ie0jikVGD
         Wtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454242; x=1738059042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peWYivbfAOTnI2yradHMHdT/q+b6yZhKcWKaBFpAlMQ=;
        b=kNZ3NyIhW4xWbI+Nqg/HEfpp3Y4KKHrzhjdQf6ezTxG0fndcPhdtFOd/lHMGLrvxxE
         LvExxRV7Q791+iyp8ZNwYfrT/HY6tsekGzVa6qke0bmlLddnAmp6dRRjIEJinReGIMhJ
         ElbwwNfrVqrSzqGtTBgfMaFsIw/qewc8l3vQ1OO7B1SksE/AG4Jkz8sAtXC4GoT85V6A
         SHfBv0iwQNKmLK0PlVSxdanlnQYkdrRtA9PnyiH67zBymMMLMoBxgdcdL3v23jZe/zlL
         z7IyldXK3fVktRLI4scBks9NpHhUsvFhZivKiKOODf18+6WVJcc8e0WcvduumV6dBoRk
         ZnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ10SxAcyfMpJtyZ8WlJ4Yiuk0f3Vr/5w6y015QXYDE6u4cBflKV7xj+N3Rn0M++E/4U5hdaxQ0mMFkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9fUgZ1GMTo0KlT3rbJ0y0bc46Oltrl2ppD1GgWao7HRg4lOWO
	DjmIfY/yIDp5cfllAt5vYGHryU5SKlhI2hMSReQkHk4Yi95GMeavdnkFt/LzFmc=
X-Gm-Gg: ASbGncskbr1gX4Aud4BgfMCVSSkL6nAGcWnkV3V5vDjsmgo860rMltQRLclSbapd4Qd
	O+ispwy1VLaJf9Bos7AidLTrEa3yjIAiPim3LWfvjNxZk3cy43YDvBmglisYDvXAsjN6Iikmpik
	wSm6fedUJ28rSkyeCTgiCRFFHt2/WPD/nCsZ5r/IVzfIr6QPqCBYWwiPPo19GVxavrnRXhgYNNc
	/vGgo3F+FLznRagCWkvNI1bHvJh494ZsrU+ByhGAni6o2aow4xU2LWSRpu9OAxaQxfUJSpWLTbI
	P3Drcec7RSTUT/4lREoD6v5oUNUpWgI710R8qw==
X-Google-Smtp-Source: AGHT+IHFukCOcjAARr4ty7TISkJvPmgc67CaDdSWKXaF3TAzHhgwZ9sQgfJEs7hNCgwUA0PxLhQU6w==
X-Received: by 2002:a17:907:7b9d:b0:aa6:7165:504b with SMTP id a640c23a62f3a-ab38b17b928mr1441384266b.31.1737454242248;
        Tue, 21 Jan 2025 02:10:42 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:9701:41e3:e368:740f:c4a0? ([2001:a61:137c:9701:41e3:e368:740f:c4a0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87d7bsm724758766b.128.2025.01.21.02.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:10:41 -0800 (PST)
Message-ID: <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
Date: Tue, 21 Jan 2025 11:10:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] HID: pidff: Stop all effects before enabling
 actuators
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: anssi.hannula@gmail.com, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.01.25 14:13, Tomasz Pakuła wrote:
> Some PID compliant devices automatically play effects after boot (i.e.
> autocenter spring) that prevent the rendering of other effects since
> it is done outside the kernel driver.
> 
> This makes sure all the effects currently played are stopped after
> resetting the device.
> It brings compatibility to the Brunner CLS-P joystick and others

Hi,

it seems to me that the same thing would happen upon resumption
from S4. Will this be handled?

	Regards
		Oliver



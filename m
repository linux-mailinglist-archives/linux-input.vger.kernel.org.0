Return-Path: <linux-input+bounces-11140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88DA6DA78
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4EB31891B07
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 12:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC3725D536;
	Mon, 24 Mar 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HnWmwjvV"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F5A25EFA2
	for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820764; cv=none; b=dUFdaJNn9sI+cuVkZ058kQEq3yMybaEkhqNNL6HUWXzofM6nQSRrPgz9os6KkTwqX/6MxkIyL2xXHsYpoch66iVZzeFvY7Va2gH5CemOJ5wDQaLgz/cXRLEa8hFu0dL0PVDx0+B6fRFzLlcT68Je6V8sYNYt/lg91sydNUfZYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820764; c=relaxed/simple;
	bh=io/d7PApFjYqWcRXJtoJmHrFsVWjySeO35GqlZs9+Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UoLrwH4CUyxnnktfQdnEZy6QJhnVVknVXRlYUTB3+HlH+IewLJPFobU/Vllt9IwEpRXvNrIRqaPY+WjpzvRUwNAbyAfG7QRb5GLi/IVv18cWpUgx7/Knq2X0WCXlqBsPADM/UIkxebh6e/yqht5L6t1xZdXQUAKDuJ1vMrPV5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HnWmwjvV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742820761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOzM2ScPSIASv0kTt42gtme+vSrdpeXLeV6vhX625yk=;
	b=HnWmwjvVmrHFLDI/dHNcFJ0kJxJUCTLV4L3sTLhuqeLyezhHf4L5atADl+Zk36TaFDAdic
	i1OneuXIA8lN5C8sWrhr9qvFNf/soN0Wlhu3tRmizKRg6l00kvfgYT/SfOKUp/R+6ExeKS
	eJCOZpz6EI95L7Q50y4jN0GyS6N2c+k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-LuCWijdcOGqGA567AP8zGw-1; Mon, 24 Mar 2025 08:52:35 -0400
X-MC-Unique: LuCWijdcOGqGA567AP8zGw-1
X-Mimecast-MFC-AGG-ID: LuCWijdcOGqGA567AP8zGw_1742820755
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf446681cso23904615e9.1
        for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 05:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820754; x=1743425554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOzM2ScPSIASv0kTt42gtme+vSrdpeXLeV6vhX625yk=;
        b=sJtHYBj7QnQMHQyY7aeNL97HZORLLM+j8QtB5X0tDAdTLoOaWt4OtZlDzxgcFgg6HE
         XcRG/L9iBV1YoZnxSog/Dc3WP7wtOlPCYA34aRujv1EyK7QAATcUniCPNkga2bFAF8f9
         FC21JZCzxxgSAdfJO8OnzUb08fFQoKFKV1qx7qiA7quMiyOWl3qGOylv7SZsJiVX1v7E
         urywsgN+TRYjo0xCXwurC+Jf0r4i13Yvhgy1TzOOLBAsfadMucdw3t7O0s4MspOzalk3
         0yGce/ByeAo6sJ6s6Ls3IoDlpURzaRwcICBKtALPLZTD0NCAO4W6byQUeu0TmAA3BfU9
         DNug==
X-Gm-Message-State: AOJu0Ywx5umc5NsOc/CQN1qrlCZIaVDrRCqRbQDZAC4BDM5Bz//bkhVJ
	YMXf9Qv0Qe/JOVQCRZjksOW4e3VRhKChipAfJA0on84N62xoErkdRotap0tiQ0ogOCXPUNDLEgV
	Dy7iJTBcZksT/C3WbbmiQqdKvqWND0w9v3iPB9hHkkmm94xdIS4sqDuUcDpqYl1u+u67e
X-Gm-Gg: ASbGncuElyiU7UUi5uH+uT2ilTUP5IDw90obSMlKt6oUqRTk5bXHMzvyLgKElLv9uig
	+R4ONC2W6JuUOr7MAc4Nwau+DOj1E1pQQzBZKB9/Xs7ZArWubYw/gqgEe61UmKW8B65DsqHdP9M
	UjrszLzYLf64L2stfHGEhaCjvIzPpO7V9BQNwM56jmYKRlCz/CV/xBKKwiFBCaj3nsrWyuT1Ais
	vf+o0vEDDilU2ashqnrYcRjQJka9vtx/NHzy52K+Y3VVrTQizywoysDVFpeNLyHMzcT3wxsL6YG
	8rqUMnR3bfNZf6iXUnw=
X-Received: by 2002:a5d:6c61:0:b0:38f:3c8a:4c0a with SMTP id ffacd0b85a97d-3997f8f5d31mr9515783f8f.7.1742820754046;
        Mon, 24 Mar 2025 05:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhWC5lZTqZk8i/eW5wi7Gsg8N/PqfA/uQsV/iXL8TfNWz6/jww5VEE0svzETauXE1XPr6HbA==
X-Received: by 2002:a5d:6c61:0:b0:38f:3c8a:4c0a with SMTP id ffacd0b85a97d-3997f8f5d31mr9515767f8f.7.1742820753602;
        Mon, 24 Mar 2025 05:52:33 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65besm11004866f8f.65.2025.03.24.05.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:52:33 -0700 (PDT)
Message-ID: <81c92638-d312-4e53-8c99-76ed1c6cff38@redhat.com>
Date: Mon, 24 Mar 2025 13:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Henry Isaac <henry_isaac@live.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB771256AE6BFD89860F547D69EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <4d07fb2b-eef8-434a-8308-9b1cb95ea482@redhat.com>
 <AM9PR03MB7712692A4A417F8E43AE0645EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB7712692A4A417F8E43AE0645EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Mar-25 18:10, Henry Isaac wrote:
> Hi Hans
> 
> Yes, both the front and back cameras work but with very noticeable lag, the back camera is unusable because of it, the front camera shows as Front Camera (V4L2) in Kamoso and for some reason the back camera is USB 2.0 Camera (V4L2) in Kamoso (I don't really care for the cameras but I thought it was worth adding)
> 
> The i2cdetect is basically instant, the first ever run did go through the list one digit at a time in cmd if you know what I mean by that, like a loading bar. But now its instantaneous.
> 
> I have attached the dmesg.txt again after running i2cdetect, I think there are more options in the list now, I think prior was only 3? I am very new to this depth of linux so excuse my lack of knowlege, its a good learning ground for me!

I'm not sure what you mean with more options in the list ?

As for getting the touchscreen to work I'm afraid I'm all out of ideas,
I've no idea what is going on here.

Regards,

Hans




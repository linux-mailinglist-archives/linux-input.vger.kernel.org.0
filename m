Return-Path: <linux-input+bounces-10093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B8A37BB9
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 08:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28FAC3A4CB3
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 07:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F66D18801A;
	Mon, 17 Feb 2025 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfUNyF4+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACA155322
	for <linux-input@vger.kernel.org>; Mon, 17 Feb 2025 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775646; cv=none; b=JJTy1CqATeed9WefB9lBU+NflzURMgLpgqb/4VqXBpzJ7kADq7PG6FJi3OcQMQYwp6SrRjuxf1ZXPhKnqr9dSV6HUhjfUMENoVESBOPjPtPTg+rXOub+cdaOonZTpKVYU1mVCQr41I7tREU0WmVMMtfgPEvvTVUMdQARMRaLSvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775646; c=relaxed/simple;
	bh=rlS6RaCELZ1rbSCxR23/5RfQtNdGSWC5e1WoqLaz/H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niW3FjvrX1Ri86ELz/S9vWniOTxoQYOaH1nctIfyyzMEzSgo4sCpUY7xaEdpDFL9gQ+kGd/RDOaYQ0wwFC90uAKoVdetE+oRVIiWY52lMa38+gTiTwilHmmunaeNNkhDIrrLLWVVpASnmp+K/YStwGjEyFpCcSgDG7YTYo2mc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfUNyF4+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb8045c3f3so162249066b.2
        for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 23:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739775642; x=1740380442; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Nz1gS/A3+CD9/JL6NUM7slPWKwzJdRJHFdoydh0jao=;
        b=dfUNyF4+LJtlzncDnNYsFqWj3lWi8TD1QEU003OxYZ/KSAbnSymrer9UVVEdGkdFJL
         ZDozAaZR5kF1f+lW0cBa/BBNn5MdcjTdDuGvkt89erJUsUpP5NgjYlnzzcgEZSYmreFL
         754AA867eaHu9qtKS0E55xylXzg4DjKaJ/Zi59wq9OWkTjhrQHOBZhxzcnbEBgWhA3fP
         R9XiNt0J4NSUzWhZmTQu3EfNWVqb6pNVxl3WyTm6SmwjIYaVL9kz994PygvLkRZeKech
         JHPuVZCOoOFlHfZ31mVvKOaU92O3Dx5scombHtbwIQujypyGERracFWSDdZ/iSkx9l3B
         gSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739775642; x=1740380442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nz1gS/A3+CD9/JL6NUM7slPWKwzJdRJHFdoydh0jao=;
        b=e+xoCns8KX2p5wZK6QsWyjsHASBKizPRLgU5fPSGX8g6ms3KeZn6F65HowFzmJdqK+
         WuCRdUMJzux1t9WbtUuAVNNOWWObpnivXlQpGbq2pz5wJrxcyg6vWC9de/X3jw4QD5Pb
         cZQ1mNglDWuCtHcrOeJoF+K4KFN9c0teYbG0S2tafBeaBsNv5Et3FT0vlOB8TOVYDpid
         vPbqNwLlhee5jBbPIul9pWyF198/gKlw+c2OA7VgjjmAaiyQb1/EgVuxktUMMA1TvUvt
         4RPkRKs7zcR+/54s2xkRcVG8008S31ApbYUD9czeqYjy1LHPwtxA4V1l0QdJtsC+hwMs
         Ux/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7aR93B8cdjqYf+3Bncrj9bpad2/r9gs6G58LDlW0B4BZkUb3uQdcCssPgiMosp4j0AvdHSuDbXw9lFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvPk9VYgQNAVBiCkvhbm5IRTA5PArb1owHVm9HXwfqQNuXdr+2
	6LPpmaZuv2mSP9jB/1mege0m26wsagneSKV6Wng2cL21zDs9h5KT5qHO6owv4LE=
X-Gm-Gg: ASbGnctC42iWkfAPsAPU/stiaiEkqbqDmlZ06ZcPOFsRaMgpM/lvzOiFb6NEczPR0mk
	B/8ltP8euFD0/0wB4B6uN+MD+2H6mOhyM64EqmynlZDNhAf92DxO8rGC9F7KNw1tAxH18qKXdiz
	Xv3bSCcKAkpwT1BzJWAOPr84lZj523zPn9q7Uf6UUuqq2mNlN+SiT5MHa6ctxcvoojV07RPx6mD
	0UZncJJ2BjdAzXP/v0pLWWt8D2QHjUi3T5Je7erXiTyelxQH7K+5sdhklXbz2v2sliAwjgcrJWr
	+K1PxPUMn0MdeLcC44Ew
X-Google-Smtp-Source: AGHT+IHGLk2AgxpFhmi2zhy4TIlmMYpy/A9mfUB4/XkNESR5sGaOmk6zpgg+rCL2DGBJAQCxq9VeOg==
X-Received: by 2002:a17:907:9308:b0:aba:6378:5ba8 with SMTP id a640c23a62f3a-abb70e53d76mr734753466b.55.1739775641785;
        Sun, 16 Feb 2025 23:00:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb88c69c1bsm300147466b.110.2025.02.16.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:00:41 -0800 (PST)
Date: Mon, 17 Feb 2025 10:00:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [bug report] HID: hid-appletb-kbd: add support for automatic
 brightness control while using the touchbar
Message-ID: <b8a25a68-fd1f-412f-b357-c9f4a6de7c10@stanley.mountain>
References: <6263a1a2-4d50-41db-aa54-cfcb3e0523a4@stanley.mountain>
 <88774FD7-0DF2-4F93-B4C7-3D26FFFC48A1@live.com>
 <539DA7C2-18D0-40C3-AB5A-25037AED611D@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <539DA7C2-18D0-40C3-AB5A-25037AED611D@live.com>

On Mon, Feb 17, 2025 at 05:27:42AM +0000, Aditya Garg wrote:
> >>   397 
> >>   398         ret = hid_hw_open(hdev);
> >>   399         if (ret) {
> >>   400                 dev_err_probe(dev, ret, "HID hw open failed\n");
> >>   401                 goto stop_hw;
> >>   402         }
> >>   403 
> >>   404         kbd->backlight_dev = backlight_device_get_by_name("appletb_backlight");
> >>   405                 if (!kbd->backlight_dev)
> >> --> 406                         dev_err_probe(dev, ret, "Failed to get backlight device\n");
> >>                                                  ^^^
> >> s/ret/-EINVAL/?
> > 
> > Should be -ENODEV
> > 
> >> 
> >> Why is this indented an extra tab?
> > 
> > Thanks for pointing this out.
> > 
> > Patch series with some issues I myself found out, along with the one you flagged are sent here:
> 
> 
> Btw, I wonder what’s wrong with checkpatch. I didn't get any errors/warnings regarding these.


These are Smatch warnings:
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst

~/smatch_dir/smatch_scripts/kchecker drivers/hid/hid-appletb-kbd.c

regards,
dan carpenter


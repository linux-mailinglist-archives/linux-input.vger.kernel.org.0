Return-Path: <linux-input+bounces-6185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC996C691
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2385F1C225B3
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE2B1E1A37;
	Wed,  4 Sep 2024 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lvkm/ITR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F91EB44;
	Wed,  4 Sep 2024 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475241; cv=none; b=PsYFRpKs98aV6eKxtO/s4yo7aXlXi5wZQQTh0jAm8EZg8q/aUGw/kPuNUsjSTpkl4xnZsoXtWV3v1+xJ40pQsnR0XQeUCQZC42r/JFCsdKlR70D009db+rFqLPOcXfdAriW3ji0PdpjPYEZNUrQjQTpmDyX07TcGE822t3gyPoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475241; c=relaxed/simple;
	bh=z7CTyBRQzHnhSsS7I4BEzf6MzWu1bOyaqgUKfYyEd4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIZg2JyhRXVzgwKeKdISvl+Tk20YP4KqmibLMTcmCpHkR1fyt8B/B3EVqzG/93diwzLsfsua7yBatsvEJ15orOHgP0j9zb22S8SyQNYBf1PQmPX59xWejOvlBc2FaW7bULxiWJwSt5TxDxcH1DxpqxPmyDgxjoHikrCY2uQuKlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lvkm/ITR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-714287e4083so6151386b3a.2;
        Wed, 04 Sep 2024 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475239; x=1726080039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gj90y9S4pmTQLI45I+wb2B5L5eIjkcLojwizD5xN0WQ=;
        b=Lvkm/ITR5AtmZp6FiwG9+TFrgjJPx9kYuqokFsguxJFxr5z0xJ/A4982ycYKR9xaAE
         Dy6HeV3siHcq0ulWkHqz+BGZm73wyj3BJNFhODdg/P/HRYOIttgVoo+2vivYY3TMx2RI
         OPJbVIsbCR4cRCFOqqCCc3Zci4BKYIkb25XMonk/by/6Ue+7dGA9U7mRMT2rl5yCnOPH
         XeQCngWLLmUXWi8hVQJ/RbAYWCmErjIQnKXmI+0ww2H2duBKa5HUmRoeSkdWICLHutGr
         6ARHjMcSI8yZiZwnMpX/XmR+7rebEq/gxGDb0AzJ4IOo9k6p8By/31bop4ueC9XgT6b7
         1BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475239; x=1726080039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj90y9S4pmTQLI45I+wb2B5L5eIjkcLojwizD5xN0WQ=;
        b=aUYiF7JU3YEMKduE+H9gd24Hktrh/g5/t0bDR3Xg7nocaOcaLEhFqdJQW9EJmReUfJ
         UCgHLZ1AfD+RkBLvfJiGhUN+i2MBd8bkMeSkb8QcDcn1/68LqWJN61OpK7GdOr49bIxd
         zgfJKyI4tYlNC6LLDNQUVxNyys87omRz4A/50LwwREKg3JWLFyubZgTi+dA83eNhloyL
         J8MWmfjbNvnP3bQkcbJgDwGLPH548mrJmUatcRcs+T9twIxwuTCdn/SwdDRX08hw4EBV
         DI+kxwzw6QpTGCX/Fy6rag9LGhtCFYZhSAgS5+Wv07eXnmQYS7W59J1zJlb2Abqb7K0q
         BBVg==
X-Forwarded-Encrypted: i=1; AJvYcCVBMmPNWnvNkk+YNby73u9UdGvnmZ6DYboNYi7azsuePCW16/4EaFBBs6tl+9g4oZK+Iil9N3c5vE+cAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCMc27Gl4/i4K39HTIhgmJdCflo1opxZxfEBwxPJUxv2sdX65o
	SGt/BBWaMLWxvZLdMzvRL5mk/Wu6vo5BDxtD3RFytq2CFYzwUMlX
X-Google-Smtp-Source: AGHT+IHOKRHHEkdMfEmxI/s51FTQAQpGZmY/NFE2K8WmfPY3IkxCFGoIQdTXaJY3OJK3RUeobukYGg==
X-Received: by 2002:a05:6a20:d487:b0:1c6:fa4b:3648 with SMTP id adf61e73a8af0-1cecdf294b6mr21242034637.22.1725475239095;
        Wed, 04 Sep 2024 11:40:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178bf574basm80429b3a.13.2024.09.04.11.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:40:38 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:40:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Cheng, Ping" <Ping.Cheng@wacom.com>,
	"Chen, Martin" <martin.chen@wacom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linux Input <linux-input@vger.kernel.org>
Subject: Re: Question for submitting a dt-binding besides an existing one
 covering enough for our device
Message-ID: <ZtippHCTtiz29IVq@google.com>
References: <PA4PR07MB7407FF98C5EA3F2E1CFA5D8E879C2@PA4PR07MB7407.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR07MB7407FF98C5EA3F2E1CFA5D8E879C2@PA4PR07MB7407.eurprd07.prod.outlook.com>

Hi Tatsunosuke,

On Wed, Sep 04, 2024 at 06:26:40AM +0000, Tobita, Tatsunosuke wrote:
> Hi,
> 
> Wacom is currently working on to add our dt-binding at
> /Documentation/devicetree/bindings/input/touchscreen.  While doing
> that, we found another dt-binding which was already sufficient to
> detect our device and load the driver for it[1].

You pointed to a whole directory of bindings, based on the context
below I assume you are talking about this:

Documentation/devicetree/bindings/input/hid-over-i2c.yaml

> 
> In this case, what can we do?  hid-over-i2c dt-binding([1]) covers
> information enough for our device to be used under I2C interface.
> Therefore, the difference is seemingly going to be at "description".
> Do we just provide a yaml file containing only the some of the
> headers, such as id, schema, tiltle, and description items to submit
> our dt-binding?

If your controller is fully covered by hid-over-i2c.yaml binding then
I think you just need to add a new compatible to it. We already have
"wacom,w9013" there.

Otherwise follow examples such as:

Documentation/devicetree/bindings/input/elan,ekth6915.yaml
Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

that are also hid-over-i2c devices but require special power up/down
handling.

Thanks.

-- 
Dmitry


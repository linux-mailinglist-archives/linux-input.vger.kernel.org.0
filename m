Return-Path: <linux-input+bounces-13175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C7AED237
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 03:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2F603AD8CF
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 01:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016F1C8CE;
	Mon, 30 Jun 2025 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y06AxkaE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3E3D69;
	Mon, 30 Jun 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247136; cv=none; b=H723z4mwowQnZefW3bBXso/IA3rmAzlgDgwyamCWLzGzLXKy8kTBH3X7hX92IDdRdUBJngiaXgbw4llk1nBXMOuIhrJRGuFMEmuhBpfIjH3rUL4/CiUpvV/coMom9U8Gb1IlhrDaQqS06PizsU5cPhMiy/2/Mw5CPWoYUqLyw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247136; c=relaxed/simple;
	bh=hdiL7HMoLJHVYQx0nZ/jiH0MELCWgrEJVD5K/zMgloI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY0oznjiUMCy2Wbvsm5a2J6KJ9VMj7wgN7bHM5I53dhsoGRSBti8XGVgi5Yss078hVto0vgShNQLZrO7ePChUePDz8l2dv/yNqUgh+PBNAUvLZZkhSmqqoMiNqkoXHgIFYa0A9gPdR5r5vbpys3lmA8ld/3S607mtG58gqw/aeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y06AxkaE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so4137839b3a.3;
        Sun, 29 Jun 2025 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751247135; x=1751851935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L0aAsZ1sbdiZCT7aZCI1+5dJ3jW5sPjVrCZW6zgvqsA=;
        b=Y06AxkaEqlDUuDtUZenjeLFA8Ko4KUEjGTwoaYmVLlQz5pXq0l67AzYMMS/q5YLCxL
         KEeVEuoX0jyLJFXwibQnrrU4bmfUAqG/2+3MzWH4nAM5GxXl/CwPbAuwPhBiTafBjpO1
         4VfmpRK6ouI3fU+IlTA/VaWzmSgckhUq7l6IYmnFNjDrC4wdPca5SjuoSQ8P8IoOqc1q
         IN4EuNlFsfVRYCJohxrr1tLw2gmdTJhr1ORnxXMi2OJzGOsqnCyC8xYBYYZ0/ORY4wF7
         ob4xrTx17X7PmAQ6ZiCRkhoatFURUOhRRXSQZu7Z1ks7dE3luHj8/BOmfqBCS2Kzs2Fm
         V5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247135; x=1751851935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0aAsZ1sbdiZCT7aZCI1+5dJ3jW5sPjVrCZW6zgvqsA=;
        b=wdFMLYDfj5PgTalGT9af2G/Fs8LUnsnjhWl5qsU1JI1x9rRIWK5G2F+OvNJMbhfW+W
         f0nVUx+1y1rgA/L95Bi3k2tCg1K0+kyiB5g5kjigaz/5d/OfXUMJqRnXMrpIqko+eFPf
         XEBG3DUviO7pOVA8fo06f+WWZNU6drKZTubG2KX7fBgyiITPdmVVeaK4zwr3ydmyv6uv
         FRuJz7SpmSkXYdzG1D4fIM4/xI4zNFIFBqSDe2Zb0mygSwRF1k5G3xB7jyN4ycBJoKdf
         dpjZk8ggXbVtXTcp6BWgKQxjzvFeriln3J8nKI/OukXgwQCCA56+f+XVZGndNnCi6vNH
         VjlA==
X-Forwarded-Encrypted: i=1; AJvYcCWzdi8H/zeyfw6EtHORqxnv/pC5JCz21fKw66/r60PotD1PCiEVKFGVw7tvjnSYHurNq+z3BI6ZqdJrlbCCRxCsvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnybYaG8YDN387xh8wfVs2QiNP2Rwu4faPNr5UipkR5AMk5kfj
	FtfqAu9OVycH7xQTO8tdqAX6/7o887lfXk67Ryi8GPMUHrvUAUprkRL6
X-Gm-Gg: ASbGncs2qLFeZZv9Rw9VGnzGLmhv83pWQcEs6hhCsd2skAJ50DV85J+bQkuTfvB3OL8
	5weBJ2LrefGiXSghDLwxN/CeJ3J6B5lKT1E4CVrd2XWIrc0lpLyAn96Pt4QyHoBi4169owNJ9vq
	7xVPNl5G13Jel+mzWLoIBisOQQsTTSs3ubnLRutZYUf29EBUl4gAnVXztiB7/g6EGG9r0sDcIR+
	QPGAQ1m78BRjk+boNgp2KRs5diOr7ka7zw0DjO2pc1oiGSwYyIHhFi04udzuhO4i73mHoPIZqN0
	vErTM/cWEnSjmYNSYAdDO3WVvv7qLXbjN/HqruOXMrsTZunA85ZHqAy/8Qpgbog=
X-Google-Smtp-Source: AGHT+IFE8EqfrNatNXll66MY6QiMMmzpfEIT1JyiUdPzr69mN+JQpR3DwaIs+MGZ4Tx6D+Zu3tsQ1g==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74af6fcd495mr18563358b3a.23.1751247134690;
        Sun, 29 Jun 2025 18:32:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d8da:e3e0:2b93:2315])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56d0002sm7980964b3a.136.2025.06.29.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 18:32:14 -0700 (PDT)
Date: Sun, 29 Jun 2025 18:32:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - add support for polling on devices
 without IRQ line
Message-ID: <6kqp24t5c23vcvv7wuirkjz6a5s3daacifw37rb5554v4uqeit@jzsinkx6qb7r>
References: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

On Tue, Jun 10, 2025 at 02:54:12AM +0200, Marek Vasut wrote:
> Add the capability of polling the touch controller for events every
> 16ms, which is useful on hardware that did integrate this touch
> controller, but did not integrate the IRQ line, like the RasPi .
> 
> Make use of the generic input poller code. Factor out the code
> from goodix_ts_irq_handler() into generic goodix_ts_handler(), so
> it can be used both by the IRQ handler and poller callback.
> 
> Use of_client->irq to find out whether the interrupt line is present
> or not, independent of whether this is OF or ACPI system. It is not
> possible to register poller in case request_irq() fails, because the
> request_irq() in this driver is deliberately called after the input
> device was registered, and registering the generic poller at that point
> is too late already.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

There was another version of this patch that was submitted and reviewed
by Hans, so I merged it. 

BTW I think this version would end up trying to disable IRQ0...

Thanks.

-- 
Dmitry


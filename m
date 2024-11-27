Return-Path: <linux-input+bounces-8277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B39DA6D0
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 12:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C705281D44
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9972C1F6689;
	Wed, 27 Nov 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaJbFJI+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9191F667F;
	Wed, 27 Nov 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706618; cv=none; b=ssPus6TXGtjWTi44+hENNrPQppp293pjNBtH/Yke3k30Q4lzfwR4CvZ73VuPcamUYlkyaNAZqyWNrLtkBZCObHYxPl+HwPzbesLIp/6Lu9F+q8qLm+Yff3tEp7qmqPWwDvEF+g4fn8TUt7vjxaPxe2rWQ7t1I6Q1ZcoOQkt/sqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706618; c=relaxed/simple;
	bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjfyPBCy+7v6HlLdCwC5NnoPD4i5VA6xkTjFjk+RIMteX2fgYGNV615Y2MAitjz96QEiIdfYx8VXbCK9+fnn6AZNthdOU+ILX8GAytx5KH1PdgpWBssQnwWLJoFENsHZavkibsElfr0F/Ev4bN/HX2PlcSQx5NtEexMvCOHtoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaJbFJI+; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e38938a55e7so6170792276.2;
        Wed, 27 Nov 2024 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732706616; x=1733311416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=DaJbFJI+NQOSxtnabrpn8VnzoJmjTg8I/g/xQiQ4i2pjuqo7GGF/13JXxrjHPSTG8f
         ljiyFNpDP3iDB93vFwGpOBWWI95MpzhiQrAqkdxGPCap5/3B+F/vKMzm/WGDC9jSm8jw
         HG9I6OcUOvCRLqPFKsFtbSjsejvvYwynzrMg09hEgoDQNvKxQKKmIWgFo7KMPtEyalWi
         RdeJ4bW19mgrOk3Ahrv3UaW95vhOP7vID+G2Xq3QMY1/YUR3mD6fWNzFm4HfENuq6GKU
         5XCNdZ381//2dqdxPhPqtg/TLjTPdvhiqQVTu27HOBnsaGQdo6XVYU/fymq32J2g+rGW
         7f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706616; x=1733311416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFNJVebhk/P2gt6mfi/joxjoUyYMV0WKr8Mcv1smVno=;
        b=AMlPBDD2W102Y/QP/4JwaNKKEDs2nZd438Jle9bq1xe7iEtEVud9azEPnMIncdBbj4
         fWIe7j4mZGPeQ6/AAqmDyLUFFCFkGOZfngxdKVqHxulhyPNzemFmI+Z2n8h/UKATTe7L
         GiQKRXl5MUX27BvO5MtkHGRgHuzy+MW0ipVIh92HTuSNNMXua2ap0O3A/86UCf4xteam
         teaQe+qo7vQh5+E28T64ze0IstookRSkI4Y1ebd5AQv1GJDdQNuUG6yXsncP6wF4FTc6
         XNCFf8S1JLuXrB5ZQp891TZL6618Bj2yFm5fyjR3vnc+1tUw5Vw4f64YOpCx0dAF5nYb
         kg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFuiWqtdyIDE2IHBqMb3KZ9PwGz+TsD/mNEt/W9qFITcEh3t3q27dyEybJlJRJhE+1aUDU6eWzR9V5U/0j@vger.kernel.org, AJvYcCVXo5YQCWV+xcar5Af/5rU7nbc52O/g+VOOB2tEyCnVmW2gRbhc1Oe1uapXZjbe3KGcOQs3zUdms+jaQCo=@vger.kernel.org, AJvYcCX5Jll5rNelndtI8w1ZA+ocDZD8V+BU0bUxvo6X0WD+rlHC2CKJVMaUullJBcl5zeivYscVALixgpds@vger.kernel.org
X-Gm-Message-State: AOJu0YweRCSPgFPv30qYhX7ZYl/OiI8pHNYPZBjR+BbzzPiuAGj3I2WK
	HfZl2DyTwavxMThq6K9T+8c4I6TViiPQbENzZdW6qXFdltDN+cg1EbU9sNuQv7F8akC9CyMwA5I
	0q7va13ELfYQvgjrPn1adnmM81lk=
X-Gm-Gg: ASbGncvWLzBUVehKNcnZnr6jE65Tqw4Y40e8PL3+cSI3Qjmauf2ypRgmVwe7Xx8iMjK
	MQ3BtAUkDpIEWGpSqmvC432dO+/n6yTlk
X-Google-Smtp-Source: AGHT+IEhGTSK2YNdXdDE1bxdAMUSkkOXknhoF5JR5lXJjT5V65SSPE0rinZmMub8wlV/7v+m+94VpiBh5uSV13rfdCg=
X-Received: by 2002:a05:6902:f83:b0:e38:b87f:52a7 with SMTP id
 3f1490d57ef6-e395b8b96f1mr2630271276.14.1732706615983; Wed, 27 Nov 2024
 03:23:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic> <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
In-Reply-To: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 12:23:25 +0100
Message-ID: <CAMT+MTTqNZuaeROufzA4p6VS0QUt8pJ+3rA3t7_BX1nW0ewB3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 11:49, Sasha Finkelstein <fnkl.kernel@gmail.com> wrote:

> > Why is this needed? I think it is not part of common touchscreen schema.
> > Drop, devices do not need labels - node name and unit address identify
> > it. If this is needed for something else, then come with generic
> > property matching all touchscreens.
>
> I want some sort of a property to contain a human readable (ish)
> name of this device.

Actually, nvm, i think i understand it now, you want the labels stored
in the driver and set based on device compatible, right?


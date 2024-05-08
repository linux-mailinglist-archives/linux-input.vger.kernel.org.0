Return-Path: <linux-input+bounces-3598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E178BF8E7
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 10:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B94286C2F
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 08:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925A3745C2;
	Wed,  8 May 2024 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndCYK31U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EDF535DD;
	Wed,  8 May 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715157595; cv=none; b=A3A022oMRm2KrJ2RAN3DyC/jFMgpjZb+xPU6BPOUeuqp8uteAe4+wokV6+Xmvp8tpebQNkVirUwxNuVR/v74lA+M9rYBvmZgQ2V6YTqT0qZSqttLrdYIIdeVl241l0CaIrEzzEnMBvWorWcVeWoa6gV6gA1+BQC71DBVfPnQaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715157595; c=relaxed/simple;
	bh=J+PQfd29qCEkIFqLYMfOqB2KUwrBfTwfwKZYBhSKYzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5yCoQedA8YtjtHqLkj2q5dlFV5wTUl/no3j+bAlrh8f0oZgZ3G1vVcuVjhUSufTnkCYUuHDOnhcw0mU7sVoWPEpT82hks/Gpw6NkZhm/08MxpGI9hOXpzv3YXB4QACrqW/dlncY7Ta/GfutrGvE6i28ZU7HGb8dZlaP0jo+tYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndCYK31U; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43dda802bb3so246991cf.0;
        Wed, 08 May 2024 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715157593; x=1715762393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+PQfd29qCEkIFqLYMfOqB2KUwrBfTwfwKZYBhSKYzc=;
        b=ndCYK31UOffe5aitstDpIoOp5urizJCGFMLMvQv0nxuHWZOaMHOViAM+wvatEjIsNc
         TUzgVHU9eXf3UG1IGcvi7RN//ee4iEoQB7g2ECWRQUrULWqv1MLabF39MsAVwh9tKB+F
         3lnyteN7OZbzfh0qadMfDeDOl7JRpiPcp2tqusRaOzEoMgfYjzv++XRmgtsH+GrSvM4E
         W/Y2eKozKKvgZ24TfJpn+jo4rW9Q/HZjF/OK/AJXvdprKKw0bAZHO4nS0vCNkRKlJgJt
         SFJD4prW8SSEc94Mz27q6Zmb3XHqOsye+GmT+YWY1bdyGSB8o9cUkbe4+d6YiyMR4sk4
         /PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715157593; x=1715762393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+PQfd29qCEkIFqLYMfOqB2KUwrBfTwfwKZYBhSKYzc=;
        b=rQbI1UAGI1cC6BUQE+vPOYE3V85frxxwE5T9177lH5275jVHZncOuwwshlbFe95XNo
         zlDLUHbWDpRIyn3MRu9h7DyomvloOijwaOBC/H4Ifn+jg1feCaDW476RUcA6gKtm34Lw
         ede4JAsrcLgUF56U8TLzwWkj0yZAgE7RIFxD6WKZ2JBBNGm+aycyf30XWokV+HFAumZl
         fvgc9ZvMGRWOlf5FoaaVjwZFKpnZonrIOVzWX2YjKIcTyrAPyFB0l4urev3SeUK2zQ0J
         syMFLI2GNYZvYx9Aq8+zkUaiG+B8IsYqveR5fMVPpaIcGglClTtKIUS81RTYL+wAWxPF
         MR8g==
X-Forwarded-Encrypted: i=1; AJvYcCXDMX0H8O/z+pGKzwiDLM1u/w0p3VcvoChAGnwGgpwu0txtVt5eZMHPXggljwqiwbzH+CBOqGb9v/4Dts/rfNVouj/D05KLXfK8YZa0Loxay8r74jtOtL4J9tbqNzobiLyE3Y95eZMIDbM=
X-Gm-Message-State: AOJu0YzZMx2Xq1CumzdAC2x3I0XMth9qsP6+oW2kIRAfHV/pCnxdeyV4
	JDDl8TF0LdB8a8W/6cfubprRggz9bcisQ9OkIhjq2gYobrcnIDlpsqulz2G/pOBAfawTRoIIj3m
	0bCD8KlEZVlwssHZyjkeciAtzjJc=
X-Google-Smtp-Source: AGHT+IFbHvBVS6LvE9VyyUxGe4Dx+/5XNZJwJY9GdUXiicZzhTZ+bu9VFrTJNH4aWCT0/TwiOvIkRq5mW32Bb71ptGA=
X-Received: by 2002:a05:6214:2aac:b0:699:4d3:98dc with SMTP id
 6a1803df08f44-6a151418127mr23321276d6.0.1715157593085; Wed, 08 May 2024
 01:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com> <ZjmOUp725QTHrfcT@google.com>
 <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk> <ZjpFVGw6PgjRcZY3@nixie71>
 <ZjqYp1oxPPWcF3jW@google.com> <ZjrledLjn8RsGiwC@finisterre.sirena.org.uk>
In-Reply-To: <ZjrledLjn8RsGiwC@finisterre.sirena.org.uk>
From: Richard Hughes <hughsient@gmail.com>
Date: Wed, 8 May 2024 09:39:41 +0100
Message-ID: <CAD2FfiE+VFa+7sHQg=LGkBy556msNyyFUhmWW_cAfZd0V4DPYQ@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy <jeff@labundy.com>, 
	Hans de Goede <hdegoede@redhat.com>, Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 03:37, Mark Brown <broonie@kernel.org> wrote:
> The other model I've seen used BTW is to expose a MTD device, if the
> device actually looks like a MTD device (perhaps even is just a flash
> that's fairly directly exposed) that minimises the kernel code quite
> well.

If it helps, fwupd already uses mtd for other devices too, although at
the moment we're using it only for system firmware -- e.g. intel-spi
style. The MTD subsystem doesn't give fwupd much info about the
{removable} device itself, and that can pose a problem unless you
start using heuristics about the parent device to match firmware to
the mtd device.

Richard.


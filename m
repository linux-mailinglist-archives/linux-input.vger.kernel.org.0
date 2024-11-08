Return-Path: <linux-input+bounces-7986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD59C201A
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 16:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D5761C21FC6
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 15:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438141F4FD6;
	Fri,  8 Nov 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bKnoG/0+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB138DC8
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731078709; cv=none; b=mJGr8tPKjsYDpnsj65SdDUKQyTRt12AnRKow4G6dt+uRwUJSAvV4ZfIf/7qj2HP2sEvO3m1+X2R+OW7LZfQNdRvt2pEZUIvq/DU1MF6oT+a9ncrxlbSjqIjU19Jw4TgO6A4u0wiICqKMiVj+hpn8bfyAOuIhDMCCfWSkP3xMY0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731078709; c=relaxed/simple;
	bh=7AbutvFdmgvjtotNL0xr9HRKPZ3PcvOcSlbj0hwvXMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJMcBHV5ioSfrERVeG7lyvKwvSNzW/zCEyX+0nWYn1e2RsTO2tWTddIsGNxnyGtY+J9AOEDAxzE52ZtF73hE5Xdzg6B5DhD8R2KpHQoo8nZLOrdJJVYl1NVtp2BPFLG28N448qPXEW498yyjUXF4HwDkTKOP8oa5CJ9H7yiUFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bKnoG/0+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2886493e87.0
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 07:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731078705; x=1731683505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AbutvFdmgvjtotNL0xr9HRKPZ3PcvOcSlbj0hwvXMI=;
        b=bKnoG/0+aarS9H4jOxRQDzKVK0A2JtgdqfOPhGlYK6VlSjdRv+DalLZi/BFFW7urW0
         kxZkrYCy8oVhnvllbTmG2xZ2d3VfFAkc5x+oO0nrGgTtITOX7jaXixeyoSitutCHLOm9
         yiHLQ5rICroz4O2IECtSFVvTsYdXhlgwLY5OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731078705; x=1731683505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AbutvFdmgvjtotNL0xr9HRKPZ3PcvOcSlbj0hwvXMI=;
        b=N7sC2MjsS/YRjzm5UYUStgQ+tsi45pINM+3ZbEiLus4arXdSvuEpdXtlrRRNpKkSJT
         VHTCyZCWNkpdQ74QIIZYEyaDICu/39XIS82KWkCeRcqZ6zn9ttJvPTZAfPmH7iXEbvUX
         RcNjdSyKJuSfT1SiwphPHHuZ0P23Y4397ypMu+mM6ZiO0VgDyIv0JhQVqctL85icpip2
         1LOJn/K0ySM+XdKX3KAdEfuCQJex4HZheTAsUFZCZbu0aJd5y5dBat0hlQ6iRGNcsth2
         1+k+xmvflBw/nhZPVQ8p3EqmISAcjw2+M9s3li2A8O/XGdS6q1u8+vCIFnSj0kNo8jXx
         l8qA==
X-Forwarded-Encrypted: i=1; AJvYcCWa4596MTMchvB+dbHCdc6Y/9E/cOwlZnjYUntWQmQ+IY30VKUUmkpE0z5G/5m8KsghEoSB6NmADrVH4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRgWfM74oLnJSk78XS0peaOWDgv70PAvsN6DGOgjk3rvMP2sh
	HvkEeTeJQJ5dDJ9XDxfZsgvsO+pHdxWoemMQ/Q30hQe0RwdaM/6k6fA2atXYUsdwMfT3MGQHnhE
	uMw==
X-Google-Smtp-Source: AGHT+IEzkiQMOKJ8qyCq+Rzb1xIODHfGPbsuTQElbgOBRdUXYtgBeqEdUUoOxLqeycuLKT6+E9Z3Uw==
X-Received: by 2002:a05:651c:b10:b0:2fb:6169:c42a with SMTP id 38308e7fff4ca-2ff20225b59mr17452241fa.30.1731078704693;
        Fri, 08 Nov 2024 07:11:44 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d834dsm6875351fa.114.2024.11.08.07.11.43
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 07:11:44 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e13375d3so2713252e87.3
        for <linux-input@vger.kernel.org>; Fri, 08 Nov 2024 07:11:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgG+w7fIILahWE433kkQJIvpeuRQ3F8fi/yXd7pNF8+3sef9HvSDjgdqkEUHd77QdKuKxoWulG3FCFhQ==@vger.kernel.org
X-Received: by 2002:a2e:9a16:0:b0:2fb:3881:35d8 with SMTP id
 38308e7fff4ca-2ff201513dbmr19941421fa.14.1731078703279; Fri, 08 Nov 2024
 07:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108120311.87795-1-charles.goodix@gmail.com>
In-Reply-To: <20241108120311.87795-1-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:11:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WNcdbdn4tzNyVWaZugma3RdqmvTPa2NsTyuhH4yA3Raw@mail.gmail.com>
Message-ID: <CAD=FV=WNcdbdn4tzNyVWaZugma3RdqmvTPa2NsTyuhH4yA3Raw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, hbarnor@chromium.org, conor.dooley@microchip.com, 
	dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 8, 2024 at 4:03=E2=80=AFAM Charles Wang <charles.goodix@gmail.c=
om> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>
> The patchset introduces the following two changes:
> 1) Add goodix,gt7986u-spifw.yaml.
> 2) Drop the 'goodix,hid-report-addr' property.
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v3:
> - Split the commit into two patches.

LOL, this isn't what I meant. You should have one patch adding the
proper bindings, but you need a second patch to _the "driver_. Right
now the driver (AKA the file "drivers/hid/hid-goodix-spi.c" in Linux)
is still looking for "goodix,hid-report-addr". The driver needs to be
updated and that was what I was saying should be patch #2. You'll also
need to fix the driver to update the compatible string it's looking
for.

-Doug


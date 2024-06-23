Return-Path: <linux-input+bounces-4570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F19138DE
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 10:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2CC91C20B17
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 08:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0774D10A;
	Sun, 23 Jun 2024 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlOLiKBq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C59376E5;
	Sun, 23 Jun 2024 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719129760; cv=none; b=T7nykhTUrmz2IPDIPNqCleGhZ8lKkRxZ5gstMUb0QvOVRZWc4ufIEfc05H57NcI+JxFJEdfFCuOu0Kogy6O/9x/Uo/+dRAXROLtF62j1VmPxo8bBUPItB3DxMX8nwUiWk0g/dEzBo3MKVcOPoJSw7IDhYNYcRqDszb6sB+qrFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719129760; c=relaxed/simple;
	bh=NVpdgJtLxbGz8AcVmJ/q9hKRXHgl1H30VLE8Z20v8pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhI2vgqMkqKs6rWFT0y0lV3MMVsOlzT1lBheNCjDR/8PnYhT0huGkaHJnXrntEYPPXEMB5IBXOuB5daOtCHirsCswxX9YgLwEFIlb66BMtYI8hhtpkhZ6dwoQJYhtWgJhdEgzt7ycICsFPiALvS7INXrHzPblZibIULYdsltQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlOLiKBq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44051a92f37so26195381cf.1;
        Sun, 23 Jun 2024 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719129757; x=1719734557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWDMd9l69iqb+D6Wxa/JBkQ4IN4XRV16aDq5fyQM2YQ=;
        b=dlOLiKBqEYcLnCiJ2KXOPKwScefo5NXx+bTNbfIcAhJIxPdJhQR1cw99+z5DFN8p8m
         AYwUmyW64b0RqOAqekDVW9LGbEqim4aHECmYvzYE+EcemBSfWTX0eslWv8HoLI6IADm2
         Gtob6Dpz2CaHL0HxzrGUCp2/yXelPhyxNeWqGFgjfIi6hvFfPJxUCQ8rQ+fbPgvToAtU
         /EPJ2ERxpEHLCkjb1xVR982xy9M1YtcCc77abt9V+uEPO0EsuX8SkrfFta/xjFlb3qQG
         PWKvCwL+hPKmyCGfJYD8hqKD6iLpZXs0PJ9erHIPHjEFc8IwX9kWE+EbTmzdyiLgkffK
         Pi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719129757; x=1719734557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWDMd9l69iqb+D6Wxa/JBkQ4IN4XRV16aDq5fyQM2YQ=;
        b=YWHmWyuixTfmWch/VOmggCnSUhT4QhyNQ0GEzqDRc5BzvfZOvHOiHedC23A7NZW/Ua
         d2bx5E55HMbuGmdfKYd0Vt6+9vk4Lkhngu5kWvXzTLqxFKgXpRKiGBQrj+g2lchaNyli
         5kIxJN4OGgc7UNDXQwopq1XrIst3+yAEnUkLKpU9KFypbt70u1T2Gwx8mwh5jp7bYP3c
         YdXk67fqrXev3WFPrnp2QzaMFbmNfzO1I7Bn5ykESUtGNc0qnmi6fSSO/6QMTNfu+24e
         1WrlF1D1Rvpg5hzRhPjdHUs+8jgntimAGIIxeYuV/TAJYQ5Ozq58urra/is3DoveGKfP
         tUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEl54/p+7+OMewHV6CIleo4Um1YT8WKdShSzq6Qq23OXVm3tGDGq940fS7XYOG/NPi8MiL5CfrLdai/fxJ+5Y90dSvzEnmrYAsIPAml2PJjdnlPOPkMPDj/JSEuFMr16vRdKxyCqYzqBP88i5dxov5gHwEckL9OI2grFNU9OkwhD/hAiU=
X-Gm-Message-State: AOJu0YyWAeYXttYQcO6M1VCpFx25iqXIocpWEb0QOEWyiDN7ZUKTw4dn
	hOqbX7S5LyjetRhDG92WOdWuKZ8rHf8CnWxGw1Hupv0NmJNaMOAz
X-Google-Smtp-Source: AGHT+IHBI7Grs+1Q9dbj3jZDgpTfx3BFj1bl8BFrxloybqWXunmQzCnqD0F4ohhZtl7BQ/fRlssmKA==
X-Received: by 2002:a05:622a:50:b0:444:d2df:e9d1 with SMTP id d75a77b69052e-444d2dff42cmr44750361cf.17.1719129757281;
        Sun, 23 Jun 2024 01:02:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c8b4:4b16:721a:ce0f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2c96b03sm29268061cf.93.2024.06.23.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 01:02:37 -0700 (PDT)
Date: Sun, 23 Jun 2024 01:02:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Message-ID: <ZnfWmR48MfcQKpTS@google.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-5-jogletre@opensource.cirrus.com>
 <ZndqwfN4G+RkCNrn@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZndqwfN4G+RkCNrn@nixie71>

On Sat, Jun 22, 2024 at 07:22:25PM -0500, Jeff LaBundy wrote:
> Hi James,
> 
> On Thu, Jun 20, 2024 at 04:17:44PM +0000, James Ogletree wrote:
> > Introduce support for Cirrus Logic Device CS40L50: a
> > haptic driver with waveform memory, integrated DSP,
> > and closed-loop algorithms.
> > 
> > The input driver provides the interface for control of
> > haptic effects through the device.
> > 
> > Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> 
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>

OK, let's merge it.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

IMO it still needs improvements so that the repeated effect can be
stopped/erased without waiting for it to finish playing, but that
can be improved later.

I assume it is going through MFD tree?

Thanks.

-- 
Dmitry


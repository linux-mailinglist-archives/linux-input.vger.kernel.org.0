Return-Path: <linux-input+bounces-6940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54098BCF2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70ACD1F26959
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 12:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A391C2451;
	Tue,  1 Oct 2024 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBKNA99o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC5D1A073B;
	Tue,  1 Oct 2024 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787543; cv=none; b=P/8hRCB1+1qwgKFqITKO6vAZJSh3AKYom2vEJwblUIGuB9k/mVtuIjcU+QO7LbaiuMZtu+qraBXKkf2ZfGVEBLkmChfPNSQUcYTVsgAsUZ3iPdgTeHttUub4HedOdRkPH1F6Hz4FDtaZ9KZb/DsSyBDmgOSrJUxECpY6QQEJPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787543; c=relaxed/simple;
	bh=Em6osfGTBWf1s2f6f3Q/3EQcFNjAxDyFagK52CLlJ1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrqgYGzkg/wRAmqwCusIn8Tao1kyhjTlHz4PDCl+Gogvj5SNGgK+VOIJOmXNZlho4/bWsws6B+GOb2t2iaIMZ5Cykp30EUNZfZtd4ISR4eLRzfEyzPQadMwqUTtRL2QbjESQX+Ih4f3g4h6donpoAmO+Sk6IgRKGFQIXomOSxh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBKNA99o; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so4614122a91.0;
        Tue, 01 Oct 2024 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727787541; x=1728392341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PI6vIBaenjmeV4v1LJ8TZd0bodccIG5VVCIvDBNwP+8=;
        b=KBKNA99ojDFhTfzx8PGBHRLsdcXN4gojUnxyNrAa48JMkxzdmTmGYGLNTVucMNgHN+
         1iSdFScjZN9L3ChUg16WMDGpnLuri2ffIwHKz39lF8PQryN4S5qHJn2cl7I2ONmxsSj8
         HbaYhJ0SD12TqzCz2mi3/26uwceqQeXDqdjI+7nY7/7fhCB8/Jr1nndhvuGzI0aFaXKA
         6ZR4gl4UV1+jg1EElouvsBPA8ozElo06+5iqTZJSbVl4TlbRwoLs8vOxgymmLFitRApH
         BoLgzPW+0CcOVnzFGvvVRpygg75b3rFLPy/fyn7a1XBbnBvKm0eCrzA565pVlifMr2pR
         Owcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727787541; x=1728392341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PI6vIBaenjmeV4v1LJ8TZd0bodccIG5VVCIvDBNwP+8=;
        b=eRbzLxeIrI57WRIspMVvd2X6evp9WjrDy7yV8VzSGooHr3Mm3nsKC+zZ0V1xEl+mUI
         PlVM+aFMwD044r/2r5NCwTMRII2kVSFTj5bskees0FFHbbw3Se8y4KKu2oPpHdmXIZ1r
         WVqj3crNPS7735Kbx40ntKrJVAXUzc/B7dehY985UxmbbvbUewzPi6h7vsYjcITvbVmq
         7kjCAhTQX1l6uY480V4PlMqODZYImPIwyGroYjk1UH02tHBR29kmrEgY23Wsww2ADSsq
         AuJnKCLEe8eO3P5nByxR5U+vRsxveX+A7YvYaZXzvhxwui2iuE+U5voc1IbTI7MetMVk
         66QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYy2S8wgewnxFmaGev6K44OQMz2JtyLEycOafKZmCasGBdXcUPxKzbRD19s35XV8XIlcK9gCgiveDCVg==@vger.kernel.org, AJvYcCXTiqg5pPgmebnED3jWyWF1PQ/4M4cPAOpkl4EHLBgWDiAOErhF27kalEyrkjsCSLNqbPyLW1NyASZZt5Tm@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJ5Z017o2IAGstHs9pOyS7z/cBZ017yEun6xb9vOcLYWUupEC
	LizLt9CjQmekqRO7b6GVCdYOyUhG/gqhIOslq3QujMGJ8jSpP8+FfiQpq0gW
X-Google-Smtp-Source: AGHT+IHfbDOoRKb2RjyhDoGXQii6tGheSnORtm8ulp45jdAOglPSMwHTdjuxMPGJSgsSXaDt2reBQA==
X-Received: by 2002:a17:90a:ec0d:b0:2d8:7edb:fd2 with SMTP id 98e67ed59e1d1-2e0b8b49913mr18979395a91.22.1727787541160;
        Tue, 01 Oct 2024 05:59:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e0fbf6sm10048795a91.40.2024.10.01.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:59:00 -0700 (PDT)
Date: Tue, 1 Oct 2024 05:58:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvyEux8f2ylRQOn@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>

On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:
> On Tue, Oct 01, 2024 at 02:57:10AM -0700, Dmitry Torokhov wrote:
> 
> > This will add an unwanted delay on ACPI systems that handle power
> > sequencing in firmware. However use of "optional" regulators is frowned
> > upon in this case as the supply in reality is not optional.
> 
> > Mark, has there been any developments that would help reconciling
> > difference in behavior between ACPI and DT systems. Ideally we'd need to
> > know when supply was turned on, and adjust the wait accordingly.
> 
> There's not been any changes here, but there's always been an event
> availalbe when a regulator is turned on?  There's also no difference
> between DT and ACPI systems here, both could have the regulator fixed on
> and I'd certainly not want to rely on an ACPI system implementing a
> device specific delay after power on given the sort of stuff they like
> to put into machine specific drivers.

Well with Elan in native mode ACPI FW does do proper power sequencing,
that is why this commit mentions failures observed on Mediatek devices.

Thanks.

-- 
Dmitry


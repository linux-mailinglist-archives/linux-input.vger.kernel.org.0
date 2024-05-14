Return-Path: <linux-input+bounces-3707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D18C53F5
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 13:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2742898CB
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E6A7B3E5;
	Tue, 14 May 2024 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0R2WyK3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415147F4B;
	Tue, 14 May 2024 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715686880; cv=none; b=ijRVuoxVb+pMPKyRuQ63unt6Zu7QZjvWCRHdQWchlVt6/QdrararvTTR6DGn8Fwx6PrG7HlRRyqjpjAw/wpYUF9ofbe+TYAuvVbAJiLcSe0R9R8MhrrG6/920l3xic4yugSDCxto/DeVKfkASSvGYmOjJNxH/MkB7i9ZqIAFSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715686880; c=relaxed/simple;
	bh=KOwfJBI/r6nC/pWf3pbdgMDET4C+KmuSyRqrYqTlRpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVJnILAFOkjfOMO+6Wt51PiLqY7vzWpiNAva5JIESbUb8/aaaJ2MVYCAshS1h0VRefjxVtCzwzjXXd/FTUzT1ATXmCmBF46tZaRbvDvyD6A2+jNDn96AMFIzmNxvGRZpHDQ+tAjvbK9zhjLI7os2aRMTNCDsvgFxM7LFHjVG7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0R2WyK3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f4e59081e6so2786095b3a.3;
        Tue, 14 May 2024 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715686878; x=1716291678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqMUqBOPibvsmTtiD2MrlbiIF0HNUZthqnKUz6O0l28=;
        b=K0R2WyK3OPK+irDXu+xycw0wG8hZqqLsRAePVrZzUP7T9Q520Tr6pHKKZgWSYjPtvw
         cqOBhfD29iyYeD9bug38q5lj0KziFQaw8/V3USwMY2xcSKSPHsXGkkV773J4MPP80l3q
         IoJ+Td2065Vd6nv6CODquj6uht+8dG5gmVQkVPrAsfZGfSMzmI4AZXHYJA6bV1mIMJvt
         xvQB1mq6NHv2ZukWrSSf6HiQ4/CYT8r1SiGIXv6ng5L/y2KWSL4B2nIlBeJdWtkJrX7g
         meGgcOhCDlWcQhyxnGBxAyfQ2poJ87MO7KOpj3Dp2uELfcWygQKPrLtenYjOdXIL+e9l
         QYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715686878; x=1716291678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqMUqBOPibvsmTtiD2MrlbiIF0HNUZthqnKUz6O0l28=;
        b=xFoweWEGkHdwRYMf/ydQTceDVYVKTuTfKR2b7hdfSYYdgnl97sMDmp8DjVbdRwolmU
         3q38Lr5khJSPWcfBELLEoqJqUGNBTmHBD+6FJvQ4FakCS1eRSS4rXqXoJ4Zp8hj+GGFd
         2PvXa102C4Rt/Y/jpB07bKbxBEkV8R+E+YmF10oiQjoZkh+KEW/8b51J9IK9W7E7nGui
         eT50M8y/bjOtZ6jTUmMqbmBiXHJjgZP6G8REnnR0chWwyUwjURP2ZD1dc7J3TPCB9I9b
         v0w3481GIFUP6L4kbSrL1nG3ulysPtXZSv/MVbnaVZe9/sxZEO7bVdVKtvBgLnPycYOH
         l0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXr3RJm3262vfTOvloWorxhLH5PVDht99Nqy4UEoSWaba92FkBxNWvcDDYbSob5I/cAr8RcKufe4DeEqa4Z2vhCFv0wnfH0QZg/ZggjTFAek0dX5OIEkapLk8S+DpFOQuv/hN6bhZz92g8=
X-Gm-Message-State: AOJu0YwYXMSNMmoQG3nZkC/eXazVI63zMcos69gDhwW4gLUeZYCyIKgN
	sICPjrjfwToQETB7OX0d+oGkT3s0afhZJ4DhhcWPOQcS53cudUoQ
X-Google-Smtp-Source: AGHT+IFy1uYzNX4thMMA++ceyFzhkgESP3RAJryx/z7gd6ec3JsRzUTpzEyB1Wc1waSLGdW206NqUw==
X-Received: by 2002:a05:6a21:6d94:b0:1af:3857:e653 with SMTP id adf61e73a8af0-1afde0af21dmr13269560637.12.1715686877806;
        Tue, 14 May 2024 04:41:17 -0700 (PDT)
Received: from mb-board ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886f143sm11261602a91.32.2024.05.14.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 04:41:17 -0700 (PDT)
Date: Tue, 14 May 2024 19:41:07 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, neil.armstrong@linaro.org,
	hughsient@gmail.com, broonie@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: goodix-berlin - Add sysfs interface for
 reading and writing touch IC registers
Message-ID: <ZkNN04yDuAYpYKHv@mb-board>
References: <20240513123444.11617-1-charles.goodix@gmail.com>
 <ZkKHGy0qvFzSoVhl@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkKHGy0qvFzSoVhl@google.com>

On Mon, May 13, 2024 at 02:33:15PM -0700, Dmitry Torokhov wrote:
> Hi Charles,
> 
> On Mon, May 13, 2024 at 08:33:37PM +0800, Charles Wang wrote:
> > +
> > +const struct attribute_group *goodix_berlin_groups[] = {
> > +	&goodix_berlin_attr_group,
> > +	NULL,
> > +};
> 
> This symbol needs to be exportedsymbol needs to be exported..
> 
Ack

Thanks

Charles


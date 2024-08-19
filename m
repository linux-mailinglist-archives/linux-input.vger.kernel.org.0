Return-Path: <linux-input+bounces-5673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C35956DE6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E767A1C21196
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93768173355;
	Mon, 19 Aug 2024 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5c9j+j9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7A15853A;
	Mon, 19 Aug 2024 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724079276; cv=none; b=rZOHb7mpdz09cEk2It29A9RdnLk/sMbLOAjo63lsIBmm33WX+umA/EEfngZAaPi3wogIi4b0CNDhrm6N+Rd7NVkj/5+udPPlB8GbzvnQbgdPlQUzYWJDPSjYRl1OAL8xm9CXyxpMJP+zZ/nalat4MUIhAMfIMprMBrsKRPXDpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724079276; c=relaxed/simple;
	bh=MqPp2rS93v5Z13jND8TVOoCuxF/63EE9pAzaBT7jUJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCa2xDieIDbJiJIsGmmw76N9gVq0Cj9RpDprqPVLAzNAumWLjBDSGKzt7Cm6zwlc2OveZT8e/LmPqr4nCLDpvF1Fs9C0YifmVV10YF6R/d4k+qCQQ++PFrJAD9/8IpEfIBO8f9zEkv9QsF/kLvmkWNeDlj3de9JBAO86EPnltXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5c9j+j9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2023dd9b86aso7735455ad.1;
        Mon, 19 Aug 2024 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724079274; x=1724684074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMrqnsnXZlRCiWLvTDc4nvoRM7cb2JfS98MjQfv9XNk=;
        b=U5c9j+j9Q2MLNyDXUx88PbPXJurHz0mJkwyuSPAX2q+85WY124lbYx4r/I1IP4+ow0
         AQtHcD+jnngBZqxnQZ0CtM5lhWxFu5xJdwtrqd3lxn0MZXTF+/Ycms2IVItWyngsa6U/
         pXBqRkxCo5Gy1GcIsKqLrezX8SWEDPgliXbmdLfGo+boaoA9ypXUBffopWLjax2ci7Dj
         BrYoZUEsn4kFuz+tDG/VRnJ2LwwjiXiQhCK0f1J0xb97cdf0zfoE0M91rN/hBnxKrN4G
         o2KkOCpT7DkDhJy+QnAxrHdfM//TfPomtngddvHkFsulHLH0KUKOKGHSub5vdMbGoy1c
         I4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724079274; x=1724684074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMrqnsnXZlRCiWLvTDc4nvoRM7cb2JfS98MjQfv9XNk=;
        b=jw206IgyB/WePOFCD1Q4SGn36TS3NN71daz6T6yLwtyw/l8IkWnV6SiIvqu4uOocCr
         PngPooF3g3d44P+giVhz3K0YOHdE4GlWhjsyrJM2++xzRM9Ok3Fnro6avPmNgPQdIj1o
         1ISixQuF5Zz4gfbBzP15/7SWR63Ld5KNugVOrMQuceDl+0seXQWmePNQt7qmE+/DU2j7
         Cd9uAF6vSTx2Sn3WJI62aAwJrOSY3NIuQSuDhn2WFqOUGGUW4MQzyoKPcOAffWSpf40k
         oefFYtWVGN3EFbZ1ds0y2JFb79jkvYqrzc/5/hosQExvWw+ogZKdIisbv1CLvB38+uYW
         l57g==
X-Forwarded-Encrypted: i=1; AJvYcCU5TGJpk2NPjOtUZbE9/gl6/dn+SdzE5dME5r00j0pEL2t4sCkyx1qNOFiEWtsr903M5DLGOD26/lyDqd/cb/VkXTRKPcZebb9EArqIbvmdJY6F+xLWvUW0xzJ5BEH2rG2SpMocx+DyZbE=
X-Gm-Message-State: AOJu0Yw679MJsK+Sg2pUYj9kILbHQADQeoalz6QB1clveuobdTRh4auo
	FGn4wOc3WBUNd5lzRmYehF9wEt3q/bCtIrvY47onyuf6iPIRl4Zk
X-Google-Smtp-Source: AGHT+IGk4ABLY+qSFS+YEfUz0OInEOVjFT697vdPkhg+xbgO5YtNmD9N9Gruu98Yn4+CvBiWm4Tt6g==
X-Received: by 2002:a17:902:d2c8:b0:202:d86:f7e6 with SMTP id d9443c01a7336-2020d86fb2bmr62892725ad.54.1724079274143;
        Mon, 19 Aug 2024 07:54:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031cb2csm63235225ad.106.2024.08.19.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:54:33 -0700 (PDT)
Date: Mon, 19 Aug 2024 07:54:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Utsav Agarwal <utsav.agarwal@analog.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
Message-ID: <ZsNcpom_Fm5uCyEj@google.com>
References: <Zr-gX0dfN4te_8VG@google.com>
 <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>

On Mon, Aug 19, 2024 at 11:29:32AM +0200, Arnd Bergmann wrote:
> On Fri, Aug 16, 2024, at 20:54, Dmitry Torokhov wrote:
> > The users of this driver were removed in 2013 in commit 28633c54bda6
> > ("ARM: ux500: Rip out keypad initialisation which is no longer used").
> >
> > Remove the driver as well.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/keyboard/Kconfig                |  11 -
> >  drivers/input/keyboard/Makefile               |   1 -
> >  drivers/input/keyboard/nomadik-ske-keypad.c   | 378 ------------------
> >  .../linux/platform_data/keypad-nomadik-ske.h  |  50 ---
> >  4 files changed, 440 deletions(-)
> >
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I have a list of drivers that I determined to be likely
> unused as well and found a few more input drivers
> that were unused in 2022:
> 
> CONFIG_KEYBOARD_ADP5520/CONFIG_PMIC_ADP5520
> CONFIG_KEYBOARD_ADP5589
> CONFIG_INPUT_AD714X
> CONFIG_TOUCHSCREEN_AD7877
> 
> As far as I can tell, these all lost their last device
> definition, or they never had one and are impossible to
> be used with device tree data.

I asked Analog Devices folks (CCed) about 5589 and Nuno said that it is
still relevant and promised to do conversion to DT similar to adp5588.

Nuno, Michale, what about the other drivers that Arnd listed?

Thanks.

-- 
Dmitry


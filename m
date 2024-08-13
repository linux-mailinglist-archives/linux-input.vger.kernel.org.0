Return-Path: <linux-input+bounces-5546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C286950608
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 933E4B22B2D
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6854B19B3C6;
	Tue, 13 Aug 2024 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWz+fPWy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D419ADBA;
	Tue, 13 Aug 2024 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554594; cv=none; b=tTiYDJH7vSiARHIs6vEKl5OthMFBbO001cGU4LkMM/0fA9SNK5yjbjP6ncRb7pdu5fxwn9nbRYby8jUS+FzQeZfwI7FWBTp5bZvOe7fupg4SsHl/gSvlNUnp7/752e7pxLLQ/6EXpzJSaKfbRL+KOOQHMsaUJsQtAUIUQs/yCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554594; c=relaxed/simple;
	bh=GRkrMa+NzJTC6sMn5hZ/urMe/80d3OUJWRmCv4XjoU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASsE6WJs1a6v2zjTz5ltY22/kFcKKYrltanjROek7aui8y2IMEzxhzJ/GzxCRs/D66JIe4DyDMqgcK7ZAYwACljSv71TqlNqTXnkbSIkT3bRVt/2dbrlnfobjox+T3bLffFzmywq1MEBq6TYFfJuEcJjvE2lbHBA08wzSZ3eB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWz+fPWy; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-268daf61e8bso2145515fac.0;
        Tue, 13 Aug 2024 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723554592; x=1724159392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5l8u9NIvp6mmIsccM1HWUWBWBG2azze1DXyub334hgs=;
        b=hWz+fPWySYIPnMpYJcNjNNE/j7zWSbl47eYVTs6RQZ9xGFE21rcpUUJL3xHEbx9YLE
         oGK7BuVci2b7mZJ9a0iRmrfkP7tw+KdbTRTYSuTrTJm3dmyw3byehv8sW0Fpz77TNnUh
         n8dyN1kP2wexUbGdVb4gpRbxoieQR7KMPRO+ZSVTQBIgBEbYBcCd0cUwOK+XzlD/l+Oj
         kX/2BjqYSxjjm++dQqdWtJW5ge0oiXG0+dLhfl9PSeKWBfmelyz7oJ2nSQQ7Un4jaRIT
         WGiMMb9oAMlU0n4YFWO/5bk/NiAavbCNQNPRR0U9eLJVs6hJYS1mIsLFpuoH+whNMiO8
         2Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554592; x=1724159392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5l8u9NIvp6mmIsccM1HWUWBWBG2azze1DXyub334hgs=;
        b=WWIcsCkrXaWu9pMzvnCKscvRnp1/V1tpbM+6uiQ7QMjeZI4QRkMBd6rzzVbTiw4gnU
         oUb8ADlqK3ZvKcMQuIEnok1OI5ObeXAoFyXQtLT0dqCcE017BEOq6mT3Nz9L7U+kiQhA
         T+ZoEAEFfKllcSbcQ7iyLaTIoKJ72+7mI68raPscEkHau8nEvxoRmIOCVUC+UptPiB9B
         f3MvBE7Cxr60bQRFjmyPE/yypsgUAgqzqhYu2egcdaICgeoePjr2TjdLhK3jqUCNFMeE
         kjVB20tCXAF856g8bUpXUiH+04cDKXSb4YUuf8Udsc0IbaeiVgijT8f8BpqVKEu+Z3eo
         4Izw==
X-Forwarded-Encrypted: i=1; AJvYcCXbeUamEWkPwsLJomZ3Fy3yQxbpGHzLznskcSmU9TTG9pMb3QV2hFUH0LaIBzD83KV7EV/mu4v+q+nnfqS35zOlDjPuVe3k+x7Q7D1FzienJfz4sB04w4G7MSk2U8zNciUtCqP/gU5+w2SpMK3YFulQjJzxQtLP2qkSTfZkEFVMrJRbV6X2
X-Gm-Message-State: AOJu0YwLwMPInSUkosaDiyOGp7DLwLm4ME2Pu6Foa0wlc1Az7g6QsJrW
	ykBUdL1+pc1eDwfo0hOIPf1cC4g0135PnfZciN5Yytk7C9nQIOF7SzUDcnpI+Pg=
X-Google-Smtp-Source: AGHT+IEcZ1mRlZz49KVz2LnlkGCg1L0G+pDdo4t/GumfAt/t/XsbmT597wK5MaAo9C3CJa2YXIuMRQ==
X-Received: by 2002:a05:6870:d14e:b0:269:2708:aff6 with SMTP id 586e51a60fabf-26fcb67a895mr3604751fac.16.1723554592032;
        Tue, 13 Aug 2024 06:09:52 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2ef8:4fc3:dde8:ca2c:7f06:eeca])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c697a549d8sm1240600a12.67.2024.08.13.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:09:51 -0700 (PDT)
Date: Tue, 13 Aug 2024 21:09:39 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, conor@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] HID: add initial support for Goodix HID-over-SPI
 touchscreen
Message-ID: <ZrtbE6VhuV6TRtao@ux-UP-WHL01>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <ZnlGDCcNch475wWA@ux-UP-WHL01>
 <CAD=FV=UkHaH_oUojLCozh-C27GUaCgr_6V16_0XKJw86p5wmFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UkHaH_oUojLCozh-C27GUaCgr_6V16_0XKJw86p5wmFQ@mail.gmail.com>

Hi Doug,

Thank you for the reminder, and I apologize for overlooking Dmitry's
review comments. I will address his feedback and submit a v6.

On Thu, Aug 08, 2024 at 10:19:16AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 24, 2024 at 3:10 AM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > Gentle ping...
> 
> Looks like Dmitry had some small nits on patch #1. Maybe folks are
> assuming that you'll send a v6 or at least respond to him about the
> nits?
> 
> -Doug

Thanks again,

Charles


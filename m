Return-Path: <linux-input+bounces-8296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321C9DAE52
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 21:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BCF16577E
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 20:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BE314A604;
	Wed, 27 Nov 2024 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RecNXpuu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBD12E1E0
	for <linux-input@vger.kernel.org>; Wed, 27 Nov 2024 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732738186; cv=none; b=G7Wn6lD9wTwEJs2DwhMyQySCuiEahdAXeuTVSaigMPVKDzY5e19YDUzYy1YTHwxwqdLJyyJ/VdmCpNVid8ibOFJvz82oLps5VF1z1TO3OCwShehULfrO0c1c0joallDEIC4Vtbs7l2c/9XpfSzGJpS4x5Dr1AFhYHmGZEY4XaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732738186; c=relaxed/simple;
	bh=irU8WVB5yveqvMuMEKNxfSWv7pyB08ukpzNfFqmXXZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2PeMPt12odTrKuJeMnzGS+15QUYx2mPjpSm3wdcaJ6GuH5KLjBjLhLMKWZFUg+zdw6+FINmDVXnSXIWeUzMOMUDlzEynOsGJhLDzZam1y4cM4bH8PLaHaJAyGhr4KJDRqRKCz1k7YptHa9+ZHVsmFfo3olYPJvkpaNf7nEqJGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RecNXpuu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so183893b3a.0
        for <linux-input@vger.kernel.org>; Wed, 27 Nov 2024 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732738184; x=1733342984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjPX5Y/d34FF0QFWIAU7FrtXJrJpDdZWj2onvtp5PwU=;
        b=RecNXpuuBoGYsj1T6NqIG9UxDFQF7ut1DH/J03A80+DuinGvMFaGBoUuk/uSdXjtFW
         ClIghEut1LbBG4aRgh6eix150VqDiIZL3z/fJ5iS56+wst4MSopKp9OcVbfK80xZOrlu
         ULt3WQLupwqdBGbSKixZQ3SftKUJoCwJclbiREkLBLI9tgYA3nQrkE3Mu4fXYbfXAg+o
         8CBhYanEtymSqpVKEClMurZlvDATwng/2E5nwSknc6McAtGZVhsvLPkiIYL5IIxCyfjE
         un4OoWgRgJLu2TrOUxIW5hvZ6TWiDDs1Y6GJYHz4QICkZx8UiS5gXVTlUXsPVA8XvZOC
         WgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732738184; x=1733342984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjPX5Y/d34FF0QFWIAU7FrtXJrJpDdZWj2onvtp5PwU=;
        b=uYpBZP/Xbh8Boij+KmYK8nS6FxqG9x9ZPN/bOZDo9i50RG7njaBKDkK9zQAT8W7IFM
         zOGx3MpAnZVm6bSynHcWQsIbXi4eMoD2sNJYWdRgDr3ufoR4dJgoHxM+yVl1cFxXsARU
         uRXQP8rtCyFDrmvNNqeAI0eGJC3fDD12AzBGy/UgooevzD6eSKe8bcog0RtJzglotztF
         rZvBKmURmHAccoRvfeqqw5G8uBZP8b1aiK79jAN7Qoyg0u59ADXy/9/T2+tNRJNJhhZy
         c+IBRX9tCnGZWLHGcOYhGabElS/IfXwnPVpRPYaf7rCLlwr/7cr4NCmhbX3sI/prH/1Z
         IY1w==
X-Gm-Message-State: AOJu0YzyWAkrc1gvHYkDScos3I7J5BXstV6626l+x+163d6JAUzj6RFy
	y1uQ1PCjCwKES203IdS6x9Dkvs5tr7l2HTEgf20BgTPqIj/GrY+nu3MDYg==
X-Gm-Gg: ASbGnctppPZzlp6DJKRJWNeWMZuPE9y6rVooKWBUkcupIRRK7mYxy0Wv16MMmrb3MKV
	2GwUGFmgu07UTQDqjDJxU9KKmd/qSefCyDva04cb+kyUSzCNa7B9OfNl0uaSBbHUGWwS+en5FWJ
	L7RcQgPf89Z0mxdsBBh2bTxbcMWIukMS4WTQAnTE8g0MF+5A+uOi/m3MC006JetcoPzkt3pz+/5
	sO1ElylM6DVQFcn07ZfqZ8eK4CCk/7WqOhe1VEQPeg4XcfTHfk=
X-Google-Smtp-Source: AGHT+IHhc4csQZGVJsqtLPEOjV9XG8nWIKBaozn1R2UQJGFbW/zATDJACPgPgEa16YEYs3NQfcyUpQ==
X-Received: by 2002:a05:6a00:189b:b0:71e:722b:ae1d with SMTP id d2e1a72fcca58-725301e475cmr5090143b3a.25.1732738183962;
        Wed, 27 Nov 2024 12:09:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de479102sm10692301b3a.45.2024.11.27.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:09:43 -0800 (PST)
Date: Wed, 27 Nov 2024 12:09:40 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nicolas@nobelis.eu
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for Nacon Pro Compact
Message-ID: <Z0d8hAZ0pvoIMlUd@google.com>
References: <20241116182419.33833-1-nicolas@nobelis.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116182419.33833-1-nicolas@nobelis.eu>

On Sat, Nov 16, 2024 at 07:24:19PM +0100, nicolas@nobelis.eu wrote:
> From: Nicolas Nobelis <nicolas@nobelis.eu>
> 
> Add Nacon Pro Compact to the list of supported devices. These are the
> ids of the "Colorlight" variant. The buttons, sticks and vibrations
> work. The decorative LEDs on the other hand do not (they stay turned
> off).
> 
> Signed-off-by: Nicolas Nobelis <nicolas@nobelis.eu>

Applied, thank you.

-- 
Dmitry


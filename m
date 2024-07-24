Return-Path: <linux-input+bounces-5135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7993ABFA
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 06:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0ED41F2389B
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 04:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB7D225A2;
	Wed, 24 Jul 2024 04:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX1miKzJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F21C69D;
	Wed, 24 Jul 2024 04:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721795779; cv=none; b=sOB4NdSOe/z9Juw2iE6meeEfHzC4M1K8kKDWXtsv8ARIOLtP745O43oW9c9p/JxSr4fcuCP7NowBbrK/FJ3MCIx+0Y3Tsu6jyHZ/UPVuaQAiSCoTy1hDK18BxRTTOnQ28gocQI+IFdKu6Y6O6F4SHXOXWPB6hxwejU+uDx8QgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721795779; c=relaxed/simple;
	bh=+GlOKVeourDUyyyRERtFHcDm1dfRMCokhO6IJ31qQFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2+KqQQF8M36dm4gSN/3swYRllZMelFI1YJ1o//8URRUHPUxNjsLawDWSA4zBOVpqTbWkHBA5dKVLYU7QFM6LJW7juQV/nJdTpQbkSfG4EeNQAzv0k++V3KjLQzVdsBHWxw1VLrSQUILCOE8U/Szyr3ckZPL5oqhf9uO5xn5UWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX1miKzJ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7091558067eso964783a34.3;
        Tue, 23 Jul 2024 21:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721795777; x=1722400577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzHeK58tIG0fQCzAX9YR+XgGT2sFZWNmDsshOJh87SA=;
        b=ZX1miKzJItT+S3GduAMn7kHBfgmEOa7PUV5kYG6qtNUtJ8WFrjVYP79qyke9OkJuaB
         eVxogcmK4I0jVlYtdIl/USAKCifveVo0l4CXdrlDWaAfpX34lTvgjso2UFJD0FcmKedO
         fp9GGWtmeOm7cR8I3i4as8ctUB+DXUtXTQZEZIb9I7sctETLQPjCFSOGFbt90ejk5euY
         77YkZz481fl/lm63KDgnKtbQdSNllFJLQioQBk3ec/WBYo/cVjD2a/gTaIsf9F7p5r9C
         aqXvVj2fX2P4IEWevJv6KgYd8dXgpqW0eT/JtCxeNm8qr+3OpQSaTsP+JaNw1wCIWqDU
         CFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721795777; x=1722400577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzHeK58tIG0fQCzAX9YR+XgGT2sFZWNmDsshOJh87SA=;
        b=JSVmCnSwO8OI51VmQNgFS4mWVd6h5JOtLUpR5Isd3ZsIzXoXsuhvJQsxZjMOaxIYYZ
         MMGjddQugPc2t+AShex1OCN0QR6VijKi4IWw0JFrF80/SUY0N5t2UmD/4U7Cbes3CaVb
         DTzHjh4OK6nlnm/HWgcJSkYq+kh5rTPPyp9qHk1bGr0rmIRiIEzt3U2hLsg2s92uuX1b
         dATJUBdotmbLnrVJQDkHQ5xNCiMkKsOTZavjTUMwQjWvvIi8+BNnQ6WBluy0idXhwg/+
         rXpHv1sC0KAsfxruXvv9bl+wWw59cj/8uuwpmVAJ3yH4yLT8PNcXz+1nlubHq4gyRfGe
         LelA==
X-Forwarded-Encrypted: i=1; AJvYcCXirvLOw+ambDojaaspPOweSGh3wLHkagcR/QrZ2YbSXUe+Zg2cXYjFxtZxiq8HE6utw+zMrrcMyBrD3H4atcyKgX9Orbws1afePr8=
X-Gm-Message-State: AOJu0Yx5fIITdm1ti2mSggNCY6Z6ihTQH3ZDYWFRLVuipEsvEC/H9cch
	uCGDd9aK0KVO2nmEHpmck1ZFnQanC5kMM1SZqRMdqIhG0IHPqdDIfpGRqQ==
X-Google-Smtp-Source: AGHT+IH6qKcX6eB7I7s3liwEHZjz8MTsUC7W6OtwTU6W+p27nHCW5B12hMGdKFaLqV+uFKP7YZj8fw==
X-Received: by 2002:a05:6830:6419:b0:703:5ba3:581b with SMTP id 46e09a7af769-7092529be13mr1266944a34.5.1721795776677;
        Tue, 23 Jul 2024 21:36:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff49159bsm7730762b3a.21.2024.07.23.21.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 21:36:16 -0700 (PDT)
Date: Tue, 23 Jul 2024 21:36:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Jeffery Miller <jefferymiller@google.com>,
	=?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>,
	Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - enable SMBus for HP Elitebook 840 G2
Message-ID: <ZqCEvbddbBt28VT0@google.com>
References: <20240719180612.1.Ib652dd808c274076f32cd7fc6c1160d2cf71753b@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719180612.1.Ib652dd808c274076f32cd7fc6c1160d2cf71753b@changeid>

Hi Jonathan,

On Fri, Jul 19, 2024 at 06:06:15PM +0000, Jonathan Denose wrote:
> The kernel reports that the touchpad for this device can support a
> different bus.
> 
> With SMBus enabled the touchpad movement is smoother and three-finger
> gestures are recognized.
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
> 
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 7a303a9d6bf72..9df0224867649 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -193,6 +193,7 @@ static const char * const smbus_pnp_ids[] = {
>  	"SYN3221", /* HP 15-ay000 */
>  	"SYN323d", /* HP Spectre X360 13-w013dx */
>  	"SYN3257", /* HP Envy 13-ad105ng */
> +	"SYN3015", /* HP EliteBook 840 G2 */

The list is supposed to be sorted alphabetically. I fixed it up and
applied.

Thanks.

-- 
Dmitry


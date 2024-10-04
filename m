Return-Path: <linux-input+bounces-7073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3B9901D5
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2CE81F2125B
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C154F146D65;
	Fri,  4 Oct 2024 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0mlYXH5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D414B94C
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040188; cv=none; b=Vc+WGgGUui8ve2xi4uWGBapAUKTCMcnauoWx5Wm5IEZ5hP6MWjGs7kFOIwRqgSUyD+gT0vWFYnQheAcXdRO3NPhW8rO/IcOXEtL+yqT0txblaGJ2FDCzY5DIj1AWhVzvbn0/eIWeSOINetqWBEPV1r+6TZ/Z5XFwQrXikodTGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040188; c=relaxed/simple;
	bh=GxxVLGPcq+fJTcK654kLqflBqKd69uZ8uAn0K+/xc9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeENb4o7hfsjsaxdXUURRTHRyY3IdYPWDYnZDw7aO12v4K2tikoaLZJm82WnVkzP0rtw1IHG79znNJzdZSDvRaF76t8dHsG3/vOcdaNdqNMUTmVAnJ3UWeJL58UBX5Hyyx32Wh3la/1QYqJuNOPNSgnZcsiwc4HivkvJMXlexcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0mlYXH5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ba8d92af9so14837275ad.3
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2024 04:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728040186; x=1728644986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ4dGS82RrOpRAkFRGNHyqZbmg7qhbGaSAHa1Kd6lS0=;
        b=C0mlYXH5Ras9I1/9ww2piSFcyzPixytlXIwez81vPXFC89n9cKgQ+lRkSCPQ3tURQg
         YTebEFekJ5NQK2gkCJrTjag9G9kb/uUrdh/q7S8zl0RPmM4j0kWH6HB1Cw2GOMcq7rCj
         HsiLxFDqCDwQQQ70eGUOyCpLVO4TNhLgXKfuT0PTGGz1yCeeZ/fJJiMCeXkSCr9PC3lE
         V450j3b46z9SdiQXpzJyh6+LdZKnqLwrf6Y0pTeQZ9tzWZcekFLrR5KC24e8b813Eqva
         8W+X4Xu+xskw7UEw9Y/zRvoy43NbpaSaoEB4hlQPme0JacpRjqIAxvjES0uG9WjGH8Hi
         8IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040186; x=1728644986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ4dGS82RrOpRAkFRGNHyqZbmg7qhbGaSAHa1Kd6lS0=;
        b=psfs0D+WdEhhfF3aw3Q51HBMByZ0zJVJ3vDyvgmZg26mUiwEY0qcsxZil7Ix1BZmE0
         eVCrzG9YP3TfyglpbKAdXXuvnCs6QSVLbJSf6IZsOrhup6hfByv5aUehIfmHASf2rkN0
         cQak929aGJ44VUhgOyrWei8uTev8XoJgLOwLnrpO64Nv06HzuIJOAiKPqcVcrnumP64U
         BDRZ67Y4jzRWnfAGIAeMD7akS03iewjYZw8iQzlXwClw4nO5aDqztrx67zjmB521pHfR
         PwKbJQlSZ4+St8boPyfXPCTW7wnHox+1+EKgEMLRAJn1rIdCggCoF5bHbwnPsjYA6DXK
         Gb8w==
X-Forwarded-Encrypted: i=1; AJvYcCVFc68VZxb8von4Co7GrZfx5+zibYawh9wMR0H2BjxUf+uUZFJ09Wotdc8O9OV573i4TN3z328nqMWaBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRgzBsbV+jetHsN4SIGXU3iKcljLjg+IBMGzApWD9w/xEKMQM
	s7QvRTNdoyBUUhUNq4v3GnHEb+n2ShmR1jaX3tnNL73ujPyz6lfL
X-Google-Smtp-Source: AGHT+IFtJMT27P63tWfJcxfk8h4n8Htpq9SJRXSsbMT5+ErVhjGLB6DEeHWCEcmCjodD6RUtK4zAjQ==
X-Received: by 2002:a17:902:f60e:b0:20b:a41f:6e48 with SMTP id d9443c01a7336-20bfe011becmr47079325ad.27.1728040186485;
        Fri, 04 Oct 2024 04:09:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1b2:add:2542:c298])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beeca14a6sm22331165ad.86.2024.10.04.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:09:46 -0700 (PDT)
Date: Fri, 4 Oct 2024 04:09:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>, patches@opensource.cirrus.com,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 21/51] Input: cs40l50: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <Zv_M9znD2tZK5Feu@google.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113708-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004094123.113708-1-sakari.ailus@linux.intel.com>

On Fri, Oct 04, 2024 at 12:41:23PM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/input/misc/cs40l50-vibra.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
> index 03bdb7c26ec0..8555f0d93d3f 100644
> --- a/drivers/input/misc/cs40l50-vibra.c
> +++ b/drivers/input/misc/cs40l50-vibra.c
> @@ -307,7 +307,7 @@ static void cs40l50_add_worker(struct work_struct *work)
>  	}
>  err_pm:
>  	pm_runtime_mark_last_busy(vib->dev);
> -	pm_runtime_put_autosuspend(vib->dev);
> +	__pm_runtime_put_autosuspend(vib->dev);

Same comment as with omap4 keypad: prefer to simply remove
pm_runtime_mark_last_busy() once pm_runtime_put_autosuspend() does this
for us.

Thanks.

-- 
Dmitry


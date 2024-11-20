Return-Path: <linux-input+bounces-8158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A68579D3329
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 06:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C03C283336
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 05:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8AF156669;
	Wed, 20 Nov 2024 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg8PeR3o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4C1547FD;
	Wed, 20 Nov 2024 05:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080967; cv=none; b=JW635HdEzDc+bFxG4cCZlCjzwi6zOoWr3O+H8/z3/za70eWQ/IvmziwabTyngd4oP9J03fJQF0wb4QnAhV0OVLymQWb6zfu7KyD95axhzX3eMZN2fFwtbQPkhOrwr0LETI7Zk4fKeRi+6uxAfRuUdizTM8lhRJPX6sw0c6FQR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080967; c=relaxed/simple;
	bh=IQkjsVD3ag0+ypivVQJCxGZe3DiY4w8h6VKDQLVk/MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu7z3u/cXA2FvVyOFSx6dxskJ9n2LcqYreLN8iI9Kz7i83G1wij8Qa2V8vUAX5MgYXOmvr1Is0MH5x9sGS33RBkwVfXxOgSDVaH6K8Tx1B0aZS12wdAsUpWozF9WVAeC6yDNRw7QP0ZiVABamnqWYfFydQp3TsknkavHlmdFbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg8PeR3o; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f8b01bd40dso375802a12.0;
        Tue, 19 Nov 2024 21:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732080965; x=1732685765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0o2sqbEUFHauC9Fy3qUxJoaKpGgk0CF94arxlM2ZQhs=;
        b=Xg8PeR3ogzWNy+KAYt3aNAfrP6JlRYd9yh+MOSWjEw68sXXcq0/xY8VXvKWfkdaUAe
         u3kPebOODcupwupVKmFR/karu2qhM4wUn8ErYwVTLz7kid6qV4BxOXc0fBSrBVc4iQ0W
         65L/EUK26NogssvAWQ3ySUdTKn5/jbmMzcuFViKdmaffqW2VA1gnhxzJFRbYHmrFhKNp
         eJTMMICsig/c4l68Dpe6sP12JU6Qj0QyAuFghsXloK2PjR8M+JCTFZK8qIoqc6GpRc+M
         nMDJOO9tbttzh2JyCtDjhBuCKZJv0DJ+t5miEeqil/peZXPUAYlwldK89NuHORbeqDND
         f6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732080965; x=1732685765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o2sqbEUFHauC9Fy3qUxJoaKpGgk0CF94arxlM2ZQhs=;
        b=CPzoZKiEgtdyFhOOoql8tLgA3kFP4uG9qeNgOTTRCFbU5KE8GFXfH92kl7MXNV4WPp
         XiLD4sio3B6hksutDDGMT3KDICb/ydefszvWCRVON7gza9pVSZPaoSgaqWjaqt/6IVvb
         4AS4wRY6VBuTWB4t1rJcJXGcfMXuyThiCf0KwdwbNq0VXCQOfjE2v3ohAtiw1UoavXqs
         XRzfqwQXkV4IK9BM99fshEv5qBOPJ1pbLoM0vCFqudxtGyIeCXKMnEYqCJsEoctYNix6
         Pe/hV53lPZfmoechuASz7G3BkkeVizmc711tugd68YcU+HVpHmT1sBfVTlOTA556SRwg
         F0UA==
X-Forwarded-Encrypted: i=1; AJvYcCVZk8dl+oY420pQNCIIOmhsUe5+zo5Rtoq68yLkthc4xJ3pq2HUQvVnbKPDVLCK/mDEzfdrZ4m4OcItnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Kx47z2o8kLPetUc+WGxOQN8zKtBUqNWGCWBdVanU8xinQruz
	XLCrG6PH1hH+lSZwtRSEVgPVFoie+yxPqIQKcTJ1J4WNUyR5eHOc
X-Google-Smtp-Source: AGHT+IEQcvcn5oIZz9lqfmtnI1LRuxbc47/1lX6kc2WEJC0Uwe2GVL+mACQ6mrBDeMEZ+9cNm1Sv0Q==
X-Received: by 2002:a17:90b:3c4a:b0:2ea:45d3:a73a with SMTP id 98e67ed59e1d1-2eaaa80a3ddmr8826118a91.16.1732080965366;
        Tue, 19 Nov 2024 21:36:05 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4fd4:a79d:4d7b:917f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead0314f30sm392324a91.22.2024.11.19.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:36:04 -0800 (PST)
Date: Tue, 19 Nov 2024 21:36:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 05/15] Input: spear-keyboard - don't include
 'pm_wakeup.h' directly
Message-ID: <Zz11QjpwveSI5Vih@google.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-6-wsa+renesas@sang-engineering.com>

On Mon, Nov 18, 2024 at 08:29:04AM +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry


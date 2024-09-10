Return-Path: <linux-input+bounces-6422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87269974647
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 01:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9395DB246BA
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 23:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B233E1AC884;
	Tue, 10 Sep 2024 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N69il8PN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C01AC885;
	Tue, 10 Sep 2024 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726010107; cv=none; b=D07GtCjKDRvxavMYmSzRYbAacFeABzD8xD97yzpo6C+SiHjmg4LKV4fyDkeaSxcDMEaFfXkfPyoUtAbmFCrrabKd93q6oB4w7geTwXXyxqq9oewmUy2RBMiFrh3f0bHF0+KVGg7U8NHsS732lBM/IDjiZY/ZLCkk9W7dxqLfOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726010107; c=relaxed/simple;
	bh=Xz17c8ZNkLG3GzfZKVYYn9Zn/gMfAbV5LfJKpPdbJm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zs3keP0e98JcNrocnG3RVk07o3p98whL/9hQcPuy4214u6QgdFb79b2QWPoC6wxcP1HrL6YRygbzSvBOQwdEb2G/+Quzzxq0S79f7BIWDfxz6nTqcvgDvPxH/VpHMPYpCmAkDB4nLIyIR+smT8wIH7bqTKb76gtVeeehjIRvqso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N69il8PN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718da0821cbso3834909b3a.0;
        Tue, 10 Sep 2024 16:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726010105; x=1726614905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXRzRZgIvpwyMg3sjBSFT+kmdwWGEUsQ1CH+K9qKY5g=;
        b=N69il8PNFyCGmJbICSrAQxi9TV125EgAja0UJsC1VGS/n1ndEuGGOVG9s8tp1GAAiH
         5J6OA6E8NH4kU7J779oJI0RHtlm59S5T1v1mg/89ps7EbnN/2iL9+YVgXmHG/YLGNKUm
         UZhH8kFugO1ycKGRCRPhmDTCZTf1S+8xYq8w3us6Ql9CG7a75tJ/kx+4+44MCGWUnS0G
         D0mP3/sYJV/tCqDMBElhgGv3Y/l4q2sWroYFT7xKe+B9UbkZpLK2CmOKWK/PFN4n0Eh4
         TQMRjHtThxV+u+CQ+Ig0IDZ59NohLe0Cg5EGv5RD4aukUJVaVAX1xbW5LOZZ4EHKTPJt
         7XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726010105; x=1726614905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXRzRZgIvpwyMg3sjBSFT+kmdwWGEUsQ1CH+K9qKY5g=;
        b=NcH5yWWcm1MM/D7VRaCfdVYeSX4syzqvAvYoNQjcbJ/9RrB0vLXTkgR2wGRUSdJt0K
         YwhKjAnm2Rssb0s7fG5P6N0u83USa4DfbjmA9AW0o+Z7xyovzO5orb75d+OnMaKZRNSw
         LmGG7tYxngeR41zEUstzCtOoFrUFX2v1ZRGigBfjeMDIrctLiR29ppJJOFPo+7fHmfnK
         KGkq0dbyNw6mKsCFyv0A61eVGcOZibx8v6/ebf18DnKncQWSch7yMtoGF7csodFxHmbf
         Wbccz+9K7tGWzXNAM9hV6hbM+Q+2lr3jmJBRIO5uwESfRRSbCSCBitBO2FFADsJooTz6
         IWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjIZYNfNndjr0wA+vZ11t5LiiP6cYqsWrxS6QhE9+afN/VC/3cE0TaKV+/zwjIxOc/qOh/mO1FmN4z95I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgR9PBo/azMUYPC699tgR7yCmcVTmXOjCF954eGOyatzObBQ6
	7xnfg/eL2y6tcP2qRibwGhxHt1XsuRAmMQTf9xtxD/GhhTOk4ZXVSMTQ6g==
X-Google-Smtp-Source: AGHT+IGhHvbYEcU+7D3tMQEZzYey8xjtw4xz062I7hRCrsigAz8j6ZoYTvTVjxhjjxNpfm56tIXdsg==
X-Received: by 2002:a05:6a21:e8e:b0:1cf:2d2f:34fa with SMTP id adf61e73a8af0-1cf5e114c82mr3204273637.25.1726010105126;
        Tue, 10 Sep 2024 16:15:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7109:d564:e676:61bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823cf3a2esm5277242a12.24.2024.09.10.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 16:15:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:15:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ims-pcu - fix calling interruptible mutex
Message-ID: <ZuDS9tfekWgHnFsp@google.com>
References: <20240910-input-misc-ims-pcu-fix-mutex-intr-v1-1-bdd983685c43@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-input-misc-ims-pcu-fix-mutex-intr-v1-1-bdd983685c43@baylibre.com>

On Tue, Sep 10, 2024 at 04:58:47PM -0500, David Lechner wrote:
> Fix calling scoped_cond_guard() with mutex instead of mutex_intr.
> 
> scoped_cond_guard(mutex, ...) will call mutex_lock() instead of
> mutex_lock_interruptible().
> 
> Fixes: 703f12672e1f ("Input: ims-pcu - switch to using cleanup functions")
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Applied, thank you.

Too bad it does not warn when incorrect type of guard object is being
used with scoped_cond_guard()...

-- 
Dmitry


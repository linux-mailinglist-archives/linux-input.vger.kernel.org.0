Return-Path: <linux-input+bounces-3696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B98C48CB
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 23:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668FB1C20E00
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 21:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9618288F;
	Mon, 13 May 2024 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqtXa5l4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC280632;
	Mon, 13 May 2024 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715635483; cv=none; b=CxHG5EcHqNqsx1SBWBwNCiiSQe35gL2MgwjMu5ynMRBw8J4unQtx5AAXgwa4TLmhvQz4EJ8tcix3yRO32wJZ0JFDZVzD1wdDc5uzGCltCXVzf+LIwMoWUPkzz5g8rWySY42UaMQm9XLxHhnM4gaj/rpGdvTxdZI2kMc/vxsBH8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715635483; c=relaxed/simple;
	bh=6Wi8SuDncGO89olr7UORpVYzgctp9MimmYXjjT2CaN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYIH/JsjftiaqgMumP+TbVF8D37IM0dzL8YSkjRjiVnrC+1WhWrTXPZ08fJAxQZuJENp65UCJ9jiN2JkC4nc/y4GGkxLU4O44ppqyHdf1ga4TSOlpHAyrFw9oq0iYhW7C/9btVnXr1CkjLkkvWSRaDIKZcPwiIwIwcdlgd1j7co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqtXa5l4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so4368707b3a.1;
        Mon, 13 May 2024 14:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715635481; x=1716240281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PORprU8bkH3+jRmliwhcEJQRxyTm9W/+V5Isa8KUnac=;
        b=cqtXa5l48WbX6JuXsqQVcwCkRhlnJsHqXZnhV6fUJDZZhtjlhS0yj7z7Nc3+5T1+D8
         4ls08T3+qlwciWTVLHdSvD/NVelw4TbmSVGA+obrwQLS3tB8wkiNYuAHzzckhfbYRxpD
         AycfHs/RliUpFEzOCYVznIJo8SaI0+cZLjTzPQjBxUkkNc/h3HTmOxjTE7dPs48en/bb
         zeKqRtriKZfolJJ0aAihLpVn/p90rgl8+a55Dof4Rc9Ar2ItSE4J88NZ+rQfCPtfifXy
         scXN9kce+kr1PaDF7iEhs3igPwM7NVOAUXQvwkn3WHAapizfNtCJuc2DxB5R9Z52vOIf
         jASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715635481; x=1716240281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PORprU8bkH3+jRmliwhcEJQRxyTm9W/+V5Isa8KUnac=;
        b=sbuU93eH3JhQEUJCnA5l7hCfeWvf6g13D2bYy6UCwVhX3znWKQPFd+lnJQm1NTzwrV
         oOQGfEBKkGZWUuIWlYW5x2/DAVmZKiA4QUIn02cDOv4V45YgASnZSlr8M/ZAlPJL22yX
         JPvvJRCGyvX4ivvCtnPub5vFKnc1SvIOHmSe2OJ9nUf0GeJHxuneqsOLSiEjHQUmSTu0
         kUwmifvbt9YbCbPcst6c9cORqkKFwXTHsKrzOQgpnEi963To9b34z20ivPplzMQR63Yp
         ZTT8ejgMdpAc+5AZKnG6CZNLGGcrINSTw+Y1OrnpRZ9UYV/KM93+PrNusRBMp/WDxQ2q
         BwEw==
X-Forwarded-Encrypted: i=1; AJvYcCXdmdUKmF+OUDgXDCkQMvXHUHuUZupIeewOkXT/JEpRmnVCMP89CZr6I8/8Kk9qkTyR4JR56SFpGujhvHE3hj5rDzE1HVIHKA5cK8cDzNC/N66i57ZSRHSePfgtTMyG0S5pAYWGYeVNCNH6mrs=
X-Gm-Message-State: AOJu0YxFyCWUetlcrUGIeLOYWhyFoWlq/+s/ADZ9OY9K54TWnfwE+car
	tQWEiR10UqAAUrzYmB2ufZrQoP8A0HCgLd5EHWrb4xz4qb3ny7m4
X-Google-Smtp-Source: AGHT+IFcSk7BRVyasEhaoxZsZqp5+AXWeZ/VWSo7j/2PsK8BQznxUYxkd2rhLKusLNTRsDAy7jqngA==
X-Received: by 2002:a05:6a00:2404:b0:6f0:28a4:a6ac with SMTP id d2e1a72fcca58-6f4e02aafb8mr14678110b3a.8.1715635481409;
        Mon, 13 May 2024 14:24:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340c99bce1sm7148361a12.49.2024.05.13.14.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 14:24:41 -0700 (PDT)
Date: Mon, 13 May 2024 14:24:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: zet6223 - remove an unused field in struct
 zet6223_ts
Message-ID: <ZkKFFocEUYUjCfPl@google.com>
References: <3065d885341e2730dd3e7905d75514796a8c25e4.1715507858.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3065d885341e2730dd3e7905d75514796a8c25e4.1715507858.git.christophe.jaillet@wanadoo.fr>

On Sun, May 12, 2024 at 11:58:00AM +0200, Christophe JAILLET wrote:
> In "struct zet6223_ts", the 'vcc' and 'vio' fields are unused.
> 
> So, remove them.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry


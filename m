Return-Path: <linux-input+bounces-1923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD40856291
	for <lists+linux-input@lfdr.de>; Thu, 15 Feb 2024 13:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38C71F2448D
	for <lists+linux-input@lfdr.de>; Thu, 15 Feb 2024 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926BF12C555;
	Thu, 15 Feb 2024 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1RYVylI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77612BF22
	for <linux-input@vger.kernel.org>; Thu, 15 Feb 2024 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707998933; cv=none; b=LL6SW6Vk7ikigHfVgBjKFWT5cTeMGorQ5zBJCzy9bKGASMDJJ7/8Wt7cErtBx6w4Tmx2kDwHiA5kd3OlX54PCj9mzrgBCoutnkcbk/6WXgQR9K87OJCMnkHpDrm5LvH3DKoMlhZOxZ1MlRJihx0vpvo/46L9c0qgl04Oyj3KTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707998933; c=relaxed/simple;
	bh=CMPSk5mRkCdtbGnML4bam7URPGZ7ac2FrMUz1ttH53I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcgzJxwadpZ6g32ZFu9rpzUTdZGk9FtM8ra8LdziO+NzlHCjHddzGQLPnfpPL+ew/X4q7C55YlP2ytqjMfy9Tw40/2iLAqhsOdMotF8rrTZ05Kd6km9PyGkbBpK0h8mJhsqATqBkROM/d+3MINTLQSU8YDmykRtsYwzZFhOmhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1RYVylI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d109e7bed2so10425021fa.2
        for <linux-input@vger.kernel.org>; Thu, 15 Feb 2024 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707998930; x=1708603730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMPSk5mRkCdtbGnML4bam7URPGZ7ac2FrMUz1ttH53I=;
        b=N1RYVylIMSUl1U/MmDlLivwydHncPpdDsZYjU9QkSuJTht50zeZN1guEbVhKLFiNsU
         kxPZw0A/J+f9doGAqpi6tqaXTpU5qTA7zZg1LQhl4Hk1Ziomw1uLAehAubLry36HupOK
         a2ubb5oxF7+oYTmHMNraRoKTxU/5DsAyADUHq00qTUn6LGyR3nQ6y8O1J61QIhQtQTS5
         PHBbtE1DEPymsKTRGWm9eaIbRf0csQQBJqAzLRTnOHsJtSzgbSQeQGLHV4hwmc60nTeH
         d+G23P25e2D6Gr98DFRopYlEVdK9zKyAKQh6zTOvSEej/HjL3PpUeRFWaVCzrtNLfIoW
         /lLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707998930; x=1708603730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMPSk5mRkCdtbGnML4bam7URPGZ7ac2FrMUz1ttH53I=;
        b=uZ69PzC7GrRmzFX28YyJQUglWgmatb4IlpWdFtaqsLPxWySjPI4cTxErMbAwvGACl9
         umtTQtT+rEzeYtLw+FclYTto+VXmiRvBHgJDzLfNGxCh/aL+eB7l0q19N1PqVPOY3ArS
         nwAyj751K9meeQ037I/8589rnVK7O4c8qa3Hc8NpgfNAODDTbqmbYkutQRQowVupuCwc
         5/8WhLClZCbV2we0d7EB0kFWuTqEegTz60mwQOJbF6j+B/JMfFe0vfVSEIxmDMLNInyx
         JwyxngO+tm8ECApsr3+p/J/FFsIxQ5/5ZDS4RGBQCHKHNLUdaEbLIJODXV5qWnLfqiLq
         cFKg==
X-Forwarded-Encrypted: i=1; AJvYcCWjCXk3zsNyPQewkbBJFr3FEg4qRbMgXnCDzx/aryabJ4efI4iUI4mirgH54In1bf/PWeusuyAUMtnq6392JSlAebJ4jw3UgAsl1P4=
X-Gm-Message-State: AOJu0YyljAG64J6OeT+ZVMm1Uv3YORBxC1cEDw+SBzQ/4y0jyogxUM9J
	b5RT7eOYs8yumXuAjzYagotRc2D8T+FRHCUkqmmVroiVPUZDkGZ2lgB3KZVBp/o=
X-Google-Smtp-Source: AGHT+IEk8U8CzLPp2+OgEkY6TQx1yyJAi+cZTYkgA0XB02c4f/pVDHTN6skxieBxdeZZPbKcDe7kKA==
X-Received: by 2002:a05:6512:3685:b0:511:8cd7:e17a with SMTP id d5-20020a056512368500b005118cd7e17amr1067467lfs.36.1707998929916;
        Thu, 15 Feb 2024 04:08:49 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c4fc400b00411d0b58056sm1879272wmq.5.2024.02.15.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:08:49 -0800 (PST)
Date: Thu, 15 Feb 2024 12:08:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 06/10] backlight/pwm-backlight: Remove struct
 backlight_ops.check_fb
Message-ID: <20240215120847.GJ9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212162645.5661-7-tzimmermann@suse.de>

On Mon, Feb 12, 2024 at 05:16:39PM +0100, Thomas Zimmermann wrote:
> The internal check_fb callback from struct pwm_bl_data is never
> implemented. thus the driver's implementation of check_fb always
> returns true, which is the backlight core's default if no
> implementation has been set. So remove the code from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

Yay! Cleaning up platform bus legacy at the same time ;-).

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


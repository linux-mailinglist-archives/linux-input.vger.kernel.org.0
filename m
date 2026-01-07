Return-Path: <linux-input+bounces-16810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B10CFD36A
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 11:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA983119CFC
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967061E515;
	Wed,  7 Jan 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YaphE1YY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B02E7657
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781483; cv=none; b=XDlBNh/p33vPmOE6udVYdNMG9ITh/ZateMH5x/QQsz0p5HTYHwIuhnGOHuuWWZMXiCZrApVDlRX2N5v0HAdPWjuOWy6Nuh+d7F3xRx7bqIwZhT7QJJGd4l7tqPBWBxo6hrhbfTUpL7vMWteuA0iKlzVTPQyL0uRLaCzAOMja8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781483; c=relaxed/simple;
	bh=RU676P3TvU0swoFzAWorS8H0cptCGiCBmBQZLWScomk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwTxijvalopHcERP6Kqz4urQIEypzB+g6aVyF/yT13bu/Za8qTWdvscRWpfENTw+H1yjI6v+cgngbjg6NoxGyCh4ZpFNIQ8/MxsggPZZymWY9Y3t7u30PpSvQa6itAqy1ttTGaUFu4hyMcj6csM0vILqU9gKaZGfBsIRtl8/xMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YaphE1YY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so15854035e9.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767781480; x=1768386280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK2Gg8unTsWO3CwKx4f9Ov3gr2i0DpoldAAWtOWz2w0=;
        b=YaphE1YY0YNYnR30Ev6vb+Db7WqxbNcgWezK6VBjVTnh7+5F+MkC4sr+khDNbwdxQ5
         +gioT+7P3ShwsUG2Takob/CqnzwIK0SS9jwWFZ/zhneBHmc79q2B7DAeL5RklvoxrXbf
         +yWFgminR1DvzSnr7mI1p86lWHKaYUFndgUbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781480; x=1768386280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK2Gg8unTsWO3CwKx4f9Ov3gr2i0DpoldAAWtOWz2w0=;
        b=t0awMzE1kEcGa0H9nSQuGAj5rVrGSFk7sQsLG33mMbyhNIZyfuSiI+U8V8T9FkBDG5
         HHokUl1C4KzDBqdbSJcIc+1WsMdJEna9jJNoY6alcbyA90GPcwqJyUjbveAT1Utg8ctP
         FgDK4/vaLxj89Xw5XRfHod2QZuEWAkLEQxT3MfSm1o5sjMd0Lhj49hLfhl9y8wkTGMMw
         zWKdatjFDISY+lUFxoqM+E2eQ2LcuTOTBxQmMg9nCFTXNFfmcgnORmuyW2OgTJZWmJPT
         pYYcTq4EsE9G+Y7OuAtck8CEyVwYS3Frz0E6r3uvddh1tplpX9gko7efA5nrG8QOYbR2
         HHVg==
X-Forwarded-Encrypted: i=1; AJvYcCXKKFRJqiC7fWn1LJE25MGF9UljrKszDH+21c2AbVOhDnR7PYW5syx1q9QYMqRJyxCZ2wGr2GLMBw9heQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCYcCL8KSNRQlvgiRoHycq3Pe+xCJvKcW/hUUkmwi8I/c16tF
	8WJwR55dYiMQz6YoF7o8WZBcV2uBzW/b517r6nBxqfzD6UMnGic/vQHgM9hl0aWoDA==
X-Gm-Gg: AY/fxX54RJ/o6zT2V042QGmGbakV75xpZj17uVUQqC2nGw/pmuXi0E3h7KVvadk0qmM
	nV9VBkod557nr13u2gH13WzEWq0R+/P1Q5RVuejA90YFA5LhewZ6GIGx8H818I1EQx7KCYcUH2e
	ENL14yFoyKTqmTMqgex3jxiC1mQkWeqqRV8xUSIEhlC3LLZRx21kE0eBBS11nUk48GbBXNs0ZhU
	cXqJM7FyssjizuOB+NbG8BDSA3FL/FzddzWbaNq8lbf36X7GFOaZPOZsPS/3L6FHM1T6N2hIB2F
	ptCv4Q6yoR4M6HKLWQeWPJUJpaSjsu5zszVD2EKqmIUyfl4Qu6e+CB3zAzKMCbAULGyGuRcIXP7
	VnHoCB3Xs3NsW9CCecEoKkz5C3amkPZq0jabPk/FYNJP4wsGVAyPWWRFLMrgDHpfHFpSanF5Lbi
	o6r4/B4mW7IFdzdf8ImZHg1GboFnXz
X-Google-Smtp-Source: AGHT+IELXErZD8ru3w6x43TKd1f8wm86x+ymI62qEzqJdcBMa1KawoY4byUO5aTYAhFJUs8vu9rlqQ==
X-Received: by 2002:a05:600c:19cc:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47d84b21227mr24311245e9.16.1767781480359;
        Wed, 07 Jan 2026 02:24:40 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653c78sm93239545e9.11.2026.01.07.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 02:24:39 -0800 (PST)
Date: Wed, 7 Jan 2026 10:24:37 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aV40ZQRNh11zAtFz@google.com>
References: <20260106112953.692304-1-fabiobaltieri@chromium.org>
 <20260106112953.692304-2-fabiobaltieri@chromium.org>
 <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszTgMeRRi_=Bs6wzdZZGDn9DbmnZEdkbqPOhi0rqDs7DnPQ@mail.gmail.com>

On Tue, Jan 06, 2026 at 09:22:06AM -0700, Simon Glass wrote:
> Hi Fabio,
> 
> On Tue, 6 Jan 2026 at 04:29, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
> >
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> >
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
> >  1 file changed, 158 insertions(+), 16 deletions(-)
> >
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks again!

> 
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index 1c6b0461dc35..74ac1700b104 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -29,6 +29,11 @@
> >
> >  #include <linux/unaligned.h>
> >
> > +/* Maximum size of the normal key matrix, this is limited by the host command
> > + * key_matrix field defined in ec_response_get_next_data_v3
> > + */
> > +#define CROS_EC_KEYBOARD_COLS_MAX 18
> > +
> >  /**
> >   * struct cros_ec_keyb - Structure representing EC keyboard device
> >   *
> > @@ -44,6 +49,11 @@
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> >   * @vdata: vivaldi function row data
> > + * @has_fn_map: whether the driver use an fn function map layer
> 
> How about: driver uses an fn function-map layer

Yeah sounds good, will send a v5 with that comment tweaked.


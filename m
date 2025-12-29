Return-Path: <linux-input+bounces-16732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A8CE6E44
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 14:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B710E3012DD3
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 13:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E572D592D;
	Mon, 29 Dec 2025 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="afkKoYkJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1011713
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767015212; cv=none; b=fBug3Ughm0o3aFa+nX3odzcpT5McrQ9pX2K2nl5QDXXAXGrjD/kUGSq/Ces2y/1F1IzpL0nV2GsiHRiTG42XFWn3aBpMLnl5p3UqrnvYHbxPN6HkDxhQpDGknH153yG+F0Ko90Mc2C0EJMCvj6+3Sb8GqHHmM7OK3ZkITV9N/OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767015212; c=relaxed/simple;
	bh=gpqz5nElaphZZvs4CCE1UfaZsgG+uPqb45FcVwe74RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+DVyZJaG4szGNIdePk8aWxLc2HNoNuwGb0cyEVo2Ps8NQ20alHJJoSGcyCXlYUSTSCi+dPk1TlSZ+emVCxIMTy7gXzFogV+gPcQWKSHW93Yzpx8CLLvmjXIpVQrQ+qAbs40YJDFyQcTyfdZ68lotIiz8AC4C/L/OKS+ewlVNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=afkKoYkJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso56828565e9.1
        for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 05:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767015209; x=1767620009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ce+SSTAL9sTdn9J8kGBQul5VYS4g6m6imR78LaTLra0=;
        b=afkKoYkJz8LgTMthFuJ0WGvjZF2Ik2TBU9Ig6x7BhZ061kNHtSE2tDSKaEUEOgUO28
         YQ4EvqIupuy/HJ3A7+Hw/qnfD2TgIUMe5njD6J9mu81sRLbgptx5LpmzQ5H8HJDJEWog
         E9BRp+cbY/m1bk5amdCi+dyh7pxMLE1474FlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767015209; x=1767620009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce+SSTAL9sTdn9J8kGBQul5VYS4g6m6imR78LaTLra0=;
        b=dWq23YsmedUOnz6WGbMDmT8zaNSsEo8QsV0JRqp72L3IlMSBJrzZjnzR9taRUbqvJr
         btSJTC9PD9Qn107u6aV7ClWCatMi9H5vvi328j47oHJPVbRM0XvC7vGRbUIrxam7+Jvg
         PW8DYlKKpNSDFtmTMxQ2n9CLmpgsGxeGkj5M2XpoJyUxlr6vEv9NkjN2g7LQXwhVVZVJ
         GcjvaThs5i9Oe6U0aH53MCqFepQzvM0+KKZj9qgv4gizib6kaTzysazxN8EOETYlXMSV
         3uOVYBM3EMNhL/v2n/W7gR5LlwTRj8XytDJnxt3hJHIu2m2dfkBoasUe8/KwrTW3UpMC
         zhCg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Xs6xbmgB02s0ova9Pck3U66qCxjm11ab2X0Vk8g9p5Agv11zACDW11C7F+UNC4xqDg1RgOAgJwCemg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNv4SYQBLHiQbJ2KR95OBNhLEo4ERYaZPV5pqxbmEHWzoeeLxN
	zghedEEbIsN8wVeXnRMBtGn9cbESNy7MCaYdImr9mSJga5JjaXG9fMSyBCTV5Mcixw==
X-Gm-Gg: AY/fxX6QboV4YsyJaRDd+ktr/ry7Gxf5DTkYuG1ivgzC+t3WwMZCbbLupGdsOxq65EA
	jcxV5SOfjV1E14zjq/TObiBkkD5TjBONAACMWxQRzEjQtH7YC+Y56bhEYUPJ8YPk8zHph73qZfv
	GygBIqVjLaq0o8KqXW3F4/KDP/EM8COoFD7Qu/Au39WxHmKanBWIJ5SJ9ifdVH97fjZjE72tqta
	KK2jFMivz+B81SzLMaaYNgFdVlxp+rAdEkoo6IMPLLB4t601KH79g9SAvkgrYR+E+RdxOhqLb10
	1UUGpHDDX2s4lggX4E+yGku+7jgMANOsfnNOTg5pZhmD0EBI51vqpWAAb0gEpqsT8AMxYmFbNQr
	FGA0+MJiTIuBdB7mHyUr8805pW8XQ5GBPk20W2yiWyM2/OPfUrJX1hc0jeOy1Z+wlUw+J2Cz5Kz
	AMuLQaqgCdQLDCCpxDzvE9nIOer2Hd
X-Google-Smtp-Source: AGHT+IEUBZibrNmtAx6mvVHkXWievEathjOoZ/y0M7H5kW76AmTFaxiWkAnyB/oLKVKeKbF8HcRCLQ==
X-Received: by 2002:a05:600c:c494:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47d19582aacmr352970715e9.30.1767015209342;
        Mon, 29 Dec 2025 05:33:29 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723b2bsm591030295e9.3.2025.12.29.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:33:28 -0800 (PST)
Date: Mon, 29 Dec 2025 13:33:26 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add
 use-fn-overlay prop
Message-ID: <aVKDJhVuOz-V9tb2@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
 <aU__uxDmeUq20Mg3@google.com>
 <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>

On Mon, Dec 29, 2025 at 01:49:05PM +0100, Krzysztof Kozlowski wrote:
> On 27/12/2025 16:48, Fabio Baltieri wrote:
> > On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> >>> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> index fefaaf46a240..437575cdf352 100644
> >>> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> @@ -44,6 +44,14 @@ properties:
> >>>        where the lower 16 bits are reserved. This property is specified only
> >>>        when the keyboard has a custom design for the top row keys.
> >>>  
> >>> +  google,use-fn-overlay:
> >>> +    description: |
> >>> +      Use a function key overlay. This allows defining an extra set of codes
> >>
> >> What is a function key overlay? Overlays are DT term and therefore are
> >> not suitable for bindings.
> > 
> > Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
> > suggestions really.
> 
> Use as Linux should use? Then it's software, so not suitable for DT.

Sorry I'm not sure how I understand the comment, this describes how the
driver handles a keyboard with Fn keys, the codes are defined in the DT
linux,keymap property and the driver needs to know that there's an extra
layer to interpret the codes correctly.

> >>> +      that are sent if a key is pressed while the KEY_FN is held pressed as
> >>> +      well. The function codes have to be defined in the linux,keymap property
> >>> +      with an offset of keypad,num-rows from the normal ones.
> >>> +    type: boolean
> >>> +
> >>>  dependencies:
> >>>    function-row-physmap: [ 'linux,keymap' ]
> >>>    google,needs-ghost-filter: [ 'linux,keymap' ]
> >>> @@ -132,6 +140,23 @@ examples:
> >>>              /* UP      LEFT    */
> >>>              0x070b0067 0x070c0069>;
> >>>      };
> >>> +  - |
> >>> +    /* With function keys */
> >>> +    #include <dt-bindings/input/input.h>
> >>> +    keyboard-controller {
> >>> +        compatible = "google,cros-ec-keyb";
> >>> +        keypad,num-rows = <8>;
> >>> +        keypad,num-columns = <18>;
> >>> +        google,use-fn-overlay;
> >>
> >> Difference in one property does not justify new example.
> > 
> > Sure but when the property is set then one has to specify the extra
> > codes in the linux,keymap property and this examples shows how. I'll
> > drop it if you want me to but I think there's value in it.
> 
> Examples are for verifying schema and you do not have schema enforcing
> this, thus still pointless. Add schema for that, assuming property will
> stay.

Ok got it, I'll just drop it in v3.


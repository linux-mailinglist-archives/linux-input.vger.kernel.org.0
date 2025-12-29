Return-Path: <linux-input+bounces-16734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4EECE73EB
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 16:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12878300A358
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B839327BFB;
	Mon, 29 Dec 2025 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H73NCP0E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1A27146A
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022774; cv=none; b=PBTdxS6QiuroMO5+FgzZFOuN56awtLqd2FUCr02eNyLnWs0swj+uv4kk2GqHRImJSgL81UQVtRYOZx+y8CRhPTbt7uIHjgz3Y+0hIK0iDMIk8A5lAbQz4YMemdBKaYfBmKvyJGTMQQVaUZUP3Mh77UCjO8UX37henzgFJdIWQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022774; c=relaxed/simple;
	bh=RcDGedmXwSRUgRLTsRrQXPhrzcqVDmty+VallOtpd/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/f/uDmi5pSrVYtNZcx321FGpn2r2tLgxIyXIPBPlGNVfOfDnGa3bjzvsovxXhs+YhhzjtzW8JDgUOMzB8en9YviRNZ0d938hGWIZaqDMqNGntdoun1nkXoLVjA/xRIAzGOqpUZaZmw/ucSC8+rZkQDx9BI2DAu0RFV7fKpCV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H73NCP0E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so58511015e9.3
        for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767022771; x=1767627571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGYWl17fxV3/QSiEObh01QR9aeCd8OVP6SgH7H57To8=;
        b=H73NCP0E4n/FY1Kx285YMugsoVY8U/mFz5cVF0U06c7i85Nw/xDnpx2Vx/16uMVev+
         QvLdBGUg6Aap+ry57wq95W7xVFXS2at+0gXp0QgI7iF8CEq8BJitlxIEMY7ZMaUHiZYj
         hsvFpRWFn5eqKqKgMOWejeQ0tPVSrIHhnvZL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022771; x=1767627571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGYWl17fxV3/QSiEObh01QR9aeCd8OVP6SgH7H57To8=;
        b=OME85LkluUDjD2n2+CrjDIXY6dbYxHLZejBJ147pJPVLNKGZmLrI+cx+lXGQWER6cW
         hr7KZlcxMcAMItlB17W8usKZDb+T1w5aeorTRpRkFcDYj04JqNzxNWwpr6bPQo8/FtMv
         7XyZkxnsmjroL7V47JIna+Ec4+6Ql81l4zUQz0HUz2LL/hNwG/L1q76MxEKH6gWaW+rE
         DbLTGxvLX6AX94tKLh5lrM/w11rf50/+dmTDrZzJrNa1VgooTL03HHWkOmDvt/zgtPYB
         7acXjoE87MJnF3+yI5xNKJWqCM9L0Tmfw6aF2j07eoSfoL9/7JKaxrsEREDiLeF76kjJ
         hK3A==
X-Forwarded-Encrypted: i=1; AJvYcCUKvCS7YxExUdvTpR5jXfzCJtCJ2MX1zGUl2UXWoVJJntCAn+1oWeGDXML8vovwhDUsHRdj8wFDGwvshg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyA3HrnOWDkLzhAy5zEh/2JUiTZqT7m+pb4YLCfuC9Uzp3VcVW
	tCO/4vejgz5+28M1iIoHHdzovXO/4iOjFI2wn+2FiMRgdyGeY5EkSX6kUpidyeGKeg==
X-Gm-Gg: AY/fxX7oQnfc5dbHlfX6VhaB6Wi0ik6Fr1G1lvHei81xSYPND3DRIoYdw4qhM3Enqny
	F9Y8mOi7Jje6KXWgQwdzg5xwzPXbgr5034IlSk2QxaiwuA9gobBhDlsCxqC5/d1SXtkWuHeccdO
	vCQzg1JjtdYbQYHUMFnkzDzZKNQv7Tof+v6RJ+jLyFY3UizuaAlmsS46vej6hR0Fsi3AjqMQrYV
	Qu5UdIYXdXRsjkW6s4ywMuJJKmq6pTwPe/nUSDVwRIfz48n5bKtX+QsjUrzeM8paS8E6/kyMw1e
	Kuo5Pi4USr6XAS66lkRxnJgVqgbmnP1E+GcbkVnLz3InlJmj3mmsEjFftWbY5qKXrh5ZR5N8HQI
	h+mwAdv0JJzr2KCbck83kFEYkwhSGjGLp2/aSXQtxfF5kMd4iiYoSrSbIuJzK5vnHKMTNfN2Nkr
	Rs45luX4TNkjKBo7QUUQ==
X-Google-Smtp-Source: AGHT+IFl14WZKwhPmiisq47nhuqUJz7ve89LSx2Bze9QplnBFGeno8tXs3tel78LX13pZskSo/9nSA==
X-Received: by 2002:a05:600c:4f15:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d19538dfbmr400115935e9.1.1767022770807;
        Mon, 29 Dec 2025 07:39:30 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm29752839f8f.25.2025.12.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:39:30 -0800 (PST)
Date: Mon, 29 Dec 2025 15:39:28 +0000
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
Message-ID: <aVKgsGwb9Rqteekj@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
 <aU__uxDmeUq20Mg3@google.com>
 <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>
 <aVKDJhVuOz-V9tb2@google.com>
 <c539aa2a-e9be-40e7-9b75-1723bdaf0a39@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c539aa2a-e9be-40e7-9b75-1723bdaf0a39@kernel.org>

On Mon, Dec 29, 2025 at 03:59:44PM +0100, Krzysztof Kozlowski wrote:
> On 29/12/2025 14:33, Fabio Baltieri wrote:
> > On Mon, Dec 29, 2025 at 01:49:05PM +0100, Krzysztof Kozlowski wrote:
> >> On 27/12/2025 16:48, Fabio Baltieri wrote:
> >>> On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> >>>>> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> index fefaaf46a240..437575cdf352 100644
> >>>>> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> @@ -44,6 +44,14 @@ properties:
> >>>>>        where the lower 16 bits are reserved. This property is specified only
> >>>>>        when the keyboard has a custom design for the top row keys.
> >>>>>  
> >>>>> +  google,use-fn-overlay:
> >>>>> +    description: |
> >>>>> +      Use a function key overlay. This allows defining an extra set of codes
> >>>>
> >>>> What is a function key overlay? Overlays are DT term and therefore are
> >>>> not suitable for bindings.
> >>>
> >>> Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
> >>> suggestions really.
> >>
> >> Use as Linux should use? Then it's software, so not suitable for DT.
> > 
> > Sorry I'm not sure how I understand the comment, this describes how the
> > driver handles a keyboard with Fn keys, the codes are defined in the DT
> 
> Exactly. The purpose of DT is not to describe how driver should handle
> anything.
> 
> See also DTS101 from this year's ELCE.

Sure so I guess this falls into the "describe the hardware feature"
category, so is the suggestion to rename it to something like
"has-fn-key"? That would be the hardware feature.


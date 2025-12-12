Return-Path: <linux-input+bounces-16544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F154CB7E1A
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 05:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E037F30161F5
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 04:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F6C30DD3A;
	Fri, 12 Dec 2025 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwIXatwS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A9D2D978B
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 04:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514648; cv=none; b=pUgxXv6dEnOnL9fktibQyYX+D4BMTiUlCWS9HYwIRdiuLeSO5vT253lHJjCx18KvPvy367foflR1AKEDG84TJ1ktl3hdK0cF7mxmTgXIxuRa/3sNStbRFcYvMhL5P6c8UwWABduDfxmi43AnT8jwLHfB126mN7qEPLO3LJDQhUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514648; c=relaxed/simple;
	bh=ktZqzCzHfOOPzM2EvOjd8+qE5gzVGh5FQ5OGoF8l4X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idFCxTvPRwUlkvPfJBus8zg7WOoyadFl0ZRqdzCrJCF3r6WlS0eAT7hHxjPJ+nHq+Whms7t+YRPF8QHf92xZYPkcD9ZPXCwf8eeKY7MT9JGDRxOc/DJdgms+qcrKZtf/vSo08iLPRvh8Qh+GyhTlMLOQAVZFF720lfwvI+Ss4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwIXatwS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295548467c7so9735475ad.2
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 20:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765514645; x=1766119445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9gBZpsCmG1xQqso4bAzsbXRPhWxYEn6n/PkIlRaLDM=;
        b=YwIXatwSd1+65UOuVU9F5DzsBKqRbx1pHBZJqdq04NvcIePaR9LESp9ZJIV7t6Wqgn
         2uXSQOS4h2lyMAyhZ30rJV/UhHRuOwbSpWHgStS2apy3/q7CFWznZCfTzBHpPyqMpjXN
         bFDzhcTx02++g0d5wobFsraslNRYn0FWenu30NZME5Y8tdqQl7+QVae3r8UEBdyaiHek
         bz4er1HJ+GXNyufwTgZshThi/HV2mCb2szXyMZjZ6hjVliDAPUxXlUlTbngLvLwCUEyz
         p1ObJQK3uVUv4JLjFsCmtQ3pHf9hpjDw5CEt/pv/2FKaZ6/ak/cEsnIZ+OmljyHmo89Z
         p5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765514645; x=1766119445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9gBZpsCmG1xQqso4bAzsbXRPhWxYEn6n/PkIlRaLDM=;
        b=F82zEFT4rT9qVqjj03SfvT5+otHThWn/hJgPGhWM2quwVu/+ovwPnO95WO4G6+aX5c
         jOf/fNmML/qsgs/ZzLLl2t1TzKMyt7sIMf10IifeL1xmCxy/io08rrHxCkn2ZrWen0Rx
         FuR51NvkB/SC/+LgmhuQzMidsvWA3ccstL/P6c8kM+T2O0+DcABpNBdYEuuVxMwaIn8t
         ZXUFQDD08YiuX+p5PdvWjvb0zGL97fUnMQ1BfNo+ALyTAoQvbG+rjzfwBo/yakNlof+A
         tbMRKDmD0vmpY0mDTcJlTGtNPhECDjViJaKwbpG8juSOHrpCZamVtkgyiTitymoGJ6iM
         foBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY0dPJSuhCm9UOpFfliHYEXjja53LUuCFCYxT2ZRukaVBAJHoqhaCpfTuGrZYaEy9S5kL7MRH/9pGeYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrdDA+e2/0l0POaKNIecsQ0RpNSxDb95rCZ6QcIRT0IMsBdM1f
	TjZoUJWBPZ8OZrKxcblBEe6ec+NkIoVFCLLX9xnKq95gx5wFU2ZHxONy
X-Gm-Gg: AY/fxX7SAvHwLHGlTZqNo1M0np+ES6qRAKb2GrBNudvkJ742X/YLQYX+ThTms97hj/g
	oDGtA4Or5HecAASKDITiekhoYFiZJeWJxi82dXRSNkn3QMy6LCds4+XzPxanjQ56LnqXoAcEY6d
	nouoRXQfbV0k2JJy1f02D+yru2gWNjTzkKfebuzIH14bEjN7O6h+DKf7RFTDPyco5Pomh/K+TCC
	IlMfy632f3Ot3oRnyiRcFmIZFVIAJsDAV2nU7nCFuRpcCdcR5CV/yJ1hboOEeza8gUtBMUzPkTk
	ZLiwOI7hTxmeLcc+W0ZiqEql2tkxGwwR3vDcGrUD+rwbru/v6eOldTJW0+lLxy8Vv68KrN/PuP7
	ZtiUmzRYiZs0mQbpV1H+fl8KkaaeJMvv+SFV65ckGgO2qU7bHtaExl/RbDUJuRQ3RE7saUZYGQb
	Xy1xrydTrepKZSH/TwzHCnXd2M7o4lhq8WKP1O7ucmygj3cXqlRmk=
X-Google-Smtp-Source: AGHT+IEOVfeIqM/cAri6W38bw/FvyPFw68AOKnN78T6Txd6eJUYhJLV+lIMPJu7qekNQBdDcQJN4rQ==
X-Received: by 2002:a05:7022:f50f:b0:119:e569:fbb2 with SMTP id a92af1059eb24-11f354dc81emr355897c88.33.1765514645119;
        Thu, 11 Dec 2025 20:44:05 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:fafd:f9bf:2a4:2a0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm11165691c88.7.2025.12.11.20.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 20:44:04 -0800 (PST)
Date: Thu, 11 Dec 2025 20:44:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTm1PVLrS7Ra0OTF@google.com>

On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> Hey Rob, thanks for the review.
> 
> On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > +  fn-key:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > +      col, code) macro, code is ignored.
> > > +
> > > +  fn-keymap:
> > 
> > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > Depends if we still think linux,keymap is Linux specific?
> 
> I'm open for suggestions, trying to understand the pattern, these are
> specific to this binding I think if anything they should be
> google,fn-key and google,fn-keymap, similarly to the existing
> google,needs-ghost-filter -- no idea why function-row-physmap was not
> prefixed but I guess it slipped in and now it's not worth changing it.

Just double the number of rows in the regular keymap to accommodate the
FN modifier, no need for separate keymap. Also no need to have fn-key
property, use whatever key that reports KEY_FN. See how it is done in
drivers/input/keyboard/tegra-kbc.c

Thanks.

-- 
Dmitry


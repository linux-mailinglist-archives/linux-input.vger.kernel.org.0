Return-Path: <linux-input+bounces-16532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20BCB3B4D
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 19:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 511D93012ECF
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 18:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B1B31D75E;
	Wed, 10 Dec 2025 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JInx26C1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B12857C7
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765389635; cv=none; b=cGpvh6Ht9iQTZUT1A/BSNSypo7Y/qBBUv4AxVzsSXEJwLtnlUe3IHEUnA98e4uU63HNHMaXU+4jVKRX4QBhk+Hf18Nd/HNXcf8I3hsK6eaS5nngQBE8P7i6j08K8S7GrnOx1nF6JamdfEzTqPpVBvlJ5Iy7w3/mXChPnpJ4Taxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765389635; c=relaxed/simple;
	bh=a+WgLV8Me8he8vsaz9WjfiuVCZvCj6zKFhsOIiTYBLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmgW+bq1+JqLFBj31q8xz88a08bGkgRMWJhHbglXrjyCKyTaLy4QSWfrQa4YCD45NcPIg4agYVAqrG9j63HB15OZ8RuatJmVQGoEK5HOAHmwJAQpImEz5/UVoJj0UQ3QbrksEZzJcZtxI3RJ46Bi69GmGx+tozvZ4FbGM1sGeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JInx26C1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fa4737049so7729f8f.3
        for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 10:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765389632; x=1765994432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNo6uQ8AO0yOaAEJTUC3/zvI8C5HZVj+hKvmdCETuYM=;
        b=JInx26C1T9J4bIK8XSvC0fuP1epZ1mBZq02rYH0f/BaN3cbM6qusuYxq4pKQ3dllxp
         xQsWKTr4XHbPLFgWXWcTOptPq26oOiG1D69YNKH3V/I3A30ohO5ByoJaLTAuPQtqKJnW
         X+prjUObi70W7zv4fMdlW04mPK63PaT0bgeJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389632; x=1765994432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNo6uQ8AO0yOaAEJTUC3/zvI8C5HZVj+hKvmdCETuYM=;
        b=ncXQodE4+nCB7FS9vN+y3KIYg1MMMrBTjWkOV0JDrqW32Ry0pUR5xZvPOggvVWC1Im
         GNSfSEr/zJsCC5O2G7t/t46qWa4bkY/33jAGzMfj8qauuIa3aZrSpZ3eRUDILR/C11xm
         3dUQhdHoMZmBg6BQ2TRAF+b/BZ0BB1ZNmZfCyKxNz8WIOJ9Oamcy9C+TDqHmOhDcXSrZ
         V0VnH5+F8Ln7B0owDfsAgv1mLN+ktVn0qnyyMeXX46KVSEPIkjnsIiP7Jt0fhu97Kqhc
         XAaJYYClsTu5nrnJgj8lfOTgJUWWu/0CtOrbCNiiWdtnoGolTBHjUqF5+ynztTosRtX2
         G08g==
X-Forwarded-Encrypted: i=1; AJvYcCUkecYIee2npWLapkHrCBvL8nn/Zz3Z1EWWbhd3r9A4LwLfPBfyC5Cu2Op7Jm/BtS9u8q0mgtLLG8Oj3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSLEajMi4rl1ImL/G+daaqbEh1mbJ/xMjo/Alef9u4wliQpwM
	5Hof/PrlZy5rXh43Q80yyXs2JqVNeYtfXQeuBhYNGR1M4R0VCiOzgiGEcGHessr9ug==
X-Gm-Gg: AY/fxX6cVfcXqJbHC8oyjKqhvNS5c8k3eQ5IpKqksQd/vqZG+lUTN6iNj16aUM8NQBF
	YJNgUs6LuChg8a74L3ixC8SaVMX3cT54t3+I20vhurDOYqueardmhEBcFFtUgrRl1MlZxIFGTUj
	AgmvwPurBPRvF2zN+ohQesM+poBNMpXLRQ7YfEHZUgGobdhn+Cl9W361KWBU57Nex+5v/NQEa6J
	Gljqb2zrV4PS2O6+6Xl+4WRQ0qB5XmUMASGAQz7mc8GSrST/aAWe/dMdBQL0kqGt3rZR0w9MF3b
	9U1kqFzr7G63jeMr3Kf1G4o6H1jAPwwzKQE+XDJegA+j7UHAJ+oVelCulGEugMJKGqmABOAeJbE
	jWrRRZDM5R3K8x5y9S+EguDk7B85AE9o9xkiKAdeEddWnlxFjWzi9Kk+UBDF5YacZk92gY8fPrN
	POPwSh57+7qKg8tDDeCQ==
X-Google-Smtp-Source: AGHT+IGPESWqtdwT/XRTR5/RmcuAb3YXC3b7FMypahW+beW9pJZ9LM1+rqVviz4PyBnlnycCgdJNOQ==
X-Received: by 2002:a05:6000:608:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42fa3b079c1mr3929886f8f.53.1765389632184;
        Wed, 10 Dec 2025 10:00:32 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8601csm291118f8f.22.2025.12.10.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:00:31 -0800 (PST)
Date: Wed, 10 Dec 2025 18:00:29 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aTm1PVLrS7Ra0OTF@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209192243.GA963693-robh@kernel.org>

Hey Rob, thanks for the review.

On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > +  fn-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > +      col, code) macro, code is ignored.
> > +
> > +  fn-keymap:
> 
> If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> Depends if we still think linux,keymap is Linux specific?

I'm open for suggestions, trying to understand the pattern, these are
specific to this binding I think if anything they should be
google,fn-key and google,fn-keymap, similarly to the existing
google,needs-ghost-filter -- no idea why function-row-physmap was not
prefixed but I guess it slipped in and now it's not worth changing it.

Would it make sense?

Thanks,
Fabio

-- 
Fabio Baltieri


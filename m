Return-Path: <linux-input+bounces-4090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92D8FBC33
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 21:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1731C22151
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 19:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D360D14AD2E;
	Tue,  4 Jun 2024 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3RGWuRG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F614AD2B;
	Tue,  4 Jun 2024 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528152; cv=none; b=EKcaRnhwzzRlpkQuMP5JD7BcaftFcZkHyRsaPOWe4WF6epb3nOh0WK3pmdB493LOPheaPQIK+0Hdf5VoDG7UICXQMhqSNj0KTvBAZ2lPR2UmoTilWYANNKaSHxS8DAI/WKVEbd/38pBwl9okRvmc0rc+RYI4J/+N4BZDNc/7Fuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528152; c=relaxed/simple;
	bh=5O2hvcEPB+WifLBOM64rjrb5IN0YGFwc6fcMkZJFpNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWgZVO123EIsR4z9tgKbwCWotDFdtn9rZ1iI5SEzBh9VuN2+y+FPB/DgV592CcEBFDjgWEuamvZ9vLCCKt7jNVoyQxxliQz4Cc2NHnmW45IxevmNgas9s/gkoUh0Jew5qvjcjONu6x/ofO2+7aqNkPX0ikN3Pza4igo6fBvERtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3RGWuRG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f480624d04so48125305ad.2;
        Tue, 04 Jun 2024 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717528151; x=1718132951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBlKoYwvZRYVCTZgzTwhw1nqnwRx3L1d/Hdiocgdp9c=;
        b=Q3RGWuRGlPYpLhn1XHa2uWN8wu8Jr/RG0zgXtvGvP34q1rqBrBXgc55bHzHKrs1+rw
         dCfa+ISH972d6GNNY+N4QU8N1gyJ8YuWi65XneX3xc06OdJ79PmIOoCIx4a7v89Ia5m+
         Bo5XxnUq9olJU3wI3g6Sfq/8RQOOuqu4hfOtdo+Ygaxz6oyjldd0X26xmF6m9LBRBti3
         qs9h4s+QOymIRdrazhZNk04j9PxcJwZ43vfo7I+UDKJAgc2lyCVT72MtAOXIj2Lbx/hi
         OLjPyjiaksqrY2bUzLrTEmdsu8HHP9L+MWGwg+d5IXmspcHihPDokL9nK1N9vDYjsrXM
         uvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528151; x=1718132951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBlKoYwvZRYVCTZgzTwhw1nqnwRx3L1d/Hdiocgdp9c=;
        b=WWZMqJUUxl/zRSOz662erHoFYpfwVzyiqnszGIUcnfl9wEa+IGo/doMAXAF3ikii9J
         PNG+gVMLPJywTV9agOfx861pVvZ4dGPdcFsc7k9OG9BRSV+BP1Q0Jc0ZAFiNyJ+YBiNd
         9JmsypiRWY+b6zuwBthuDIz63g1S0jo0UJ868fxbcSeIrHv1F7cmIs3GZICUmoTtpdxQ
         MHgbC6FazEhRpesmAOSh6nzapwlHNOo5D1LSzknd0vYGQC7CnzU5xutweEK2JqxcSE/s
         mmYGZnYwtehrgNcN/QzQfix4Tv8uHebuxxhkoSe/QSUrCNZbWK3jxxoDF22AqSc9SGMd
         3qVw==
X-Forwarded-Encrypted: i=1; AJvYcCV7CtPt2+H2sj9Mt/JpC5V4771bNoAifZ9ZJBv747e75dmHZQaMxtITC4AjJ+Uy31eW0pJ9Ks48mQdYKmjbaU4e6kFp2gywqC40TscOqc1gTJzShmkSWRNlUjTPrm9lwo0tKmkvzGpUKA8huSh076eU/RSIHJ/fjkk3Qxd5b+rFy9mze9Tx
X-Gm-Message-State: AOJu0YwUUYzYje15mSHohTtPnsamLuTe6L3L134tVcQnv5cI85DMcRM0
	auipNnXPKSZTnK48oIcA7pBWDuTC/m3WPSUZmon2gkX1CD4ctVnv
X-Google-Smtp-Source: AGHT+IF2CgvPQeC3wsa6Wxy+YuRpwdo5sw8trQD/dcdJCI61OHiJLZHSBEaHAviXAx9+GkCKCcbzOQ==
X-Received: by 2002:a17:902:f547:b0:1f6:700e:a2ca with SMTP id d9443c01a7336-1f6a5a28eb1mr5424485ad.39.1717528150639;
        Tue, 04 Jun 2024 12:09:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1327:f82:3fa9:728f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dd6bsm87130275ad.54.2024.06.04.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 12:09:10 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:09:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: cros-ec-keyboard: Add keyboard matrix v3.0
Message-ID: <Zl9mUxT2XXKHdb_e@google.com>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
 <20240604170935.2518856-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604170935.2518856-1-dnojiri@chromium.org>

Hi Daisuke,

On Tue, Jun 04, 2024 at 10:09:33AM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0. To enable it, define
> CONFIG_CROS_KBD_V30.

I might be wrong but it looks to me if one enables support for v3 keymap
then the kernel will not work for devices using other/older versions of
keymap. It might be acceptable for Chrome OS kernels but will nto work
for upstream.

I think you need to create arch/arm/boot/dts/cros-ec-keyboard-v3.dtsi
that would define "keyboard_controller" node with proper keymap and
include this new dtsi into std files for devices/boards that need it.

Thanks.

-- 
Dmitry


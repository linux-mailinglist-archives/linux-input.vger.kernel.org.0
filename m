Return-Path: <linux-input+bounces-4910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E392AC77
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 01:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84EDF28262C
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 23:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0BA150986;
	Mon,  8 Jul 2024 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8HGjmem"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C7A33993;
	Mon,  8 Jul 2024 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720480597; cv=none; b=gRqPXq7e7411ByAZNJSkm84H73At1S2Y+MdFqf6yMPHq1ZtHLG1By7WGu/SIleOv9iFNjGCMmeugPrCQkqCHJLc02GgXr97ciLT4lc2yfiwpJfiDIk9VNvGs4WfCd7d3XTlffvTyuSeauU+xSwB73KhB+PY6+pxk+8IjHj+xVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720480597; c=relaxed/simple;
	bh=gb+VQ2HoccIXWeorLO412/GRKILgSGbTiJfCRgTzwdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCrDA0LUnQ95H43EhAYSmKLDIjWoro0YsPaInMy3k6suFM7TAZ6CyExf2BMkfA0DY2/ley67n8721uQhAN9yRbhUXefM402iuQ4Lns524z90KOeZ6+oSpzgFhWBgdeGHbdC36TQ6gDHzamw2DauBeg3jXWV5lrxiyIou0NeEmas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8HGjmem; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso3469795b3a.0;
        Mon, 08 Jul 2024 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720480595; x=1721085395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkfi0ZGGhlPm8YGtRJaPnrGiZgaJQOgvXosi1T3YYr4=;
        b=W8HGjmemvPcexjhUgNVAcgIn2TSxjJ6Z09z+PwH09CJobcsQx0SUVoBVR3jRfryryl
         Ae6iMTTSWry59KZglKTC4hvW83tZy5OSotpS/wPx2quHTQza3vDZFMyNmL3b6nS3fAwS
         5utTqGz0JEvqR/zshjk2/9v7lcIZys7SOMz1NsUE7deJV3sgOxilT/qhDe6g/fYArFuy
         6jwyjsV5v3ONIrHxZO/Wc9ucZp1Mlg1wzYXUwNNdyK7F1DrJKDP8UZhOXyII6Fc0S1Eu
         U34JeZ17FdHBBOsmezFun0oQVF0Q57XWSUMgTfR//2GTfMIgs4zCOq+PCJF/mFytiv7Y
         untA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720480595; x=1721085395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkfi0ZGGhlPm8YGtRJaPnrGiZgaJQOgvXosi1T3YYr4=;
        b=qaKur2zKB8NwzU3O0f/SsQTWzXzdmUboNGgYUHQ8Q4AV3GGtkSMkYSQ+u4UKqoNeTS
         4ExmJ1tUU1pxue5oKdWlLRxP7/ht4ekf/jQlt3OaDt/oaHDgSflBrwwRfPnMD+qXbana
         FiZWAkvqCNtShu7zTyonPcQVVsI+q8yLJrIDQlW/+b/x2GjedBctuOu90dTOLGX+qUNs
         eBz1ZTofKybAr9iBDVro9BbMvB1DcEsChpj3oKRattR0ZUSMchx9jt29my+7OwQOLY5j
         r46OlOsxDJrsKQQN3gXr4cIeTDFcA6Ap12JBeOpWSiziJ05rNjQtb8g3TDJTdiOiKi1o
         QItw==
X-Forwarded-Encrypted: i=1; AJvYcCUQyzvCjXj/NC0ktlg+fwhlmqFoCx8ZP+w0VIkATjn3Iz16oZgpgj2CZyXOSo5VmrggkC5gRgixJF2Is0U1LPfWMRDaY9xMUtd37j+s2aphPNJjZC1veH9g8II+k/F56SpXx+TMAK29Z0zhbnpztvnEET3cDAsvj/Py2Gb3/thcxpN95wYB
X-Gm-Message-State: AOJu0Yxm6P+Q/Jt7p56SlAm2cNyDGye+0WLW+v2tS9hVcrlEFZ7Cpg01
	EUdvwVC28ZtDDH0Cnxa9m28O+J1aHUE8W6sIAIZufne68eRalQKr
X-Google-Smtp-Source: AGHT+IH4W6+RW0xbdWaMvpNmma1j9y72EY/kqBGuYjqium8CtuJgbRdQUmyWnJIuNBeT57qMg7y3ew==
X-Received: by 2002:a05:6a21:7895:b0:1be:e6d8:756e with SMTP id adf61e73a8af0-1c2984d7aaemr1193623637.53.1720480595263;
        Mon, 08 Jul 2024 16:16:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:922a:af36:b3d9:2eac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438bfa86sm432650b3a.47.2024.07.08.16.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 16:16:34 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:16:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Felix Kaechele <felix@kaechele.ca>
Cc: Job Noorman <job@noorman.info>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] himax_hx83112b: add support for HX83100A
Message-ID: <ZoxzUHsGcgYrRXjT@google.com>
References: <20240620145019.156187-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620145019.156187-1-felix@kaechele.ca>

On Thu, Jun 20, 2024 at 10:50:01AM -0400, Felix Kaechele wrote:
> Original discussion around v2 here: https://lore.kernel.org/all/20240511121245.109644-1-felix@kaechele.ca/
> 
> Changes from v2:
> - reworded dt-bindings commit message to specifiy how the HX83100A is different
>   from other chips in this series to justify having its own compatible string
> - added Acked-By from Conor that was given in the v2 thread to commit message
> 
> I've done some more testing in the meantime and haven't found any issues.
> I haven't heard back from anyone with an HX83112B, but the HX83100A works as
> intended with these changes and I assume the HX83112B will too.

Applied the lot, thank you.

-- 
Dmitry


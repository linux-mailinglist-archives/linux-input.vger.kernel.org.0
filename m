Return-Path: <linux-input+bounces-8610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F99F379D
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5D0188B530
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA84205AA1;
	Mon, 16 Dec 2024 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu7UHzKY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135E1F706A;
	Mon, 16 Dec 2024 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734370425; cv=none; b=h6gltjxi6MOd2kU2/4oa24uWI9Gd4/fdLBGezHLW6/J0Frz+MBBmnOkXdpVfbb2kYENrA7sNqCDLGVC78lNeQW2PTikSWBiqm/GBo/tV1dMXxKd4EKpSf25frynD20/UpaYkkm2stIY8ff3VCuoHynBg8dBwVjL2XDalZqU5kmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734370425; c=relaxed/simple;
	bh=5nhlOZy3lpOaseMweibm1bkV9MB8V+65DRxW8Lk3JPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtKnDrnzgR1msSE1yoXK3bACTIZEd9ZE9nuSckOjAhkmM5+2GOdGK0VHIDGL92sjBwv4x1gygeKzoENJPEFsusxN7SzhmTwdQbEbvt+MHkZA8ZiZcLNuQcUQt/qI9R6gw15d8NKEvtfe9R6e9AaaoXNym0COQNSw3CRh2LVXyDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu7UHzKY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21680814d42so36698535ad.2;
        Mon, 16 Dec 2024 09:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734370423; x=1734975223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxKLcU/LD2SdG2mxNI33A/94mTmys59MycDtX0HPxbU=;
        b=Vu7UHzKYR84r4b8hkJqjwjtbvyU7xdPCt1sPV6M0SD+LjWmAT4YPwna2CzUk/aBkRX
         VOxnk1AuIz92SBoV6KTYz7zcJRVeSrap/fAo5TWb4ylEgX40rsN7KNAdiaZ+BuGMyXWa
         bXGY1WbS2kpH0y9eqDJaiXL9pjXzv1PwwOVP6LC2PoNx8luOT5W/fw7/Lc6aMACIG2Kr
         nblRjzlRRc8AbpZo0fNngA92N20BdWJ34iejEEhw7WD7ujDERqZwKwE5DMRquGvFJkJw
         URLQ+QNSjuo79jjrgeUiFp00dcvUIP3/OqSQWCaWQOu4/mKFYIkTyeaMiPzZzp8uorx2
         MHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734370423; x=1734975223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxKLcU/LD2SdG2mxNI33A/94mTmys59MycDtX0HPxbU=;
        b=oFlQSw5f+V/fQ0b1smBSq/txF16fMZVXsOI5viA2SqhoJp9hQtpT6Z/SzwJIaQ8cZK
         7FgHsRxLvI1cdG3Np8wZ4wXmpD3DCx59r/DgrmRWxfg+LFXTsQyIVrKMR7jbQCmVAkNX
         Qs075dSl7FV4UAeqMfSaBHJucxD+KxxCUvE6lRja9jsNKiZUvXblwRiu51UfXEGQHFj2
         cUwsw43tu84yde42sth9AApjlPpHj20xsWO4lL/gDQKjyiryx2cSuatcq02I9w3OP6QB
         /CI50IUF46RYGWWq9HLHPQyRz70WGi6lyHjs+AdkK8M6t/7jwDAABH4fRtgUfs31s2Ec
         rM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVniVOYe2ALG2Z7pUnGdvBWJ8Js/k6UGdrvtgIxhf+ODFVC/UvaLMsMfWeILW1X71mfdpKq4QdkX6Uoyjv@vger.kernel.org, AJvYcCXLeynE05SoiYVlcLdWHvSHoELs5otbxK9bVaRqvy+AJ+2Z+z0VBanNaV2H2I5b/SFMt51hEqOYcPQrKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+jRIlq++UnNdqj8QunhHbrgCYl8APDFEy4ig3b0r6YRwdIhTY
	ir+wS+M5bFjri5q1z12unDQh/E4WLbA4eeYCTTrZgsl04vfx02L1
X-Gm-Gg: ASbGncsZppdAKr/5fvkw81acXi+Wq1ccYgErKcSlnegxs4+SWjeocpPewxkF9UAH/H7
	aGiPkjnb3ZALIcHwi7pjCiRnbuzw3bAwFZBJyGB4afdY89p0+eXuZAsJeCRJdMaM4hUerQ3cab0
	sR4Cang+TJBDijDONfGN2Kwx7Z+NNJYBcZ21bXk67OToiRaF0xW8JOBj4CgLhWDbvBKeFjXX5Fo
	uTp/lzyUHliASl8v067BK2uSxQ/6bQJGzUE6FS25hNxcrcRXcg5M9AZLQ==
X-Google-Smtp-Source: AGHT+IFaYrAVmYCOFdakygDA9jdmEXTRYiJZM1mb5n08I1f9Di1y+QCuZEJiZNToXIZhMoAmQHAIAw==
X-Received: by 2002:a17:902:e545:b0:216:7ee9:2212 with SMTP id d9443c01a7336-218929ca98cmr189049765ad.23.1734370423474;
        Mon, 16 Dec 2024 09:33:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e6c1:cee8:7b58:a395])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db63a6sm45327005ad.37.2024.12.16.09.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:33:43 -0800 (PST)
Date: Mon, 16 Dec 2024 09:33:40 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank.Li@nxp.com, ping.bai@nxp.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH V4] Input: bbnsm_pwrkey - add remove hook
Message-ID: <Z2BkdFHZnj-pDOoN@google.com>
References: <20241212030322.3110017-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212030322.3110017-1-peng.fan@oss.nxp.com>

On Thu, Dec 12, 2024 at 11:03:22AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V4:
>  Fix build warning
> 
> V3:
>  I tried to dev_pm_clear_wake_irq in common code, but Greg rejected:
>  https://lore.kernel.org/all/2024111213-eradicate-puma-3592@gregkh/
>  So post v3 with input_unregister_device dropped

Greg did not reject the patch, he asked for a better justification.
Please answer his questions (we clear a lot of resources in remove() to
reduce boilerplate in the drivers), in the meantime I will apply this
patch to fix the pressing issue.

Thanks.

-- 
Dmitry


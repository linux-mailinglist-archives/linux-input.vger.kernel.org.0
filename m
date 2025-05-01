Return-Path: <linux-input+bounces-12092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D5AA5A47
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 06:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE2B07B7CCE
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 04:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9256C1EF0B0;
	Thu,  1 May 2025 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRjzVZC3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7322541F;
	Thu,  1 May 2025 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746073390; cv=none; b=TCVkJCZjQCL2Ylxqj9QUtj+DSSosUUiAWK+UkJN85EQ93y3ZiPeLMwv9e2qMMx7WgBKluXP3lwjkq6NBivrSx7sQxq9zzYtNgi/J8yQcirMCZRMJZC9Pb3mRXyVgenKT6cEO5kIFfr8kdkPEmHdqN2iyuREj1cmly3fFMUXQv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746073390; c=relaxed/simple;
	bh=rWzjgVEuyGHkGE033EzJp7s4hafpsCW3nF3tFps8nTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovdQCMA2e/h7YG+3K+Ch5FPbrmuTnv5Sq/fjWEaQczrfUkhddDzqZb224RotaTTx9Okk10wtQI/4gTwheVd4ltemV0R7LgvBkZt8jzAnBfFKRDt5maHnARU8n0+TPzINmfhlmlkCDCkPzVg5S/glDx8JpYt0+WetX0TLk/5soL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRjzVZC3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so6014985ad.1;
        Wed, 30 Apr 2025 21:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746073388; x=1746678188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqLAUJZtyX+jJiSNCAAuy/58V+wF4ZqMOguGaDhSIyY=;
        b=VRjzVZC39GjNd5q9Wl94qodUDH1TEDzTHIS/L2D8sDmJtK1b0YKIuXp+zy5JAFQio6
         P9TKpoMcEu4FQV73bo4K30E5mhD1D/+gsPzIaB0vNAfL2jeeH/mnm3ez1dfcab2VlOL6
         0QPC4Pr3xlPkO79KUCgiL1ZM/vWDXg/uIGp1i9NgmHcaBg5lY2PIsrPVReq+8+uRo4bL
         ZbIMipIwrYjD5d0DBwMdth8OEY4Y1QOsfha/dWx8e2FLInjtRri57KfqiILx2DGwXpFV
         g/2QK8GGyMppBnIJAtVvkeASF2d6mYROZty/7DtPYuW5WqAupoghxMIz0aYy7eAb013r
         DjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746073388; x=1746678188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqLAUJZtyX+jJiSNCAAuy/58V+wF4ZqMOguGaDhSIyY=;
        b=eiVUBR/6tcHUzb9L9SBFpcBTdrXwBAi8hzWDVHdwS98W7f6heGpKxvolPyUuyBM/CW
         HrrGtF56t2IUpP4/6Ro3wM4njCV0wXm48W9iLeWwEpnCd/EiaEvYoTF0EjVVlzyaE95o
         6rwVD+0ta0yzvpvpsJoWuVAxpX2ZVsslgYIBJ5El/Uk5j3YDkaS1S/+S/B3Xd75z/2PT
         WbHaCz/UmrfQ+nfiu0BktGs8KqbCNM/XUNb/e7YBg2CrCE6omNxf32IZo8PIBv5uIHys
         sD0wroX5ztCjjYzIfE8fOQbJ8EuL/X/995eQlZYhLDbqm3D3WN6EiVH/TzlbxouTSLNp
         zARA==
X-Forwarded-Encrypted: i=1; AJvYcCVR0lZnUHwvtKo7NBOki37+4GMT681/1viSbzFccMRDBTFb/jGDW2cu6X9r+ArTb3ZOpyF9zeB8aShc@vger.kernel.org, AJvYcCX3K5otIeHr+GZPswrqqR7FYTmrYBLXpaYU7/NH+f0ywNKl6ltGKrGaFs79bEzE5UfGKVnPVxA/kYKxJEY=@vger.kernel.org, AJvYcCXtmQGzyp6cddWW9QYRm/6N3gJZBsqtmOKjPxf/8pn4ZvLr7rRZHxaRh4d7N2878hdzxnXOnE+q5e6R+Kcn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7We8vCTOX6nGXAaZ+RkTFevI3SvLbBuvjaaJtnN1SN6bF8oU
	xdnuRY74N0nGuruE5ZJzigRIpaTzyTue5AtkYxWHttAr1Nb225Wp
X-Gm-Gg: ASbGncuvg1INqC5XCUwETzlUdcfzXe1BXae0tgNCANBWHxlzQuT7x2+DW6EpikPYln+
	SPJbBznTK5JXjSETBP+A4mMaQ9lca8UQAXh6a+cXMN7BP8R80Scvk76UE1/88VWi4Fyo1NeBh4y
	pNbmxH2Zljbr0niNIaWOumFLCd2Of/9mq68pmCy3qLCZvkMlFdcIhWh/uVu+E2eleiNkNv8v/EG
	S1ikHw15GRo7zCQA3E4vXJOL94OfMSBUhsR3UCLEB6CjY4yUdRt63x0O3M2miwRMDtomdU4Gd1B
	IUd6TMh4NSjhohCSTXRoKBn6iX3Pn21Tj1FQO40Rlg==
X-Google-Smtp-Source: AGHT+IHtGfnLfkHmfknSPWfZLj2cCh3PuK4QKc4uhZspTTRfFeT++PxKg+DoA1uD1JSOGgFWcVzVvA==
X-Received: by 2002:a17:903:41ce:b0:224:1935:fb7e with SMTP id d9443c01a7336-22e0842bd83mr17812325ad.24.1746073388308;
        Wed, 30 Apr 2025 21:23:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bda7:836a:d9fa:ac5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcb88sm130961695ad.64.2025.04.30.21.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 21:23:07 -0700 (PDT)
Date: Wed, 30 Apr 2025 21:23:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: snvs_pwrkey - support power-off-time-sec
Message-ID: <zwapgp7uerwvbb45nzkeaitzldcwzq4znbmqmlblckpzm5qc4u@3rnqwadsbjki>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
 <20250315093455.1100-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315093455.1100-3-ian.ray@gehealthcare.com>

On Sat, Mar 15, 2025 at 11:34:55AM +0200, Ian Ray wrote:
> The power-off time is configured in LPCR[17:16] BTN_PRESS_TIME:
> 
>  * b00:  5 seconds (SoC default)
>  * b01: 10 seconds
>  * b10: 15 seconds
>  * b11: PMIC is not disabled
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied with formatting changes, thank you.

-- 
Dmitry


Return-Path: <linux-input+bounces-13376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB6AF874F
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 07:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C26567D51
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 05:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782EF1A2545;
	Fri,  4 Jul 2025 05:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0HMhF3L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF141F4C8E;
	Fri,  4 Jul 2025 05:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607193; cv=none; b=DDdWUhnOH8tV8MNSoitKWZvIxq3ySyT63StSgKaoqYYeFw/Woat5FPX85lQc13mxd2RaxqzXe2lenTO80c1/uf/Fvw/18cLIG3m0JZQ53DPE8+WKg4n7dSCH8o+RGWVf6XrCmSwOLSh999OhcHuX4PANl4MX+3LkbwPX4ppsxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607193; c=relaxed/simple;
	bh=0O0Jyu0BDk1FKc0g99/EdYNFTiby1PgO4mCRC3uoNHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ7/fjtPAAepHWvYLH21RG3FMI2WSS7OumqtZ293ZPm2H7ULDLsg5QI+C7ii2hCixOvp1FcSTvPsLlBOD6+RdymaG52vS504KzMsJb1wJBJPsve7f7sPLiqzibXbGoM1y2tSt39zhrJMzSfy9l1HwVDewuEw2PfB6r/OYCefwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0HMhF3L; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so825635a12.0;
        Thu, 03 Jul 2025 22:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607190; x=1752211990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejt8F/jG6bpSz1vmmfKxJnYrV0UQOG6l/egw1qFjuDs=;
        b=I0HMhF3L8kunr5mTu3k1sI2HN778L2uuKM2BXbZwIoG59aQJSGHGGIBLS5m0gTd/8l
         AStRiFuJAN1etEs2+sTspNzb8fDXq35KT7kLLApDErfZQiBTDICHjt6/QSWrbuieQ1S/
         P+FoLpI5KgozKdtZ24sqaXegCRDAkNE6yokSv83KOSqJbdvs6X97DRbctKVqZb1UA+YC
         sYLVnxR8oj+yPvVgi/y+F5iagyok/apKc14Ce3+h2jzby/0e+tEW0qOk03REMhOkJi7m
         0hFwr5rGcoYKLZPAPFF+MiMvEo+9BEyN7csm/ngAr81Tshgo0Z5wXybfDvByKt5Ukm0Z
         i3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607190; x=1752211990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejt8F/jG6bpSz1vmmfKxJnYrV0UQOG6l/egw1qFjuDs=;
        b=rWfPGo81RM5zUERGyDWH9gFhDqCxqpj/9VRcI0KkcdrTFd4kqq4KMDhZjNxa+oGj54
         6zIQGS2zWxinNdD1HhLUmyWK9GvYF7tOIF5NnF/Kvb5JalUt/6mQAI9fhfAvjMKIduOX
         ucGSDyRcaipMUTutK7nC6XNHPYtwTgUrrrPNndccyBX9dbn7fAFyr9t0CMjJNCcLu0mH
         Tlpuaw/jLhqf6P8L7DK4SC104g6FIbchfF2KY0WAq2Wgbi/cSMZ6KclX1hAMTFpwhCAK
         KLOM4IOnMGkrYcbKmlwUXcBEPyCQsTDthXwh+9NqiQz5qq6AXC9OwGFOnRh3rPzfCy2K
         ur8A==
X-Forwarded-Encrypted: i=1; AJvYcCVHe+sFgWZ9oPGqIm+rcvWQ4lVjEFxFi7Q/WKywndjavTOv4HWgRgdZP69q5lslBlNm1hf7fgFS/TWp@vger.kernel.org, AJvYcCXbIeYRzrRUQ7al9BCJc6Hykn0AADtU5SAo0zLz4p8srSRxRLhnKPN5/uZS4xtJ5EYpmZkrqEO95XyXlXI=@vger.kernel.org, AJvYcCXuoO67yFdw5UMRBgF0T/oAQ+wIX/SccwRwdVxbCtq78if8CZAmjDzdKY5Wf0Uk3NR/4cmJFlMg6iBIzeX0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4oBlDY1eMfNxE6XR+u57uIS6xWrE4zLDHa5N+8tKIFdjehgD
	Ys+3Xk/S/KCnI7A4pG/YQfO5HXWU5KY2TNRXP2MDhbROrJLFOVlX0aAt18KA+A==
X-Gm-Gg: ASbGncvF5fVdg0F+N6Esq5/SSi6jf7M+KMDV2VEg6tjOWOTR+WBnOiTE7pOCeAfmedu
	BtvGzqiyWTPpzDeeEwQd24u6Xj7F6emz8hRIWEhmg+NS2MSK+33aLr9BluBBwILvQOkN2w1JwXV
	v8reyW/vY+PvAADPd6HZuncqoAQ/ThjosShnTg6I+0/3rnyyLjBM+FnjR8x4C9py5yJDulm/Hcl
	VWD74Ct5cV+fcSl/hMjTAL9qkbM4QusUkAJ6FqGpWMle+J4czboqWryB205FCfxNCAfqd62gb37
	R0MesVjT4KT8vNFjUXHOmBcQjnfXbg8CssBHAT7n+hNgmlwozzssQt481YetX/w9/yg19dR8LQ=
	=
X-Google-Smtp-Source: AGHT+IHIo3bt8SUUJoWUFyFWNKZw20xUxwX84UI64gCV5521klw5BbnY34brDo8xiSeCwodsN3rq1w==
X-Received: by 2002:a17:903:19cc:b0:234:f580:9ed with SMTP id d9443c01a7336-23c85e18d97mr26485625ad.21.1751607190144;
        Thu, 03 Jul 2025 22:33:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8ddd:816c:9ca2:2a5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459e14bsm11636345ad.228.2025.07.03.22.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:33:09 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:33:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - add support for MT6359 PMIC
 keys
Message-ID: <vfdsmhfafwmdlbk2n6kibeaiufwkcdf3mbz77kw3w2fy353xgr@tjcmjp7mb6c6>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
 <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>

On Thu, Jul 03, 2025 at 05:41:03PM +0200, Louis-Alexis Eyraud wrote:
> Add PMIC key support on MT6359 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied, thank you.

-- 
Dmitry


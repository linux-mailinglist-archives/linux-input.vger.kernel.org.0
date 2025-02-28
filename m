Return-Path: <linux-input+bounces-10428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB5A48DA6
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 02:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520533B3DD3
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 01:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1626317BD6;
	Fri, 28 Feb 2025 01:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAOuNqDm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6241DFE1;
	Fri, 28 Feb 2025 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740704865; cv=none; b=RC5qmUj0BHKBjgR2Qu/qkMGbRm6R/CnB+S+1RPEqeA17esbmpKJiscOpb2CUvP/i49pAlO1CHsX2zGVq4oh/FDlBEsmkfcnl+IzDPVwBgduqUeBvVaot31E7V319B/C51LZqXsnk+dtV+yEUvP4yJ8wcAhjj/TufgHsAydsWT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740704865; c=relaxed/simple;
	bh=7F+485a2GYMpEoCglv0JpYsO64gxsh7+k5AuHXZ43jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZFFdkkz4a0RLuZ39dVNpOIwHOS+Tbm9UU7PJHCyFjqkin92J3L335wjzWT+AuDf2HS+tA3/ri5HT6EWOmKLbleDIp89q2fOmCGTN0pzf4fxgw1j/31xv2vh2zODIVOP4kpoBOV8ekksokEIGAfuZ6xUkQ/okUGEjiw7Y9uucU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAOuNqDm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22185cddbffso47601575ad.1;
        Thu, 27 Feb 2025 17:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740704863; x=1741309663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1laYBHFjrGeFBi7DbEcxWjegyvsUli4cG4YPheS1ZSE=;
        b=GAOuNqDmbNXLwgqehyAO5tev7ko8IpaANECV6Oxv2mw80kv65ju/LpHYbc/0YXuY2m
         32X9HzHK8XnaNxsL5aMTj44ZlZBu5s1Ne02mXUc2BUHVA68NPwc2eMK8tzHHscXkECm3
         iqjxvEWFw/cVpIDoJTsLGmlr0PEciM9ExC4DqCTum2DewFu/xUTnGDSz423hh2TQi/pD
         aOrR+YIaGp779Jg15NvvXhVHIKbwchRSArv4dKN3CLSDe1bALEN+E4Epq1qEGmGTwpaM
         djNym791Pul358ahvLYUk0tyKE4e4SwH1GB2VfVrSnEm9i8m+7AJ+aEoqp90ahzuq+fN
         0a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740704863; x=1741309663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1laYBHFjrGeFBi7DbEcxWjegyvsUli4cG4YPheS1ZSE=;
        b=qmbUR6RitdprpbBDbeWsgKNUL4BA+6odaHvgycMU/530lAGVm9ro8xJHpZimgFSF9C
         exc0EZNljLgOP9g5xbObh7ab4wVIm1vJWbEH382AFlPqJfwNfvJ1Vz7+ij6c+3fJ6pEc
         3l5NrLUwmwiVru3/EvzYi7Xh7Qd6Ee0+kG+YqsYEX/v+QoUQ2MytgSgFkcDOhbRlOJFH
         +MrpKBkhfqwIByfHMK6bwwgpqpawhPUoexH0FzEI9ICVB43YCJoNk7M9I08lCcKt84+L
         lz4uGMUG7DVPgJDq6WOWBMo9B/4A92CLWnfxoAd5mswhmmJIwvyrEHEQ8zCZT5BKiHD8
         PM+w==
X-Forwarded-Encrypted: i=1; AJvYcCWdcF7lJk3HfasFzcF7FCw1GyxP5l18kIbPuezxG98CDy0HhLV+SM9cOCtx2+jmNVWheWV2oawAouMvbnw=@vger.kernel.org, AJvYcCXMWcu63E8qnWlhLm760Zduw9BNT2l2s4xK4BNkzdrqsa1mrcllsueSApt4BGrD2dLZ0HvfQOPann7s@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvtfkj49J7KGXDOahjbngHCUW16O/xSWRquHJ9qMzTiA61sfX8
	dQGNolmiQQnM82CGHK8FZzDfsj6GH24CEe+39ePh6MY4x7b+DDXlcAORSw==
X-Gm-Gg: ASbGncuCspojmtLoIK17o8nXoB3N3nsqbfeIjJNCBRkh7QpWr7LMzhb+D2bGOEb3jV2
	iGPwOv0B2ehW7pwIPX/T5n2mIUOBGXcghZeY98FspY0cLU7X7qTK9LKt6FkM5GudbWcvEJs+8U8
	6YnoGkNStvem/wpkaTApgN6QRKUGiYwEVKG96MwVE9ipT/xb8etY1VYIuMMw1GbzGBduGk4Cpz2
	vgcR3CBdi54N64IRu2cmzoYjHihpcuC5ohY4rRRcqPj9SMGvyiECGogNBH7HMOsrzd0YU2zosUi
	C1G8yWNzgiuKaWHMnZ2hpYbyq+o=
X-Google-Smtp-Source: AGHT+IEpGrcNoN5NEVxEEM1ywW1LEQdRBk6lpjhv0z2LW/RIfXXQXJPUjLCHRU3Ba0uCJH+CiwmDig==
X-Received: by 2002:a05:6a21:6014:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-1f2f3e11c7fmr2583907637.17.1740704862744;
        Thu, 27 Feb 2025 17:07:42 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c0e7:f2be:7020:c4a6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec4142sm2193005a12.56.2025.02.27.17.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:07:42 -0800 (PST)
Date: Thu, 27 Feb 2025 17:07:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>,
	Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z8EMW2MmIrhUIpAS@google.com>
References: <20250226152843.43932-1-markus.burri@mt.com>
 <20250226152843.43932-3-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226152843.43932-3-markus.burri@mt.com>

On Wed, Feb 26, 2025 at 04:28:42PM +0100, Markus Burri wrote:
> The property is implemented in the driver but not described in dt-bindings.
> Add missing property 'gpio-activelow' to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied but dropped Rob's reviewed-by because the patch is different
from what he has reviewed.

Thanks.

-- 
Dmitry


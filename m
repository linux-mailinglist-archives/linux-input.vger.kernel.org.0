Return-Path: <linux-input+bounces-7576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D59A5C7F
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 09:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D4E1C21C7A
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 07:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9AE1D14FB;
	Mon, 21 Oct 2024 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifvADmV3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7651D07A3;
	Mon, 21 Oct 2024 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495045; cv=none; b=QwShAW+yBiV4V0NoTMPIp+VvUw+srnMKOHRQOKooHh0ZX6AVVZ+zPwFshjUH8lHMO1zwbyj7rW3NSaPNvLXuNXi83vWMBSlWRom30QzDeXy/MZbC3O/oDghlTb/HW5hm+VivinGGWUdcVUDTbeAvwRlcwNSgLeQdan7mm1Cning=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495045; c=relaxed/simple;
	bh=yNkzjvJHErMr5ItWr86Ff1LdwbAplket3nAXC6LDs5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4ePZ/O+ledm3TXgXWC+QJMtDj0/oa9H9IfQVFIqV5jE5Ibhldt3pu9fNR+SomftxaLeyggDT78c/CerB7p/EStUZ9PGGVGERgqlk58SXbfitdrPp3vvj56r2PfVWhT4C9AtEE4yBhC8oH4sv/or7MSsETcsupbB5sJunqogGqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifvADmV3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so3003163a91.2;
        Mon, 21 Oct 2024 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495042; x=1730099842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAUk5W98O64U9IZMaqTyyBAdnws1M/z10hXkJohh3N0=;
        b=ifvADmV3nynRpi87NSCJ2PHwcHPaqU8HxV23aCQ6wCuxl8aLAGBC56PckiWf8EKwom
         wDW8yRuZlK9TXnDH8GZ6o/p5f7+iO3Jfpp4rZBOwA1+hQKNcqEsu5ieVL+3rZmQ3i2VI
         t3pfM8JYsAY8a8IJC0dzn7fZT6u2xtu+/JIHwHcPRJUi2J+DFuwR2EO2h8cW95fJAVkq
         8Czs1bMbXcunJZ7fLadQG8xz6KQPz5S+nKFqu+TLvq+bFXKJJNih3Qw9+cS6dnoQIN3u
         dSvBqdqI5fF5TWXnGMSHZBqQdGtOh4vtJ4Kck+DfeqZ0ADJhhIs4XNc09/n1pDXIXG9Y
         5IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495042; x=1730099842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAUk5W98O64U9IZMaqTyyBAdnws1M/z10hXkJohh3N0=;
        b=LBNj076JdiJhC1fRcTcJN0lAbT84B+fz7wZcXLOwEoPSsAdSG48424/PFudU7nr+z7
         4uX5J74Got0IXmisIn496/7dt57fjtLrf5heAZb/KVVtuN7l3AF/pCerWDOOv3cDesay
         pJ0hCz84oiv9UFAT5cLLwzJCZ10OSEYxxBdPd/9HDudUhE6I47VclwWjnebUZval/1Xe
         w1YpTKj6Q+zOvLqLBmXGItGKmiDZdVSMU2IAJ6nCNBRZ222acFlSu9cHN1tyLmngmoQD
         AmH6Nqg6vRBGHXii4o4PfOhCNz3sZU8sozsjpnIbD2X2y5m66O/rKChMRc6iDjdg0VAK
         +lMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUquk/6VUrGufTFGMvpvJ7WY8bC87ukOV8O3G5IbXVfObS8hVLbZ/XRoD1AfEmdrRbhfL7CYfX1X6Tw@vger.kernel.org, AJvYcCUzX5tGme4kTxoqfNQ9u3IqjPcuW5pajOm3icRQdAc7mCCarSihu8splLOPtpyslX5LTbUcCBNTqSYpF5I=@vger.kernel.org, AJvYcCXZikzZBLZob58IlVpeE3gHz+RTKfdSr5GEBhMmdDxOE9iIsjcZ96xNVwGb8CUDW0cy89B3v4/xRwwMVfny@vger.kernel.org
X-Gm-Message-State: AOJu0YxunbulIMigeDQTQ1RN36pHX4jMxgU2qrs7u6/FlXWCEGBlVJUS
	U6qZt7DwodDMpHN31ignqs4ezoxidodNEqdPz3R8itaPCPecBbiS
X-Google-Smtp-Source: AGHT+IGneQjtaluKEP/Dr7JWISPzjl8lPXj+gklNXWwqzoxaJiGA1EN7a1TRxGE1qWenqDLpbFxmXA==
X-Received: by 2002:a17:90a:8d14:b0:2e2:c00c:cb79 with SMTP id 98e67ed59e1d1-2e5616db842mr11923766a91.3.1729495042427;
        Mon, 21 Oct 2024 00:17:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6e21:7092:f7c7:3951])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389146sm2818628a91.26.2024.10.21.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:17:22 -0700 (PDT)
Date: Mon, 21 Oct 2024 00:17:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, chen.zhong@mediatek.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
	kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible
 for MT6359 keys
Message-ID: <ZxX__86dGl5QNsYE@google.com>
References: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>

On Tue, Oct 08, 2024 at 09:41:37AM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the keys found on the MT6359 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thank you.

-- 
Dmitry


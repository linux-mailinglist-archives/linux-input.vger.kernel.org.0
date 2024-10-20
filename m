Return-Path: <linux-input+bounces-7568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1569A5267
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D88F282D1F
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7766FB0;
	Sun, 20 Oct 2024 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djgnRDCx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724CB11187;
	Sun, 20 Oct 2024 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729398027; cv=none; b=hxXTVSYqSysVKG5clxY83EbQOPBeo/G0y1y8JRby+1+J1NbPob4FS8+xde5DMvaOFHCD8rhv46AJ9l7tkBVIHUVRQbVFuw1gs0SDlyyqPS09xPxPBiyb7SgUGh0uTxkgTBq/METGwycMMu3aC+y0O5u2V5aszVv1l6fFSBN6UoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729398027; c=relaxed/simple;
	bh=LNHACedYQbx0cjfOb2FnneuefkB12VYRlcpJPj8EcVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2elpwCeuWGuqpNiKkcp2xuq+nTuGxwuEM3iO7XIOl/D+LlAJxaF961J3XoHfL1aZ9yL89D0SOgZZRmloCpWBPN9HrKXatVa5nnl6O+dq3P/8PmR5NmTMoVLhRWpfQPec3tvVfKaAtGfbtWnGV2HVD2+xRrNd8Q6dLRdqokeD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djgnRDCx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so2784929a91.0;
        Sat, 19 Oct 2024 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398025; x=1730002825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=djgnRDCx1CSaSNGhCX8jgDmBNh/Lx58TkJFayZYbAic7QzptarBtvnop3YnDA2+BLw
         77clRFJeWlW1/8dL8BkFg6yxaopsRPhMxsZDJc/UHtOb+lmCcGKpVDvkC6ZGO1W1dF5I
         NHaHCkU88ReIX6lg+m+9AJgeGYwSFFQh/DNmtCivyYbbzinDlvOPSEfPf4fmUhwCqrlG
         f2v/Uq5lTVvQWt+pO/td619t2ObJ2AR5Cp3IHbs9Len6CXPom5WFIk43SRh4AXs/iEDi
         OmqJu60ZymjnoCJSI2skrV3x1owgA8wU8e2AMKg/yRwUFB/XVNT6fIHgPoyR5i6/c5x9
         VT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398025; x=1730002825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=BiSCRIsDaJsJOssPmTYJXAqX/4LV7KU3lTpdKuTS/QhRAAbejvo7qkuBxFL7AH4ork
         9gesTwQeq8dgXVXQOvEfXUaSGwXYyx2ise6GSPm7iWj+L8zx+R4EuVKI858cMIc17A90
         y/56kkOKYrDdytg/f2qfCKDXAX8WxB28ocEc9wW7UilwEfKsL+27/DrsJ3eZLoesI8t2
         R/ukdqIFVixERuBzitMeosujFJ5o5KwCebRqVupIZ/WL+r7okfFPjqZVQq6a/I541skM
         UNADFekNx4S3hIveaVXVK/Z2Weq7Nlyz0aq+Z9i4eCb/ASCa7yln2BoFpBC97rRSNdZ1
         pB1w==
X-Forwarded-Encrypted: i=1; AJvYcCWi85j5Jpap3p/nPuZj2Uc2Jv+fnXbr978UXMNh7mk3KgbuUNm+OHBtF6HieUfx2eCjouMRum/DJuonXg==@vger.kernel.org, AJvYcCXSb2+8OZZFFpC7Fwv/vT1jTj3bGyRY3MXjDsSBlaIHem023bgOciaYox30ZWhBxpNjdJEi49cSWYFCNkkc@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOBTOvbFd849fUpzVAlxMpJh5hOhwr2e12ixng6M6JBZpIgNF
	7WyfwopI9mHBpsfJe0Rv28WFnNZSIgy2MhFjuypQyDaczTlTX5Lv
X-Google-Smtp-Source: AGHT+IHA6YFEqEtg61PXYGVgACwL+Cintoefuk4OglOjvjRf+3hwgSbRVFqdWX6TDCZbDfVBCqjZbw==
X-Received: by 2002:a17:90b:4b03:b0:2dd:6969:2096 with SMTP id 98e67ed59e1d1-2e561a230ddmr8389123a91.38.1729398024690;
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ee3b0sm644120a91.42.2024.10.19.21.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
Message-ID: <ZxSFBbo5sO3w_9sl@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:26:00PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry


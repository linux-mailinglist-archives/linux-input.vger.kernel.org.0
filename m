Return-Path: <linux-input+bounces-14831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E9B82F3A
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A548B583690
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726672749DC;
	Thu, 18 Sep 2025 05:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UahEEE5o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25F257AC2
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172197; cv=none; b=goVgXwh2XNA8jEjCVJX9imTkOwG5/pqcIQT6w/D9VkWgyXIWKEzQn45ZpoFawucyN5mBS5Sv1/akl0//sWQfLSKGV2rGEuKscTgWZGkx4sqx7aNEd7UG1RQxyxcTHGrdvyxEA3jqXn0W1c2rVbXA9G9I3wOdpZERSlXOalk3Grs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172197; c=relaxed/simple;
	bh=cSJ4eUM0DsaOhlcWfrSZ2S7GNwrJAdc8Rw5tLu8gtJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+gu5Xu/toNqR9gd2xgp0ErwzWieuHmwEYhtB2+u7PxTeXspvhdab81yI2+2wQ6XsyBnFoh+KQL70UmbaeDc9FTsAkhfvWnBoVRgULRO7v1TeaCZGpc6HcBX7ujnUYSx4dZ0Eda+HOGkTkDTNf9rNP/J3DAb7TWKnE/IN8sujzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UahEEE5o; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-327f87275d4so529497a91.1
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758172195; x=1758776995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzO5J5b/DpAoS9q36wSTyxp4bWMYntWCRlnNr1Ul6mw=;
        b=UahEEE5ofyyXoY047oataLzWhTWmrdVjWxR5DajFp+OW/RVx96mNne9PEwYgxIbr01
         sgobGqqdmp2eERbWq8df6OZLLXGMAyJgQMKKyG2suLXyo6NIaoOV+BGwOSE22NjicMel
         NoqPDcPuPDxfug2zTgMlZhWlJW84LhJ8PlfdzTMXmwai6XBmuWBLsH4U6az6OMtipAZ9
         3dm/yo5REjUVgpyrCuAeDnmsF75hdWp7jJNBewYHlT/ylEf7W9XFTV0jTb0/7SpxQ3Zg
         GNZe8podHYoL0RGhGMbozcaL1cICuAplq+K/b/RfqegoxOKsmA4xuNnWGmaFT61da3Je
         /Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758172195; x=1758776995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzO5J5b/DpAoS9q36wSTyxp4bWMYntWCRlnNr1Ul6mw=;
        b=ngQamsOX3gj+E90PrfYe7pPlyJ5KSyHCXuy11sLQWtS0BFsJj6+w3EJxfDjYENhbYa
         WU9pQ/0f/4UjAi8+njtiskdgk6xn4rt1jWz7KYk55yHFalIvdEoI/xhwEVvY43LcOR/r
         YvG1aZxGDrMvLgNNqG9XzT26lI3SQuylPTaEAk4Bpy+kuiInS/Sc2DYa5Eg5h4+SGcio
         yV2YIDY5IYFrdSNL+5mwd7N6VEP84PlEFcTq8q4/BqSVyCvfb0GZKVxcHtSSA74cdeqD
         EfCGFXd+w2Yi0mQ39IiMBbYBUT+qEUYWzCjQX7cQ/hJckmFsRzX78WSv6cClI1vQVrfl
         c5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv5zfdYXJLatCoOHYhKqS3EpzcLmC+GPoQNABpeKs63EPqWrkXwxSzgj58ayNh/LKB8NanaFcSBXkjGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8k5VoHGwDURz6nhLwLZcRWmfXykITmvYFEDJNDza3HUcrBp/T
	nbkhuezG9Ifsyi1yxHJryPKQ1QsYhXMdaEVxcjO+1m3uKRIr/1BCQKV2W4upYw==
X-Gm-Gg: ASbGncv2aoiWngDtORI5taKQ2wytMi0w59GPE09xFITIHRlg+VL2QJ6a95NnwbFg0iZ
	adwNa+AgS7Db21J0oCJnxu6tUOGkGqeQjDL7z7XUj0lm8kTJ7M24K3q05t+YX7vxLJKudUXaQDc
	Wjnc8Gue0/7fD15mQ4Op9JxAHPrL3QZx6kBuzL/6vzbshRQGwshX7Y4MATjN51yM82p3v/ogP1o
	TA4ZJ3/0sYqicQkOEsWUjrAq8U4ZYaDPjIYGrM5D+Z//IuQG5vjfJ4QbawLjl8j3YUp1mmsaIIQ
	xZLtTLijLkzVixoaczyBTaXn/tZ27qYs7MNoaVh9rVNhmmFdgojpdWv5jqyuvANg/2XbGPPy4wY
	c96DM2DxhcB4YvzigjQQ1IjDJg/J35wt+13IKJMXKyD85kF1DlEEB
X-Google-Smtp-Source: AGHT+IEoyQwkdhcbO2KKAnocbbWtxOraH4oEPJ9rZeaTPzEToqLKVmqvC+7go7FKKDfNLNeEHp+khA==
X-Received: by 2002:a17:90a:e7c9:b0:32e:329d:3062 with SMTP id 98e67ed59e1d1-32ee3f7431fmr6979916a91.19.1758172195070;
        Wed, 17 Sep 2025 22:09:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm4122687a91.29.2025.09.17.22.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:09:54 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:09:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: convert tca8418_keypad.txt to
 yaml format
Message-ID: <htwupxwox3c5fjvjr3nxc5qtotgnlesit2jnswg3g37a5tku7t@npyzyv7mtwr3>
References: <20250916171327.3773620-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916171327.3773620-1-Frank.Li@nxp.com>

On Tue, Sep 16, 2025 at 01:13:26PM -0400, Frank Li wrote:
> Convert tca8418_keypad.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry


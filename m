Return-Path: <linux-input+bounces-708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E95280E251
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 03:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F42F1C2170B
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B794696;
	Tue, 12 Dec 2023 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5Fkcq6l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90358AD;
	Mon, 11 Dec 2023 18:50:23 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d0b2752dc6so45447915ad.3;
        Mon, 11 Dec 2023 18:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702349423; x=1702954223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5wKOiCgqswdmnAE+7GTByJH/L22v0TKX6Ot3bMlqWs=;
        b=D5Fkcq6lLgkYpR2n3TGxEpX8CyGrJ48HOymhkJwVZzlX0DFTPM8DY4gwS4PRuaZDVx
         zPrn8mJ6qPeSKdX1UFrh6CTRO6nStm/kyHPfGYSbelo1CP3vSgbCekHX8+mhargJWoVj
         h+g6mCA09LZOSys/pwu+IGVqaHkdsIvviSfRsyGn8dfhTOSD1mo+kLm3rPbC9VloJoEV
         fvFJIO75Jn9YkffpNKnKwkY/klZ1oSurQ/ApayM/Q7LaKsgxnM8ZJILlE6KwEekuKCey
         2CX0ui2RBY+kHB5kXNpiZxNx1N4Qll+broESwoQBrlsOfBpn1R172oX16ZuVIMxKo+3V
         0q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702349423; x=1702954223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5wKOiCgqswdmnAE+7GTByJH/L22v0TKX6Ot3bMlqWs=;
        b=VphMqxHcwIKTBQmeEXW5bOu8dsWqaYTm7uclozXch1lJB0tzy075nJ2dtnfbcnqSZa
         26FJ4/ht/uWaoytGFfoH0Bk5QosnOgl30Rzt9813MKq9mV3K51/FeMsc6dfPkgDm4nGF
         41z/ileQYL84AjfhRTyFAWn2uFcRdZMsDNpmC5J68Dl662x1Px7AB4poUx2X/ANMTb8P
         CP7P1V+Kosk5yoVV/Hjf4800+NpLZ3yB9Z7l1KPt3y9ChXtcHf2eTJeEYuwoUM6OOyoL
         9v0JlP7p1NZg4J1KAqsm6lKv94dxjoUR4ETy4jxXkdRlNDYNSllBkNEAUJjsAq7BkDup
         dNKg==
X-Gm-Message-State: AOJu0Yz17CIPtgshF7P/8KW7E+ua2hnimeBGWoHwZEmtrdIOPJAOFiQi
	c8x9uGrkNHfTwt9PZES6qb8J+YkCfPbW5w==
X-Google-Smtp-Source: AGHT+IHZNi5dCKJ59opPtFzEyCZt2GcAMbOQONIBrgmAJOj06J3uNAoDVaL19FQTCvoYrB8RxekVuw==
X-Received: by 2002:a17:903:2791:b0:1d0:6ffd:9e30 with SMTP id jw17-20020a170903279100b001d06ffd9e30mr5493893plb.130.1702349422865;
        Mon, 11 Dec 2023 18:50:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:46e0:3920:a552:71cb])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b001cfc15993efsm7408879plg.163.2023.12.11.18.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:50:22 -0800 (PST)
Date: Mon, 11 Dec 2023 18:50:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Jonathan.Cameron@huawei.com, tony@atomide.com, robh@kernel.org,
	frank.li@vivo.com, u.kleine-koenig@pengutronix.de,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: omap4-keypad: react on keypresses if device is
 runtime-suspended
Message-ID: <ZXfKa_LjCgvskb99@google.com>
References: <20231211221757.517427-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211221757.517427-1-andreas@kemnade.info>

On Mon, Dec 11, 2023 at 11:17:57PM +0100, Andreas Kemnade wrote:
> According to SWPU235AB, table 26-6, fclk is required to generate events
> at least on OMAP4460, so keep fclk enabled all the time the device
> is opened.
> 
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Tony Lindgren <tony@atomide.com>

Applied, thank you.

-- 
Dmitry


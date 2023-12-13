Return-Path: <linux-input+bounces-737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27658108BC
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 04:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 115BAB20E1A
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 03:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA326124;
	Wed, 13 Dec 2023 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/V9N6Y7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239F7B0;
	Tue, 12 Dec 2023 19:24:31 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce9e897aeaso5720202b3a.2;
        Tue, 12 Dec 2023 19:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702437870; x=1703042670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYI7mjxuzxvHJ3SIZeWUGEGRlIlWuOmUo8cbgyjlYf0=;
        b=c/V9N6Y7z2SWQo3q7i2H1oYRK559/qqxSU81axlL2mrCP5HCcYKQeXXoEfGbxZXJSr
         dIh1UweAjI9K+0uN5Qu0kk4WOMYOn5Kp1h0//TAC8/u8MiYUekppU7PPcdmOIEQDKrbA
         Ov7wyuMNHAdn0/KBwRSbMtANtwNhdiFe/SHPazWHhp1uXOFaX5xBI3jnx6stDdlbyCky
         4wuMMKQ7u8CyrRkRHI2k+Dr5KcjlHtoCu0kBTYOLHrxRfRhWOw57HvIqrju51rUb+eo/
         NdBwsvCOtiPy9m5V+XgyFHPHstotSPR+yuwpIbeBq9A0bqJJdILdc/OO7Hej+Ku0fcgn
         UghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702437870; x=1703042670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYI7mjxuzxvHJ3SIZeWUGEGRlIlWuOmUo8cbgyjlYf0=;
        b=dt1g9xIoz9nuY+UPB4weN95AFHXXCgbyKjW14zDu8LwaTcxd6wf2aFgOnV6dsNgIll
         7hqKcUlNezjmevV1ofshYqAMKzflCukHT3KVIjkl+EDcnGKn+NxGivb6Jj1kCLtJvi0f
         LalLvPW0GCnxj0eMjBM1jlCyL0bq/+yILaVAYWiH3BE9C4bo6hFnYaozlXFgmmEPu/f8
         jGW9mrkoh9G9U8V2rXDOG3NZGUc5PAW2XDEeMH/e0wMhS6eMVZ6yfFis5tmSYkhoEiYB
         ogRi7HWij9U2WFaIVM9G3R2gTbdDEM8Wrb9BY6DWnXkes3arJQ12VnYmiwni69u0Znps
         08eQ==
X-Gm-Message-State: AOJu0YyCvXbpzSioMV9a4UHmK0AZESVtwbSJZE3edv8udAYm8215uqJ9
	IRe3dm/1OBGxxM1P+XMej8vnVaWMK/zWKQ==
X-Google-Smtp-Source: AGHT+IH6fiOUQ8+96XTdWUooGXRL1f5YJcVHKu7p5Nq/lEsqZ4XRQlADV2k6NUl8CdoKvB85akuLlA==
X-Received: by 2002:a05:6a00:2e10:b0:6d0:9913:3363 with SMTP id fc16-20020a056a002e1000b006d099133363mr4495001pfb.46.1702437870450;
        Tue, 12 Dec 2023 19:24:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id u3-20020a056a00098300b006ce7fb8f59csm8927618pfg.32.2023.12.12.19.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 19:24:30 -0800 (PST)
Date: Tue, 12 Dec 2023 19:24:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add Razer Wolverine V2 support
Message-ID: <ZXkj6-ZgqZhQZ323@google.com>
References: <20231125-razer-wolverine-v2-v1-1-979fe9f9288e@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125-razer-wolverine-v2-v1-1-979fe9f9288e@z3ntu.xyz>

On Sat, Nov 25, 2023 at 05:22:15PM +0100, Luca Weiss wrote:
> Add the VID and PID of Razer Wolverine V2 to xpad_device.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied, thank you.

-- 
Dmitry


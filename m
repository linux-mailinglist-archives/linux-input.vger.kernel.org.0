Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576E84306ED
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 07:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244915AbhJQF0L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 01:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241437AbhJQF0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 01:26:11 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028D6C061765
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:24:01 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso10267966pjb.1
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SY1+DVuu/2W6bu1mz+URw9WebOTgJ603v8RGTf1p+Ws=;
        b=mjOP0fDlwN5NLRwQGMu06wlFve0vF7AMAgN65BDuKf0kuc55/L26azIQ8jDHZIw/Re
         qy66tJxqdtHZTOeb9YhaB0XUPnmedTjpVBJuR/7yJ9oyoJHkcbr5f8e6JH29sfi+wUOe
         r/1bEiU/n2+xoxPsNfLCYuQmAo4UCAvCSeOXkSaqrh96A0XuOU/W1Pch70nhys0XItNX
         OyB4kd82+n7XXqa9SpUY2zI98hjxSrSMRwwnSog/1Ogsx74TykoSkxqvG5jL9bGY3OBG
         /7DQNpTIOAbLN0o8K2Kylo1W1P8/DzbJv+YwQ6Xg7rsyjkw1N+nmXy79OpzBSl2eQ1zu
         Fmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SY1+DVuu/2W6bu1mz+URw9WebOTgJ603v8RGTf1p+Ws=;
        b=u/570fszqL4LJpF+8w2aRaObdLUqkIs32UtZM76TGg2fxgSwbDxzp76hwJkNEmLMAp
         lpqTbKXyQ5AUIMm736ofStRMhPk+8ILhE0G26xZAt8h948SEzLKMnm82y6PgW5rpc9W8
         L2gQhE4D+fiXF5N5QIpJNpWl4HYZ67sbdTCeYsWKG5zWhvkiNw0QW0cvACOwTn72E5Ma
         PkUfQRw/VC6NETlCfot6TwqDTIJ6cacIdBSq2flEAudlWAgMfckfdqqfKlQI0bll0Lg8
         V+ufTdxEHgqWnDvu8MEodnJAmA0GrMxYb3OmZi0PEOvpQMCiIvVxGBzwtO2DestqU9KQ
         kc7A==
X-Gm-Message-State: AOAM5312ZxPVjuf1aHyyzxTbHFBAkQltpTPHdGIG0HTe85gcmGPDOxdi
        CvXdIk6QLYeeXHfuDaX7CPo=
X-Google-Smtp-Source: ABdhPJx2i+a+s+iDJo0T8jt8k/igvangXIlpFv75m+e8jHc+A/j3H1tC/GpxtaNoDYAN3W1ZioQJhQ==
X-Received: by 2002:a17:902:b94b:b0:13d:b1af:f9d4 with SMTP id h11-20020a170902b94b00b0013db1aff9d4mr20345946pls.0.1634448241015;
        Sat, 16 Oct 2021 22:24:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id h4sm8678605pgn.6.2021.10.16.22.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 22:24:00 -0700 (PDT)
Date:   Sat, 16 Oct 2021 22:23:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v3 2/3] Input: ili210x - export ili251x version details
 via sysfs
Message-ID: <YWuzbTGV/at8BxZq@google.com>
References: <20210831202506.181927-1-marex@denx.de>
 <20210831202506.181927-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831202506.181927-2-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 31, 2021 at 10:25:05PM +0200, Marek Vasut wrote:
> The ili251x firmware protocol permits readout of firmware version,
> protocol version, mcu version and current mode (application, boot
> loader, forced update). These information are useful when updating
> the firmware on the il251x, e.g. to avoid updating the same firmware
> into the device multiple times. The locking is now necessary to avoid
> races between interrupt handler and the sysfs readouts.
> 
> Note that the protocol differs considerably between the ili2xxx devices,
> this patch therefore implements this functionality only for ili251x that
> I can test.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>

Applied, thank you.

-- 
Dmitry

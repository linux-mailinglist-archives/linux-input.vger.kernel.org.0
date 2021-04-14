Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1447F35EC4B
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 07:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbhDNFo5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 01:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbhDNFo5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 01:44:57 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C04C06175F;
        Tue, 13 Apr 2021 22:44:34 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e2so5169309plh.8;
        Tue, 13 Apr 2021 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eymxVZxxGtz4JaDVfeNaUFrs9jy3ndAnSYyQqKhgXkc=;
        b=Cp1e3zJVr7HXNNoMIWAavqsGdGIB4AAXhO+YEnvmiSi+NEbj3Db54rsI1SBqrChq6h
         xTXVzJv5jqnLdY2dIHbb6kaTPIRGqARRgmLthckyEmaYFq6kYC+93G3NT+f70QhoMaB/
         ssmtDRMAHYmUZMZ/muIQVjzAVgCpG3s+Is+mknub/rQ6N0Td57BokAI+ESoEWDFb7zqq
         07RtLz7agTVFwgEOTETtHzJ/pDQGfxD+j/FC9+wjiDqGjx7UvnfOIsY3Od3dg7ADr6UY
         lEEW8sbElnZMPZd5c35autmhhnKa0NohAEWyyLf6RydvgnszQpN2J5D1f3g8KmJZN+lN
         qBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eymxVZxxGtz4JaDVfeNaUFrs9jy3ndAnSYyQqKhgXkc=;
        b=bsaKShKaL5zbQJYo+DR9tBJA0n90PNKvbD2we+HBRgjy1IctZ2zzk7JBMfUTJVc449
         haVrwpMoIabK2p96WK/0b9lS8H/3M9QYFcjnB587Gy6641aiVBAWYnIU5LWiICzPJa5h
         krIo/AjBUTFCjXO7RoO0sAFgDNbbkwcAKrlyhXn6hewGrR1Whg6xlka7eQcKB1/dP+DA
         7xRROnWaI1mFwbfgj1ZeZRY4tVHif7sVraI/i95RPlL8uuYp2rt44OplFG+EVpEu+LGz
         Fq/VWzFQjhgjDJ14luxus85Zm/BH4WCg06H+c5upLcEWeiUZaA5rAyDGgVq8+CaUOg5j
         DtWA==
X-Gm-Message-State: AOAM532AcpJnQNmHAFxzG+Q61I3PiruYAoYjTMPFm3ytPFnvcMgShLWE
        kx7xPsthEqhYebQiCeDCDsI=
X-Google-Smtp-Source: ABdhPJyrKnbqvZ6T1CdUuYOOHjiY9CBGHWwaWgeDurTp6hzE1sxjoZwXOZYzqmvIuoaAY78ziDJ8gw==
X-Received: by 2002:a17:902:9886:b029:e6:2bc6:b74 with SMTP id s6-20020a1709029886b02900e62bc60b74mr36127085plp.13.1618379074296;
        Tue, 13 Apr 2021 22:44:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c22:82af:e208:38f6])
        by smtp.gmail.com with ESMTPSA id r26sm3353121pfq.17.2021.04.13.22.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 22:44:33 -0700 (PDT)
Date:   Tue, 13 Apr 2021 22:44:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <YHaBP61CDmBq4e66@google.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413144446.2277817-3-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 13, 2021 at 04:44:45PM +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied, thank you.

-- 
Dmitry

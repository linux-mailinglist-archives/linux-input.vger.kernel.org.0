Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D277135EC49
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 07:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbhDNFoq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 01:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbhDNFop (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 01:44:45 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CF6C061574;
        Tue, 13 Apr 2021 22:44:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id w8so7141878plg.9;
        Tue, 13 Apr 2021 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KnaKgiM1dMolsy+hrBwHGq3LunZ+cCVMNRxLboIxfbo=;
        b=tXy1FX1ucilRl0mJe/AUt5GeOXyImDeDa2MWoEGggqsaxeQV5mMnxQfIl/b8Kvm3Oi
         3FyGgTcgyCa6pn5MObHWiszp7cYE6FaaUpYdhHgAkCk8QFI4Mz5xnS/fNgQSPis9ED5s
         ZlAmzVLotYvIkz72d+I4YYRl1HtplC+UAH7PA7x6dshQATlDklqNj/Ka4Fh1ORCC4yRr
         N7Fnz+5mgzL6hyckKPervcvbk57OVC6Zkc9FjHH2H9cwR4EbujJx0ndnzOf5/oGCJlNF
         yvpulgX+sg1FbCI7mdvm9eNtQnU6aihAdvd/sp2ZCsK4NSF/nywQvxTtAVLW/0QOGieS
         P0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KnaKgiM1dMolsy+hrBwHGq3LunZ+cCVMNRxLboIxfbo=;
        b=CJVlRQHxWmyGc0LVSw0pnDXGlOr7Ak732x7jM4cmtGiR/MJgNzqzh+UiE3PoElehEj
         xKLgTrBxVi421nFmRZMsN4LAIo5xaIqkDw44uPZmMkf07jG9Rn2EB9APwuaLT1LMiXJq
         BdLvkSxyKvVqBZqXeT9cuSicQ65kNSBg/Icppuo8KBn9JyxFnfNX3rCZFMbArRQrj2TT
         UuaSwWoWuSWcY9CIXCFA/Brt7In+wcy5710vFnfxVyo9SB05gjlo1uKLfYXetPpkqUqp
         UG0JmiLJQx249WjFyNHez5CkZt5z4+EL1EK/NQ8O6r4sFU81BOdjZJWmBFaSrFVeioUQ
         aHLA==
X-Gm-Message-State: AOAM532c6y+ocM0enH8y38yrryfh25nig69L0jxnuDhhkbW3J3hiHYTN
        SZX44OsTrtyarIZkIuLiBQc=
X-Google-Smtp-Source: ABdhPJxIaWOomHPKnZHbGES/DQnhQ4PEkLSchnc7zn/RGtVDHOEZeCOR96fN1MM6j+dUMqdD5AoNQw==
X-Received: by 2002:a17:902:be11:b029:e9:3dcf:c2a7 with SMTP id r17-20020a170902be11b02900e93dcfc2a7mr36853676pls.4.1618379064326;
        Tue, 13 Apr 2021 22:44:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c22:82af:e208:38f6])
        by smtp.gmail.com with ESMTPSA id w127sm13594233pfc.51.2021.04.13.22.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 22:44:23 -0700 (PDT)
Date:   Tue, 13 Apr 2021 22:44:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: Add Hycon Technology vendor prefix
Message-ID: <YHaBNQVfUeH0CpjA@google.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413144446.2277817-2-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 13, 2021 at 04:44:44PM +0200, Giulio Benetti wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "hycon" as a vendor prefix for "Hycon Technology".
> Company website: https://www.hycontek.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

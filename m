Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B2D2F05AE
	for <lists+linux-input@lfdr.de>; Sun, 10 Jan 2021 07:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbhAJGSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jan 2021 01:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbhAJGSs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jan 2021 01:18:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E127BC06179F;
        Sat,  9 Jan 2021 22:18:07 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id a188so8973066pfa.11;
        Sat, 09 Jan 2021 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1RztPCtExxzGmUDCYvo7m1kVGlyflIHunUjdtBEhxgE=;
        b=C5hCsjgOXqBPST0nkSZNyhMlMPB6xGl+GTRIRWaLGb4RMHAF7gfflmBAZoNfNT67UG
         7VmPAYDiBE34diIieNTby1s1LusN0wbkOa1HUns0VQTDWbm2QSLMtt0G3Oq5oaoA57Kt
         Dihb5cq23dm+U38ilLwMcrsiCFDBmah6JXZWa6VT1OGAjDrg6DhXE/hkjE1Az4SN8tsr
         3YwsziP+Rx7ZJsn8FFEnQwXRfG47dlrFwMAIezJ41b65qLdKDuKaDvC5DasH21U0brn1
         Z8Dci67ifyIbYBS1TKAiauor4aJjAzKxn5l9JdCrhyxnHnsOi2H0mMZMfzrIsz7MQkAb
         BasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1RztPCtExxzGmUDCYvo7m1kVGlyflIHunUjdtBEhxgE=;
        b=n3PVqaoQe1STFCJiBzNEJ328pFnJgNnwr0QKtvCIk2BTzOQ+cllBrB5lSGVO47soqv
         90ibFMRYmMq5qMrTvQYcXPwbIQu5t/TNzbK3bWqCwYxMPrSm38H2iSQ4z5Ph2wJ5BxSS
         7Xs/vt9S07HTJyDAY88ZeJMT/0ppdOvsMBnyeuNuIi67+t7WJNc/kVOMma4iB86PKcr3
         FxpdgEpVjr5ZOZRtYwFM1m6Imz6oTPTI4wqVZyjfvaTquc7B4q1X2srkcJiKBp8mK8Uo
         ytzng3KZ4GxegLuB1AAvGgWoU+NKMEYH806wzkMPwWh2cNp2XI0OLBZc7Bjysig2/jg1
         BI/Q==
X-Gm-Message-State: AOAM533eZG/dPWHknTealT2YwHsCwe1wdpLzsb0JU8IbuSLaftf6S1tL
        ZX+HEguuN/StPjJqNzGy90Y=
X-Google-Smtp-Source: ABdhPJxRW3sVUquGIbVodCMYFKp7FbnkX7KfjKd50TQUzhegXRuOXTEHsA5h9gIKDqU8IiSNtbJ3vQ==
X-Received: by 2002:a65:5b0a:: with SMTP id y10mr14588535pgq.337.1610259487470;
        Sat, 09 Jan 2021 22:18:07 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h12sm15302233pgs.7.2021.01.09.22.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 22:18:06 -0800 (PST)
Date:   Sat, 9 Jan 2021 22:18:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-input@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        hadess@hadess.net, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] input: goodix: Add support for Goodix GT9286 chip
Message-ID: <X/qcHGNIcoozfpBZ@google.com>
References: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
 <20210109135512.149032-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109135512.149032-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 09, 2021 at 02:55:11PM +0100, AngeloGioacchino Del Regno wrote:
> The Goodix GT9286 is a capacitive touch sensor IC based on GT1x.
> 
> This chip can be found on a number of smartphones, including the
> F(x)tec Pro 1 and the Elephone U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Applied, thank you.

-- 
Dmitry

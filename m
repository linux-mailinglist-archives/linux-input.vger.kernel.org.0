Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAAA2F05AF
	for <lists+linux-input@lfdr.de>; Sun, 10 Jan 2021 07:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbhAJGTI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jan 2021 01:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbhAJGTI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jan 2021 01:19:08 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C3DC061786;
        Sat,  9 Jan 2021 22:18:28 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 15so10455680pgx.7;
        Sat, 09 Jan 2021 22:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=66gZx177cKctl75cI6KyQcdZOqrIj9vdFaNqN2D+LWg=;
        b=mxJiYnRDU0gJ0TsoGBT0KAB5gqzTGQcb1jauJkqNFBTH8QkW6LKOW2f8VVMyF5bM4x
         xlhfric7q/hmTyVQHBDQj6ph1XKi0OiHFZsEMM2IheX4v7klqhVMAKh1jpiddkm9wIG4
         mwqHWGfGY4w+o6Oo0UKRAIRt/eg4O8DBxk5O/z12IVe5HsKJriG6hvc+bB08V21tyxTz
         mU4UJ6SdhHuws0tRoR9Cbt6Xk08XJJ0k9Xo/YhVgAztJ41MFt6IPfaTrARCw2iyfU0X3
         7wqqvcYl8HOxPqFxtgikoyZr+MTWVqKYzE0SBu9ZRqzcRuGv645yXeZMSyJM/m2XhXO1
         /vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=66gZx177cKctl75cI6KyQcdZOqrIj9vdFaNqN2D+LWg=;
        b=X+ieQEDLzGcxv7lYjYGrSgB3M2yDqkJ9wXlDCNoWY8oYAwjUo7MTocEAW7bEdOTdNJ
         WE/tjMt7DdgNV2Mpfd2lYJ3KWFvAz1i7obkkAEBL3tAyzK3OQPRsrm3qW442i3XX4sH6
         3y5G/kTlh+hZzskd3ojamdCsGBpjTOvGkpJ5eAS6HPectiELvb8lNIn1X/SCYUuPMd7I
         /hqodEeXc8cDGsh3qfoLLyh1DxzywZVosgha0+4DOAj9mSetJOzUTPJIJSgOtzKX9nYO
         +cLwo0xsuf4+qbX3JTr3QmTWonukuKdoiF2N/puVFiuy3p69a3KcH8crf9zclICvDgO8
         uMEg==
X-Gm-Message-State: AOAM531czXyt3xcl0j+MALM2abYB3MzJ75j+0rgHEyvAk5tsLwydf1o4
        ulXINdJrpb+DfZh/sjgBjKM=
X-Google-Smtp-Source: ABdhPJy3jQO476dT1xhNvJI2x+SYhOTQk78YpnA5ZxULs3f7vjAZfL/x+5/iG6QC2CTtIxIGIJQITA==
X-Received: by 2002:aa7:97bc:0:b029:19e:18c7:76b with SMTP id d28-20020aa797bc0000b029019e18c7076bmr11303253pfq.23.1610259507720;
        Sat, 09 Jan 2021 22:18:27 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x125sm15448575pgb.35.2021.01.09.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 22:18:27 -0800 (PST)
Date:   Sat, 9 Jan 2021 22:18:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-input@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        hadess@hadess.net, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: ts: goodix: Add binding for GT9286 IC
Message-ID: <X/qcMF5mYblMHpw6@google.com>
References: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
 <20210109135512.149032-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109135512.149032-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 09, 2021 at 02:55:12PM +0100, AngeloGioacchino Del Regno wrote:
> Support for this chip was added to the goodix driver: add the
> DT binding for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Applied, thank you.

-- 
Dmitry

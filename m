Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5483F45E9CC
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 10:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359856AbhKZJEY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Nov 2021 04:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345567AbhKZJCX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Nov 2021 04:02:23 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5229DC06175B
        for <linux-input@vger.kernel.org>; Fri, 26 Nov 2021 00:58:45 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 133so7534553wme.0
        for <linux-input@vger.kernel.org>; Fri, 26 Nov 2021 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QQKu0wLQ3EINDsuTavpRxlViDIpHjrTQmHq8drZuCdI=;
        b=u7jIKV2L2wXGjODZsOAFQWMCGnSRzMVTNQQ+bndoOGxpn6wWBwO772M7NUycbREbR5
         URmWbgGS2vFdJG/0tBbyzB345/VkRfh6DOqYWGoaBlmThPVrhiu0eYtZTP3jDnrbbF6E
         0gy3l8RTOodkgJ2IIy6LTCv0i+1N1T7yiomdt6hMesqZh783bBjklfRtEJf1tv3MURtC
         6+lHG7oe5WutykCjz42ErRcbgQHTOiC0NI7+uWs8mQx2OCbQuynJydG15IOenUYjY2YV
         Bk2L52KFM5Pb4zNjbW/QrrBNBmwDpxBAWvqcZM0EJl4gwWa0VBY/PL9RclOUySLoh7iY
         flDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QQKu0wLQ3EINDsuTavpRxlViDIpHjrTQmHq8drZuCdI=;
        b=0XjCBtffkL4b5yRy6gdwSD4FMY9vDgVJguisL1UvrQo9wjGBKz2blgr4xi3eguh+oB
         XUJ3CGw/FThbYrrqLBFQg6zDMa4na9yXvqoVM7N0vKRmz+wbOuJKCKGj0HXupd0Y7mCH
         M5gZPEF3gucVjvIf6SJVNJoPJNrhEf/Geo3sHCy6wRt/T7hHb5Rbk1FXOyk+RKwMP2DQ
         LIxEaWC+YE3KT1puUAs1eVjoy5F4adQtBATvnV+WrCHX1qVcceiEASAHnw3fk3TASj59
         TD2yQ6etcUBL2P3ep2R5/ZeSRMBxVZ69UKosY9X5zmIYkDWNO3aqrr1VlaovwyqKQBnP
         uO0Q==
X-Gm-Message-State: AOAM532DfiYZ6Kz/ic9kUV0Q7avWoQrpMHG8VlwABUg5mBZ4wIYjoVTt
        DKBSjMBUS6iVSxdGnnbeKrdqwA==
X-Google-Smtp-Source: ABdhPJya/B2tWSCntaoNhea0VFa4G0bliUrYZBQYaEX2DXzPttDS9V0EJpVncLRibpHiymKSUFSX7A==
X-Received: by 2002:a05:600c:35d2:: with SMTP id r18mr14005223wmq.166.1637917123922;
        Fri, 26 Nov 2021 00:58:43 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id z6sm7530235wmp.9.2021.11.26.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 00:58:43 -0800 (PST)
Date:   Fri, 26 Nov 2021 08:58:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-input@vger.kernel.org, Felipe Balbi <balbi@ti.com>,
        Zubair Lutfullah <zubair.lutfullah@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>,
        Wolfram Sang <wsa@kernel.org>, Brad Griffis <bgriffis@ti.com>,
        Jeff Lance <j-lance1@ti.com>, Rachna Patil <rachna@ti.com>
Subject: Re: [PATCH v2 4/4] mfd: ti_am335x_tscadc: drop the
 CNTRLREG_TSC_8WIRE macro
Message-ID: <YaChwbp3lno/07fV@google.com>
References: <20211125224642.21011-1-dariobin@libero.it>
 <20211125224642.21011-5-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211125224642.21011-5-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 25 Nov 2021, Dario Binacchi wrote:

> In TI's reference manual description for the `AFE_Pen_Ctrl' bit-field
> of the TSC's CTRL register, there is no mention of 8-wire touchscreens.
> Even commit f0933a60d190 ("mfd: ti_am335x_tscadc: Update logic in CTRL
> register for 5-wire TS") says that the value of this bit-field must be
> the same for 4-wire and 8-wire touchscreens. So let's remove the
> CNTRLREG_TSC_8WIRE macro to avoid misunderstandings.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---
> 
> Changes in v2:
> - Replace CNTRLREG_8WIRE with CNTRLREG_TSC_8WIRE. In the meantime, the
>   file ti_am335x_tscadc.h has been modified, so the patch must be
>   updated.
> 
>  include/linux/mfd/ti_am335x_tscadc.h | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

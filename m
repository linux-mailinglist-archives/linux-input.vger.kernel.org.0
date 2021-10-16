Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AE3430003
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 06:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239247AbhJPESd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 00:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhJPESc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 00:18:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A590C061570;
        Fri, 15 Oct 2021 21:16:25 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ez7-20020a17090ae14700b001a132a1679bso844996pjb.0;
        Fri, 15 Oct 2021 21:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jadfWwsGWbfcMVzA86Zmsj4ccH6aVvbFOxxxB0YQO2c=;
        b=phKLRU0ncy2tOX8H8Xzqty+6W6UtLttM2RrPWeYV+VrEn37EHPxn6yBovhW073ZWbX
         J8fRv7OLUhwbGXfKP2V0FXt5gpDBuLS+IArhYBZXSRNkEwLJNDEjWd2CgpXXtEGfY/43
         TMMb5/50hL9heD173V/Av05FX9TIwqKirvReXuBIynAv2PImITDvLktIzUhKnekzWzjW
         Jd77Zm38zsNYROvqnYy/xR1y+BU6U0Oz349OczsIFaXgnpQAcTfYEpUyBjHgH9aLcnTs
         1+G2fl036zXjoOIymL7ub4JjSD2wcg2CuQxbfQELCiX2ADxrQTpXGU6L2HMheXLSsm1d
         bkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jadfWwsGWbfcMVzA86Zmsj4ccH6aVvbFOxxxB0YQO2c=;
        b=5sW6jMULdP1RaQFfpxiPPXkE8XWH5pSUuWmoQ+Y/j/tHgmHdNLMw8JejC+D3LLgo6D
         MGTHkKZeDgYdiw9WDiXPl66VF101OffffxOqB9Uvdy2Dzu+QUdWA+XRylsIhL7+XwOwW
         /ZF+qN5Qon4Ou+LMKQxrBCwj29ZKjD5xdL9LBsraBIF9yc/nSshV2wiz0Qc3+tJtVhDX
         IPsRsPE/JT6o/Mg5SWZtknn1Li2HwCIg3/oAHX/u2PlTQFqtNhXMj/K/JdcyKvMH1CeE
         RLgcwR6ddNucDcdbYWopDjaHPimSkXTwOMqM8Xgg+KIEUcDaQXNF+uRzgN/4zU6M7/eq
         OR/w==
X-Gm-Message-State: AOAM5314BK65V0/zk8JKTMe+C6wunDWWsW/UlwzRq2go98GMsuUim53x
        f32IUheKOzP0RZ7B0tZp4GjVA5Jp4CQ=
X-Google-Smtp-Source: ABdhPJx/Q9ftI5Y135ilvAWfRkKeSYSh3LCiQWk/Y7tUJ3bx6tKbIqrNRbYNlkOn1K2EV1pCvAhdUQ==
X-Received: by 2002:a17:90a:62ca:: with SMTP id k10mr18096486pjs.38.1634357784535;
        Fri, 15 Oct 2021 21:16:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id x1sm6232280pfp.190.2021.10.15.21.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 21:16:23 -0700 (PDT)
Date:   Fri, 15 Oct 2021 21:16:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH v1] Input: resistive-adc-touch - fix division by zero
 error on z1 == 0
Message-ID: <YWpSFJ0hEc81qad7@google.com>
References: <20211007095727.29579-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007095727.29579-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 07, 2021 at 11:57:27AM +0200, Oleksij Rempel wrote:
> For proper pressure calculation we need at least x and z1 to be non
> zero. Even worse, in case z1 we may run in to division by zero
> error.
> 
> Fixes: 60b7db914ddd ("Input: resistive-adc-touch - rework mapping of channels")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thank you.

-- 
Dmitry

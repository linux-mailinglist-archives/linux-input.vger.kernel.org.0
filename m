Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8672AB0FF
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 06:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbgKIFvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 00:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbgKIFvT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 00:51:19 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1283C0613CF;
        Sun,  8 Nov 2020 21:51:19 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e21so6177418pgr.11;
        Sun, 08 Nov 2020 21:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iA97TFBN/39kvrcdDBexoSQj+NQDw2XLUMt7DjliqeM=;
        b=LJDkXZtnjvtpeogPK2RvsimnOZToOLrDweT2ckFxpJ7E5yiZBrFS9HUpyK4Ssndt0m
         WVJ0d/KhbBMvltf80LjJSqZRdO524l0y2UpoxiGrLT4IH9re1eXBqzvNajZQeRqPVgfd
         pSjsGi41R9Ki4XZrIK7CUJXpWrOw4+HIacOu+ZbSVxu+1SrRFnJkei1kN0YCb4ty2RvX
         wp2Q6fB0oJ/frx41gisBmywnGvYWaBB/vqe9Knrszx88GQ8hNk8SMecuQ3EZfGWbIOP0
         FHkcXB3+9lhScRd3s9LT4JRGacmOgkTnAxKXhyiVSW/u/rc0KLHhgnaJ/VgAP7T2nfx9
         9y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iA97TFBN/39kvrcdDBexoSQj+NQDw2XLUMt7DjliqeM=;
        b=IYlvvdFZgw1nldHw9cmWeyyEiAHfAuxXyGeNytzhgRcp8wb9X3VWKu2ntnJCUrE7il
         j9N28QhwvCBk0lCe9OgmCzU2I2pjg91sEfDTb6o0vVbXjkHS6WgyFl1k8kEPcq9CweOI
         Udm0WX2xn7zwk2fbtF10i2ieS1X/Xq0WWSe9Svbe46fxqqE96t4RRlVbNoQDbuRWGHEP
         4VasiLRAR4eOOQcE1raU3RxQufmX6YOfa59iwxbQKueTAFf2ViW6PL+XxbmJufNbQEoI
         AYFj8WftBQV1u4SlvUnoJwDjlDbtXGlo6yDS2WcSe+hJu5qAs49CeqBkfCwodkBdNqw1
         kozQ==
X-Gm-Message-State: AOAM530fFGTx99v4FybMFx5jKeZxKJVA4us1osrLyTepZQgwPb7ZRyc7
        fLCECOVmKJyh1ZE45PNxK5k=
X-Google-Smtp-Source: ABdhPJyNXb2Wx9mMA7UZ9qA/5Pj74VEnzwR2Qs4RA3vkKC1mdRJEyMa2r+Xn3R0gtGxL4McEJDR+bA==
X-Received: by 2002:a05:6a00:134c:b029:160:c73:8462 with SMTP id k12-20020a056a00134cb02901600c738462mr12368130pfu.4.1604901079001;
        Sun, 08 Nov 2020 21:51:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d22sm8499581pgv.87.2020.11.08.21.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 21:51:18 -0800 (PST)
Date:   Sun, 8 Nov 2020 21:51:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] touchscreen: use kobj_to_dev() API
Message-ID: <20201109055115.GH1003057@dtor-ws>
References: <1604893436-20206-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604893436-20206-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 09, 2020 at 11:43:54AM +0800, Wang Qing wrote:
> Use kobj_to_dev() instead of container_of().
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Applied, thank you.

-- 
Dmitry

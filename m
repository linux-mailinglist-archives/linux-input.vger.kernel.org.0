Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CD54066B7
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 07:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhIJF1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 01:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhIJF1E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 01:27:04 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FDFC061574;
        Thu,  9 Sep 2021 22:25:53 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q3so426994plx.4;
        Thu, 09 Sep 2021 22:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eYB4xclX6nU8BjBKvkhYddYsIz6ktkELU80e97kp5Jw=;
        b=ojOWpgQ4RATCnuf5Hz1tLXf7TD90hXaK2FTKQ3T5a2YlM5SgA4bpxKpjBLmIByz+In
         MdtZmEcHAatuOLU2Pny5o5jI+IojDy9h7tVrlgfYwUefvJscZwTZZKdwq3/4AMAoa7Xq
         AQvG5NqlQQ32BY4buQVc35Vh2DGcAVoSkg4aUU6hdoT1u7sirhVLswkW6/MOQ+t6vwEd
         xnl8l0WU+0MxyA3fGekzIHUWc/k/QGuwgRl++mMy2jp3OsyrCasWHVrbS+VEvRCqdBPE
         Y+zlTuwkrkCRLUlib8Ql9k+z2YZqDmsCtTaeCXg/6IblW0aAH5AM3n/ORM98DrIcIyUF
         f6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eYB4xclX6nU8BjBKvkhYddYsIz6ktkELU80e97kp5Jw=;
        b=D81Tcj/BTlQu+0Gik/aPkOoSJ6yagYr0dB9ve6IHfkRQX7kHj21yUcOu5LBooFKU5T
         SZ/5u3Ycs8nIpZsr04VhsFpEX2gLIRx+Deq0cGDlFpDrL6KcoJRYLa6PIlvNJWY5qq9T
         /uICi2Gny3NrmGpTxT4OwnaqYS1O7/vX+5c/5undO7uawH10tdDrK8JRK5831Vc5fFoF
         ioxSivfuQm0X82Jo7Xym8SNLcY0hU6GYXfDpcVgkCpqG5HLGnsYUBNAnRB7j0I3CqkZ/
         PKS1lqIFpvM9JWBf8cRaOXDsvHUH/aL7AzO+EUKp8HjedY5VW/MElrhCuqGlMtn3G6ft
         IQxA==
X-Gm-Message-State: AOAM533T9n5vAXONgShmLehcuqFaNLR0M7mvohureqiNzBQu3xix/E/T
        e/K3lkQKjQTXZ8+yKFWy0jMX/bjmm7Q=
X-Google-Smtp-Source: ABdhPJzaQIoBsDmBFfVHPJAlrQ3vMpSj5qYJbg6jYdYPt0QtCIOTD4PJt2NQf2i6fUdVXLWfRVz3Tg==
X-Received: by 2002:a17:90a:2dc7:: with SMTP id q7mr7499790pjm.231.1631251553315;
        Thu, 09 Sep 2021 22:25:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id z12sm3688441pfe.79.2021.09.09.22.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 22:25:52 -0700 (PDT)
Date:   Thu, 9 Sep 2021 22:25:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Add binding for cypress-sf
Message-ID: <YTrsXU0KPQVsKcQN@google.com>
References: <20210907174341.422013-1-y.oudjana@protonmail.com>
 <20210907174341.422013-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907174341.422013-3-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 07, 2021 at 05:44:13PM +0000, Yassine Oudjana wrote:
> Add a device tree binding for Cypress StreetFighter.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831A03467E5
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 19:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhCWSkM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 14:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhCWSkG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 14:40:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3405C061574
        for <linux-input@vger.kernel.org>; Tue, 23 Mar 2021 11:40:05 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id l1so12614839pgb.5
        for <linux-input@vger.kernel.org>; Tue, 23 Mar 2021 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Zfj/kWZPix3zndHuoxntuoFJOentd9YWLBF+3wiyM44=;
        b=Lw+cyIgu7EwPtgbxqldjniVLHYtdTCLqA/NWK5YN+QksiH33zKjTNsv+WkhJ8mq5F3
         CKYHj1Oz7CXL8TtMpayt2GGHXeWniFJGjBXCTcPfSDkFV3EFLFMdVpz3AKXbOIO01Oxu
         qYG+f+MK3QII0XXcDXmrtKjVUbsqAyIjmIWCPFd8w1/hjssQV2DBtv5stxk9y+0tRUjo
         G8U7I2JbOriQGOt/j10ba38Gq2El5BS4wHqrQY79jd6SM62ve8k3OhHW0sjsqHyeYac1
         qITiLw0Xh6QNcuD1CnlP2iUpeUuVimwhaOl5wpMyLsvq8VkA/Wguu5p0upMRKvTgWDbe
         c7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Zfj/kWZPix3zndHuoxntuoFJOentd9YWLBF+3wiyM44=;
        b=flKNvZ1ePj3x6FDUhs741iTKS6QSg3DZ7PjokHeR2DSf++R/EsCFJVee0UI7ge4xPi
         rk0kd92Psbn76DdkJywLgpRr4jt3DmyoGcQBc/g+pM0hYzJKP+taG4ttHCkNO9EIGRQ0
         RFw0DIJv+h9zRoCZUX8JBIXVuuRAjJSx+CNXbNM7Qq5A8RPh+qT1oxd0gMSWZcsXZgNq
         LppTJ50m903SRDyVYI/52gZOsAoRXvwUeQWeD81PeOi34LLIwtm3DEPfn0S3syycoxpz
         TQEJDiehKiUKsk8LImgP5nIS1F7hcnig5N5Z9eyID1ArdmQAXLmAFzJwnee1pv7C3a6i
         dyJg==
X-Gm-Message-State: AOAM532lUl5usD2yBVeEoSw06f1WUvTVLw89zQaRaPvzq9BYoz7p9cnt
        e1YghgvXIcONLRRccvRp+wI=
X-Google-Smtp-Source: ABdhPJyKqyxVgCRfSIhDtRzDAMuMilUks9vKkEofqWtJ+n95mqagFZ+TGoyFcafnAa3d6OGsGFuE2Q==
X-Received: by 2002:a17:902:ecc3:b029:e5:d7cc:2a20 with SMTP id a3-20020a170902ecc3b02900e5d7cc2a20mr7183883plh.11.1616524805254;
        Tue, 23 Mar 2021 11:40:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id 23sm6441343pgo.53.2021.03.23.11.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:40:03 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:40:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] input: misc: max8997: Simplify open coding of a
 division using up to 64 divisions
Message-ID: <YFo2AUJ8OeOyTx/D@google.com>
References: <20210316211822.49830-1-uwe@kleine-koenig.org>
 <20210316212233.50765-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316212233.50765-1-uwe@kleine-koenig.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 16, 2021 at 10:22:33PM +0100, Uwe Kleine-König wrote:
> The for loop is just a complicate way to express a division. Replace it
> by the actual division which is both simpler to understand for a human
> and more efficient for a CPU to calculate.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Applied, thank you.

-- 
Dmitry

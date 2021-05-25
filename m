Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F49838F93C
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 06:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhEYERG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 00:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhEYERF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 00:17:05 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAEFC061574;
        Mon, 24 May 2021 21:15:34 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q67so5534219pfb.4;
        Mon, 24 May 2021 21:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H6oJyMA8AzxwUZbSo7O7qwM/HYWVVzy5GdBiLkC+T08=;
        b=FiXY3/aKOI42WcOPvbNAT1NDNEosxfTHIuXNXZxh01Jbj1Sg8MQl8l8CTKplBpjIq6
         SQI5x98mF/ZwzaWR9ll4OHJTpVIVuYDoaZhv22Uj1H9+Sp1dckAJgbf3bKTVNz7NWhxG
         vc3B6SVVfOMosPGgTLhx/Wi8lh1F1PUEklyxIqzSgCDTx8liM3a2XX9VbXPtcucpQDEe
         3kfPAHVqGcP2ZeCf11bjcXAMDC5ijOQ2Lsbd8Nf+cXFEz/AgJS3w/qXFaoV5NeSi0ntc
         mc365Cu48KqQ6oxiE4vZwg7CGbgARWiiPJsa7Q1xfGO0a1a6i3tis6T2xm34t4AzjI+c
         wUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H6oJyMA8AzxwUZbSo7O7qwM/HYWVVzy5GdBiLkC+T08=;
        b=AhkrYTa8KfCZDgpDt0vDdVcOWPtuk/KZXzy4FKCX+CRN92Npym6ZWSFbNCZTEqQvud
         bj9CvNPuM0XQNaq+boc4toInV51bzGAYLQewqgc2O8M1QgWYv2Ss1iSdB1PaWYie9S7z
         crPA2GtsTngMoAwq1oslDHm6lc+B6+onlVHS6xdGTHwWxoBx7a5V0xypuFieP4U2qGcJ
         3UETIWHDXnKPyc8hLf1o7m0MzSTIoUEqZs+rTaLAkQJWgXoyG8mKy/6ixggUmNPfXhLb
         NwA23gtg6Wz/ZKZz28j59gy9Q+ThmrqD4Znoaiib7F3BOSnk0mGk+y6YjsIpCISEkGTi
         CuYg==
X-Gm-Message-State: AOAM532jqb5NAvxutBAvlP1YWWgQyQrDP8mo0afhzMLi2f2o57do7PZp
        XnbsJNomBIAmnSRD55zz1z4=
X-Google-Smtp-Source: ABdhPJy0D6Lr/q2ywMQRMgD4mIoRmZI2IcQayqyeeg2DvNiFaFkW7TSPxoS9bgHjV63zwkkHoiLfgw==
X-Received: by 2002:a05:6a00:2394:b029:2e0:a27:ba26 with SMTP id f20-20020a056a002394b02902e00a27ba26mr28133449pfc.63.1621916133986;
        Mon, 24 May 2021 21:15:33 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id c15sm8437763pgt.68.2021.05.24.21.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 21:15:32 -0700 (PDT)
Date:   Mon, 24 May 2021 21:15:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Shubhankar Kuranagatti <shubhankarvk@gmail.com>
Cc:     colin.king@canonical.com, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanjanasrinidhi1810@gmail.com
Subject: Re: [PATCH] drivers: input: misc: ims-pcu.c: Fix usage of spaces
Message-ID: <YKx54ddWeILZ70O+@google.com>
References: <20210428091050.ryr7kxlxre7uhye4@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428091050.ryr7kxlxre7uhye4@kewl-virtual-machine>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 28, 2021 at 02:40:50PM +0530, Shubhankar Kuranagatti wrote:
> Unnecessary spaces have been replaced with tab space
> This is done to maintain code uniformity.
> 
> Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>

Applied, thank you.

-- 
Dmitry

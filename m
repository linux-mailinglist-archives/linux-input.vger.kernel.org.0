Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E44C2BA0FC
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgKTDRg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgKTDRe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:17:34 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE99C0613CF;
        Thu, 19 Nov 2020 19:17:33 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so6495628pfg.12;
        Thu, 19 Nov 2020 19:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a5QGltMhuGEUt+qCg2Y4ft9JeMn/8wz3R3MkTA0qEkQ=;
        b=Fel3w72QdbiWFf/jFb6TPXF9B0gAaki0mjS6HWa/SQVO5aKqO30TjFqEccfJfTGqeI
         8PytpF2mNeWODRrLo5tnZyy8lbEOzAe4eX5qoLyD1VVLcq7xuw3IFNV00zn9dwatkeoW
         dfqvMoMU6jy6acuBflNnwRJ2nZ2Hu8EzZmpG/iuQIXIT8gcfU/MiphGUWjkQC6c3zdzw
         2Vp2/fXP+6lD0iMcRhKjkqW4LT3mjev3c3wbaOQEFXInQzHKqxXxyxnrxiSGb4Hfn5lo
         1r3/zRIZ1X3IzV9WL+9t9AhuttECPqOExfs5ZBARd8UC4N7Npr57reJFEBcFCPdjdzam
         hbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a5QGltMhuGEUt+qCg2Y4ft9JeMn/8wz3R3MkTA0qEkQ=;
        b=W4WsZHWgwqCAn7ENuX70Na44v0hm6Igwgsk7YWADVCi2OqiZGHX+7CupGYlHPHdaHa
         mlhsnh4pl+73XgRASWhtDxvY3XhShxYgZ+XEsHJd/jUOnD7BUyq7+lUa3Blgf2mqFwQm
         TW31+9qomlrLifljgFBYqpyx0s/RGMPmsr7Dv1LiM4aw+7+J7C5ovCQyqamjvuHjMpEn
         zgNTrhsn9AEL+lUKaxTkCV/VnUoPHZ+kp993+6g4+wkk7C+UbLAmls7yiDB8eDI+pCDH
         YrRT7ht7o26v7NkjvfJ+zMl2ZeZhKGNEm1QvCL1KZwj6QLtQQeptuMjZJ2nh1oULnOQS
         8G8A==
X-Gm-Message-State: AOAM530CfL2JDPfASIxbQWZaZqY3ImP+2Th627zT6HVLxZ4y+kXVfZ4s
        0ku6IoKezAZb1Ui4YmqJXMQ=
X-Google-Smtp-Source: ABdhPJyilT4uWqIAETboDc2NhJo0SollptE7Zsa001ViLqANhWlqCzmoutscogHwWeSepMgGAIZ4OA==
X-Received: by 2002:a63:ba1d:: with SMTP id k29mr15077546pgf.179.1605842252978;
        Thu, 19 Nov 2020 19:17:32 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k30sm1145002pgb.83.2020.11.19.19.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:17:32 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:17:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>,
        Ian Molton <spyro@f2s.com>, Andrew Zabolotny <zap@homelink.ru>,
        Russell King <rmk@arm.linux.org.uk>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 11/15] input: touchscreen: wm97xx-core: Provide missing
 description for 'status'
Message-ID: <20201120031729.GQ2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-12-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-12-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:02:00AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/wm97xx-core.c:204: warning: Function parameter or member 'status' not described in 'wm97xx_set_gpio'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Liam Girdwood <lrg@slimlogic.co.uk>
> Cc: Ian Molton <spyro@f2s.com>
> Cc: Andrew Zabolotny <zap@homelink.ru>
> Cc: Russell King <rmk@arm.linux.org.uk>
> Cc: patches@opensource.cirrus.com
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry

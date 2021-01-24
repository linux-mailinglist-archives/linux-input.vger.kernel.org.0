Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF091301F18
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 23:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbhAXWMJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 17:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbhAXWMH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 17:12:07 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7E7C061573;
        Sun, 24 Jan 2021 14:11:26 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id r4so6390648pls.11;
        Sun, 24 Jan 2021 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3k07XMyxSgBhON7tCAEGHEOP69fy0z0cXJslFxRnE4U=;
        b=W8JUReo5lg6CeyckY2aO8LY5mnfDkG/hOKi3JqfP6P/lbeGVFNNDUPSuIJ9GDBcY00
         MoWCSoCv65zell51IDEsMn0HHIJ+Qp4c7VUK0TidQXGcmXm23Kl4Qg+4WU5WjOljzFDJ
         Fvvkk1Sl+AYqSCKzBeo/LQNAxvNBT//7ipTENTRkNBkNjQKTY6RPRq5Tlu19oACiT0xs
         J0DMGtt+eoHg66CvheNLIp2dqX2O2moszejMXPITJAaascQtKKyrA24TTg9TjIoDD4rb
         QeKIsdv3acw6xQQxGf+LGgTK1hX1fR8LMZUfj+5zsQjPeL2Ke1vy5d1Jtk0k3iHzO6JF
         vTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3k07XMyxSgBhON7tCAEGHEOP69fy0z0cXJslFxRnE4U=;
        b=NDn5jfivSpOcN9MVwhZlraDAcNpmyAWb3ciKRnTCU34ScyUbjDAGXhL//20Itvq2bP
         yHOVLfAlq40lu4CuDaZTia87jeJ2xS2S4DpgfJLxZEwkHWNH1WF3k7E9Hno6MF1mjCtZ
         uvPFlvKOG7kvFc8nCUeKNOT6GabkBok55+4DC8YTc7+0jIBRZXFZhD5i5YUSI/qkfo/E
         rUyMNs8tT0+qlgbJ6IPyTM9So5+YIgtn/7U/ZsBI3Kv9U7OL1CibN5Unnv+3dwknt09c
         gjj5emztvC7lMdoC/4L54hvvwzr13XtHr9imylwHJkkqisdmo4fFTeIm+xTl062tZ2qi
         nHsw==
X-Gm-Message-State: AOAM532cW7QxmsjAw+Ktv69VyYEOLNPLcMBw4veg0DcnwvNVTc+63vK7
        wllMf/3s2ZEm6BJwjh7wAo0=
X-Google-Smtp-Source: ABdhPJwhNO8N74+tH9/0NhoErJBL3cqRvNNGSo2ms7x/FXVcVyuPcJrDume32w0EUVN5pkpJ7Jh1HQ==
X-Received: by 2002:a17:90a:9310:: with SMTP id p16mr18752990pjo.211.1611526286401;
        Sun, 24 Jan 2021 14:11:26 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i62sm11257058pfe.84.2021.01.24.14.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 14:11:25 -0800 (PST)
Date:   Sun, 24 Jan 2021 14:11:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?iso-8859-1?Q?=A0Tan?= Zhongjun <hbut_tan@163.com>
Cc:     andrzej.p@collabora.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, "george.tan" <tanzhongjun@yulong.com>
Subject: Re: [PATCH] Input: auo-pixcir-ts - fix typo
Message-ID: <YA3wiywDg34rkO9o@google.com>
References: <20210123035612.143-1-hbut_tan@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210123035612.143-1-hbut_tan@163.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 23, 2021 at 11:56:12AM +0800,  Tan Zhongjun wrote:
> From: "george.tan" <tanzhongjun@yulong.com>
> 
> change 'interupt' to 'interrupt'
> 
> Signed-off-by: george.tan <tanzhongjun@yulong.com>

Applied, thank you.

-- 
Dmitry

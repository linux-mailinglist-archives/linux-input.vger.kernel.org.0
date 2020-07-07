Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DDD21633C
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 03:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgGGBNp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 21:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGGBNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 21:13:44 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CDDC061755;
        Mon,  6 Jul 2020 18:13:44 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f2so16039218plr.8;
        Mon, 06 Jul 2020 18:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b4eXM3PdRtpoGl6C3J7DoKJSy2Tqt4J8k5hDe5hOL3g=;
        b=LGNuOhRHcQosoILXnDZpPx9x0m5FszxBBNLlmrW0XI5yMLsXLNz94njnsC6kPYRug+
         RmmlzWeTkEmFCk5d5MVUTpQME4PMK7GPmBuaLE0+f/pYdbAYFTUbg96wU6BebeOgR+nO
         iLpNwUmC6ZhEv9ZqbXkx0c/znISiy4ad/BH19Pvm0zxcoi5SEgPhy7Dgs5dxmj24KT4z
         2G0XzipYTdyjQNqEKBYDb+6+qm2w/3CAQfH9A8N5hO3+yLDpLnIljEiXjMFTJpcnY4Df
         7tyKPfYX9+lgsGPOq14AFG6Hu9Tkro2oyLEVWvkOyOSkaN//5sGOZPJoSwgb2X7mvJ0k
         bsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b4eXM3PdRtpoGl6C3J7DoKJSy2Tqt4J8k5hDe5hOL3g=;
        b=ERf+NtoynwimJ+4TrAmDd5VNGb5lZDKjpEm/8IwFuszxWtBKhNMIaF7oOx23xOszhn
         +WX8lHbMamOL5bLmlISHBd0T6SfwT7EYIBZFYr4mtDgpUHhE5rE4djyguchvvsK8qSA6
         7rA1t7QPoS6/ZeNvqhqyreIL3Mq5Ps1Ar/5X8jrRixQffB/zycV0aetdA8viXM8FoKQW
         Vrv4pPwNNb1NJX3XNW3h3f/9yGgtd/A4IqnaKfbPuAajemQJkUmeI4KbQeDmfHxAu1ZU
         wV/7tu+AotmPSSUlzhsVO/3wVSRNuLd+1BrFPMpXqlB0FYOTbTT8lS2b3F3j0jxtZroF
         sFyw==
X-Gm-Message-State: AOAM5325xRy7Pkv79uMVz+3soI+vmZC/QjIYpe6Cj3hNTlRKPVstjtU9
        s+Egcu4V4Br90EDA49Yx7+U=
X-Google-Smtp-Source: ABdhPJzsfzJ3c8lDJHUNPJMOZy/qJPxreLh3HU+bHDaA4cRbNyqsLdAbrsNflhlwddO5smJTsICbsg==
X-Received: by 2002:a17:90a:348d:: with SMTP id p13mr1759397pjb.108.1594084423911;
        Mon, 06 Jul 2020 18:13:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a17sm590535pjh.31.2020.07.06.18.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 18:13:43 -0700 (PDT)
Date:   Mon, 6 Jul 2020 18:13:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     K900 <me@0upti.me>
Cc:     Lyude Paul <lyude@redhat.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Yussuf Khalil <dev@pp3345.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dennis Kadioglu <denk@eclipso.email>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Joe Perches <joe@perches.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input/synaptics: enable InterTouch for ThinkPad X1E 1st
 gen
Message-ID: <20200707011341.GC3273837@dtor-ws>
References: <20200703143457.132373-1-me@0upti.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703143457.132373-1-me@0upti.me>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 03, 2020 at 05:34:55PM +0300, K900 wrote:
> From: Ilya Katsnelson <me@0upti.me>
> 
> Tested on my own laptop, touchpad feels slightly more responsive with
> this on, though it might just be placebo.
> 
> Signed-off-by: Ilya Katsnelson <me@0upti.me>

Applied, thank you.

-- 
Dmitry

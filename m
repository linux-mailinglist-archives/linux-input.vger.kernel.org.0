Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72692AFE5D
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 06:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbgKLFhT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 00:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbgKLEP3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 23:15:29 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB8EC0613D1;
        Wed, 11 Nov 2020 20:15:28 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id i13so3060482pgm.9;
        Wed, 11 Nov 2020 20:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qnh+z5WL37YCyxGJR96tE2cf6ma2pmefTHi1Z25RkBQ=;
        b=esrk8u5Ltr77E9ANRFZwfGwqX0y1caFi0sW0+bigt/Q1frzfvRy4+5UKtMyYRFlRw6
         UOLNePs2epb4tiEACtP12R46fpbgbOt2DVYsweQt0fxXLejx1rn0yj9oICRLFfNRL1OA
         nhzkCTMU4JyrOvf9rwOp0UZBo3pvY5xrUTmUhDa/MqKJhWRmrpePcqIJF+cH84mN7AnM
         YRrbRFcUxadM8rEAwdp218eMPnGfgDhPIX784DeuUXMvid8Mv+/nFkyWeEW41Pu8qqqJ
         AhLKu/huboN4hTbiEJSvtgrpy1akSIONwH3Z1iY22ZqENUPBZob/4Bbl+pmQp/wFXHj/
         0ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qnh+z5WL37YCyxGJR96tE2cf6ma2pmefTHi1Z25RkBQ=;
        b=WhfBrwrxfSYVY/oxW/4je6secBVKDRsJ312mxmall07riTkqCTOn+mtQCMCsLu2SeC
         GKjIT55khcMkquBZSTkA30e7CgeiHnQ3nijxSgLUbsiQdvocrHSNv0aDhtguoxbfukZV
         PgPw8zt1j+JrAUXSORjAodETDfxaA+CE3yj+FfYFPYaHyLH4AVsYPsRE13pgHqokbrTB
         Qd8VSYTDqjSuHnADG8IgZpK3NMjhqNmEvk3VQ/rWJxi/H4re6RNo0T7YUoFGX8Vu56QU
         u1CAA+5PJRZThYdo8rI29vzPh1kvPmT6xHgfktGsh8K53R+tpcSWMLpaHbTqouxX3xBO
         cQow==
X-Gm-Message-State: AOAM531tj7H8lbdjUCIFuSmubqSMH31vnpHW94JITPF3OaAoTCJMo3GV
        JGkb2/NZC1vkaXLpY6pQ7+/lgybHIZ8=
X-Google-Smtp-Source: ABdhPJy+YYWbXjnIKgHMBUOT4ZDAw5QAoybm3cPMlWsgNRGJkaHCcnOOCFl9zYTL2+CVz1zmtMKn3A==
X-Received: by 2002:a17:90a:4208:: with SMTP id o8mr7375338pjg.19.1605154528105;
        Wed, 11 Nov 2020 20:15:28 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z12sm4501005pfg.123.2020.11.11.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 20:15:27 -0800 (PST)
Date:   Wed, 11 Nov 2020 20:15:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw
Subject: Re: [PATCH] Input: elan_i2c - Modify the correct input of the iap
 page type command.
Message-ID: <20201112041524.GE1003057@dtor-ws>
References: <20201112015810.9559-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112015810.9559-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 09:58:10AM +0800, jingle.wu wrote:
> The iap page type command of the parameter is page_size.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>

Applied, thank you.

-- 
Dmitry

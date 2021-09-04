Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7310E400A0A
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 08:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhIDGXK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 02:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhIDGXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 02:23:09 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C62FC061575;
        Fri,  3 Sep 2021 23:22:08 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n4so789846plh.9;
        Fri, 03 Sep 2021 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MFtTjA6Me4v1EtwNQS0lXGHS3dDY/uqJ4MgL2eljH48=;
        b=HKTtEgntHKc8fUKUfuzEsdDhdpV7qmlpHlNiYX0A1pqipagEVSNkGIqNQ2y6mj/QwB
         HgVOt1rtGx/S5MPo2EJ+I+/R4+4pribV+sRrJ4kXNqQDW2LFE1EyIzBBuB/OaFCoortV
         l/Osg+jE9xlojSzhonhanRAdLgAEhrA62Qa+WPQ87lVsRhRwZYnwSQZIc22lkruE8XEQ
         72ZfoNSN2qeaSQnLDhhl0amYYpF+wPFDR01/2U/Jl36dGXpLleW27NGdhxhHMcPdWb6d
         Fpg89akppquPgZO7T22o62bBuOEHTAOpZBaPW1IBfh0qusJBCvUlQ9oYnIou8ZxtvZmt
         GHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MFtTjA6Me4v1EtwNQS0lXGHS3dDY/uqJ4MgL2eljH48=;
        b=C5504WCLTTjXv0QMuL8ZK68EIzjM+4iH76KRSUmzAo9mRSHMVSpLMrbOCId1GGG1Bl
         4iJaxV/Q9dQTQVnwqrX3Ts86oji9Q7KGbnDOz+iOLEoYX+75mVbegzqpx+QrgGoKWBr0
         821UlEqaGYy16OWgiHdekCsmwM8dKKUBbid3ZtBOtvMQL3WaalHSoLIe82fvi5bAIEm9
         Z/TMz4Q6RsqGdGtBn4u9+j1x3dHbpiQHunECVQBkZWzawj1lYE56fjLGQ+ZI+R8EICLv
         lAWp8wpeycZMkvOCFTRM29ZPHSFDZSwRrJYpQobXGmheUPjSJ0ul0GygepN5wzh67o+e
         G29Q==
X-Gm-Message-State: AOAM532MPCxD25c5Hv6Duha72VFxrw0D46QqzcWq+qKc5DnyQlTkzzXl
        dm0Y73FHkYNqvy5K2ydHagnwFowIV8o=
X-Google-Smtp-Source: ABdhPJy+IZNPdqThOmjNh73zbmQsz9xGJcjqRqUZpYS7ltr9Gom2rEyypN11uP1Rk23Em669CSC4QQ==
X-Received: by 2002:a17:902:c246:b0:136:c582:ebd with SMTP id 6-20020a170902c24600b00136c5820ebdmr2012973plg.61.1630736527870;
        Fri, 03 Sep 2021 23:22:07 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:44a5:4d4e:ed46:daa])
        by smtp.gmail.com with ESMTPSA id j17sm1209072pfn.148.2021.09.03.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:22:06 -0700 (PDT)
Date:   Fri, 3 Sep 2021 23:22:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Fix spelling mistake in Kconfig "Modul" ->
 "Module"
Message-ID: <YTMQjL1i0FMtVCii@google.com>
References: <20210704095702.37567-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704095702.37567-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 04, 2021 at 10:57:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry

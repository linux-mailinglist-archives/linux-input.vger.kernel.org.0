Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660DB2D8147
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 22:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390662AbgLKVtg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 16:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390546AbgLKVt1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 16:49:27 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C45C0613D6;
        Fri, 11 Dec 2020 13:48:47 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so8021150pgi.11;
        Fri, 11 Dec 2020 13:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pHpWKSn31l43f2H1717TfLOC7MUZHKw7FosgRYUrlrc=;
        b=oCcvSqoJfTdJZ3YkzPODs1BQRZ99UkyrPviVnc2vBbFT1OkGN0AA+lkxWd/cBtc3tU
         UHnk0AdUgmhjiZ2wWWFEqhLwV3eg1A9bHyIIVj3Nc37ae6aok6FQQ+y6maxWtD5KtPP4
         D4b/iErr+7Oq0q0w3L07faaW5mSuMUfYlCHYh6aL/9kwmzH7qlTXOTktyPBKmCRK07yx
         z0FAS25WgZxwTVOTpSagskhCjIlKT2fiDulqI0nJIZ6LKkPJY9anJg18G+76+bk0w6Bl
         AbDJuJjVpmwZaWjwQsBca2FgrgLJQXYapsfsNsWMfxM9ODkBR42OXU6pYVzSk/NEtIOW
         IjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pHpWKSn31l43f2H1717TfLOC7MUZHKw7FosgRYUrlrc=;
        b=m9wV3a+T8uNzqZBNjjj1dTsmVyGZvVrMqtEV5miyPi5HJbERS540k3ePFNKLqeUY0f
         8AJPtusE2053rPz0hC2fgMBtgUQnGyQc1GEhx0vBcDhRZin229sSjc1TsR2TF0YtmYDK
         hmMxoP8oV5p3bw+BQ5GGO9GxYcyeLyU+ZJlXiCatPvz0he8GJG1oEm3pnatrc/FCdptg
         Ptp3JfnIDevCJeTHqqMnaRNbDbMP8UDH+cgMczSfE6Ni3kGxArt6RvHDiFT8rCwFnhKg
         BX9ehl+SuH8elYGHU1d5SVtZYcT1R2ZTVuqpMdtoIg5rQcTICunh677+zBHN6hQ5k97s
         cDBw==
X-Gm-Message-State: AOAM530nKbr3JQwTfoFpaUQuoJ0UPPvZtDGAvAQKM6mW6lD//FBvSOBT
        w2AkqDrwN/vB7KD3iJh+pv8=
X-Google-Smtp-Source: ABdhPJznz3tmOkmUqAYL6KS4gGcW2zJLa62nv7tdxVTopFcCtPoxLxIodwqJ4RHd5MpQ+NchlPf3dA==
X-Received: by 2002:a63:2e05:: with SMTP id u5mr7562182pgu.239.1607723326476;
        Fri, 11 Dec 2020 13:48:46 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r67sm11672581pfc.82.2020.12.11.13.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:48:45 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:48:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type
 0x5F.
Message-ID: <X9PpOaN8KBwkOr1e@google.com>
References: <20201211071511.32349-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211071511.32349-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 03:15:11PM +0800, jingle.wu wrote:
> The 0x5F is new trackpoint report type of some module.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>

Applied with few minor edits.

-- 
Dmitry

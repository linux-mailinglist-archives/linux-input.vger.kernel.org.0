Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA86139CBB0
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 01:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhFEXVw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Jun 2021 19:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFEXVw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Jun 2021 19:21:52 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3405AC061766;
        Sat,  5 Jun 2021 16:20:04 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h16so7613061pjv.2;
        Sat, 05 Jun 2021 16:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EHOgEydSh9+f0K7RDourUcztPS+43uYqhQL+HmK3gfc=;
        b=ck/JbiYSkmyLlHgzOC5W05WQSkIN1yegZ0mNuJiIz2oQxqq82ywWjKn0RN4SmGTo3s
         e2RmljrWNossh37U6FR89v2++5sdRiDdXQRvTjiQPYZ40cnv6Z5HKtfATIAnhwPW2gg+
         1TmYEnTdX+VR672DZ7QQt+gxjKWgDzNUgdriMN995I+jnLWex2DezAQCvzkPncewP5JW
         UNddyYwyGGFfO4pgMVLBAaaasGKj4GJIteUt+DU+z5rrNS/j1wfL0kCfs9ekcZ7U7jb8
         4M1+9Qgu09seQDXyFVKQuw78vuaYW/yxmeZ4qZlZhNcNP5o24CGICbqLMmZ8yLmetnus
         I/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EHOgEydSh9+f0K7RDourUcztPS+43uYqhQL+HmK3gfc=;
        b=MynLSV9hNYOjzEWs2pqzR6hYsm2JIiqzIPq+nh94voSDC8b0lX60WPn9lsT6Xfkqia
         lMHRs635Yeu7o4Ms57aKcRKsq5Xlz4Ijkga8aaffNZmKVxoNxI4H6TJoWoYsUgKIjsuz
         KsWLNqUc/jwW84Y3v5zwXU1AUhd3sQySplnOgCgoqpAHkyVObxrC97vN+RLXHPXGWRjh
         yGpEL9+HGDMmIFDwhplEez0efGWALR5khzyZOtX56go5ml3o/6M3sJwiyL3s3IM+60Pr
         pBUspJziQrqBIbS1eFfOKyztUBq7g6H7Bm7ePlsfwsocBmD6YYDuAjfUM98xLJKbrwzG
         8HfQ==
X-Gm-Message-State: AOAM533lYFlCio26ISRIViF2SP98aRGPKWhng18Rz6m6ENVGkIp8m7Id
        ww2yxXll5p35oStZx5/H4Po=
X-Google-Smtp-Source: ABdhPJyhunINVUM8Qu+6CCtPfFcyEZhDYekiYYIchtIxUFECds1bIzuN3AT1+9O6d0G6IPGNLugmNA==
X-Received: by 2002:a17:902:bf04:b029:fd:7c7c:bbf3 with SMTP id bi4-20020a170902bf04b02900fd7c7cbbf3mr10858171plb.59.1622935202678;
        Sat, 05 Jun 2021 16:20:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5762:ab6a:6802:ef65])
        by smtp.gmail.com with ESMTPSA id z7sm5210936pgr.28.2021.06.05.16.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 16:20:01 -0700 (PDT)
Date:   Sat, 5 Jun 2021 16:19:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] Input: resistive-adc-touch: Fix uninitialized
 variable 'press'
Message-ID: <YLwGnzqb2JvKKNnm@google.com>
References: <20210603220809.155118-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603220809.155118-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Colin,

On Thu, Jun 03, 2021 at 11:08:09PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where st->ch_map[GRTS_CH_PRESSURE] < GRTS_MAX_CHANNELS is false
> and also st->ch_map[GRTS_CH_Z1] < GRTS_MAX_CHANNELS is false the variable
> press is not initialized and contains garbage. This affects a later
> comparison of press < st->pressure_min.

If neither of the conditions is true, then st->pressure is also false,
and we will not be evaluating condition involving "press". However it is
impossible for the compiler/Coverity to figure this out, so I'll apply
the patch adjusting the description a bit.

Thanks.

-- 
Dmitry

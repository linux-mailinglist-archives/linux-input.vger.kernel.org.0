Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418C8402378
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhIGGdz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhIGGdy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:33:54 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EB3C061575;
        Mon,  6 Sep 2021 23:32:48 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so863488pjc.3;
        Mon, 06 Sep 2021 23:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=64mFdYVl7BVzf6+d0qvVIdoyZ2ivk+Bi5jIPYprhUgk=;
        b=lxHSCUspWlrhEoh/wiLWSV7D7oQlUpK4u/+d12AcT+uRCrxRSAXEpaU0Nh50pSpGae
         bK1vOgZdPpb4WivsOvYMSh04WVuP07ILDwPa13AsM1ryzLLZlZQyGiqeB4irgiXn3dDe
         wnW8WmDmNeM4x35fBkAPg1FhcmRvY1IHrVv9PfiAmkruzSZCsvN2Duo98nR5/+dqyhV3
         ULoROPZvG2LwhuXXVcLBEsC1yQi1rxkY9SjapsOb8h5qDdM2ZQI0wA3X3qbelhg9fpFq
         jtWJjHPfQP1JNMcyM9Eku8l7NI1FG51SU03YgrDlsCRxXO4MXSOUEg0Cf1G1O0Mn99F5
         LlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=64mFdYVl7BVzf6+d0qvVIdoyZ2ivk+Bi5jIPYprhUgk=;
        b=W84stDXGjmkZCj1orSWBSZBnMWFdhSm8TDkX3f/OV57fgCJbOVUawE9sFji53OgukI
         I55VXDBND/FLFpQTiqnNPKs0K3IxIuASBKdu8MZxcKaEmZ1ouc/DsOSBDHxBy4gfzKbS
         HaCOGa0pyN5xNZ9wcBJiGwyqh/rBKZ4LaHMsM4HiAZDzCq0zs/GiqxfV7EfaoTn1Pmo1
         Rj6iWU/h9e1LkVaBlPIb6GHtb53M0PnwGNBbqzaeBHdShhKdUGGsx1ZhLWNqq03Oq7Bh
         d+tE4wSp0oWwaQy6F27AYVwr4DqYs6E85EYoBzvy6PapshgUi6wFjzGrP5Tl3BZDjjmu
         PF0g==
X-Gm-Message-State: AOAM532sTRrX/kmi2VU/Ky7okPbVJb/SlDbC3UoQi7G9iUmDaaY5g9/D
        vbij8IrWoc49Luv0VHMO8lQ=
X-Google-Smtp-Source: ABdhPJzlOMZGlkAuJOGhUdMmx3sx3AudFBTaUA7tEA8sZK5HI/RQuT7w/wdie96+zeSVSgZanLiWYw==
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr2980309pjb.85.1630996367916;
        Mon, 06 Sep 2021 23:32:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:668f:8a8e:5bc5:fb2d])
        by smtp.gmail.com with ESMTPSA id gw21sm1137315pjb.36.2021.09.06.23.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 23:32:47 -0700 (PDT)
Date:   Mon, 6 Sep 2021 23:32:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] Input: mms114 - support MMS134S
Message-ID: <YTcHjJUG2S1WmS1Z@google.com>
References: <20210706235951.189289-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706235951.189289-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 07, 2021 at 01:59:51AM +0200, Linus Walleij wrote:
> The MMS134S like the MMS136 has an event size of 6 bytes.
> 
> After this patch, the touchscreen on the Samsung SGH-I407
> works fine with PostmarketOS.
> 
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry

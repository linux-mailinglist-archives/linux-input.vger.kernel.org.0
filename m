Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061E630211F
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbhAYEdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbhAYEdF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:33:05 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB50C06174A
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:32:25 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id t6so6839340plq.1
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g5ULN2Xiohn0YmqK6IJv9dHNgbiOdKMiqMVO5vM1SSk=;
        b=Gln4VjP6VCnWSYSseIOaRVuCHXzhc+QQZDWKWElK1WiItcbOTI2c0Nt5fzoiqk137Y
         lyfJfxqv7QG0Zw+zLi/lMmUsEPYkWlQ2tDBz0ZyP6glX5E0bVUy57xFjYSQDwq8WI7sp
         NywhC3OYKke1cDbMDce0gHxbU6+LHGzxODlxSop9OqqJJLtxaDTrb8Q8t49yBS1QpYo9
         jqTvtmIGy5AKbZJidh63cfVF/AZqMqfix8YqmsigW3rYli7wu7o0CKb1DtmfUWo04dYY
         BFUsvsE1cfOcMhN5l8qmmac7z3IWVUsQS7sCyV2bNVkPlOAREKYN/1P71sRbumbyf//V
         VgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g5ULN2Xiohn0YmqK6IJv9dHNgbiOdKMiqMVO5vM1SSk=;
        b=o4PEAOsV6zWZD4SPPhCCYVn2DxY5l37SWW/PULtaY66tcTFEdVk7wx+PS13p/7PTUF
         Hr0lK5AeTizyXdU0wZVHEHLqjc46qUlebJu9+kHlow4n33UNXPzfH2ROfCk/yelUEODM
         dzZWjllxwYCPUcjKZHxXp/MPasxY4ws/H12edeNlP73XGRzVnDMP8oCJFwt8Ha2uF5QS
         bSqYG2jiaum86QwrAt0ZD9EzG7XPfIrh42fsm/Xlbu1IXW2kh+KNplFhZukKI4O8ncFS
         cIv1V8nxUtvrpja5E6NiAGqxiydNIL+d1nu5lcwky7CpPmQyGRwA05QbPdI58FJZI9iE
         8mTw==
X-Gm-Message-State: AOAM532mg9xBxXpBFwNTfua+Fa0KQFlV8EB+xQBYxcVu2vmSLqTZbGY9
        pi7Af2Jo6Zl08wn46dCchww=
X-Google-Smtp-Source: ABdhPJwQk9vV60GmNPobk7KNs/vEnRrsulhcaVipsweKdP/UTEkHtwatx81BMN3/gnJsGezIK7XPZw==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id c8-20020a170902b688b02900dc240a2bd7mr1623136pls.50.1611549145238;
        Sun, 24 Jan 2021 20:32:25 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id o14sm17215417pjf.12.2021.01.24.20.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:32:24 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:32:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 05/10] input: iqs5xx: Re-initialize device upon warm reset
Message-ID: <YA5J1RFK7Hy8g/ke@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-6-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-6-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:41PM -0600, Jeff LaBundy wrote:
> The device may be inadvertently reset during runtime in the event
> of ESD strike, etc. To protect against this case, acknowledge the
> SHOW_RESET interrupt and re-initialize the device.
> 
> To facilitate this change, expand the range of registers that are
> read in the interrupt handler to include the system status fields.
> 
> Also, update the unrelated (but nearby) SUSPEND register field to
> use the BIT() macro. The remaining register fields are cleaned up
> in another patch.

Added linux/bits.h include and applied, thank you.

-- 
Dmitry

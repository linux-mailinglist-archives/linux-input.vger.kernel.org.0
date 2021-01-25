Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7803029C4
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbhAYSOz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731341AbhAYSOV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:14:21 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F6AC061573
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:13:41 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id kx7so89541pjb.2
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HiTpZoDhBydNpmFDHHaZVSTv8XGM/RxlSdsszEQJB2I=;
        b=X3r17em81jhC1+heCEqrcBzEMOh0hsr/lnCyUSm9a6NG6IbUAldow12ojQB/GciWQU
         ySG+CmWTo7LeurYR9GE+EJ/GRyMetvCzoYrZuINYmiQPDQr23f/A/ghc6cWJB1ZjJmoT
         KIhYNZmu8WHd9Qhn4vcCKWl6P+9dwvZhHFqvPmoU3HbiiGZG2xV9hR5l6U7SHL5u4Ycn
         UvcFN10FxG0BbMhhLw/53FAi6l1vMiCYWA+eVClHJ9ZKH0wfiYSD8LEGO3EIMRiQeCtw
         mW1T2YfSYyhtlSM6XMNs8WCs8/NkJZKGL6dllAiYGgEDsKsNuROQ/Bvy6Kscwnkv4V03
         bG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HiTpZoDhBydNpmFDHHaZVSTv8XGM/RxlSdsszEQJB2I=;
        b=oAqf7HLO3mXLW5hyUJ2yjbD0fJq1Q+/SKvnPf4W7b9frX2jB5ziTi/RuVHZMBtzj4W
         Cenko+vkB6Z89DmN1V6alLojM7i+j0Ko/n4zZfan0qTSsFk1SIYQeBrgS+G+Zsr1PZVN
         nttxBwy18oDTrKjyQYFlYR0h7/+0Zy+9tNxVCGN1sb3IOlRvwkWWdf9ZCA5zg3nc3t9x
         FjdoUprNO4K2nJiRuAmTp0sPbGEPfMTjtwd5NDyGttts3Q3OcIThqfXcZtYmoUs/euJZ
         A5nu9aRYH1HlLN0qZlAj1ez+hebFRcDXmSmw6ig5iSrBTZruyC1BpB4cihC5J5SVcXoF
         ZRjQ==
X-Gm-Message-State: AOAM533G8qn/NaCwQ26vhrETQP9Rlc7omMLpP+vuPiuYMlhf4yvC34w5
        NTXnJJHGmV8UQXm8t+Gks38TwyetF8c=
X-Google-Smtp-Source: ABdhPJy29vy+VHZq+I3tVJuvq0vkH6WROMUZG2QKZ99C/H9PbGvpWnx8hk5s73v3pKoXyzSGE1Rc2g==
X-Received: by 2002:a17:902:d894:b029:db:e0c6:49a4 with SMTP id b20-20020a170902d894b02900dbe0c649a4mr1712696plz.1.1611598420920;
        Mon, 25 Jan 2021 10:13:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k5sm11926560pfi.31.2021.01.25.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 10:13:40 -0800 (PST)
Date:   Mon, 25 Jan 2021 10:13:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs5xx - initialize an uninitialized variable
Message-ID: <YA8KUchMrB24GhHX@google.com>
References: <1611592500-32209-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611592500-32209-1-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 25, 2021 at 10:35:00AM -0600, Jeff LaBundy wrote:
> If execution jumps to the err_kfree label, error_bl is evaluated
> before it is initialized. Fix this by initializing it to zero.
> 
> Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

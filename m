Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6987C30215B
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbhAYEpX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbhAYEpS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:45:18 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1163EC061573
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:44:38 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b8so6812103plh.12
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HsaAtSluH3z5jCcJTZqjSbCo66izivwUgTVGL9IL/RM=;
        b=DoVyV2KYXH/l8LmXZOfqSD+MlAVr6/d8RLlJHSQuHgpanQBDW+4YCUeXzf2uPdOGnt
         SxZRlX09LtCDC9rvvAIm2jFVPaHEC1zK8MI8y6U1kdfMsow3uk9TUL24iBacgIXpw2g5
         V1e0H/9qjjGnziB9jCEAwSG5fAhxVt2W8Vmf4u25WYDMnOpk+yxJi1TKtRYf6T+5w0rS
         I9iDdMAanjB9jE37asaPoXuChqYTHlDuyhWqZNrwS4c6ZWivy41Lgct5bux8jKJhqpHm
         hsLP1GAjlY5VdxeDSi3+sFDs8rU2Dc3cuKqT5TsjeEOqdi8cUudJZ9k6ViJvOmcxQNTP
         4OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HsaAtSluH3z5jCcJTZqjSbCo66izivwUgTVGL9IL/RM=;
        b=DwfC0palysz7ZHYKucD8uIEgUsUti1Mt5FcBqec+IN84O8sbMb2zt3BAYhBtXz1bb5
         /6CmxhD99Z5mCOByJDNJRYpmjcFlwEK1RY07HAzu2h1fjCn029D92tOya5fjL9OA09Dj
         fWheHNPiVUBKx7Pbr8W8nsvSPm5wuqe7NGMmaqjBi7OTBOFnux1OJX9SkYKZ/46+FJ/4
         eeryRS23n0SUQsZKkPQazAGPJ+Fu0mwAciT9rjq0/0Ml2pMJ8y1yXusRh63VQtHIhN/j
         PSij3rl8ozRl/u3O5Lx9NqwsZiC7amZoU8iyUNzQ8xaxfSt/kVqTOhAG6bLlO6MsvyFe
         BxdA==
X-Gm-Message-State: AOAM533kiuckpCvCyNvdbTfwH19kwwqOkj6+bRrl7o1ebqWsONGocwVS
        QT/n9cVhcD3BfZBCdVv40rCXf2b5y6U=
X-Google-Smtp-Source: ABdhPJyQ2gaJN5WK3Czu6MSFqqX0aw1tjrsZRjPNcO41xvLufUKAX/bM1bqvi1LF3xxtSC4hRoHiFg==
X-Received: by 2002:a17:90a:3e81:: with SMTP id k1mr2998757pjc.13.1611549877523;
        Sun, 24 Jan 2021 20:44:37 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b185sm14573605pfa.112.2021.01.24.20.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:44:36 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:44:34 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 10/10] input: iqs5xx: Allow device to be a wake-up source
Message-ID: <YA5Mso4eawuk90UU@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-11-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-11-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:46PM -0600, Jeff LaBundy wrote:
> Avoid placing the device in suspend mode (from which it cannot
> generate interrupts) if it is defined as a wake-up source. The
> device is still permitted to enter a low-power sensing mode on
> its own.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

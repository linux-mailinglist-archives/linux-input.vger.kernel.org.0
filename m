Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3880460F87
	for <lists+linux-input@lfdr.de>; Mon, 29 Nov 2021 08:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240920AbhK2Hsz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Nov 2021 02:48:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238289AbhK2Hqz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Nov 2021 02:46:55 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29369C0613F1
        for <linux-input@vger.kernel.org>; Sun, 28 Nov 2021 23:43:26 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id c29so4242477pgl.12
        for <linux-input@vger.kernel.org>; Sun, 28 Nov 2021 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ep4+IvQK2q9+7Qz5pTGwIihA0IWGVUMcxXrRLICeZN0=;
        b=Dy8xjqSFadU86p7O2LSrvkanbnccCvczO1obU7wNyPxAOThSQSjqAFoGe1Evdk88Pk
         YlM2vlH5iXGqZD1tguU4KQ8LMnFhXREdvgenQ3RnZtYvdTHSJqbMv+yChGxHQCLomJ76
         Wf+uaYeMJOZhCpDVhi/+7idMjU9PDu6vRux9QwnEtgzByl0aaxTwNlT9Dc6UKintt3z5
         M2C1vBluiyjUQeI2D06JnkwG2nw7n3lU9BKqNgIJAqL1xkFKr2heJoxT5izHpNBBkEzY
         D8JxcPxlm7cjHMfOrvjtZ+qOwHOL2hNVkLPXjuLShzEK5nUOzpEXbqiOOu9oln7WHfev
         rkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ep4+IvQK2q9+7Qz5pTGwIihA0IWGVUMcxXrRLICeZN0=;
        b=FJhq2EEmfTJ1MrVVwS7LFMJm+XH2ozAhxS0LNKeu9XLuxxhVHBtCkujJBFP80QAnI+
         VG4nVpJOCdaxCmYoTVfKhinxjSEjGv767HmgnXP7R8eu5NqPauE3vGOh3vqqjVml+IpA
         /oVoTsbevNt1j6nVC3lflvr0qXztXhMhFfzj2FH9WpOQMK1xb/RoJpAMAwjNwcoI8AqZ
         EXaUtWO+KPSQgcrEiq6Ir7J3aheDQm7McNaejVupo4byIrNGC+45TeQkHGE82e7Ag+4W
         EZ58kVC92TOnTSVYm9CdC8J3DHSlWkkFFo0AbYmZMpXgj4oI8D2bTbNhkcDZ8RYm74du
         3xjw==
X-Gm-Message-State: AOAM532xLiBSRbOU+WYtTVhWn8q6+KRtyK3W1dBe+oxJmYy0Wt+BAoDs
        /oKWjWWnTTLZ9049Adw7Omg=
X-Google-Smtp-Source: ABdhPJyHlqvfci/YuAW+2Gt3SujyDI3ByTQjqXR4Y3e/CADuk9tv5Oct1IGQ2W64dxDzr0IRcVS9kQ==
X-Received: by 2002:a63:2402:: with SMTP id k2mr34056993pgk.353.1638171805588;
        Sun, 28 Nov 2021 23:43:25 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f5d5:95ab:43b1:99a9])
        by smtp.gmail.com with ESMTPSA id u6sm16162233pfg.157.2021.11.28.23.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 23:43:24 -0800 (PST)
Date:   Sun, 28 Nov 2021 23:43:22 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Input: iqs626a - prohibit inlining of channel parsing
 functions
Message-ID: <YaSEmkjei5Ml+t7Y@google.com>
References: <20211129004104.453930-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129004104.453930-1-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 28, 2021 at 06:41:04PM -0600, Jeff LaBundy wrote:
> Some automated builds report a stack frame size in excess
> of 2 kB for iqs626_probe(); the culprit appears to be the
> call to iqs626_parse_prop().
> 
> To solve this problem, specify noinline_for_stack for all
> of the iqs626_parse_*() helper functions which are called
> inside a for loop within iqs626_parse_prop().
> 
> As a result, a build with '-Wframe-larger-than' as low as
> 512 is free of any such warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

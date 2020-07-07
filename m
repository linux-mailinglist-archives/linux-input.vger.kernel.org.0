Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4D21630C
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 02:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgGGAim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 20:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGGAil (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 20:38:41 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C17DC061755;
        Mon,  6 Jul 2020 17:38:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so6740914pls.4;
        Mon, 06 Jul 2020 17:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4tvS8IktrWs5/Kk8tqKJKsgBXlSc0oDziPVJdcObJ2g=;
        b=UHd7BhR8vH9lj/THHnyhQidKZiopTRTIpPeQ3iTW6XnSoBW5db3keAqzdlEVV4nwiO
         ua5d1Ksm+qwpHOiKLH+6lGp+/3I8GysmBcbTe5p8aunqomzjNMepIDT1Ql5RJw/HC3g3
         ptuLPtyCTL1oDETmmHEJqJV5QR3jwcGp5Ca9XqcfU6rf2F0ZcNOVS6F+5atLLMz2FdZX
         ju1JwaE5w+XD5Q/zezWF/1rNxh6D2tdI08dvMPszjQoAh0caSXRZk6BjtWrNCYg2iU6K
         nT1A1cX4eSca2GDbkF+kgy3s/JGUd6NREl6KK2dgr1f/15rtdku0tkJpXUVsT1qBp8T/
         MGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4tvS8IktrWs5/Kk8tqKJKsgBXlSc0oDziPVJdcObJ2g=;
        b=dNT40ESVIP/cIb3gdNf3oeN0OS73iVjmWyaX/5Txg5SsUgws2ytXrjBJ0waKbnsh5m
         TYkNlf8z+vMFi4+2uusZ8/5SPRVLayh8XAmAIoCSBjr/hf269tjOJ8Qyeu2dtuqVwDN+
         rxcRSVfc2JfLu5voWD4vezhfChUr9FoqAZtg4JPcV/dfICzCgfd0oFsJrK54Uo0LFOUl
         a2Qs5rovsmomcCqoMhn2q6lLq/mibR/6bEs6CqMNz8bCAAyOLcG2LzMqVqoDJXnUkr5C
         Nsh22srfgZ0bBuz0GCZ1BeU3JwXOKhN6fae7Oll1HEgizjARpfgs7y0XrJahSRDODtah
         kyKQ==
X-Gm-Message-State: AOAM5325R1h6MtPRH+1k1vZ4l6YO+b7+2j01cK6mzUMbjhc6egLBHtFY
        yAdmmiBl286xcMAKfVRnHzk=
X-Google-Smtp-Source: ABdhPJwsvweceG0eHRZ5WNlqqS/WpPHANTYjAUVhSiywwAC4RcJqj2SuwmNC3qiXWb0Spsg9mblSDQ==
X-Received: by 2002:a17:902:7c8b:: with SMTP id y11mr41154211pll.53.1594082320903;
        Mon, 06 Jul 2020 17:38:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h1sm12524182pgn.41.2020.07.06.17.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 17:38:40 -0700 (PDT)
Date:   Mon, 6 Jul 2020 17:38:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: elantech: remove redundant assignments to
 variable error
Message-ID: <20200707003838.GA3273837@dtor-ws>
References: <20200603140431.131347-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603140431.131347-1-colin.king@canonical.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 03:04:31PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry

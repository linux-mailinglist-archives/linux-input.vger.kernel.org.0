Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD90F5049F9
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 01:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbiDQXIC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 19:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbiDQXIA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 19:08:00 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0852B7DC
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 16:05:23 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n8so11085719plh.1
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AbNtMpVSWDEBXG5Ig+gx4B6Rxr0RScdSPo0CTT/kw+8=;
        b=SoW0a/T0DVQcz3OZH9lwquRBWzrU6HoPUG9GZpHOrsZlEVIL2okbTaxHslf9LD0MKX
         /Kh/zgxhnnhRzGltYs8nKNm6c9TGSiFSoSaQI7QQq5VVhWzKRoljugR6MA2TxX3OnIN7
         2s0g2OnLdlaj+Pl5q77Xu+Wq3aZLVFsKTXR8IEVu/+emRwjJAbnNiYzYiEI0HRqA7YdL
         jvpRRbOiFi5ttzGeiGThulteC/JJRkA4vnzGPNM0uXknIjM/05cI7FfwrTHKAEzkBtqt
         wxIJNxTggOCJ+GeJa0mpuk/x03hlQGzXxUCI7vZOpitxTtVlez91if+9pO/peqNsQF6m
         D+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AbNtMpVSWDEBXG5Ig+gx4B6Rxr0RScdSPo0CTT/kw+8=;
        b=2DBgqMsbmRPvPYtY05XImNcDRI3ApFYqyZcwNgxoCuvEm/AdktcVO5+Aq6VO84b7pL
         u5ASNcliVJOcNwiaaI0gpU9Wsp4+5gmhol7ufqYRAGh/Uyxnogg37bwBAfiH/KZuWD1q
         MgTX7IUnhT90MG7nxy7M4jxS6IEVQ5GilMihYOfNOYvRfdLiNRd0a3IJKCIYPQmMqys9
         lH7WkwXqmLhU5xVZ9stJmJXQgajzI5n+8w0yEQgW7r+I32s1AxSfqq0EwKGLTYEs2Z9l
         JnztqE6nIJYxvjaGsvzpsR42UgbNr0j/vx9Lu85hYEc6nhNmedeuZn3BCdQIINGY448L
         yzTA==
X-Gm-Message-State: AOAM530BrGL/n0fIjbbO8Yca4jeflb9VPg4cNBarm9C5mQfd+pkkKnNy
        cNPz47IKeQxCjRqEBSUqQ08=
X-Google-Smtp-Source: ABdhPJxFrQKcVK4C/b3oC1X68WbSUHTxuJ7OP5Gyo37252olot6eJygAQCQwA6Vrrbl3fyONYMSPGA==
X-Received: by 2002:a17:902:cf08:b0:151:9d28:f46f with SMTP id i8-20020a170902cf0800b001519d28f46fmr8458191plg.53.1650236723023;
        Sun, 17 Apr 2022 16:05:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1752:34a6:ebd3:cc40])
        by smtp.gmail.com with ESMTPSA id b10-20020a056a00114a00b004f784ba5e6asm10532601pfm.17.2022.04.17.16.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 16:05:22 -0700 (PDT)
Date:   Sun, 17 Apr 2022 16:05:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] Input: iqs7222 - avoid dereferencing a NULL pointer
Message-ID: <YlydL4+m2jhcwMFR@google.com>
References: <20220417214132.497487-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417214132.497487-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 17, 2022 at 04:41:32PM -0500, Jeff LaBundy wrote:
> Select callers of iqs7222_parse_props() do not expect a child node
> to be derived and returned via pointer. As such, these callers set
> **child_node to NULL. However, this pointer is dereferenced in all
> cases.
> 
> To solve this problem, dereference the pointer only for cases that
> expect a child node in the first place. In these cases, the caller
> provides a valid pointer.
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

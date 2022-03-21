Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE1B4E1FB0
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 05:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244015AbiCUFAR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 01:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243479AbiCUFAQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 01:00:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D77A1EAC9
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:52 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id l8so14535659pfu.1
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=A56M+iidt402+wu9IlTfyumpQTqoIlxIKWbqpo6VwQY=;
        b=QEvD+FvdaO7NyO6hKfahzbzfn4x/Ln0vUvlsxLcU2b4OzrOUJ/GVFJIH7Lrv+y75I+
         GGV5xAcutNOhms1AU7Xdu5ILU8ay8focJCKWZzwkwyI4gygTIfyJQihtFLCxB4uIc2Nu
         RqPeIyLhXN6skN6X1Sl1zVEh1vdfOC3OBarvGRNzp9hlujlgr/RQSL8D9kSJ/yQosNFY
         q57xbpIHhElOYubefzjkYraeBaE/akJNWop6CYqmvVQjc+Lh9Drd66IERJ6+EIkldoN0
         bQcfLThML10WnEOvxXkCzX8CryP6jNt+fzazIQoUdL9uZ+xtHvOrj1jZD6+MeOTebjto
         +05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A56M+iidt402+wu9IlTfyumpQTqoIlxIKWbqpo6VwQY=;
        b=sHZs2KVY9w8txwZhaO5SkHuCGZVRs587nQQlJ/rGhlfWCfAzPwFMH+sSOt2SW85/sU
         ZQuZ8NYWZfo18CXJYsMhb9oJEvle5nVLqMrZt7wazxfaGHSkM4eqOG2m5N6303BU2Z/s
         76hcWCn4lH02vnuFL9yC9rvhGDhzU055g6dNsvJidZ8TbqP4dGGvvaZdmVV2UwDy4iLZ
         IAGoAxEAxqoQKkxa/uvMs0rRChlezR8i3c3zsnLKJz46bWmuqBLE+cJo9dhro2eATHPN
         LDK4Oz/6Nl1mYgOdL3vDuTamzKL6pkuL8Er6nGgNMwaMikqkzMG3m84SGGmgvj4F29AK
         KysA==
X-Gm-Message-State: AOAM5338Tg95nbJ5MipdeqjmgFSb+Otu5pbQVwlv8hqhTMjmVZNHt8+Z
        iaw9gAWAc6a/jxC8c0i+xdI=
X-Google-Smtp-Source: ABdhPJxTA6AdkWoKdY89W//kICicNtmuxxsyOK1q7lmBERPbeT3FyGCdV7UB1uRkxIZd4JzObrByMg==
X-Received: by 2002:a05:6a00:1582:b0:4f7:63da:dfea with SMTP id u2-20020a056a00158200b004f763dadfeamr22370235pfk.27.1647838731739;
        Sun, 20 Mar 2022 21:58:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:31f6:c8f1:6f10:b2ec])
        by smtp.gmail.com with ESMTPSA id g12-20020a056a0023cc00b004f707cc97f9sm18367565pfc.52.2022.03.20.21.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 21:58:50 -0700 (PDT)
Date:   Sun, 20 Mar 2022 21:58:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org,
        Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>
Subject: Re: [PATCH] Input: add bounds checking to input_set_capability()
Message-ID: <YjgGCHF7jmK1BHke@google.com>
References: <20220320032537.545250-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220320032537.545250-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 19, 2022 at 10:25:37PM -0500, Jeff LaBundy wrote:
> Update input_set_capability() to prevent kernel panic in case the
> event code exceeds the bitmap for the given event type.
> 
> Suggested-by: Tomasz Moń <tomasz.mon@camlingroup.com>
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> Reviewed-by: Tomasz Moń <tomasz.mon@camlingroup.com>

Applied, thank you.

-- 
Dmitry

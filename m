Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551526F60AA
	for <lists+linux-input@lfdr.de>; Wed,  3 May 2023 23:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjECV4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 May 2023 17:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjECV4L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 May 2023 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6A47685
        for <linux-input@vger.kernel.org>; Wed,  3 May 2023 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683150924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aRUy8fQIjPClPN9HCJtt+C0DKsdLlhX68tqTevi/WdQ=;
        b=bpGhVfT9sPsRONmzrwhLuFY1PtwjNM6jUD2FNQU8zshF8EFCUnUaYHDzEmlsztFSSjskFm
        wjZUF4K86uSGuHDwzD9/5wf8F6y0DtiGwo4rwX7cPenWOiLju2AqAme815JU0ViIr1LJr+
        D9OJdsxWqcVwmvqELi1qEouSkrliexo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-9L5LkSlfP4mhRcjokuvBVA-1; Wed, 03 May 2023 17:55:23 -0400
X-MC-Unique: 9L5LkSlfP4mhRcjokuvBVA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f3157128b4so25424925e9.0
        for <linux-input@vger.kernel.org>; Wed, 03 May 2023 14:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683150922; x=1685742922;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRUy8fQIjPClPN9HCJtt+C0DKsdLlhX68tqTevi/WdQ=;
        b=d2e2zvBV8S4qu2Xy4/WvEHXz5909K8TvCnhbAhCmZcOPaXg1aGVaBH/VxfPgbGnSG0
         K8oanebhEy/ZJAs5/i8DiZSr7J/jlrpaY+UVOGLBWdStOqXFiIurxLNTnJ9zMi9HIa0y
         /R2enVH2rfF9CVWRzqe7yR4J2BgmpkCIVtIRaW/m/qHipgqYwlZEbuuZhmvOkhhZQVxe
         JOAN8Ff4LAAB5EcpDJJKbRX0ZvVNkLBp9xTw5Y4DvTCzDv/1K/hoAWzM7/jowcM6Q3/B
         SlnUG0tZY60FPBCrE+l+16PMK/iKuSlvaGcH1WENrMKnfBwy0TDVJmuIoBdCb4QyhPrH
         1kJQ==
X-Gm-Message-State: AC+VfDy02kQYoByU+0xoDIw6t79UTztpuXUQRhy7SYh0c6lpOsgbZ6e8
        fSNy8iSQcYR5v+ZF00hwjEAUEr/6HB5THAGygS8R/DMVLSqYiN4IXOCP6GqUA80Cji7hmF2GPvR
        tjDF8UjkHlGtpBYXTI6x2bDOpnFGMt+k=
X-Received: by 2002:a5d:508d:0:b0:2f0:2d96:1c5a with SMTP id a13-20020a5d508d000000b002f02d961c5amr790261wrt.32.1683150922203;
        Wed, 03 May 2023 14:55:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4EOt86nc6cbqb31wNKWhCWMZZP+Iyp7c7zJw9PvZLVtTq6pn553v3IlJvkk7Xqdg2QwOu0sg==
X-Received: by 2002:a5d:508d:0:b0:2f0:2d96:1c5a with SMTP id a13-20020a5d508d000000b002f02d961c5amr790252wrt.32.1683150921888;
        Wed, 03 May 2023 14:55:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe0c7000000b003048477729asm24820970wri.81.2023.05.03.14.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 14:55:21 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tests - fix input_test_match_device_id test
In-Reply-To: <ZFLI7T2qZTGJ1UUK@google.com>
References: <ZFLI7T2qZTGJ1UUK@google.com>
Date:   Wed, 03 May 2023 23:55:20 +0200
Message-ID: <87pm7hw053.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

Hello Dmitry,

> Properly initialize input_device_id structure in
> input_test_match_device_id test to make sure it contains no garbage
> causing the test to randomly fail.
>
> Fixes: fdefcbdd6f36 ("Input: Add KUnit tests for some of the input core helper functions")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Thanks a lot for fixing this!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC7668A78A
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 02:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjBDBWM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 20:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjBDBWL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 20:22:11 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CCB20D16;
        Fri,  3 Feb 2023 17:22:11 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so6498487pjb.3;
        Fri, 03 Feb 2023 17:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BqK39dHqEx/ULv1T/TgqKMLGmlXp8ZnqmteYsVISmY=;
        b=SXWSUxt0xoUZ3JfmCnrTKSapx5i2iqWpmUi6Lx4e41Dg2B44uX0r9xS3IDikyfN0T7
         K6Nt+myrpuiybO2gj4qrI3dgnBAc6BWtufUGXnjqSKP+le5kkqL1lUd3ZMHLuXnk2ZEV
         XhIJ+6ZaB19b+PkaCaw9UcHi9j0lxVqbqpefNtkdxDA4AySENvtq8NGQtwqcS4D/rTfz
         dHqYz8uhgGXa7B9nZehSMwYaj0+YBSfSp/7oLkpYVRdzUhH74D/YsOyd+PJV/fE3z8i3
         aVaAoKxzPxGN4UFkAynAN4soKNubypaU0eJMxVAWis4E7z0Ap85LLWoR7KaAkO89NEBb
         pmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BqK39dHqEx/ULv1T/TgqKMLGmlXp8ZnqmteYsVISmY=;
        b=Nu/5Fdr0a/83A3qqhONZzT8iButUQyD+5OGqGLH1aUvxo25FyDxVwgNAE1sydUKdvd
         AL/JwMtkCXfnu0Yd58Ei9bAwuJUTSqbEq36D4OqLaTZs15W1ksEHtuhSDlpMlfCeucfl
         u5nMQ3w24Kmzq6x0iq9c+dIt3mypnKMZp+BClKRDhMysUaENsBLkPv6zuS1vNIdv6uuT
         Q4R8tIjtEzUc44Up/llsmFr/MFqRbGVqy/RGNDRUL+JX+XgEaWg14A+kCQr+8xHHpXyC
         sh7sYBQpIAIri6i/D/X4OTs5S+TeNDIkBjrwTABdtrC63PgO5FPwNqaWjiRxrWhZuIFW
         wxQQ==
X-Gm-Message-State: AO0yUKXfaSo3nUKJKIQf5iLk6VLSH8Ui9LG63l3aLLOug5N7pwn4t4ET
        j6dGtO9B8N/78TXCPc4b1vo=
X-Google-Smtp-Source: AK7set9bamg/i5HQd+0uO0N/VosDsKULG7uVRkrOIYM3imPBseGlHWvVA2HRAchztiI/yrf3n0Hrjw==
X-Received: by 2002:a17:902:e850:b0:196:8dce:82eb with SMTP id t16-20020a170902e85000b001968dce82ebmr14035444plg.66.1675473729073;
        Fri, 03 Feb 2023 17:22:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5a16:81a3:86ec:ceb2])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902710500b001743ba85d39sm2210567pll.110.2023.02.03.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 17:22:08 -0800 (PST)
Date:   Fri, 3 Feb 2023 17:22:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: input: iqs626a: Redefine trackpad
 property types
Message-ID: <Y92zPaNxptZ0m+K+@google.com>
References: <Y9RQCQa69f3TaiWf@nixie71>
 <Y9RQcddToBr1rrnJ@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9RQcddToBr1rrnJ@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 27, 2023 at 04:30:09PM -0600, Jeff LaBundy wrote:
> Following a recent refactor of the driver to properly drop unused
> device nodes, the driver expects trackpad channel touch thresholds
> and ATI base values to be specified under single trackpad channel
> child nodes.
> 
> This enhancement moves both properties to scalar values as opposed
> to arrays, making their types consistent across bindings.
> 
> Fixes: a8f1f0dc865c ("dt-bindings: input: Add bindings for Azoteq IQS626A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

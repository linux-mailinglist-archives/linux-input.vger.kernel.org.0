Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A175B2881
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiIHVYP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 17:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiIHVYP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 17:24:15 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB91D1203CC;
        Thu,  8 Sep 2022 14:24:13 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id l10so5914568plb.10;
        Thu, 08 Sep 2022 14:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5GfSTi1R/ESkpa+aaPusEnYJcdj2GioiLBZlHtQkNKg=;
        b=DTTkpMX0DV2sTq7k33fL8Bmi8wikRPKiHbrVQqmLYKtYLZHNhmMh8qTyfm62eyvrG4
         CC9lgLTS3LuDKURMeQDKvu0Hm7BrS4fhCHmMfGKV03PkhNe6DU1VLc7QqClHyx9BaMqi
         T6/KS/3bMoQVIRIAip/di0Mw0KrQjzbvu/jfFOOUPgcQb89cRbS9wCI/AhQ7fQffJQEj
         kGVlsnv7JbH61yb5g5CBNjqoaJnzRmehLDmQcGh0kc3dfZXKJeGgAKdL/IJ198TB8xmW
         zqHofn4FWN2BM9b2coBjqVs3A0a5AoCMdGk5WfKjQ3jHKeKM5f+zsWwlNOZ33gl0YhkM
         LANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5GfSTi1R/ESkpa+aaPusEnYJcdj2GioiLBZlHtQkNKg=;
        b=L2IfnyHxdKZCP3IgqpTQXuTniC1PsVdvPFCzzSv5QjKmKcXzghRoxTuh5EjPPU/aWL
         ro1sRVWx2whncGoG2Wv1eL3c3ROXcIhiVmiZle29XWClRx+ZBVEkONvavAJzRdBpEeuV
         RLJuoy4itwFtC7FyFubVUTW5HHtnOCFqeGTUn7eKm98h9EsLfrxJftjzzYAD8pid+WOc
         tPkP9zaxZ7PavVi8ZULvYehVENLJIHLePnGNBhidTCZBxvElwsJQqct61JyDoevLG95O
         KqffCzoAT5bETBxV53GeGM0Q6HtuexoGNRUZRS8UK4qN6d71YhPfMmZbEIktCdVbTBYI
         Ofdg==
X-Gm-Message-State: ACgBeo3Ep4M22hsaSiHHj0SwjRV05yg0LqbKP+hgk2LUFY+sPAO/ogTZ
        vv4eMYuYx4VSCvAXQ6F/ox0=
X-Google-Smtp-Source: AA6agR5h8XBUNX4JlMXybudR+8z0skzoFIBEB6MsSB3wpbfn33qpYNGQYxUNA89bC7WrTllsGH4s+A==
X-Received: by 2002:a17:90b:4b06:b0:1fb:29d0:7363 with SMTP id lx6-20020a17090b4b0600b001fb29d07363mr5912771pjb.12.1662672253194;
        Thu, 08 Sep 2022 14:24:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7554:1f24:9d2b:37a0])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a654300b002000d577cc3sm4681pjs.55.2022.09.08.14.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:24:12 -0700 (PDT)
Date:   Thu, 8 Sep 2022 14:24:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 05/11] Input: iqs7222 - trim force communication command
Message-ID: <YxpdeuPAYiSVjmO7@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-6-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-6-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 08:15:42AM -0500, Jeff LaBundy wrote:
> According to the datasheets, writing only 0xFF is sufficient to
> elicit a communication window. Remove the superfluous 0x00 from
> the force communication command.
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

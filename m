Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F785B284B
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 23:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiIHVRe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 17:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbiIHVR0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 17:17:26 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AA3F4135;
        Thu,  8 Sep 2022 14:17:24 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so3768579pji.1;
        Thu, 08 Sep 2022 14:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=KhL6+SPjuBPiraisuhRvp206Zkt0sw2dGsFp96SeFIY=;
        b=lmDkrINNZQK5NRqC3rkZon5niLRiuVo4lsAmm7jKJE6A1VVbAaMUTbxWZ3hfECTYhY
         cMuG+gwnffzI4kidat4tdpCtJrhLXU/2PUtsNrz6uCzDtLdVpOtGfACg841U3GSF0udP
         ibkzo1n8w10qXr55EM+/A9aT7oNtLlOYXclq8ayDgFtZhtBbqV6Ti/gWK7+G+vrV/CBI
         vX7lwp6c/leFY1QJQcFavX88Sk2uxBbgFmjKh5jtfN0r/a8Lp2G/R4iPilGgXIbP4PZp
         D/26OlHi0HH9J1lQ/8NUrgtS3lfJA2ZC7QQsoU2mNc0Qn+FWC4ZleUWBDLS9TmaNQ1Qa
         ASJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=KhL6+SPjuBPiraisuhRvp206Zkt0sw2dGsFp96SeFIY=;
        b=bzBWJHZ8/PVGNPqx1pS1YwrGX1dc0iNLM8tNy1J5WTyPWv59pPsLogXXWmHH7w5cCJ
         Eam4ImH+4vZkbF4CMq5gRm3XUsIo0WHeOgLL0gAEpuejEmpvOoAH236oycKDEsEBP448
         veBH8M90QH4IzLWShbydU7slfP+YVQqCzv7je8s9GIGgCcZzTpHW5/B+4tpBMgjYGoc/
         XdsLYszQci5PJAqDtMBV5gCh9S/h+O3hKMahUeV4djsYoKywclS9AwzB7x1ZVfZUw1rN
         yDSi+AhI/Vzew632ViKwPzW737LaMnyqIXt0hkZeEnKz6px+/5W49J2KZpW5ohA/CdPB
         6+Ng==
X-Gm-Message-State: ACgBeo34MNs8PXeYR2GiP78xI7VOwIqNdhw4gX0MoIzuS97gN57BCRtl
        D1tsaIsvS4qYKgqRhFYlg6nVs0ETuOc=
X-Google-Smtp-Source: AA6agR6UXWQyk0RfNsEgaaMuE3A2gl461+NfH3OlD+f2zUpZDhtqgpwEo1PKuywU7X/VundP36y1Ug==
X-Received: by 2002:a17:903:41d0:b0:174:d8e0:b0f1 with SMTP id u16-20020a17090341d000b00174d8e0b0f1mr10486473ple.74.1662671843998;
        Thu, 08 Sep 2022 14:17:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7554:1f24:9d2b:37a0])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902eb8200b00176c9015633sm7385089plg.28.2022.09.08.14.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:17:23 -0700 (PDT)
Date:   Thu, 8 Sep 2022 14:17:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] Input: iqs7222 - drop unused device node references
Message-ID: <Yxpb4QdZej4QnZlo@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-2-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 08:15:38AM -0500, Jeff LaBundy wrote:
> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
> 
> Currently, the driver never calls fwnode_handle_put(). This patch
> adds the missing calls.

Hmm, dev_fwnode() however does not do that, which means that
iqs7222_parse_props() has different refounting, depending on what is
being fetched. I think we need to start there.

Also, maybe we could avoid sprinkling gotos if we moved property reading
code into helpers?

Thanks.

-- 
Dmitry

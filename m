Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59EF5B2D8E
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 06:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiIIEiE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Sep 2022 00:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiIIEiC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Sep 2022 00:38:02 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D61BC12F;
        Thu,  8 Sep 2022 21:38:01 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id jm11so672588plb.13;
        Thu, 08 Sep 2022 21:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=mHZ+11emo0v77HtEtVwg5cGvEAYi49V2ltzazKWWPTg=;
        b=HjrkYdyKxNe66W9itdbQFZgNn955/ekqmPR2J8TmFer6BhPb3WBBTxbKgkYMcno1Bg
         1K8NlTJ03NLFWbxQ0nUX49fuJz+QZoe8102VLExUC1TybzRm0gVNt9Fll6Gn4TNRsWS9
         nmJtsU/T9OkKvXUQGDFBnMvw6Ss2cfXjaCQzQ7DP1CDmPVHyD6HYajTiuD43qMGb0Cvm
         IeSjvFKQS7DJeJmzI4ZzMh4L1KQ8h1jziDOUCCNc6kMmmNQiET3Ir4CEPrXcPsvcipXE
         mspFAcHvNvJay5qMgfPEahPrtH3IToe2ekBhepSMqUJV2lgKkj99Pt6JQ3d6lE7xPQN0
         nyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mHZ+11emo0v77HtEtVwg5cGvEAYi49V2ltzazKWWPTg=;
        b=XjbtcM+JBhR8mJd5k0PwAQLLpZEZnO9QkhViaLgh+7aQn0VnbYARegpU8UC5WZUJp1
         o0iqxuxZhJ4MZ/jxPmHD495Uv/5gUOTC0fuMT4duGRDdz4+6DdLHY/ET4PVRJ5T1R4GE
         c8wKi5oiPBpCammxhDHyDC7pd8J/crU3oRKURHz6bEnfT/tnaY81IlZexsEYXe93tAO5
         djep2BXOQ4hmGjjDaZnnnuLVjlNtnA2ElmnROtyldNR2t6+mulqO5lqRcBu/wiHTec2t
         /JD+63CZzahEq92EiZ/1mAT8La6JG+CCEtLsA+nd0mHwbi/C94DqzeBzVH+FPU/iF0y6
         yrCQ==
X-Gm-Message-State: ACgBeo0a3plgrl6N5EaTt/WSv70kGATCk+V/CgwmH3XFc+1jzHaC2hvp
        p50JE5/2gen+qJ3m4o5xVJs=
X-Google-Smtp-Source: AA6agR7y0U1b1x+w61CyPHuK544a2MR0qZeYVdkamczqTO3vQMG55hPWI4DQ3O/JupV0BYk8MD7Hfg==
X-Received: by 2002:a17:90a:e60d:b0:201:6b28:5406 with SMTP id j13-20020a17090ae60d00b002016b285406mr7503884pjy.228.1662698280969;
        Thu, 08 Sep 2022 21:38:00 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7554:1f24:9d2b:37a0])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7972e000000b00540d03f3792sm512745pfg.81.2022.09.08.21.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 21:38:00 -0700 (PDT)
Date:   Thu, 8 Sep 2022 21:37:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] Input: iqs7222 - drop unused device node references
Message-ID: <YxrDJYOsllUDqiod@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-2-jeff@labundy.com>
 <Yxpb4QdZej4QnZlo@google.com>
 <20220909020355.GA3306@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909020355.GA3306@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 09:04:06PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> Thank you for taking a look.
> 
> On Thu, Sep 08, 2022 at 02:17:21PM -0700, Dmitry Torokhov wrote:
> > On Thu, Sep 08, 2022 at 08:15:38AM -0500, Jeff LaBundy wrote:
> > > Each call to device/fwnode_get_named_child_node() must be matched
> > > with a call to fwnode_handle_put() once the corresponding node is
> > > no longer in use. This ensures a reference count remains balanced
> > > in the case of dynamic device tree support.
> > > 
> > > Currently, the driver never calls fwnode_handle_put(). This patch
> > > adds the missing calls.
> > 
> > Hmm, dev_fwnode() however does not do that, which means that
> > iqs7222_parse_props() has different refounting, depending on what is
> > being fetched. I think we need to start there.
> 
> Right, but none of the callers that prompt iqs7222_parse_props() to
> use dev_fwnode() follow with fwnode_handle_put().

I think this is a problem that code has to be aware of that and behave
differently. I'd recommend bumping up refcount in dev_fwnode() path so
that all callers would behave uniformly. 

Thanks.

-- 
Dmitry

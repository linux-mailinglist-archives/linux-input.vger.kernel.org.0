Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FAC56C732
	for <lists+linux-input@lfdr.de>; Sat,  9 Jul 2022 07:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiGIFCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jul 2022 01:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiGIFCa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jul 2022 01:02:30 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B933F325
        for <linux-input@vger.kernel.org>; Fri,  8 Jul 2022 22:02:29 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r22so575998pgr.2
        for <linux-input@vger.kernel.org>; Fri, 08 Jul 2022 22:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rBemb1VwaMicZbsPmhSCCnPFYL6Td94ObrNKQFDRgKs=;
        b=hEkRMgUidmDSTpw8G13UjJ5EKYPXGs9miCNTnB69eG2HEpJFOBZiSZrUCVjiUycwWZ
         Te+5HRqQ6woHqGsto6H2DbOulyBS0Ks/pFTUIZKwoyOlyLoQMw9OdCpkceggLAwWDQIR
         K79iyaPOywkrsWgU6JCuEcEcosekaa6v08sG9/WPLzY/Wni1A8dgRdNMy+kppaI7CyjE
         PVXiSZh6cuW1cl5q8SnfaVmbrdBh+zKOInSWKz2iyNH0/Ax+gN/YfVGFiCFDeWAseDnF
         //eTxNP/urE7qyAphves2GoCFaS/8vnL74cdAJX1oeSvdIOzCQTpAcuJrvWqdJmUrUn4
         qRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rBemb1VwaMicZbsPmhSCCnPFYL6Td94ObrNKQFDRgKs=;
        b=Gm3mSw8VbtDxFUoiw3xkq3qYCZWrvPbroRLK+dWn0EWJGd6+PouNzAmFA9SdjmxdjC
         XHKpdVia2jHcDtlqvcdo/HjeJC7snB6SxsA2eQL+JFzkgzQKqGELlfxvWD332ATeXRRh
         CccGGteemKgx7o9kbKkMpYlxNtX/cAKG28VxcSd+zN2qbfgo5TUrKKZKOvxPdYVRumj1
         k5FMt25pH7iQsAwDElsi7zXUjydUELbaHlUkqCQ4eQPOFl5UTCVcReco2NkK74cypeUz
         EPEbDOh+z2EUYddvAUgAfygYKzqrt5hxTnn+0PyZDsq7DpE9rMEhTCUhk1oSc3a8mQSW
         fWmw==
X-Gm-Message-State: AJIora+ugl7sL00Y7Spz5lGAsxgS1lHW5yPc2uoTya89s0ZTLDw+ufq+
        3SUt8xxkWHfhPt1/aWXpZZ5Hu34Be50=
X-Google-Smtp-Source: AGRyM1usJ3mBB/85Utdxqf4/CDLF2jWJJEGdYd/EvYHtwMvoUWncbOpAuA0QB4S91vWmAPVACT57hA==
X-Received: by 2002:a63:185b:0:b0:411:75ee:c87a with SMTP id 27-20020a63185b000000b0041175eec87amr6021145pgy.607.1657342949397;
        Fri, 08 Jul 2022 22:02:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5011:9ea9:1cc2:a4c0])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b0016a109c7606sm383274plb.259.2022.07.08.22.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 22:02:28 -0700 (PDT)
Date:   Fri, 8 Jul 2022 22:02:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     rydberg@bitmath.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Document the units for resolution of size axes
Message-ID: <YskL4oa+SGuwKamT@google.com>
References: <20220520084514.3451193-1-svv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520084514.3451193-1-svv@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 20, 2022 at 01:45:14AM -0700, Siarhei Vishniakou wrote:
> Today, the resolution of size axes is not documented. As a result, it's
> not clear what the canonical interpretation of this value should be. On
> Android, there is a need to calculate the size of the touch ellipse in
> physical units (millimeters).
> 
> After reviewing linux source, it turned out that most of the existing
> usages are already interpreting this value as "units/mm". This
> documentation will make it explicit. This will help device
> implementations with correctly following the linux specs, and will
> ensure that the devices will work on Android without needing further
> customized parameters for scaling of major/minor values.
> 
> Signed-off-by: Siarhei Vishniakou <svv@google.com>
> Change-Id: I4a2de9e6d02e5fd707e5d312f5c3325734266a6e

Applied, thank you.

-- 
Dmitry

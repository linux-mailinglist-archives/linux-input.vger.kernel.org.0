Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7273D74DDEC
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 21:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGJTJx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 15:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjGJTJd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 15:09:33 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AA81718;
        Mon, 10 Jul 2023 12:08:29 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-66767d628e2so3121773b3a.2;
        Mon, 10 Jul 2023 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689016108; x=1691608108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7McYVgluk3vM3NZeUdBnqsQIyfg+ua/q2+QSPlAUV20=;
        b=SqCXRDlCo2IGWDe+Bv0NoqzCCnVoiug56eJZlq1R8IRoYij+ZwmlldDryyLjdsYgok
         Lp7u7OmVMhN9D5KVyRAKo+ccUMAcZwKFpT2AAHmKh0aMKLdOtb8kAteM1b1OIVHvUhYY
         ie2GmuO3ScFxAxEsZiWSkzs/i+zd3FRjG6tEE0B4YKzwHQuWRi4nkA8MVPTa4Z2nIMIz
         qFL6zpTxT/+yVD+bOOkBfzvSDWaM5ULwNepIsbfufcDZHgsY6afYtbEdzFqIpakczyri
         whcT0YxdOUn3PJbqOvksaATkRBmIO1ND6u0M7PtXt0hm4U4iT48RtvYq7Sr69GrOSMEa
         Sl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016108; x=1691608108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7McYVgluk3vM3NZeUdBnqsQIyfg+ua/q2+QSPlAUV20=;
        b=A7CJNjNZ7gcGBQtK1ZhFx7FB525jlGSwWiu42Kl3ttfWwHVjkJcKPqBbaIW4tadBgT
         PobgQvhfV72NxwXDY0nYzbOAi3ribUb+FVmIQ2WN2HcLBZNf0KcLsu5m/YOCX8w4+qnj
         /l6qVBBQIbH0neLho2eF+x9tE8aXSp3XsMR4lVDMSoOsLBrISbBgrJ33AT2s95XO6+l6
         ianMeTacC45cEvY8D9EU+kmUK2ouBcnOs8q3JIJZCy3U4ey1cj4PN8OWO6zz1lhHwoiz
         GtzFJa693DWU+l6sNIKjx0AVguIDm/t6wGmHFwTYjiwFt7G3KO7BQX/KfSY8LU7nmTZ6
         ODGw==
X-Gm-Message-State: ABy/qLbt45e89zL5VN9x+Qw/bFZKyd3MPlQ0feIDU9LiI/APkSieidJU
        xyqC34ywgotLIPIArm/6/uctTGg6tqI=
X-Google-Smtp-Source: APBJJlGyY9SaMdSHifAdtifm+d4Cx0zg0OhQjHhxsjJIJ/MB6sFoVfe2CaxvLdxO7JnTqiAtEHMI7A==
X-Received: by 2002:a05:6a00:228a:b0:64d:1c59:6767 with SMTP id f10-20020a056a00228a00b0064d1c596767mr13157305pfe.24.1689016107684;
        Mon, 10 Jul 2023 12:08:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:96bf:7e77:39eb:7a23])
        by smtp.gmail.com with ESMTPSA id d11-20020aa78e4b000000b00678159eacecsm130386pfr.121.2023.07.10.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:08:27 -0700 (PDT)
Date:   Mon, 10 Jul 2023 12:08:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add support for Azoteq IQS7222D
Message-ID: <ZKxXKGjIlJeUnFsO@google.com>
References: <ZKrotyhz7eueujys@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKrotyhz7eueujys@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 09, 2023 at 12:04:55PM -0500, Jeff LaBundy wrote:
> This series adds support for the latest member of the Azoteq IQS7222x
> family of devices; it also sneaks in a bug fix and a clarification to
> the binding.
> 
> Changes in v2:
>  - Added patches [1/4] and [2/4]
>  - Updated patch [3/4] as follows:
>    - Wrapped words instead of splitting them
>    - Specified units for the 'azoteq,top-speed', 'azoteq,bottom-speed'
>      and 'azoteq,gesture-dist' properties as in patch [2/4]
>    - Corrected the 'azoteq,gesture-dist' property's role in the case of
>      tap gestures
>    - Updated the if/then/else schema to consolidate restrictions common
>      to both IQS7222B and IQS7222D, and to indicate that the latter can
>      support the 'azoteq,ulp-allow' property
>    - Added more details to the commit message
>  - Removed unused variable 'val' from patch [4/4]
> 
> Jeff LaBundy (4):
>   Input: iqs7222 - configure power mode before triggering ATI
>   dt-bindings: input: iqs7222: Define units for slider properties
>   dt-bindings: input: iqs7222: Add properties for Azoteq IQS7222D
>   Input: iqs7222 - add support for Azoteq IQS7222D

Applied the lot, thank you.

-- 
Dmitry

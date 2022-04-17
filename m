Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF80850495F
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 22:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbiDQUHO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 16:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbiDQUHM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 16:07:12 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC112F017;
        Sun, 17 Apr 2022 13:04:36 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso15693388pju.1;
        Sun, 17 Apr 2022 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H+OPSyyonW6HqnJS2JTKZaWpcaV7HVVc6KNd817IfUk=;
        b=Tfpw6Nqca+lXJSrK4lvlarfIRRGOTaewNd41ato7WFmWjDw1kYiTEzOOOfM6PxyUV1
         fTUqrhP2PywqMAZqJUvOBVuyi6iVFoP6ALrxefPfrNhRJG1uJdDNR1uzwIum3dIcjvHZ
         Z9fbniQnzU4jZxaFqi20cuz8Qx/zd+7T+QT7SFleK7mtSx93UoaQCZfVShJmwLMjUd4e
         iftGfvoSJyA7XvBt47tUAOnpFP/ZGyg58VRFgNrfan0xE3tzmX4iScHAXAHZ/l2BbOAK
         9OUvq3q/fwEk+KM3ispL/GQE4OlBed45HSt4dweYJkwxua9sVBuFCoAF/OCMT0LaWaSb
         7tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H+OPSyyonW6HqnJS2JTKZaWpcaV7HVVc6KNd817IfUk=;
        b=7khyR667fB0UeV8MZyTKfffD9wbZF91peHGltFXTYrmiYLcMjkK92y7+PTVOSgGb+5
         LmuK00v0lT+T/ocxGgpMZaodZjQMNksiJmd6i5oK7bhKJd1KgrrlvA9PS/Va79lkt5fy
         lWa1UCqnAEgNMheo1/A7iyv7sAdNwAA2dWFNe+WhSPJxeEqYYSgR9fGipumvi0v9ID7x
         fz/EBy0zlTsj3nUzwUrbKy0H9/E5ez5PYYfDBYtuaVPl1slZiloLfJt7DbiEfHsD37l5
         YfbOSPby43QWMfakt9bq1e2CoEI4yLhlPSSsSPpH45mUxlduay2ZkwgCLuSi+C0jmRKx
         dwJw==
X-Gm-Message-State: AOAM531u0hfv3Qiw4ZVtcDjDRMnvQWlbgCux3rWQEbXF3E53dBPTvEc5
        N7Fqshsl6urbEEGJQkV1HJ0=
X-Google-Smtp-Source: ABdhPJycZYmQ6RNR+xmy0+nxm1UaZf3Ik5XVk8UqyieOCpKW4q24P7IlZICYbM3L4/kj0KnSEOTo4g==
X-Received: by 2002:a17:90a:ff17:b0:1cb:a182:9b05 with SMTP id ce23-20020a17090aff1700b001cba1829b05mr9489331pjb.1.1650225876199;
        Sun, 17 Apr 2022 13:04:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1752:34a6:ebd3:cc40])
        by smtp.gmail.com with ESMTPSA id pi2-20020a17090b1e4200b001c7b15928e0sm15330951pjb.23.2022.04.17.13.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 13:04:35 -0700 (PDT)
Date:   Sun, 17 Apr 2022 13:04:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - propagate some error codes correctly
Message-ID: <Ylxy0fnZ0lNSWzxh@google.com>
References: <20220412153954.GA15406@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412153954.GA15406@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 12, 2022 at 06:39:54PM +0300, Dan Carpenter wrote:
> If fwnode_property_count_u32() returns a negative error code then,
> because of type promotion, the "count > ARRAY_SIZE(pins)" condition
> will be true.  The negative "count" is type promoted to a high unsigned
> size_t value.
> 
> That means the "else if (count < 0)" condition will always be false and
> we don't print that error message or propagate the error code from
> fwnode_property_count_u32() as intended.
> 
> Fix this by re-ordering the checks so that we check for negative first.
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

-- 
Dmitry

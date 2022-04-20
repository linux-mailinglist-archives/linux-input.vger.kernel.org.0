Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D5450924E
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 23:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382648AbiDTVsN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Apr 2022 17:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382646AbiDTVsK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 17:48:10 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC072A262
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 14:45:23 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id j17so3158505pfi.9
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 14:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1C+MYZ2YZhPFidryxq4zEiEBe4AsQdWeN2BKPp6yqRQ=;
        b=nomwd9X3mBuxt21JMkk2exIFnqhVGJntfA57AKG5R4k+45+l2MsJ52TvYpdgv5acCI
         in5X7AJAC4cqFk2FO0qFxcXgz/RBMah5N360hjKMxiOK4ayPah9We/Vt1QHvyV2skykn
         VXBuOUVAgdab8O3y1clItvYrFRo4S/rEOnkLmnJVx+DPUk3M4VCvlceuDMPjPBgHciy0
         rfTm9B/G7EnHFO6JUFRqrS6uhwJNdDObbx1mXbm2nsn/K7BXA/4Ak7xmbfnftmS4I/Yb
         dxNQyFLFI8JRg+3Yu1uL3Z/+OXae6YcGep8/JST+F4+ATa2gzw1sCve3/XSIwFfURMhd
         boXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1C+MYZ2YZhPFidryxq4zEiEBe4AsQdWeN2BKPp6yqRQ=;
        b=sVzT2+AZLCSt9MVXlARwKUQNrv5nSRu41gCNniMMr32eScY8TdPTMltBBFfoUm7ZYp
         bntBu8boCjwFR+NK4ymA3eQbJx63MTzDAQaIUE7ITVvJeGvqiqzMFwVwv/rIq5n/JLs4
         L9d0wVLcq4L+lE8MHsIBa8Y6bKZgBmNEFaf4wNm8fsi+/FsyFtdiIYgfGMGKl5KWZlEC
         thuiq4OrytkKNeOl1g9kDUg0A4wP7EWAMv7O/zJCpXZTKZZquWjqRTjctFoz1nTHl4Zy
         Z+BSuvPexQtdyUeVlRJFtN5whsm/fiubhGGBiC1Z2OprlaooxGdrpkoE5Tq8A1adEP57
         lN0g==
X-Gm-Message-State: AOAM531LoA877Q3kc6VDFYBRLD05D3ITIwK5NedbpGjjDNYeYLfUA4fh
        B8sbqNBAKzVXjHHilmzB0qLCT0Z77eY=
X-Google-Smtp-Source: ABdhPJwDxUUN0Ddj982fdAzP+DW5+jVcc8dM+98/ZGaXbKeUiAX4NpXjkbwM1jZrnRq0gFH0/uWZuw==
X-Received: by 2002:a63:6401:0:b0:3aa:5639:1884 with SMTP id y1-20020a636401000000b003aa56391884mr6196060pgb.71.1650491123169;
        Wed, 20 Apr 2022 14:45:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fe4b:9301:599b:d734])
        by smtp.gmail.com with ESMTPSA id gd7-20020a17090b0fc700b001d0ec9c93fesm152335pjb.12.2022.04.20.14.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:45:22 -0700 (PDT)
Date:   Wed, 20 Apr 2022 14:45:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input: clps711x-keypad: Use
 syscon_regmap_lookup_by_phandle
Message-ID: <YmB+73TFVDTBTpix@google.com>
References: <20220420062725.25614-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420062725.25614-1-eagle.alexander923@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 20, 2022 at 09:27:25AM +0300, Alexander Shiyan wrote:
> Since version 5.13, the standard syscon bindings have been added
> to all clps711x DT nodes, so we can now use the more general
> syscon_regmap_lookup_by_phandle function to get the syscon pointer.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Applied, thank you.

-- 
Dmitry

Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFCBD5FF667
	for <lists+linux-input@lfdr.de>; Sat, 15 Oct 2022 00:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJNWhr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 18:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiJNWhr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 18:37:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9085060F1
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 15:37:46 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d26so13337052eje.10
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1V4e9jqqTdVFZtiW+buOhqrGLm37lTJlpJ17VPVjGk=;
        b=UTRgEXtU9PKREtgFBjuD3uzXsOS5kS2CX6O/jA7AVh+U09kK+3I1WSOil93+EcIac4
         3sW9zyBXJmMHiXxb719zxwznNFZdjdC4lJtClWB30eQSi5A9r9sVE1O2M+Aj8yNhX9ei
         kw7z/1GQsrz1QY/S+5v6ZV/tGGIuC+NPF5OkK1SXKli3tsjQav+I6J2aU9R2wSkI8yDv
         mJDq75x8CdEdH6inWvPUs4u5DtbsD/ID0IxoDt9WPZ89dQjt3pfjHDhsjCCAwEQ4jQTn
         IM8o1aureJZWjgmMeFrvJvEDqXyBDKByjo8RTLNcVd0gZkZL6OKVqgfv5wQbVJ3ySP4/
         wJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1V4e9jqqTdVFZtiW+buOhqrGLm37lTJlpJ17VPVjGk=;
        b=PUQWnT/S8MxPPXheRUQARda2NpQtZzoGCWIVJq+NOM+RxY8JcreiGi/S35Sks+GgaL
         RSuDhSUc1QEKZgCwA6Y0qkFSXaPE3VW2nuOoLF/BqxRxe7KkT8DK+Zxt6XVUildLADHR
         28mPH/+unzRqU23k4IqPqyyN5j5C4HDboDgd3+JfboaRHYqGacFESxjLsxwM8fChQVN9
         oT4evqA4HHNgMAbJ18bl3qccz2DQ+gNe83dNlSfsz0cbrLz+dmGPNY9K07uQVEVXOY5U
         6WuvNsIhQXJsZCxVJwa7nZEj1R4jP9XP97N70tErAqlmYBGq3zC1L8sdZluybr3SxnWQ
         apYQ==
X-Gm-Message-State: ACrzQf1U3qWxlH+qaT2hSiHKgnE7RR4uuuvz00NVU+wfiGjSmEFVRjn6
        c25G8WnrkZIiWO7g1JJnIUI=
X-Google-Smtp-Source: AMsMyM6/GvljkCPttbnzHEn8IBx67/gD2CfwZ20vxX2IfGabyrjO42aFvxOyr9SOuYbX7nEec5dj3A==
X-Received: by 2002:a17:907:970b:b0:78d:8d70:e4e8 with SMTP id jg11-20020a170907970b00b0078d8d70e4e8mr134799ejc.614.1665787064910;
        Fri, 14 Oct 2022 15:37:44 -0700 (PDT)
Received: from penguin ([57.190.1.13])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b00779cde476e4sm2180427ejt.62.2022.10.14.15.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 15:37:44 -0700 (PDT)
Date:   Fri, 14 Oct 2022 15:37:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     linux-input@vger.kernel.org, snafu109@gmail.com,
        mpearson-lenovo@squebb.ca
Subject: Re: [PATCH] Input: Disable Intertouch for Lenovo T14 and P14s AMD G1
Message-ID: <Y0nIdgy9BKpIKsfP@penguin>
References: <markpearson@lenovo.com,>
 <20220920193936.8709-1-markpearson@lenovo.com>
 <eef66090-15ac-a53e-4677-f1f2620fb965@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef66090-15ac-a53e-4677-f1f2620fb965@lenovo.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

On Fri, Oct 14, 2022 at 03:24:07PM -0400, Mark Pearson wrote:
> Resending as I hadn't seen any reviews. I think this didn't make it on
> the list as I can't see it on the archives :(

I believe this is commit 2fd003ee8ade6b7f2777becc6f9917d7c313784f and it
should be part of 6.0 release.

Thanks.

-- 
Dmitry

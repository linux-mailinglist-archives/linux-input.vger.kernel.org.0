Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5025268A788
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 02:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjBDBWB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 20:22:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjBDBWA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 20:22:00 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA9820D16;
        Fri,  3 Feb 2023 17:22:00 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id m13so6981989plx.13;
        Fri, 03 Feb 2023 17:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKudAxqHJuMyobAQz1WGBx3bev5Kjt7VUsZ/6Ss1veM=;
        b=JfdtFLJMC3bgz4STMh/iIyKDBzJV8fwnNw+KI2kFZImLo/BiqczQ0g7GHIkNkqJsCe
         8zxLJiNnI9eGsoFUVEgJUX2OZfRPpJGC9+KESCDM6yT2fz+a2POFo8NjC46wrcZ0fXDy
         +/DCGPw3FR/pMlDO2E55Tr4QorkgfvkTaTe3JvFQ6rUbmcBu12Z7r9nhyfM3UuAL4WNT
         3jQgrg2ij58i8+7NHQ8iEbUmRCVObGBH5G3AtXoIAHofka3FeTuZ4/mvv42lACs/xfJ3
         VWmQtgOuY4n0GevndXXUmerevF/OAuJcg9ofgsL/IY8Ebp3ql4ZnndnxHZL2Z/C7OG3y
         BlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKudAxqHJuMyobAQz1WGBx3bev5Kjt7VUsZ/6Ss1veM=;
        b=31skUHBLUF2qs6H0oIT+E//zU9a8nmx36teJXTZaS/9buBZCZNz7qfpFEBaBZlCF0h
         meD81Fq8EQy4DpJbRB9/N030SIonxTJGFHPa8nw2KKSXi+wEAuN4p+W54dnsYJfwfq1P
         N+pxoiYr6GpxsuEsB8EoHP6fNFqJX598Lv96A5p5j4qjh//QDzACqqZsENE0Pxi95rty
         CodNccLSXS57TcQzic2ELp/RtsK8/gtCtKgZLsAguq9sARGwzZHSLfgQQ2kJ4Pn4JvN1
         zZLUnnLg3qmU4hL5cw3aDPe5jHbA23OErn95j7TQIZGpE+lYTNON0bgWJwv7lFyg+4ko
         p3rw==
X-Gm-Message-State: AO0yUKVxPUertZzV9CjEfEa+bGIA12iE0ct9PLkAsfROEgqaiXUVyrar
        s0ThvRMvFWzYtiZjFBHwOmIBrNc6hJU=
X-Google-Smtp-Source: AK7set+fCEt03iHhXDUd0tRzTm+ILypcJPAikFsAn2cWOYs0jqrCuHc74l/pq0GEP/TPiv4dvO06IQ==
X-Received: by 2002:a17:903:2312:b0:198:adc4:2289 with SMTP id d18-20020a170903231200b00198adc42289mr7051421plh.4.1675473719516;
        Fri, 03 Feb 2023 17:21:59 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5a16:81a3:86ec:ceb2])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902780600b001929f0b4582sm2176748pll.300.2023.02.03.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 17:21:58 -0800 (PST)
Date:   Fri, 3 Feb 2023 17:21:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: iqs626a - drop unused device node
 references
Message-ID: <Y92zM/SpazGv6CpN@google.com>
References: <Y9RQCQa69f3TaiWf@nixie71>
 <Y9RQVe/V1Hnw1oly@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9RQVe/V1Hnw1oly@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 27, 2023 at 04:29:41PM -0600, Jeff LaBundy wrote:
> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
> 
> Currently, the driver never calls fwnode_handle_put(); this patch
> adds the missing calls. Because fwnode_handle_put() does not take
> a const *fwnode_handle, the const qualifier is removed across all
> corresponding *fwnode_handle instances.
> 
> As part of this change, trackpad channel touch thresholds and ATI
> base values are now specified under single trackpad channel child
> nodes. This enhancement moves both properties to scalar values as
> opposed to arrays, making their types consistent across bindings.
> 
> Fixes: f1d2809de97a ("Input: Add support for Azoteq IQS626A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

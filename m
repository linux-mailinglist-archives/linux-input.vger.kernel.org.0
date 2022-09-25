Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19725E9118
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 07:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiIYFKV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 01:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIYFKV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 01:10:21 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4999C2FFDD
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:10:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id go6so3560888pjb.2
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=jYbymj9Q5wzcckBgghZcMXG3H3OlHFa68leLZvfyWwA=;
        b=XcsQ1we2gMbzRhN+c8uOfOCEBmgcx0WaW9SuaigLmVIa1Uf6BhlhOl9jqj1iKx9BO8
         7ahaVGvZapgOcIGOxCJOOmEL8FPQaZlk6TMndf/SryhvzWmS7r4S8njqoLI+K3EZ4/eV
         azTmaSZX9bprLMOlE7eMG+pJaewlMYbyq3Mud4//O15ZPpN4QD+51RW9Z9OHM6TFhqG7
         6G+wGudiupbrP0lrHlSNC/5XYe1APggll+moU/XWuxUKWieC1vI00I9dsfGq8hdV4OuM
         qahvgmgZN7VIEOXdBXXAMyIbT7wi9vG910BYfzbUJMqIsjnXQOHmKfbapZl64ODH4cbO
         3h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jYbymj9Q5wzcckBgghZcMXG3H3OlHFa68leLZvfyWwA=;
        b=cwGjORJjW47no4meZ8Y9JYx4Y4u/gLQcQPADWlFMlrLhC/OizUHY6IoOJDvv4T6bnh
         +jI7etJeJap6PfcHZq7G8bC17aygnEm23nbYlt6Y7o510HTlS/tFxdzLuDwb1BaF0DjI
         2O1sqQgfIqe4CqRyKWaykiQyt6MquSqkuI6PC4o6NCMymrim18JzuiDNPuZL2ROwPZUq
         wW25ZQIXlufU1Q7ydeCG3O/cAb+TUSoGIhy/vg/U0qB0DfA4Jvdlk2DGBFRP8ffweAGA
         /FhclPoSgcwvuHYTFt8pXK5mkIIS98RxR/PkSL6Q7cqY+zK7r7FFK9gEvN5Hje0ISbnf
         ud+w==
X-Gm-Message-State: ACrzQf3IiTJGvqPbeAErFOzoChCpgdR3QBr2pgVeT3R64e9O4YwRCTsD
        PvpwUpAbb9/nxrsIvH01gL8=
X-Google-Smtp-Source: AMsMyM4KzA/7CpPCyuRkLEX8uNGQLPeMeBm+a9Z1g5hmXBBzFZaUj50OOEPEJatzZXHHk09hI9OJrg==
X-Received: by 2002:a17:90b:1650:b0:205:65db:d6eb with SMTP id il16-20020a17090b165000b0020565dbd6ebmr17401349pjb.246.1664082619605;
        Sat, 24 Sep 2022 22:10:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:37c:3916:9a45:14cc])
        by smtp.gmail.com with ESMTPSA id x125-20020a628683000000b0054087e1aea4sm9471182pfd.15.2022.09.24.22.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 22:10:18 -0700 (PDT)
Date:   Sat, 24 Sep 2022 22:10:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-input@vger.kernel.org, jeesw@melfas.com, rydberg@bitmath.org
Subject: Re: [PATCH] Input: melfas_mip4 - fix return value check in
 mip4_probe()
Message-ID: <Yy/iuEReEVmy0hEk@google.com>
References: <20220924030715.1653538-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924030715.1653538-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 24, 2022 at 11:07:15AM +0800, Yang Yingliang wrote:
> devm_gpiod_get_optional() may return ERR_PTR(-EPROBE_DEFER),
> add a minus sign to fix it.
> 
> Fixes: 6ccb1d8f78bd ("Input: add MELFAS MIP4 Touchscreen driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied, thank you.

-- 
Dmitry
